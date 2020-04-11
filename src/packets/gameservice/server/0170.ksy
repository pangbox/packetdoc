#pragma.examples gameservice/server 0170
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0170_locker_inventory_response
  title: GameService Server Locker Inventory Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet (presumably) contains the user's locker's inventory.
  
  Insufficient packets were (as of yet) captured to attempt proper documentation.
  
  This is a response to [GameService Client 0x00D3 Locker Inventory Request](/packets/gameservice/client/00d3.ksy).

seq:
  - id: unknown_a
    size: 8
