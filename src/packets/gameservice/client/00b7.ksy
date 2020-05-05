#pragma.examples gameservice/client 00b7
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_00b7_inventory_open_b
  title: GameService Client Inventory Open B
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is one of two that signals the user has opened the inventory screen.
  
  The responses are [GameService Server 0x012D My Room Layout](/packets/gameservice/server/012d.ksy)
  and [GameService Server 0x0168 User Information](/packets/gameservice/server/0168.ksy).
  
  **See Also:**
  * [GameService Client 0x00B5 Inventory Open A](/packets/gameservice/client/00b5.ksy).
  
  **Aliases:**
  * `eantoniobr/UGPangya`: `PLAYER_ENTER_ROOM_GETINFO`

seq:
  - id: user_id
    type: u4
    doc: Local user's ID
  - id: unknown_a
    size: 1
    doc: All examples show 1 (0x01).