#pragma.examples gameservice/server 0158
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0158_unknown_user_related_response
  title: GameService Server 0158 Unknown Response (User Related)
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
        0x00: user_response_0158_00_blank
        0x05: user_response_0158_05_full

types:
  user_response_0158_00_blank:
    seq:
      - id: padding_a
        size: 91
        doc: All 0x00.
      - id: unknown_7f
        size: 5
        doc: All 0x7F.
      - id: padding_b
        size: 143
        doc: All 0x00.
  user_response_0158_05_full:
    seq:
      - id: unknown_a
        type: u4
      - id: unknown_b
        type: u4
      - id: unknown_c
        type: u4
      - id: unknown_d
        type: u4
      - id: unknown_e
        type: f4
      - id: unknown_f
        type: u4
      - id: unknown_g
        type: u4
      - id: unknown_h
        type: u4
      - id: unknown_i
        type: u4
      - id: unknown_j
        type: u4
      - id: unknown_k
        type: u4
      - id: unknown_l
        type: u4
      - id: unknown_m
        type: u2
      - id: unknown_n
        type: u4
      - id: unknown_o
        type: u4
      - id: unknown_p
        size: 4
        doc: All 0x00.
      - id: unknown_q
        type: u4
      - id: unknown_r
        type: f4
      - id: unknown_s
        type: f4
      - id: unknown_t
        type: u4
      - id: unknown_u
        type: u4
      - id: unknown_v
        size: 5
        doc: All 0x00.
      - id: unknown_w
        type: s4
      - id: unknown_7f
        size: 5
        doc: All 0x7F.
      - id: unknown_x
        size: 49
        doc: All 0x00.
      - id: unknown_y
        type: u4
      - id: unknown_z
        type: u4
      - id: unknown_aa
        type: u4
      - id: unknown_ab
        type: u4
      - id: unknown_ac
        type: u4
      - id: unknown_ad
        size: 16
        doc: All 0x00.
      - id: unknown_ae
        type: u4
      - id: unknown_af
        type: u4
      - id: unknown_ag
        type: u4
      - id: unknown_ah
        size: 34
        doc: All 0x00.
      - id: unknown_ai
        type: u4
      - id: unknown_aj
        size: 8
        doc: All 0x00.
