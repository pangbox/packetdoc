#pragma.examples gameservice/client 00d3
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_00d3_locker_inventory_request
  title: GameService Client Locker Inventory Request
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet requests the inventory of the user's locker. It is sent on the first inventory screen opening per login,
  as well as before every locker combination attempt thereafter.
  
  There is no payload.
  
  The response is [GameService Server 0x0170 Locker Inventory](/packets/gameservice/server/0170.ksy).
  
  **See Also** [GameService Client 0x00CC Locker Combination Attempt](/packets/gameservice/client/00cc.ksy).
