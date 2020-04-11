#pragma.examples gameservice/server 00ed
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_00ed_user_shop_purchase_announce
  title: GameService Server User Shop Purchase Announce
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet announces that changes have occurred in a user shop currently being browsed because of items being purchased by a user.
  
  It is one of the responses to [GameService Client 0x007D User Shop Buy Item](/packets/gameservice/client/007d.ksy),
  but is sent other times, too.

seq:
  - id: remote_user_nickname
    type: pstring
    doc: Seller's nickname.
  - id: remote_user_id
    type: u4
    doc: Seller's user ID.
  - id: unknown_a
    size: 4
    doc: Possibly changes count? Only seen 1.
  - id: item_id
    type: u4
    doc: From pangya_xx.iff/Item.iff.
  - id: remote_inventory_id
    type: u4
    doc: Seller's inventory ID for changed shop item.
  - id: item_quantity
    type: u4
    doc: The number of items that have recently sold.
  - id: unknown_b
    size: 27
  - id: guild_emblem_id
    type: strz
    size: 9
    doc: Possibly garbage data?
  - id: unknown_c
    size: 124
