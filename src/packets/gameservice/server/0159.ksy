#pragma.examples gameservice/server 0159
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0159_unknown_user_related_response
  title: GameService Server 0159 Unknown Response (User Related)
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
        0x00: user_response_0159_00_blank
        0x05: user_response_0159_05_full

types:
  user_response_0159_00_blank:
    seq:
      - id: padding_a
        size: 78
        doc: All 0x00.
  user_response_0159_05_full:
    seq:
      - id: unknown_a
        size: 24
        doc: All 0x00.
      - id: unknown_b
        type: u2
      - id: unknown_c
        type: u2
      - id: unknown_d
        type: u2
        doc: All 0x00?
      - id: unknown_e
        type: u2
      - id: unknown_f
        type: u2
      - id: unknown_g
        type: u2
      - id: unknown_h
        type: u2
      - id: unknown_i
        type: u2
      - id: unknown_j
        type: u2
      - id: unknown_k
        type: u2
      - id: unknown_l
        type: u2
      - id: unknown_m
        type: u2
      - id: unknown_n
        type: u2
      - id: unknown_o
        type: u2
      - id: unknown_p
        type: u2
      - id: unknown_q
        type: u2
      - id: unknown_r
        type: u2
      - id: unknown_s
        type: u2
      - id: unknown_t
        type: u2
        doc: All 0x00?
      - id: unknown_u
        type: u2
      - id: unknown_v
        type: u2
      - id: unknown_w
        size: 12
        doc: All 0x00.
