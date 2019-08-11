// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Pstring = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
var Pstring = (function() {
  function Pstring(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;
    this._debug = {};

  }
  Pstring.prototype._read = function() {
    this._debug.length = { start: this._io.pos, ioOffset: this._io._byteOffset };
    this.length = this._io.readU2le();
    this._debug.length.end = this._io.pos;
    this._debug.data = { start: this._io.pos, ioOffset: this._io._byteOffset };
    this.data = KaitaiStream.bytesToStr(this._io.readBytes(this.length), "ASCII");
    this._debug.data.end = this._io.pos;
  }

  return Pstring;
})();
return Pstring;
}));
