#pragma.examples gameservice/client 0158
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0158_tiki_shop_convert_item
  title: GameService Client Tiki Shop Convert Item
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet converts items into other items in the Cadie's Magicbox section of Tiki's Shop.
  
  The responses are:
  * [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy) to remove ingredients and add created items,
  * [GameService Server 0x022F Tiki Shop Convert Item Response](/packets/gameservice/server/022f.ksy) to acknowledge conversion,
  * [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy) for setting tiki shop achievement progress,
  * [GameService Server 0x022E Achievement Unlocked](/packets/gameservice/server/022e.ksy), and
  * [GameService Server 0x0220 Achievement Update](/packets/gameservice/server/0220.ksy).

seq:
  - id: recipe_index
    type: u2
    doc: Increments left to right, top to bottom, then continues through all recipe tabs.
  - id: recipe_quantity
    type: u4
    doc: Number of conversions to be done.
  - id: ingredient_count
    type: u1
  - id: ingredients
    type: ingredient
    repeat: expr
    repeat-expr: ingredient_count

types:
  ingredient:
    seq:
      - id: item_id
        type: u4
        doc: From pangya_xx.iff/Item.iff
      - id: inventory_slot
        type: u4
