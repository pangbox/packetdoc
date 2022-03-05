#pragma.examples gameservice/server 0156
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0156_user_equipment_response
  title: GameService Server User Equipment Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring
    - ../../common/user_equipment_data

doc: |
  This packet contains details about the requested user's equipment.
  
  This packet is a response to [GameService Client 0x002F User Information Request](/packets/gameservice/client/002f.ksy).

seq:
  - id: request_type
    type: u1
    doc: Matches request packet. Only 0x05 witnessed.
    enum: request_type
  - id: user_id
    type: u4
    doc: Matches request packet.
  - id: user_equipment_data
    type: user_equipment_data
    doc: More details can be found in type definition file.

enums:
  request_type:
    0x05: season
