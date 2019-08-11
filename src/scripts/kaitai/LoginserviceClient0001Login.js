// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './Pstring'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./Pstring'));
  } else {
    root.LoginserviceClient0001Login = factory(root.KaitaiStream, root.Pstring);
  }
}(this, function (KaitaiStream, Pstring) {
/**
 * This packet is sent by the PangYa client when the user clicks the 'Login'
 * button. Upon clicking login, the client opens a TCP connection to the
 * LoginService, performs the protocol handshake, sends this message, and then
 * awaits a reply from the server.
 */

var LoginserviceClient0001Login = (function() {
  function LoginserviceClient0001Login(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;
    this._debug = {};

  }
  LoginserviceClient0001Login.prototype._read = function() {
    this._debug.username = { start: this._io.pos, ioOffset: this._io._byteOffset };
    this.username = new Pstring(this._io, this, null);
    this.username._read();
    this._debug.username.end = this._io.pos;
    this._debug.password = { start: this._io.pos, ioOffset: this._io._byteOffset };
    this.password = new Pstring(this._io, this, null);
    this.password._read();
    this._debug.password.end = this._io.pos;
    this._debug.padding = { start: this._io.pos, ioOffset: this._io._byteOffset };
    this.padding = this._io.readBytesFull();
    this._debug.padding.end = this._io.pos;
  }

  /**
   * Username, as entered by the user in the Login dialog.
   */

  /**
   * Password, as entered by the user in the Login dialog. In some releases,
   * such as the TH release, this is sent as plaintext, whereas in others, it
   * is sent as an MD5 hash.
   */

  /**
   * A few padding bytes. In the US release, this is 17 bytes of zeros. In
   * the TH release, this is 18 bytes, and is a static pattern on every
   * login. It is unclear what the function of this is.
   * 
   * Note that the padding does not improve the obfuscation. In the US
   * release, because this is zeroed, the last four characters of the MD5 sum
   * will appear unobfuscated in the ciphertext, because they will be XOR'd
   * with the zeros.
   */

  return LoginserviceClient0001Login;
})();
return LoginserviceClient0001Login;
}));
