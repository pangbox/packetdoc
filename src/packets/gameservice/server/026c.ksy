#pragma.examples gameservice/server 026c
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_026c_big_black_papel_result
  title: GameService Server Big Black Papel Result
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges playing the Big Black Papel gacha game.
  
  Structurally, it is identical to the results for a standard Black Papel play.
  
  It is a response to:
  * [GameService Client 0x0186 Big Black Papel Play](/packets/gameservice/client/0186.ksy).
  
  **See Also:**
  * [GameService Server 0x021b Black Papel Result](/packets/gameservice/server/021b.ksy).

seq:
  - id: unknown_gss026c_a
    size: 8
    doc: All 0x00?
  - id: item_count
    type: u4
  - id: items
    type: item
    repeat: expr
    repeat-expr: item_count
  - id: pang_balance
    type: u4
    doc: New pang balance after play.
  - id: unknown_gss026c_b
    size: 12
    doc: All 0x00?
  
types:
  item:
    seq:
      - id: ball_colour
        type: u4
        doc: This value is moot, as Big Black Papel plays always produce a single giant black ball.
        enum: ball_colour
      - id: item_id
        type: u4
        doc: From pangya_xx.iff/Item.iff, Part.iff, etc.
      - id: inventory_slot
        type: u4
        doc: If new/no slot assigned yet, 0 (0x00000000).
      - id: item_quantity
        type: u4
      - id: item_rarity
        type: u4
        doc: This value is moot, as Big Black Papel plays immediately proceed to results screen.
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
