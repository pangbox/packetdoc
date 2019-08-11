// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './LoginserviceClient0001Login'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./LoginserviceClient0001Login'));
  } else {
    root.LoginserviceClientPacket = factory(root.KaitaiStream, root.LoginserviceClient0001Login);
  }
}(this, function (KaitaiStream, LoginserviceClient0001Login) {
var LoginserviceClientPacket = (function() {
  function LoginserviceClientPacket(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;
    this._debug = {};

  }
  LoginserviceClientPacket.prototype._read = function() {
    this._debug.packetId = { start: this._io.pos, ioOffset: this._io._byteOffset };
    this.packetId = this._io.readU2le();
    this._debug.packetId.end = this._io.pos;
    this._debug.data = { start: this._io.pos, ioOffset: this._io._byteOffset };
    switch (this.packetId) {
    case 1:
      this.data = new LoginserviceClient0001Login(this._io, this, null);
      this.data._read();
      break;
    }
    this._debug.data.end = this._io.pos;
  }

  return LoginserviceClientPacket;
})();
return LoginserviceClientPacket;
}));
