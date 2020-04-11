#pragma.examples gameservice/client 0078
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0078_user_shop_leave
  title: GameService Client User Shop Leave
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet notes that a user has stopped browsing a user shop.
  
  The response is [GameService Server 0x00E7 User Shop Leave Response](/packets/gameservice/server/00e7.ksy).
  
  **See Also:** [GameService Client 0x0077 User Shop Inventory Request](/packets/gameservice/client/0077.ksy), to start browsing.

seq:
  - id: user_id
    type: u4
    doc: Seller's user ID.
