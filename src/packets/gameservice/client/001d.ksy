#pragma.examples gameservice/client 001d
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_001d_pangya_shop_buy_item
  title: GameService Client Pangya Shop Buy Item
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet purchases an item from the Pangya Shop.
  
  The response is [GameService Server 0x0068 Pangya Shop Buy Item Response](/packets/gameservice/server/0068.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_BUY_ITEM`
  * `eantoniobr/UGPangya`: `PLAYER_BUY_ITEM_GAME`

seq:
  - id: unknown_a
    type: u1
  - id: item_count
    type: u2
  - id: items
    type: item
    repeat: expr
    repeat-expr: item_count
  - id: unknown_b
    type: u4

types:
  item:
    seq:
      - id: unknown_c
        type: s4
        doc: All examples show -1 (0xFFFFFFFF).
      - id: item_id
        type: u4
        doc: From pangya_xx.iff/Item.iff.
      - id: unknown_d
        type: s4
        doc: All examples show -65536 (0xFFFF0000).
      - id: item_quantity
        type: u4
      - id: item_cost_pang
        type: u4
        doc: Per item.
      - id: item_cost_cookie
        type: u4
        doc: Unconfirmed. Per item.
