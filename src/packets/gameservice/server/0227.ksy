#pragma.examples gameservice/server 0227
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0227_quest_submit_response
  title: GameService Server Quest Submit Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges claiming a completed quest.
  
  This is one of the responses to [GameService Client 0x0153 Quest Submit](/packets/gameservice/client/0153.ksy).

seq:
  - id: unknown_b
    type: u4
  - id: quest_count
    type: u4
    doc: All examples are 1, but this follows pattern established elsewhere.
  - id: quest_status_slot
    type: u4
    repeat: expr
    repeat-expr: quest_count
