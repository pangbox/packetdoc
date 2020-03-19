#pragma.examples gameservice/server 016c
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_016c_locker_combination_response
  title: GameService Server Locker Combination Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet reports if a locker combination attempt was valid or not.
  
  This packet is a response to [GameService Client 0x00CC Locker Combination Attempt](/packets/gameservice/client/00cc.ksy).

seq:
  - id: result
    type: u4
    enum: results

enums:
  results:
    0x00000000: locker_combination_valid
    0x00000075: locker_combination_invalid
