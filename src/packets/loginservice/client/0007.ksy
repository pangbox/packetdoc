#pragma.examples loginservice/client 0007
#pragma.parseAs LoginserviceClientPacket
---
meta:
  id: loginservice_client_0007_check_nickname
  title: LoginService Client Check Nickname
  encoding: ASCII
  endian: le

doc: |
  This packet is sent by the PangYa client to check if a given nickname is
  allowed, prior to setting the nickname.
  
  In `hsreina/pangya-server`, the packet ID is `TCLPID.PLAYER_CONFIRM`.

seq:
  - id: nickname
    type: pstring
    doc: |
      Nickname to check.
