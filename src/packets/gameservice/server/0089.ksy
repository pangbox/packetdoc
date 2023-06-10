#pragma.examples gameservice/server 0089
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0089_user_information_response
  title: GameService Server User Information Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges a user info request.

  This is one of the responses to [GameService Client 0x002F User Information Request](/packets/gameservice/client/002f.ksy),
  and the only one to always send regardless of input.

seq:
  - id: request_status
    type: u4
    doc: Valid lookups return 1. A lookup for `user_id == 0x00000000` returns 2.
    enum: request_status
  - id: request_type
    type: u1
    enum: request_types
    doc: Matches [GameService Client 0x002F User Information Request](/packets/gameservice/client/002f.ksy).
  - id: user_id
    type: u4

enums:
  request_status:
    0x00000001: valid
    0x00000002: error
  request_types:
    0x00: total
    0x05: season
