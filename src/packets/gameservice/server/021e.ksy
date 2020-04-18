#pragma.examples gameservice/server 021e
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_021e_achievement_association_report
  title: GameService Server Achievement Association Report
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet lists all the user's achievements and assocates real IDs with user-specific status IDs.

  **Important**: This packet is segmented into 18-group lists. When more than
  18 groups exist, multiple of this packet will be sent consecutively. The
  'pending' integer in each is the total count of groups in the current packet
  plus all future packets in the series.
  
  This packet is sent during the response to [GameService Client 0x0002 Hello](/packets/gameservice/client/0002.ksy).

seq:
  - id: unknown_a
    size: 4
  - id: achievement_groups_pending
    type: u4
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
        doc: From pangya_xx.iff/Achievement.iff.
      - id: achievement_group_slot
        type: u4
        doc: Unconfirmed.
      - id: unknown_c
        type: u4
        doc: All examples show 3 (0x00000003).
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
        doc: Ref. [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy). Identical for entire group.
      - id: achievement_status_slot
        type: u4
        doc: Ref. [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy). Achieved are unique; unachieved identical for entire group.
      - id: unknown_unix_time
        type: u4
        doc: Timestamp of when achieved. Unachieved are 0 (0x00000000).
