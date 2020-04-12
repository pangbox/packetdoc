#pragma.examples gameservice/server 0251
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0251_event_mode_leave_response
  title: GameService Server Event Mode Leave Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges a user has left Grand Prix event mode.
  
  It is a response to [GameService Client 0x0177 Event Mode Leave](/packets/gameservice/client/0177.ksy).

seq:
  - id: unknown_a
    type: u4
    doc: All examples show 0 (0x00000000).
