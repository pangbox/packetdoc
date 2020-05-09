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
  - id: unknown_a
    type: u4
    doc: Possibly a count? All examples show 1 (0x00000001).
  - id: request_type
    type: u1
    enum: request_types
    doc: Matches [GameService Client 0x002F User Information Request](/packets/gameservice/client/002f.ksy).
  - id: user_id
    type: u4

enums:
  request_types:
    0x00: blank
    0x05: full
