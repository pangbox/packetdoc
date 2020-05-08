#pragma.examples gameservice/client 00ce
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_00ce_locker_item_deposit
  title: GameService Client Locker Item Deposit
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet deposits an item in the user's locker.
  
  The responses are:
  * [GameService Server 0x0139 Locker Item Deposit Response A](/packets/gameservice/server/0139.ksy),
  * [GameService Server 0x00EC Item Transact, type 0x01](/packets/gameservice/server/00ec.ksy), and
  * [GameService Server 0x016E Locker Item Deposit Response B](/packets/gameservice/server/016e.ksy).
  
  **Aliases:**
  * `eantoniobr/UGPangya`: `PLAYER_PUT_ITEMLOCKER`

seq:
  - id: unknown_a
    size: 9
    doc: Might correspond with the first 9 bytes of 0x00EC.
  - id: item_id
    type: u4
    doc: From pangya_xx.iff/Item.iff. ID of the deposited item.
  - id: inventory_slot
    type: u4
  - id: item_quantity
    type: u4
  - id: unknown_b
    size: 156
    doc: Might correspond with the last 156 bytes of server's responses.
