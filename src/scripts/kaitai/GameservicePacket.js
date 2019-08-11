// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './GameserviceClientPacket', './GameserviceServerPacket'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./GameserviceClientPacket'), require('./GameserviceServerPacket'));
  } else {
    root.GameservicePacket = factory(root.KaitaiStream, root.GameserviceClientPacket, root.GameserviceServerPacket);
  }
}(this, function (KaitaiStream, GameserviceClientPacket, GameserviceServerPacket) {
var GameservicePacket = (function() {
  function GameservicePacket(_io, _parent, _root, origin) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;
    this.origin = origin;
    this._debug = {};

  }
  GameservicePacket.prototype._read = function() {
    this._debug.gamePacket = { start: this._io.pos, ioOffset: this._io._byteOffset };
    switch (this.origin) {
    case 0:
      this.gamePacket = new GameserviceClientPacket(this._io, this, null);
      this.gamePacket._read();
      break;
    case 1:
      this.gamePacket = new GameserviceServerPacket(this._io, this, null);
      this.gamePacket._read();
      break;
    }
    this._debug.gamePacket.end = this._io.pos;
  }

  return GameservicePacket;
})();
return GameservicePacket;
}));
