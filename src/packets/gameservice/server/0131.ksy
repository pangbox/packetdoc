#pragma.examples gameservice/server 0131
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0131_unknown
  title: GameService Server 0131 Unknown
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet has unknown meaning.
  
  This is a response to [Gameservice Client 0x0002 Hello / Login](/packets/gameservice/client/0002.ksy),
  but it also apparently sent automatically at the top of the hour.

seq:
  - id: unknown_a
    type: u1
  - id: entry_count
    type: u1
    doc: Only 21 (0x15) witnessed.
  - id: entries
    type: entry
    repeat: expr
    repeat-expr: entry_count

types:
  entry:
    seq:
      - id: entry_index
        type: u1
        doc: Increments from 0x00 to (entry_count - 1)
      - id: entry_value
        type: u4
        doc: All seen values multiples of 10, in no particular order.
