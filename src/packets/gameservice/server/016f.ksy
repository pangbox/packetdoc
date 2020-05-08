#pragma.examples gameservice/server 016f
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_016f_locker_item_withdraw_response
  title: GameService Server Locker Item Withdraw Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges an item has been withdrawn from the locker.

  This is one of the responses to [GameService Client 0x00CF Locker Item Withdraw](/packets/gameservice/client/00cf.ksy).

seq:
  - id: unknown_a
    size: 4
  - id: unknown_id
    type: u4
  - id: unknown_b
    size: 4
    doc: All 0x00.
  - id: item_id
    type: u4
  - id: inventory_slot
    type: u4
  - id: item_quantity
    type: u4
  - id: unknown_c
    size: 156
    doc: Possibly corresponds to the last 156 bytes in client's packet.
