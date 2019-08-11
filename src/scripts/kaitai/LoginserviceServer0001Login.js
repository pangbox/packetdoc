// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.LoginserviceServer0001Login = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
var LoginserviceServer0001Login = (function() {
  function LoginserviceServer0001Login(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;
    this._debug = {};

  }
  LoginserviceServer0001Login.prototype._read = function() {
  }

  return LoginserviceServer0001Login;
})();
return LoginserviceServer0001Login;
}));
