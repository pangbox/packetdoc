#pragma.examples loginservice/server 0003
#pragma.parseAs LoginserviceServerPacket
---
meta:
  id: loginservice_server_0003_session_key
  title: LoginService Server Session Key
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is sent shortly after choosing a game server to use with
  [LoginService Client 0x0003 Select Server](/packets/loginservice/client/0003.ksy),
  and contains the session key the client must use to initiate connection with
  said game server in [GameService Client 0x0002 Hello](/packets/gameservice/client/0002.ksy).

seq:
  - id: unknown_a
    size: 4
    doc: Possibly padding?
  - id: session_key
    type: pstring
    doc: In PangyaTH, this is assigned sequentially!
