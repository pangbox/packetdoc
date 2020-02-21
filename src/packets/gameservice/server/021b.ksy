#pragma.examples gameservice/server 021b
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_021b_black_papel_result
  title: GameService Server Black Papel Result
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains the results of a Black Papel play.
  
  This packet is part of the response to
  GameService Client 0x014B Black Papel Play. (TODO: Add link.)

seq:
  - id: unknown_a
    size: 8
  - id: item_count
    type: u4
  - id: items
    type: item
    repeat: expr
    repeat-expr: item_count
  - id: unknown_d
    size: 16

types:
  item:
    seq:
      - id: unknown_b
        size: 4
      - id: item_id
        type: u4
      - id: inventory_slot
        type: u4
      - id: item_quantity
        type: u4
      - id: unknown_c
        size: 4
