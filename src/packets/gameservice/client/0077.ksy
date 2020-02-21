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
  This packet requests a particular user's shop while in a lounge.
  
  The response is [GameService Server 0x0077 User Shop Inventory](/packets/gameservice/server/0077.ksy).

seq:
  - id: user_id
    type: u4
    doc: The target user's ID.
