#pragma.examples gameservice/server 0257
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0257_unknown_user_related_response
  title: GameService Server 0257 Unknown Response (User Related)
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
        0x00: user_response_0257_00_blank
        0x05: user_response_0257_05_full

types:
  user_response_0257_00_blank:
    seq:
      - id: padding_a
        size: 4
        doc: All 0x00.
  user_response_0257_05_full:
    seq:
      - id: entry_count
        type: u2
      - id: entries
        type: entry
        repeat: expr
        repear-expr: entry_count
  entries:
    seq:
      - id: unknown_a
        size: 12
