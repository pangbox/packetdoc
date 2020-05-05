#pragma.examples gameservice/client 007d
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_007d_user_shop_buy_item
  title: GameService Client User Shop Buy Item
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is sent when the user buys an item from a user shop in a lounge.
  
  Its responses are:
  * [GameService Server 0x00EC Transact Item](/packets/gameservice/server/00ec.ksy), and
  * [GameService Server 0x00ED User Shop Purchase Announce](/packets/gameservice/server/00ed.ksy)
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_BUY_SHOP_ITEM`

seq:
  - id: remote_user_id
    type: u4
    doc: Seller's user ID
  - id: unknown_a
    size: 4
  - id: remote_item_id
    type: u4
    doc: From pangya_xx.iff/Item.iff. Seller's item ID for purchased item.
  - id: remote_inventory_id
    type: u4
    doc: Seller's inventory ID for the purchased item.
  - id: item_quantity
    type: u4
  - id: unknown_b
    size: 3
  - id: item_cost
    type: u4
    doc: The pang cost of each purchased item.
  - id: unknown_c
    size: 20
  - id: guild_emblem_id
    type: strz
    size: 9
    doc: Possibly garbage data?
  - id: unknown_d
    size: 121
