import Asset from "parcel-bundler/lib/Asset";
import path from "path";
import { TemplateRenderer } from "./template";

class MarkdownAsset extends Asset {
  ast: string = "";
  renderer: TemplateRenderer;

  constructor(filepath: string, options: any) {
    super(filepath, options);
    this.type = "html";
    this.renderer = new TemplateRenderer(this);
  }

  async parse(code: string): Promise<string> {
    return code;
  }

  getTemplateContext() {
    return {
      code: this.ast,
      repopath: path.relative(path.dirname(this.options.rootDir), this.name)
    };
  }

  async generate() {
    return [
      {
        type: "html",
        value: await this.renderer.render("markdown", this.getTemplateContext())
      }
    ];
  }
}

module.exports = MarkdownAsset;
