#pragma.examples gameservice/server 021d
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_022d_unknown
  title: GameService Server 022D Unknown
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

seq:
  - id: unknown_a
    size: 8
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
        size: 8
      - id: sub_entry_count
        type: u4
      - id: sub_entries
        type: sub_entry
        repeat: expr
        repeat-expr: sub_entry_count
  sub_entry:
    seq:
      - id: unknown_c
        size: 12
