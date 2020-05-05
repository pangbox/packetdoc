#pragma.examples gameservice/client 018d
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_018d_tiki_shop_recycle_items
  title: GameService Client Tiki Shop Recycle Items
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet recycles items into Tiki Points (TP) in Tiki's Shop.
  
  The responses are:
  * [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy) to remove items and add points/crystals,
  * [GameService Server 0x0274 Tiki Shop Recycle Items Response](/packets/gameservice/server/0274.ksy) to acknowledge recycling,
  * [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy) for setting tiki shop achievement progress,
  * [GameService Server 0x022E Achievement Unlocked](/packets/gameservice/server/022e.ksy), and
  * [GameService Server 0x0220 Achievement Update](/packets/gameservice/server/0220.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_RECYCLE_ITEM`
  
seq:
  - id: item_count
    type: u4
    doc: Maximum of 5.
  - id: items
    type: item
    repeat: expr
    repeat-expr: item_count

types:
  item:
    seq:
      - id: item_id
        type: u4
        doc: From pangya_xx.iff/Item.iff. Item to be recycled.
      - id: inventory_slot
        type: u4
      - id: item_quantity
        type: u4
        doc: Amount to be recycled.
