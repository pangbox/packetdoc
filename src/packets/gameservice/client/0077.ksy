#pragma.examples gameservice/client 0077
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0077_user_shop_inventory_request
  title: GameService Client User Shop Inventory Request
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet signals a user starting to browse a particular user shop in a lounge,
  and requests said shop's inventory.
  
  The response is [GameService Server 0x00E6 User Shop Inventory](/packets/gameservice/server/00e6.ksy).
  
  **See Also:** [GameService Client 0x0078 User Shop Leave](/packets/gameservice/client/0078.ksy), to stop browsing.

seq:
  - id: user_id
    type: u4
    doc: The target user's ID.
