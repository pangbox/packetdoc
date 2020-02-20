#pragma.examples gameservice/client 001f
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_001f_unknown
  title: GameService Client 001F Unknown
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This is a stub entry.
  
seq:
  - id: unknown_a
    size: 1
    doc: |
      Known values are $00 and $01
  - id: entity_count
    type: u1
  - id: entity_list
    type: entity
    repeat: expr
    repeat-expr: entity_count

types:
  entity:
    seq:
      - id: unknown_b
        size: 5
