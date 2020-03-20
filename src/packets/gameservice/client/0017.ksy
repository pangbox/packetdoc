#pragma.examples gameservice/client 0017
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0017_user_use_consumable_item
  title: GameService Client User Use Consumable Item
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet signals the use of a consumable item during a match.
  
  The response is [GameServer Service 005A User Use Consumable Item Announce](/packets/gameservice/server/005a.ksy)

seq:
  - id: item_id
    type: u4
    doc: From pangya_xx.iff/Item.iff. Consumable item to be used.
