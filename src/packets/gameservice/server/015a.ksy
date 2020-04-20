#pragma.examples gameservice/server 015a
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_015a_unknown_user_related_response
  title: GameService Server 015A Unknown Response (User Related)
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This is one of the responses to [GameService Client 0x002F User Information Request](/packets/gameservice/client/002f.ksy).

seq:
  - id: request_type
    type: u1
    doc: Matches [GameService Client 0x002F User Information Request](/packets/gameservice/client/002f.ksy).
  - id: user_id
    type: u4
  - id: payload
    type:
      switch-on: request_type
      cases:
        0x00: user_response_015a_00_blank
        0x05: user_response_015a_05_full

types:
  user_response_015a_00_blank:
    seq:
      - id: padding_a
        size: 2
        doc: All 0x00.
  user_response_015a_05_full:
    seq:
      - id: entry_count
        type: u2
      - id: entries
        type: entry
        repeat: expr
        repeat-expr: entry_count
  entry:
    seq:
      - id: unknown_a
        type: u4
      - id: unknown_b
        type: u4
        doc: Perhaps an ID? 0x2C / 0x2D range.
      - id: unknown_c
        type: u4
