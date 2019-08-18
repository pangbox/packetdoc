import Asset from "parcel-bundler/lib/Asset";
import path from "path";
import fs from "fs";
import glob from "glob";
import { TemplateRenderer } from "./template";
import { KaitaiStructFile } from "./struct";

const pragmaTemplateRe = /#pragma\.template (.+)/;
const pragmaExamplesRe = /#pragma\.examples ([a-z0-9/]+) ([a-f0-9]+)/;
const pragmaParseAsRe = /#pragma\.parseAs (.+)/;

const examplesDir = path.resolve(__dirname, "../../../examples/");

interface Example {
  agent: string;
  filename: string;
  data: Buffer;
}

class AssetData {
  file: KaitaiStructFile;
  examples: Example[] = [];

  examplesArg: string | null = null;
  examplesSubDir: string | null = null;
  parserName: string | null = null;
  templateName: string;

  constructor(asset: Asset, code: string) {
    const templatePragma = code.match(pragmaTemplateRe);
    this.templateName = "packet";
    if (templatePragma) {
      [, this.templateName] = templatePragma;
    }

    const examplesPragma = code.match(pragmaExamplesRe);
    if (examplesPragma) {
      [, this.examplesSubDir, this.examplesArg] = examplesPragma;
    }

    const parseAsPragma = code.match(pragmaParseAsRe);
    if (parseAsPragma) {
      [, this.parserName] = parseAsPragma;
    }

    this.file = new KaitaiStructFile(asset.name, code);
  }
}

class KaitaiStructAsset extends Asset {
  ast: AssetData;
  renderer: TemplateRenderer;

  constructor(filepath: string, options: any) {
    super(filepath, options);
    this.type = "html";
    this.renderer = new TemplateRenderer(this);
  }

  loadExamples() {
    if (!this.ast.examplesSubDir || !this.ast.examplesArg) {
      return;
    }

    const fullPath = path.join(examplesDir, this.ast.examplesSubDir);
    for (const filename of glob.sync(
      `${fullPath}/*/${this.ast.examplesArg}*.bin`
    )) {
      this.addDependency(filename, {
        includedInParent: true,
        dynamic: true
      });

      const agent = filename.slice(fullPath.length + 1).split("/")[0];
      const data = fs.readFileSync(filename);
      this.ast.examples.push({ agent, filename, data });
    }
  }

  get cases() {
    for (const field of this.ast.file.root.fields) {
      if (field.switch) {
        return field.switch.cases;
      }
    }
  }

  async parse(code: string): Promise<AssetData> {
    return new AssetData(this, code);
  }

  collectDependencies() {
    this.ast.file.loadImports(filename => {
      const relativeName = path.relative(path.dirname(this.name), filename);
      this.addURLDependency(relativeName, {
        entry: true,
        dynamic: true
      });
      return fs.readFileSync(filename, { encoding: this.encoding });
    });
  }

  getTemplateContext() {
    return {
      file: this.ast.file,
      struct: this.ast.file.root,
      parser: this.ast.parserName,
      examples: this.ast.examples,
      cases: this.cases,
      enums: this.ast.file.localEnums,
      types: this.ast.file.localTypes,
      typeMap: this.ast.file.typeMap,
      repopath: path.relative(path.dirname(this.options.rootDir), this.name),
    };
  }

  async generate() {
    this.loadExamples();

    return [
      {
        type: "html",
        value: await this.renderer.render(
          this.ast.templateName,
          this.getTemplateContext()
        )
      }
    ];
  }
}

module.exports = KaitaiStructAsset;