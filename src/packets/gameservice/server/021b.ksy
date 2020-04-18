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
  
  This packet is part of the response to [GameService Client 0x014B Black Papel Play](/packets/gameservice/client/014b.ksy).

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
      - id: ball_colour
        type: u4
        enum: ball_colour
      - id: item_id
        type: u4
      - id: inventory_slot
        type: u4
        doc: If new/no slot assigned yet, 0 (0x00000000).
      - id: item_quantity
        type: u4
      - id: item_rarity
        type: u4
        enum: item_rarity

enums:
  ball_colour:
    0x00000000: blue
    0x00000001: teal
    0x00000002: red
  item_rarity:
    0x00000000: black_normal
    0x00000001: blue_premium
    0x00000002: red_rare
