#pragma.examples gameservice/server 015a
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_015a_unknown_user_related_response
  title: GameService Server 015A Unknown Response (User Information Related)
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
  - id: data_count
    type: u2
  - id: unknown_gss015a_data
    type: unknown_gss015a_data
    repeat: expr
    repeat-expr: data_count

types:
  unknown_gss015a_data:
    seq:
      - id: unknown_gss015a_a
        type: u4
      - id: unknown_gss015a_b
        type: u4
        doc: Perhaps an ID? 0x2C / 0x2D range.
      - id: unknown_gss015a_c
        type: u4
        doc: Always 1?

enums:
  request_type:
    0x00: total
    0x05: season
