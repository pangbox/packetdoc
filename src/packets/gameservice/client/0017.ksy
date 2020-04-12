#pragma.examples gameservice/client 0017
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0017_shot_item_use
  title: GameService Client Shot Item Use
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet signals the use of a consumable item during a match.
  
  The response is [GameServer Service 005A Shot Item Use Announce](/packets/gameservice/server/005a.ksy)

seq:
  - id: item_id
    type: u4
    doc: From pangya_xx.iff/Item.iff. Consumable item to be used.
