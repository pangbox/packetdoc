import marked from "marked";
import hljs from "highlight.js";

const markedOptions: marked.MarkedOptions = {
  highlight: function(code, lang) {
    if (lang) {
      return hljs.highlight(lang, code).value;
    } else {
      return hljs.highlightAuto(code).value;
    }
  }
};

export default (text: string) => marked(text || "", markedOptions);
