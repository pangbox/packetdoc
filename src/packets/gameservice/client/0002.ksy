#pragma.examples gameservice/client 0002
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0002_hello
  title: GameService Client Hello / Login
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet begins communication between the gameserver and the client, after
  interaction with the loginserver has completed and the client has been handed off.

seq:
  - id: user_name
    type: pstring
    doc: |
      Local user's name
  - id: user_id
    type: u4
    doc: |
      Local user's ID
  - id: padding_a
    size: 4
    doc: Likely padding.
  - id: unknown_b
    size: 2
  - id: login_key
    type: pstring
    doc: |
      Provided by [Loginservice Server 0x0010 Login Key](/packets/loginservice/server/0010.ksy).
  - id: client_version
    type: pstring
    doc: |
      e.g. "829.01"
  - id: unknown_c
    size: 4
  - id: padding_d
    size: 4
    doc: Likely padding.
  - id: session_key
    type: pstring
    doc: |
      Provided by [Loginservice Server 0x0003 Session Key](/packets/loginservice/server/0003.ksy) or [Gameservice Server 0x01D4 New Session Key](/packets/loginservice/server/01d4.ksy).
