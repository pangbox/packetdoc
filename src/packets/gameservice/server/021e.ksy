#pragma.examples gameservice/server 021e
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_021e_unknown
  title: GameService Server 021E Unknown
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  **Important**: This packet is segmented into 18-entry lists. When more than
  18 entries exist, multiple of this packet will be sent consecutively. The
  'pending' integer in each is the total count of entries in the current packet
  plus all future packets in the series.

seq:
  - id: unknown_a
    size: 4
  - id: entries_pending
    type: u4
  - id: entry_count
    type: u4
  - id: entries
    type: entry
    repeat: expr
    repeat-expr: entry_count

types:
  entry:
    seq:
      - id: unknown_b
        size: 13
      - id: sub_entry_count
        type: u4
      - id: sub_entries
        type: sub_entry
        repeat: expr
        repeat-expr: sub_entry_count
  sub_entry:
    seq:
      - id: quest_id_a
        type: u4
        doc: Group ID in pangya_xx.iff/QuestStuff.iff (maybe Achievement ID instead?)
      - id: quest_id_b
        type: u4
        doc: Sub ID in pangya_xx.iff/QuestStuff.iff
      - id: unknown_id_c
        type: u4  
      - id: unknown_unix_time
        type: u4
        doc: Timestamp of when triggered. 0 = not triggered.
