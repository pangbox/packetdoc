#pragma.examples gameservice/server 021d
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_021d_unknown
  title: GameService Server 021D Unknown
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  **Important**: This packet is segmented into 300-entry lists. When more than
  300 entries exist, multiple of this packet will be sent consecutively. The
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
