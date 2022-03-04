#pragma.examples gameservice/server 0072
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0072_user_equipment
  title: GameService Server User Equipment
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring
    - ../../common/user_equipment_data

doc: |
  This packet lists current equipped consumables, and potentially other things.
  
  This packet is sent during the response to [GameService Client 0x0002 Hello](/packets/gameservice/client/0002.ksy).

seq:
  - id: user_equipment_data
    type: user_equipment_data
    doc: More details can be found in type definition file.
