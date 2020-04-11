#pragma.examples gameservice/server 0225
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0225_quest_status_response
  title: GameService Server Quest Status Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet appears to detail the user's quests.
  
  This is one of the responses to [GameService Client 0x0151 Quest Status Request](/packets/gameservice/client/0151.ksy).

seq:
  - id: unknown_a
    size: 4
  - id: quest_expiry_unix_time
    type: u4
    doc: Timestamp of (presumably) when the active quests will expire.
  - id: quest_started_unix_time
    type: u4
    doc: Timestamp of when the active quests were started.
  - id: quest_count
    type: u4
  - id: quest_id
    type: u4
    repeat: expr
    repeat-expr: quest_count
    doc: From pangya_xx.iff/Quest.iff.
  - id: quest_slot_count
    type: u4
  - id: quest_slot
    type: u4
    repeat: expr
    repeat-expr: quest_slot_count
    doc: |
      See [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy).
      When present, appears to be assigned sequentially?
