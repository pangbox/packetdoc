// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './LoginservicePacket', './GameservicePacket', './MessageservicePacket'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./LoginservicePacket'), require('./GameservicePacket'), require('./MessageservicePacket'));
  } else {
    root.PangyaPacket = factory(root.KaitaiStream, root.LoginservicePacket, root.GameservicePacket, root.MessageservicePacket);
  }
}(this, function (KaitaiStream, LoginservicePacket, GameservicePacket, MessageservicePacket) {
/**
 * Welcome to Packetdoc, a documentation of Pangya packets. Pangya is divided
 * into 3 different services:
 * 
 *   * LoginService: Provides basic authentication capabilities.
 *   * GameService: Synchronizes game state across clients.
 *   * MessageService: Provides messaging capabilities.
 * 
 * Packets themselves are divided into client and server packets for these
 * respective services.
 */

var PangyaPacket = (function() {
  PangyaPacket.Service = Object.freeze({
    LOGINSERVICE: 0,
    GAMESERVICE: 1,
    MESSAGESERVICE: 2,

    0: "LOGINSERVICE",
    1: "GAMESERVICE",
    2: "MESSAGESERVICE",
  });

  function PangyaPacket(_io, _parent, _root, type, origin) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;
    this.type = type;
    this.origin = origin;
    this._debug = {};

  }
  PangyaPacket.prototype._read = function() {
    this._debug.packet = { start: this._io.pos, ioOffset: this._io._byteOffset };
    switch (this.type) {
    case 0:
      this.packet = new LoginservicePacket(this._io, this, null, this.origin);
      this.packet._read();
      break;
    case 1:
      this.packet = new GameservicePacket(this._io, this, null, this.origin);
      this.packet._read();
      break;
    case 2:
      this.packet = new MessageservicePacket(this._io, this, null, this.origin);
      this.packet._read();
      break;
    }
    this._debug.packet.end = this._io.pos;
  }

  return PangyaPacket;
})();
return PangyaPacket;
}));
