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
  This packet is one of two that signals the user has opened the inventory screen.
  
  Given that the user ID appears twice, it might be that this packet might also be used by administration to
  open another user's inventory (one field might be for the local user ID for a permissions check, and the other for the target user ID).
  This is entirely hypothetical, however.
  
  The response is [GameService Server 0x012B Inventory Open A Response](/packets/gameservice/server/012b.ksy).
  
  **See Also:**
  * [GameService Client 0x00B7 Inventory Open B](/packets/gameservice/client/00b7.ksy).
  
  **Aliases:**
  * `eantoniobr/UGPangya`: `PLAYER_ENTER_ROOM`

seq:
  - id: user_id_a
    type: u4
    doc: User's ID
  - id: user_id_b
    type: u4
    doc: User's ID (duplicate?)
