import Asset from "parcel-bundler/lib/Asset";
import Liquid from "liquidjs";
import path from "path";

import hexdumpFilter from "./filters/hexdump";
import highlightFilter from "./filters/highlight";
import markdownFilter from "./filters/markdown";
import stripdocsFilter from "./filters/stripdocs";
import yamlFilter from "./filters/yaml";
import { KaitaiStructFile, KaitaiStruct, KaitaiEnum, KaitaiEnumValue } from "./struct";

const templateDir = path.resolve(__dirname, "../../../src/templates/");

function patchFsWithDeps(engine: Liquid, asset: Asset) {
  const readFile = engine["fs"].readFile;
  engine["fs"] = {
    ...engine["fs"],
    readFile: (filepath: string) => {
      asset.addDependency(filepath, { includedInParent: true, dynamic: true });
      return readFile(filepath);
    }
  };
}

export class TemplateRenderer {
  engine: Liquid;

  constructor(asset: Asset) {
    this.engine = new Liquid({ root: templateDir, extname: ".html" });
    this.engine.registerFilter("yaml", yamlFilter);
    this.engine.registerFilter("highlight", highlightFilter);
    this.engine.registerFilter("stripdocs", stripdocsFilter);
    this.engine.registerFilter("markdown", markdownFilter);
    this.engine.registerFilter("hexdump", hexdumpFilter);
    this.engine.registerFilter("packetid", id =>
      Number(id)
        .toString(16)
        .padStart(4, "0")
    );
    this.engine.registerFilter(
      "urlpath",
      (file: KaitaiStructFile) =>
        "/" + path.relative(asset.options.rootDir, file.filename)
    );
    this.engine.registerFilter("urlhash", (type: KaitaiStruct|KaitaiEnum|KaitaiEnumValue) => {
      if (type instanceof KaitaiEnumValue) {
        return `${type.parent.id}__${type.id}`;
      }
      return type.id;
    });
    this.engine.registerFilter("mapGet", (map: Map<any, any>, key: any) =>
      map.get(key)
    );
    patchFsWithDeps(this.engine, asset);
  }

  async render(template: string, context: object) {
    return this.engine.renderFile(template, context);
  }
}
