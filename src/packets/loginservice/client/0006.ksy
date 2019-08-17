#pragma.examples loginservice/client 0006
#pragma.parseAs LoginserviceClientPacket
---
meta:
  id: loginservice_client_0006_set_nickname
  title: LoginService Client Set Nickname
  encoding: ASCII
  endian: le

doc: |
  This packet is sent by the PangYa client to set the player's nickname.
  
  In `hsreina/pangya-server`, the packet ID is `TCLPID.PLAYER_SET_NICKNAME`.

seq:
  - id: nickname
    type: pstring
    doc: |
      Nickname to set.
