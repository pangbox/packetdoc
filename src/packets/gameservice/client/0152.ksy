#pragma.examples gameservice/client 0152
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0152_quest_accept
  title: GameService Client Quest Accept
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet accepts the currently offered lineup of daily quests.
  
  Its response is [GameService Server 0x0226 Quest Accept Response](/packets/gameservice/server/0226.ksy).

seq:
  - id: quest_count
    type: u4
  - id: quest_status_slot
    type: u4
    repeat: expr
    repeat-expr: quest_count
