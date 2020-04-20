#pragma.examples gameservice/server 015b
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_015b_unknown_user_related_response
  title: GameService Server 015B Unknown Response (User Related)
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
        0x00: user_response_015b_00_blank
        0x05: user_response_015b_05_full

types:
  user_response_015b_00_blank:
    seq:
      - id: padding_a
        size: 2
        doc: All 0x00.
  user_response_015b_05_full:
    seq:
      - id: unknown_a
        type: u2
        doc: All 0x00.
