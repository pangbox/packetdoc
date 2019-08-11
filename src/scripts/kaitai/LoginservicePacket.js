// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './LoginserviceServerPacket', './LoginserviceClientPacket'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./LoginserviceServerPacket'), require('./LoginserviceClientPacket'));
  } else {
    root.LoginservicePacket = factory(root.KaitaiStream, root.LoginserviceServerPacket, root.LoginserviceClientPacket);
  }
}(this, function (KaitaiStream, LoginserviceServerPacket, LoginserviceClientPacket) {
var LoginservicePacket = (function() {
  function LoginservicePacket(_io, _parent, _root, origin) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;
    this.origin = origin;
    this._debug = {};

  }
  LoginservicePacket.prototype._read = function() {
    this._debug.loginPacket = { start: this._io.pos, ioOffset: this._io._byteOffset };
    switch (this.origin) {
    case 0:
      this.loginPacket = new LoginserviceClientPacket(this._io, this, null);
      this.loginPacket._read();
      break;
    case 1:
      this.loginPacket = new LoginserviceServerPacket(this._io, this, null);
      this.loginPacket._read();
      break;
    }
    this._debug.loginPacket.end = this._io.pos;
  }

  return LoginservicePacket;
})();
return LoginservicePacket;
}));
