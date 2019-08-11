// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.MessageserviceServerPacket = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
var MessageserviceServerPacket = (function() {
  function MessageserviceServerPacket(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;
    this._debug = {};

  }
  MessageserviceServerPacket.prototype._read = function() {
    this._debug.packetId = { start: this._io.pos, ioOffset: this._io._byteOffset };
    this.packetId = this._io.readU2le();
    this._debug.packetId.end = this._io.pos;
  }

  return MessageserviceServerPacket;
})();
return MessageserviceServerPacket;
}));
