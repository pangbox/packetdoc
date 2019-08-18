import KaitaiStream from "kaitai-struct/KaitaiStream";
import path from "path";

const kaitaiDir = "../../../../src/scripts/kaitai/";

interface Span {
  id: string;
  class: string;
  start: number;
  end: number;
  value: number;
  level: number;
}

function getParser(parserName: string) {
  return require(path.join(kaitaiDir, parserName));
}

function parseBin(data: Buffer, parser: string) {
  const Struct = getParser(parser);
  const struct = new Struct(new KaitaiStream(data));
  struct._read();
  return struct;
}

function extractSpans(struct: any, level = 0) {
  let spans: Span[] = [];

  for (const key of Object.keys(struct)) {
    if (key[0] === "_") {
      continue;
    }
    spans.push({
      id: key,
      class: struct[key].constructor.name,
      start: struct._debug[key].start,
      end: struct._debug[key].end,
      value: struct[key]._debug ? null : struct[key],
      level
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
  });

  return spans;
}

export default function hexdump(data: Buffer, parser: string) {
  let linebuf = "",
    hexbuf = "",
    asciibuf = "";
  let linecount = ((data.length + 15) / 16) | 0;
  let spans: Span[] = [];
  let spanstack: Span[] = [];

  if (parser) {
    const parsed = parseBin(data, parser);
    spans = extractSpans(parsed);
  }

  for (var i = 0; i < linecount; i++) {
    linebuf += (i * 16).toString(16).padStart(8, "0") + "\n";
  }

  linebuf = '<div class="line">' + linebuf + "</div>";

  for (var i = 0; i < data.length; i++) {
    if (i % 16 == 0 && i !== 0) {
      hexbuf += "\n";
    }

    let dirty = false,
      prevStack = spanstack.length !== 0;
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
        hexbuf += `<span class="structspan"><div class="popup">${breadcrumbs.slice(
          3
        )}</div>`;
      }
    }

    const byte = data[i];
    hexbuf += byte.toString(16).padStart(2, "0") + " ";
  }

  hexbuf = '<div class="hex">' + hexbuf + "</div>";

  for (var i = 0; i < data.length; i++) {
    if (i % 16 == 0 && i !== 0) {
      asciibuf += "\n";
    }

    const byte = data[i];
    if (byte >= 0x20 && byte <= 0x7f) {
      asciibuf += String.fromCharCode(byte);
    } else {
      asciibuf += '<span class="unprintable">.</span>';
    }
  }

  asciibuf = '<div class="ascii">' + asciibuf + "</div>";

  return (
    '<div class="hexdump"><pre><code>' +
    linebuf +
    hexbuf +
    asciibuf +
    "</code></pre></div>"
  );
}
