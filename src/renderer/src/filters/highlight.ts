import hljs from "highlight.js";

export default (code: string, lang = "yaml") =>
  hljs.highlight(lang, code).value;
