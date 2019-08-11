// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.PacketOrigin = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
var PacketOrigin = (function() {
  PacketOrigin.Origin = Object.freeze({
    CLIENT: 0,
    SERVER: 1,

    0: "CLIENT",
    1: "SERVER",
  });

  function PacketOrigin(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;
    this._debug = {};

  }
  PacketOrigin.prototype._read = function() {
  }

  return PacketOrigin;
})();
return PacketOrigin;
}));
