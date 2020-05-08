#pragma.examples gameservice/server 016e
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_016e_locker_item_deposit_response_b
  title: GameService Server Locker Item Deposit Response B
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges an item has been deposited in the locker.

  This is one of the responses to [GameService Client 0x00CE Locker Item Deposit](/packets/gameservice/client/00ce.ksy).

seq:
  - id: unknown_a
    size: 12
    doc: All 0x00.
  - id: item_id
    type: u4
  - id: inventory_slot
    type: u4
  - id: item_quantity
    type: u4
  - id: unknown_b
    size: 156
    doc: Possibly corresponds to the last 156 bytes in client's packet.
