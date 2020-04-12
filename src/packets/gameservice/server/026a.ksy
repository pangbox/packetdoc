#pragma.examples gameservice/server 026a
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_026a_shot_assist_toggle_response
  title: GameService Server Shot Assist Toggle Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges the shot assist being toggled.
  
  This is one of the responses to [GameService Client 0x0184 Shot Assist Toggle](/packets/gameservice/client/0184.ksy).

seq:
  - id: unknown_a
    type: u4
    doc: All examples show 0 (0x00000000).
