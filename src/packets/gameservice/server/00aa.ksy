#pragma.examples gameservice/server 00aa
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_00aa_inventory_slot_assign
  title: GameService Server Inventory Slot Assign
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet (apparently) assigns an inventory slot to new items, and updates current pang balance.
    
seq:
  - id: item_count
    type: u2
  - id: items
    type: item
    repeat: expr
    repeat-expr: item_count
  - id: balance_pang
    type: u4
  - id: unknown_a
    size: 12

types:
  item:
    seq:
      - id: item_id
        type: u4
        doc: From pangya_xx.iff/Item.iff.
      - id: inventory_slot
        type: u4
      - id: unknown_b
        size: 3
      - id: item_quantity
        type: u4
      - id: unknown_c
        size: 23
