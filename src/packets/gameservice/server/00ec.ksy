#pragma.examples gameservice/server 00ec
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_00ec_item_transact
  title: GameService Server Item Transact
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges an item entering or leaving the user's inventory.
  
  Type 0x00 (get_item) is a response to:
  * [GameService Client 0x007D User Shop Buy Item](/packets/gameservice/client/007d.ksy)
  * [GameService Client 0x00CF Locker Withdraw Item](/packets/gameservice/client/00cf.ksy)
  
  Type 0x01 (lose_item) is a response to:
  * [GameService Client 0x00CE Locker Deposit Item](/packets/gameservice/client/00ce.ksy)

seq:
  - id: unknown_a
    size: 4
  - id: transaction_type
    type: u1
    enum: transaction_type
  - id: transaction
    type:
      switch-on: transaction_type
      cases:
        transaction_type::get_item: get_item
        transaction_type::lose_item: lose_item
      
types:
  get_item:
    doc: In locker withdrawals, 'local' and 'remote' fields are identical.
    seq:
      - id: pang_amount
        type: u4
        doc: Local user's new pang balance after acquisition.
      - id: unknown_b
        size: 8
      - id: remote_item_id
        type: u4
        doc: From pangya_xx.iff/Item.iff. Seller's item ID for acquired item.
      - id: remote_inventory_slot
        type: u4
        doc: Seller's inventory slot for acquired item.
      - id: item_quantity
        type: u4
      - id: unknown_c
        size: 3
      - id: item_cost
        type: u4
        doc: The pang cost of each acquired item.
      - id: unknown_d
        size: 150
      - id: local_inventory_slot
        type: u4
        doc: Buyer's inventory slot for acquired item.
      - id: local_item_id
        type: u4
        doc: Buyer's item ID for acquired item. Ought to be identical to remote_item_id.
      - id: unknown_e
        size: 188
  lose_item:
    seq:
      - id: unknown_f
        size: 12
      - id: local_item_id
        type: u4
        doc: From pangya_xx.iff/Item.iff. Item ID for lost item.
      - id: local_inventory_slot
        type: u4
      - id: item_quantity
        type: u4
      - id: unknown_g
        size: 156

enums:
  transaction_type:
    0x00: get_item
    0x01: lose_item
