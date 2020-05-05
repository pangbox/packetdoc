#pragma.examples gameservice/server 022f
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_022f_tiki_shop_convert_item_response
  title: GameService Server Tiki Shop Convert Item Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges converting an item in the Cadie's Magicbox section of Tiki's Shop.
  
  This is one of the responses to [GameService Client 0x0158 Tiki Shop Convert Item](/packets/gameservice/client/0158.ksy).

seq:
  - id: unknown_a
    size: 4
  - id: recipe_index
    type: u2
  - id: unknown_b
    size: 2
  - id: item_count
    type: u4
    doc: Number of different created items, probably. No multi-item recipes are accessible, however.
  - id: item_id
    type: u4
    doc: From pangya_xx.iff/Item.iff. Created item's ID.
  - id: inventory_slot
    type: u4
  - id: item_quantity
    type: u4
    doc: Combined quantity of created item from all runs of recipe.
  - id: item_quantity_total
    type: u4
    doc: New quantity of all such item in inventory.
  - id: unknown_c
    size: 4
