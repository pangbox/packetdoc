#pragma.examples gameservice/client 00ce
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_00ce_locker_deposit_item
  title: GameService Client Locker Deposit Item
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet deposits an item in the user's locker.
  
  The responses are:
  * [GameService Server 0x0139 Locker Deposit Item Response A](/packets/gameservice/server/0139.ksy),
  * [GameService Server 0x00EC Transact Item, type 0x01](/packets/gameservice/server/00ec.ksy), and
  * [GameService Server 0x016E Locker Deposit Item Response B](/packets/gameservice/server/016e.ksy).

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
