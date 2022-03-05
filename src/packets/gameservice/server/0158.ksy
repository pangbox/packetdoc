#pragma.examples gameservice/server 0158
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0158_user_statistics_response
  title: GameService Server User Statistics Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring
    - ../../common/user_statistic_data

doc: |
  This is one of the responses to [GameService Client 0x002F User Information Request](/packets/gameservice/client/002f.ksy).

seq:
  - id: request_type
    type: u1
    doc: Matches request packet.
    enum: request_type
  - id: user_id
    type: u4
    doc: Matches request packet.
  - id: user_statistic
    type: user_statistic_data
    doc: More details can be found in type definition file.

enums:
  request_type:
    0x00: total
    0x05: season
