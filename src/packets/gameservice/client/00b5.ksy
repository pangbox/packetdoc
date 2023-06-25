#pragma.examples gameservice/client 00b5
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_00b5_inventory_open_a
  title: GameService Client Inventory Open A
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is one of two that signals the user has opened my room.

  In newer seasons, you can't enter another user's room, so the `room_user_id` will always be the same as the `user_id`.
  
  The response is [GameService Server 0x012B Inventory Open A Response](/packets/gameservice/server/012b.ksy).
  
  **See Also:**
  * [GameService Client 0x00B7 Inventory Open B](/packets/gameservice/client/00b7.ksy).
  
  **Aliases:**
  * `eantoniobr/UGPangya`: `PLAYER_ENTER_ROOM`

seq:
  - id: user_id
    type: u4
    doc: User's ID
  - id: room_user_id
    type: u4
    doc: ID of user whose room is being entered
