// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './LoginserviceServer0001Login'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./LoginserviceServer0001Login'));
  } else {
    root.LoginserviceServerPacket = factory(root.KaitaiStream, root.LoginserviceServer0001Login);
  }
}(this, function (KaitaiStream, LoginserviceServer0001Login) {
var LoginserviceServerPacket = (function() {
  function LoginserviceServerPacket(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;
    this._debug = {};

  }
  LoginserviceServerPacket.prototype._read = function() {
    this._debug.packetId = { start: this._io.pos, ioOffset: this._io._byteOffset };
    this.packetId = this._io.readU2le();
    this._debug.packetId.end = this._io.pos;
    this._debug.data = { start: this._io.pos, ioOffset: this._io._byteOffset };
    switch (this.packetId) {
    case 1:
      this.data = new LoginserviceServer0001Login(this._io, this, null);
      this.data._read();
      break;
    }
    this._debug.data.end = this._io.pos;
  }

  return LoginserviceServerPacket;
})();
return LoginserviceServerPacket;
}));
