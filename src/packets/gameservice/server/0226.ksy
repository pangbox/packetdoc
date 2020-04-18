#pragma.examples gameservice/server 0225
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0226_quest_accept_response
  title: GameService Server Quest Accept Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet recognizes the user accepting the daily quests.
  
  This is the response to [GameService Client 0x0152 Quest Accept](/packets/gameservice/client/0152.ksy).

seq:
  - id: unknown_a
    size: 4
  - id: quest_count
    type: u4
  - id: quests
    type: quest
    repeat: expr
    repeat-expr: quest_count

types:
  quest:
    seq:
      - id: unknown_b
        type: u1
      - id: quest_id
        type: u4
        doc: From pangya_xx.iff/QuestItem.iff.
      - id: quest_status_slot
        type: u4
      - id: unknown_c
        type: u4
      - id: unknown_d
        type: u4
      - id: achievement_id
        type: u4
        doc: From pangya_xx.iff/Achievement.iff. Associated achievement.
      - id: achievement_status_id
        type: u4
        doc: From pangya_xx.iff/Achievement.iff. Associated achievement.
      - id: achievement_status_slot
        type: u4
        doc: From [GameService Server 0x021E User Achievements](/packets/gameservice/server/021e.ksy). Associated achievement.
      - id: unknown_e
        type: u4
