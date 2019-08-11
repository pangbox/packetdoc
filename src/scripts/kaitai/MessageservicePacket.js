// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './MessageserviceServerPacket', './MessageserviceClientPacket'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./MessageserviceServerPacket'), require('./MessageserviceClientPacket'));
  } else {
    root.MessageservicePacket = factory(root.KaitaiStream, root.MessageserviceServerPacket, root.MessageserviceClientPacket);
  }
}(this, function (KaitaiStream, MessageserviceServerPacket, MessageserviceClientPacket) {
var MessageservicePacket = (function() {
  function MessageservicePacket(_io, _parent, _root, origin) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;
    this.origin = origin;
    this._debug = {};

  }
  MessageservicePacket.prototype._read = function() {
    this._debug.messagePacket = { start: this._io.pos, ioOffset: this._io._byteOffset };
    switch (this.origin) {
    case 0:
      this.messagePacket = new MessageserviceClientPacket(this._io, this, null);
      this.messagePacket._read();
      break;
    case 1:
      this.messagePacket = new MessageserviceServerPacket(this._io, this, null);
      this.messagePacket._read();
      break;
    }
    this._debug.messagePacket.end = this._io.pos;
  }

  return MessageservicePacket;
})();
return MessageservicePacket;
}));
