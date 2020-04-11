#pragma.examples gameservice/server 00ec
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_00ec_user_shop_buy_item_response
  title: GameService Server User Shop Buy Item Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges a purchased item from a user shop.
  
  It is one of the responses to [GameService Client 0x007D User Shop Buy Item](/packets/gameservice/client/007d.ksy).

seq:
  - id: unknown_a
    size: 5
  - id: pang_amount
    type: u4
    doc: Local user's new pang balance after purchase.
  - id: unknown_b
    size: 8
  - id: remote_item_id
    type: u4
    doc: From pangya_xx.iff/Item.iff. Seller's item ID for purchased item.
  - id: remote_inventory_id
    type: u4
    doc: Seller's inventory ID for purchased item.
  - id: item_quantity
    type: u4
  - id: unknown_c
    size: 3
  - id: item_cost
    type: u4
    doc: The pang cost of each purchased item.
  - id: unknown_d
    size: 150
  - id: local_inventory_id
    type: u4
    doc: Buyer's inventory ID for purchased item.
  - id: local_item_id
    type: u4
    doc: Buyer's item ID for purchased item. Ought to be identical to remote_item_id.
  - id: unknown_e
    size: 188
