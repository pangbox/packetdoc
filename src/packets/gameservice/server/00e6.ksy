#pragma.examples gameservice/server 00e6
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_00e6_user_shop_inventory
  title: GameService Server User Shop Inventory
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is sent after being requested by [GameService Client 0x0077 User Shop Inventory Request](/packets/gameservice/client/0077.ksy).
  It contains the inventory of a user's shop set up within a lounge room.

seq:
  - id: unknown_a
    type: u4
  - id: unknown_b
    type: u4
  - id: user_nickname
    type: strz
    size: 22
    doc: Shop owner's nickname.
  - id: shop_name
    type: pstring
  - id: user_id
    type: u4
    doc: Shop owner's user ID.
  - id: shop_item_count
    type: u4
  - id: shop_items
    type: shop_item
    repeat: expr
    repeat-expr: shop_item_count

types:
  shop_item:
    seq:
      - id: shop_item_index
        type: u4
        doc: Increments from $00 to $05.
      - id: item_id
        type: u4
        doc: From pangya_xx.iff/Item.iff, /Card.iff, etc.
      - id: unknown_c
        type: u4
      - id: shop_item_quantity
        type: u4
      - id: unknown_e
        size: 3
      - id: shop_item_cost
        type: u4
      - id: unknown_f
        size: 20
      - id: unknown_g
        size: 9
        doc: Some sort of user ID perhaps?
      - id: unknown_h
        size: 121
