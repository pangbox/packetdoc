const Asset = require("parcel-bundler/lib/Asset");
const Liquid = require("liquidjs");
const yaml = require("js-yaml");
const path = require("path");
const fs = require("fs");
const hljs = require("highlight.js");
const marked = require('marked');
const glob = require("glob");
const KaitaiStream = require('kaitai-struct/KaitaiStream');

const templateDir = path.resolve(__dirname, "../../src/templates/");
const examplesDir = path.resolve(__dirname, "../../examples/")
const kaitaiDir = "../../src/scripts/kaitai/";

marked.setOptions({
  highlight: function(code, lang) {
    if (lang) {
      return hljs.highlight(lang, code);
    } else {
      return hljs.highlightAuto(code);
    }
  }
});

function patchFsWithDeps(fs, asset) {
  return {
    ...fs,
    readFile: filepath => {
      asset.addDependency(filepath, { includedInParent: true, dynamic: true });
      return fs.readFile(filepath);
    }
  };
}

function stripdocs(data) {
  if (Array.isArray(data)) {
    return data.map(stripdocs);
  } else if(typeof data === 'object') {
    let result = {};
    for (const key in data) {
      if (!data.hasOwnProperty(key) || key === 'doc') {
        continue
      }
      result[key] = stripdocs(data[key]);
    }
    return result;
  } else {
    return data;
  }
}

function getParser(parser) {
  return require(path.join(kaitaiDir, parser));
}

function parseBin(data, parser) {
  const Struct = getParser(parser);
  const struct = new Struct(new KaitaiStream(data));
  struct._read();
  return struct;
}

function extractSpans(struct, level=0) {
  let spans = [];

  for (const key of Object.keys(struct)) {
    if (key[0] === '_') {
      continue;
    }
    spans.push({
      id: key,
      class: struct[key].constructor.name,
      start: struct._debug[key].start,
      end: struct._debug[key].end,
      value: struct[key]._debug ? null : struct[key],
      level,
    });
    if (struct[key]._debug) {
      spans = spans.concat(extractSpans(struct[key], level + 1));
    }
  }

  spans.sort((a, b) => {
    if (a.start === b.start) {
      return a.level - b.level;
    }
    return a.start - b.start;
  })

  return spans;
}

function hexdump(data, parser) {
  let linebuf = "", hexbuf = "", asciibuf = "";
  let linecount = ((data.length + 15) / 16) | 0;
  let spans = [];
  let spanstack = [];

  if (parser) {
    const parsed = parseBin(data, parser);
    spans = extractSpans(parsed);
  }

  for (var i = 0; i < linecount; i++) {
    linebuf += (i * 16).toString(16).padStart(8, "0") + "\n";
  }

  linebuf = '<div class="line">' + linebuf + '</div>';

  for (var i = 0; i < data.length; i++) {
    if (i % 16 == 0 && i !== 0) {
      hexbuf += "\n";
    }

    let dirty = false, prevStack = spanstack.length !== 0;
    for (const span of spans) {
      if (i === span.start) {
        spanstack.push(span);
        dirty = true;
      } else if (i === span.end) {
        spanstack.pop();
        dirty = true;
      }
    }

    if (dirty) {
      if (prevStack) {
        hexbuf += "</span>";
      }
      if (spanstack.length) {
        let breadcrumbs = "";
        for (const span of spanstack) {
          breadcrumbs += ` > ${span.id}`;
          if (span.value) {
            breadcrumbs += ` = ${span.value}`;
          }
        }
        hexbuf += `<span class="structspan"><div class="popup">${breadcrumbs.slice(3)}</div>`;
      }
    }

    const byte = data[i];
    hexbuf += byte.toString(16).padStart(2, "0") + " ";
  }

  hexbuf = '<div class="hex">' + hexbuf + '</div>';

  for (var i = 0; i < data.length; i++) {
    if (i % 16 == 0 && i !== 0) {
      asciibuf += "\n";
    }

    for (const span in spans) {
      if (i === span.start) {
        asciibuf += genspanstart(span);
      } else if (i === span.end) {
        asciibuf += genspanend(span);
      }
    }

    const byte = data[i];
    if (byte >= 0x20 && byte <= 0x7F) {
      asciibuf += String.fromCharCode(byte);
    } else {
      asciibuf += '<span class="unprintable">.</span>';
    }
  }

  asciibuf = '<div class="ascii">' + asciibuf + '</div>';

  return '<div class="hexdump"><pre><code>' + linebuf + hexbuf + asciibuf + '</code></pre></div>';
}

class KaitaiStructAsset extends Asset {
  constructor(filepath, options) {
    super(filepath, options);
    this.type = "html";
    this.engine = new Liquid({
      root: templateDir,
      extname: ".html"
    });

    // Hack to add some dependency tracking for template files.
    this.engine.fs = patchFsWithDeps(this.engine.fs, this);

    this.engine.registerFilter("yaml", data => {
      return yaml.safeDump(data);
    });
    this.engine.registerFilter("highlight", (code, lang = "yaml") => {
      return hljs.highlight(lang, code).value;
    });
    this.engine.registerFilter("stripdocs", stripdocs);
    this.engine.registerFilter("markdown", md => marked(md || ""));
    this.engine.registerFilter("hexdump", hexdump);
    this.engine.registerFilter("packetid", id => id.toString(16).padStart(4, "0"));
  }

  findExamples(subdir, packet) {
    const examples = [];
    const fullPath = path.join(examplesDir, subdir);
    for (const example of glob.sync(`${fullPath}/*/${packet}*.bin`)) {
      const agent = example.slice(fullPath.length + 1).split('/')[0];
      examples.push({agent, filename: example});
    }
    return examples;
  }

  loadExamples() {
    for (const example of this.ast.examples) {
      this.addDependency(example.filename, { includedInParent: true, dynamic: true });
      example.data = fs.readFileSync(example.filename);
    }
  }

  async parse(code) {
    const templatePragma = /#pragma\.template (.+)/g.exec(code);
    let template = "packet";
    if (templatePragma) {
      template = templatePragma[1];
    }

    const examplePragma = /#pragma\.examples ([a-z0-9/]+) ([a-f0-9]+)/g.exec(code);
    let examples = [];
    if (examplePragma) {
      examples = this.findExamples(examplePragma[1], examplePragma[2]);
    }

    const parseAsPragma = /#pragma\.parseAs (.+)/g.exec(code);
    let parser = "";
    if (parseAsPragma) {
      parser = parseAsPragma[1];
    }

    return {
      template,
      examples,
      parser,
      yaml: yaml.safeLoad(code)
    };
  }

  dependencyForImport(file) {
    // TODO(jchw): Maybe implement KS_PATH resolution?
    return "./" + file + ".ksy";
  }

  importToFullPath(imp) {
    return path.resolve(
      path.dirname(this.name),
      this.dependencyForImport(imp)
    );
  }

  collectDependencies() {
    this.loadExamples();

    if (!this.ast.yaml.meta || !this.ast.yaml.meta.imports) {
      return;
    }

    for (const file of this.ast.yaml.meta.imports) {
      this.addURLDependency(this.dependencyForImport(file), {
        entry: true,
        dynamic: true
      });
    }
  }

  getTemplateContext() {
    return {
      struct: this.ast.yaml,
      parser: this.ast.parser,
      examples: this.ast.examples,
      cases: this.ast.cases,
      types: this.ast.types,
      urlpath: "/" + path.relative(this.options.rootDir, this.name),
      repopath: path.relative(path.dirname(this.options.rootDir), this.name),
    };
  }

  async transform() {
    // Provide imported types.
    this.ast.types = {};
    if (this.ast.yaml.meta && this.ast.yaml.meta.imports) {
      for (const file of this.ast.yaml.meta.imports) {
        // TODO(jchw): this is inefficient, but I can't figure out how to get the necessary bits otherwise :(
        const fullpath = this.importToFullPath(file);
        const asset = new KaitaiStructAsset(fullpath, this.options);
        await asset.process();
        this.ast.types[asset.ast.yaml.meta.id] = asset.getTemplateContext();
      }
    }

    // Provide cases.
    this.ast.cases = [];
    if (this.ast.yaml.seq) {
      for (const field of this.ast.yaml.seq) {
        if (!field.type || !field.type.cases) {
          continue;
        }
        for (const [key, value] of Object.entries(field.type.cases)) {
          this.ast.cases.push({ key, value: value.split("(", 1)[0] });
        }
      }
    }
  }

  async generate() {
    return [{
      type: "html",
      value: await this.engine.renderFile(this.ast.template, this.getTemplateContext())
    }];
  }
}

module.exports = KaitaiStructAsset;
