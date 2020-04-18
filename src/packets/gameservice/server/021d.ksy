#pragma.examples gameservice/server 021d
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_021d_achievement_progress_report
  title: GameService Server Achievement Progress Report
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet reports a list of all achievement progress.
  
  **Important**: This packet is segmented into 300-entry lists. When more than
  300 entries exist, multiple of this packet will be sent consecutively. The
  'pending' integer in each is the total count of entries in the current packet
  plus all future packets in the series.
  
  This packet is sent during the response to [GameService Client 0x0002 Hello](/packets/gameservice/client/0002.ksy).

seq:
  - id: unknown_a
    size: 4
  - id: achievements_pending
    type: u4
  - id: achievement_count
    type: u4
  - id: achievements
    type: achievement
    repeat: expr
    repeat-expr: achievement_count

types:
  achievement:
    seq:
      - id: unknown_b
        type: u1
      - id: achievement_status_id
        type: u4
      - id: achievement_status_slot
        type: u4
      - id: achievement_value
        type: u4
        doc: Progress value. Treated like a 'quantity', to be added and subtracted as needed.
