#pragma.examples loginservice/server 0001
#pragma.parseAs LoginserviceServerPacket
---
meta:
  id: loginservice_server_0001_login
  title: LoginService Server 0x0001 Login Packet
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is sent by the PangYa server in a variety of circumstances, and
  has many different forms. The primary function of this packet is to provide
  a response to the client Login request packet.

  The other roles this packet is used in are still fairly related. During
  first login, a user is sent this packet with `status::need_set_nickname`,
  which prompts the client to set a nickname. After that, the login packet
  is sent again with `status::need_select_character`. Finally, it is sent
  with the usual `status::success` once the character is selected.

  When the server returns `error_code::already_logged_in`, the client then
  automatically sends
  [LoginService Client 0x0004 Ghost](/packets/loginservice/client/0004.ksy)
  to end the old session. This may happen, for example, if your last session
  was disconnected before you were able to log out or exit properly. If you
  are still connected, the server will instead return
  `error_code::duplicate_connection`.
  
  In `hsreina/pangya-server`, the packet ID is `TSLPID.LOGIN`.

  **See Also**:
  [LoginService Client 0x0001 Login Packet](/packets/loginservice/client/0001.ksy)

seq:
  - id: status
    type: u1
    enum: status
    doc: |
      Status code; zero when the login was successful.
  - id: response
    type:
      switch-on: status
      cases:
        status::success: login_success
        status::need_set_nickname: login_need_set_nickname
        status::need_select_character: login_need_select_character
        status::error: login_error

types:
  login_success:
    doc: |
      Sent after a successful login.
    seq:
      - id: username
        type: pstring
        doc: |
          Name used for authentication. The game typically enforces that this
          differ from your nickname.
      - id: user_id
        type: u4
        doc: |
          User ID. Probably usually just the primary key in a database.
      - id: unknown
        size: 14
        doc: |
          Some unknown bytes; most of these are zeros.
      - id: nickname
        type: pstring
        doc: |
          The user's nickname. As a wrinkle, official servers seem to return
          an empty string for this after the first login process is completed,
          despite the fact that a nickname was set already.
  login_need_set_nickname:
    seq:
      - id: unused
        contents: [0xff, 0xff, 0xff, 0xff]
        doc: |
          Appears to just be a constant, 0xff 0xff 0xff 0xff.
  login_need_select_character:
    seq: []
  login_error:
    seq:
      - id: error_code
        type: u4
        enum: error_code
        doc: |
          An error code. See the error_code enumeration for known possible
          values.

enums:
  status:
    0x00: success
    0xd9: need_set_nickname
    0xda: need_select_character
    0xe3: error

  error_code:
    5100019: already_logged_in
    5100107: duplicate_connection
