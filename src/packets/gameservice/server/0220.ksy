#pragma.examples gameservice/server 0220
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0220_achievement_list
  title: GameService Server Achievement List
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is a list of all achievements IDs, including timestamps to when
  the user has earnt them.

seq:
  - id: unknown_a
    size: 4
  - id: achievement_group_count
    type: u4
  - id: achievement_groups
    type: achievement_group
    repeat: expr
    repeat-expr: achievement_group_count

types:
  achievement_group:
    seq:
      - id: unknown_b
        size: 1
      - id: achievement_group_id
        type: u4
      - id: unknown_c
        size: 8
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
        doc: From pangya_xx.iff/Achievement.iff
      - id: achievement_status_id
        type: u4
        doc: Referenced in [Gameservice Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy).
      - id: achievement_status_slot
        type: u4
        doc: Referenced in [Gameservice Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy).
      - id: achievement_unix_time
        type: u4
        doc: Timestamp of when achieved. 0 = unachieved.
