#pragma.examples gameservice/server 0157
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0157_user_name_response
  title: GameService Server User Name Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring
    - ../../common/user_name_data

doc: |
  This packet contains display name and guild information about a requested user.
  
  This packet is a response to [GameService Client 0x002F User Information Request](/packets/gameservice/client/002f.ksy).

seq:
  - id: request_type
    type: u1
    doc: Matches request packet. Only 0x05 witnessed.
    enum: request_type
  - id: user_id
    type: u4
    doc: Matches request packet.
  - id: user_name_data
    type: user_name_data
    doc: More details can be found in type definition file.
  - id: unknown_gss0157_a
    size: 4
    doc: All 0x00?

enums:
  request_type:
    0x05: season
