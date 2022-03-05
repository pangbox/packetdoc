#pragma.examples gameservice/server 015b
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_015b_unknown_user_related_response
  title: GameService Server 015B Unknown Response (User Information Related)
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

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
  - id: unknown_gss015b_a
    type: u2
    doc: All 0x00? Probably a count for entries.

enums:
  request_type:
    0x00: total
    0x05: season
