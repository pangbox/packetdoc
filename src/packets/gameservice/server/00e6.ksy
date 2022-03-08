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
  This packet contains the inventory of a user's shop set up within a lounge room.
  
  It is a response to:
  * [GameService Client 0x0077 User Shop Inventory Request](/packets/gameservice/client/0077.ksy).
  
seq:
  - id: unknown_gss00e6_a
    type: u4
    doc: Always 1? Possibly a page count of some sort for a hypothetical multi-page user inventory?
  - id: unknown_gss00e6_b
    type: u4
    doc: Always 1? Possibly a page number of some sort for a hypothetical multi-page user inventory?
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
      - id: inventory_slot
        type: u4
        doc: Unconfirmed.
      - id: shop_item_quantity
        type: u4
      - id: unknown_gss00e6_c
        size: 3
        doc: All 0x00?
      - id: shop_item_cost
        type: u4
      - id: unknown_gss00e6_d
        size: 20
        doc: All 0x00?
      - id: item_asset_id
        size: 9
        doc: Associated with downloading custom assets, such as user designed clothing.
      - id: unknown_gss00e6_f
        type: u2
      - id: unknown_gss00e6_g
        type: u2
      - id: unknown_gss00e6_h
        size: 116
