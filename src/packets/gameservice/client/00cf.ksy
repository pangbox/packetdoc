#pragma.examples gameservice/client 00cf
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_00cf_locker_item_withdraw
  title: GameService Client Locker Item Withdraw
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet withdraws an item from the user's locker.
  
  The responses are:
  * [GameService Server 0x00EC Item Transact, type 0x00](/packets/gameservice/server/00ec.ksy), and
  * [GameService Server 0x016F Locker Item Withdraw Response](/packets/gameservice/server/016f.ksy).
  
  **Aliases:**
  * `eantoniobr/UGPangya`: `PLAYER_TAKE_ITEMLOCKER`

seq:
  - id: unknown_a
    size: 1
  - id: unknown_id
    type: u4
  - id: unknown_b
    size: 4
  - id: item_id
    type: u4
    doc: From pangya_xx.iff/Item.iff. ID of the deposited item.
  - id: inventory_slot
    type: u4
    doc: May be 0 if no examples present in main inventory.
  - id: item_quantity
    type: u4
  - id: unknown_c
    size: 156
    doc: Might correspond with the last 156 bytes of server's responses.
