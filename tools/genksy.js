const path = require("path");
const fs = require("fs");
const yaml = require("js-yaml");
const KaitaiStructCompiler = require("kaitai-struct-compiler");
const compiler = new KaitaiStructCompiler();

const entryFn = "../src/index";
const entryDir = path.dirname(path.resolve(__dirname, entryFn));
const outputDir = path.resolve(__dirname, "../src/scripts/kaitai");

function dependencyForImport(file) {
  // TODO(jchw): Maybe implement KS_PATH resolution?
  return "./" + file + ".ksy";
}

function importToFullPath(imp) {
  return path.resolve(
    entryDir,
    dependencyForImport(imp)
  );
}

kaitaiImporter = {
  importYaml: name => {
    var importKsyYaml = fs.readFileSync(importToFullPath(name));
    var importKsy = yaml.safeLoad(importKsyYaml);
    return Promise.resolve(importKsy);
  }
};

kaitaiImporter.importYaml(entryFn).then(async ksy => {
  const files = await compiler.compile("javascript", ksy, kaitaiImporter, true);
  for (const [name, source] of Object.entries(files)) {
    console.log(`Writing ${name}.`)
    fs.writeFileSync(path.join(outputDir, name), source);
  }
  console.log("All done.")
}).catch(console.error);
