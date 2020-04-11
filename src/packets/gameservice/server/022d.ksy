#pragma.examples gameservice/server 022d
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_022d_achievement_status_response
  title: GameService Server Achievement Status Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet appears to detail the user's progress in all achievements.
  
  **Important**: This packet is segmented into 20-entry lists. When more than
  20 entries exist, multiple of this packet will be sent consecutively. The
  'pending' integer in each is the total count of entries in the current packet
  plus all future packets in the series.
  
  This is one of the responses to [GameService Client 0x0157 Achievement Status Request](/packets/gameservice/client/0157.ksy).

seq:
  - id: unknown_a
    size: 4
  - id: achievement_count_pending
    type: u4
  - id: achievement_count
    type: u4
  - id: achievement_groups
    type: achievement_group
    repeat: expr
    repeat-expr: achievement_count

types:
  achievement_group:
    seq:
      - id: unknown_b
        size: 4
      - id: achievement_group_id
        type: u4
        doc: From pangya_xx.iff/Achievement.iff.
      - id: achievement_count
        type: u4
      - id: achievements
        type: achievement
        repeat: expr
        repeat-expr: achievement_count
  achievement:
    seq:
      - id: achievement_id
        type: u4
        doc: From pangya_xx.iff/Achievement.iff.
      - id: achievement_value
        type: u4
        doc: Unconfirmed.
      - id: achievement_unix_time
        size: 4
        doc: Timestamp of when achieved. 0 = unachieved.
