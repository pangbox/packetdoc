#pragma.examples gameservice/server 0228
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0228_quest_dismiss_response
  title: GameService Server Quest Dismiss Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges dismissing quests.
  
  This is one of the responses to [GameService Client 0x0154 Quest Dismiss](/packets/gameservice/client/0154.ksy).

seq:
  - id: unknown_a
    type: u4
  - id: quest_count
    type: u4
  - id: quest_status_slot
    type: u4
    repeat: expr
    repeat-expr: quest_count
