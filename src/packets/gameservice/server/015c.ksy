#pragma.examples gameservice/server 015c
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_015c_user_information_course_records
  title: GameService Server User Information Course Records
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains the user's all-time course records as shown in the User Info screen.

  This is one of the responses to [GameService Client 0x002F User Information Request](/packets/gameservice/client/002f.ksy).

seq:
  - id: request_type
    type: u1
    enum: request_types
    doc: Matches [GameService Client 0x002F User Information Request](/packets/gameservice/client/002f.ksy).
  - id: user_id
    type: u4
  - id: payload
    type:
      switch-on: request_type
      cases:
        request_types::blank_original: user_course_records_blank
        request_types::mode_original: user_course_records_full
        request_types::blank_natural: user_course_records_blank
        request_types::blank_grand_prix: user_course_records_blank
        request_types::mode_natural: user_course_records_full
        request_types::mode_grand_prix: user_course_records_full

types:
  user_course_records_blank:
    seq:
      - id: padding_a
        size: 8
        doc: All 0x00.
  user_course_records_full:
    seq:
      - id: course_record_a_count
        type: u4
      - id: course_a_records
        type: course_record
        repeat: expr
        repeat-expr: course_record_a_count
        doc: These are the ones displayed in user info.
      - id: course_record_b_count
        type: u4
      - id: course_b_records
        type: course_record
        repeat: expr
        repeat-expr: course_record_b_count
        doc: These are of unknown use.
  course_record:
    seq:
      - id: course_id
        type: u1
        enum: course_ids
      - id: unknown_a
        type: u4
      - id: unknown_b
        type: u4
      - id: unknown_c
        type: u4
      - id: unknown_d
        type: u4
      - id: unknown_e
        type: u4
      - id: unknown_f
        type: u4
      - id: unknown_g
        type: s4
      - id: course_score
        type: s1
        doc: Record final score.
      - id: course_pang
        type: u4
        doc: Record final pang amount.
      - id: unknown_j
        type: u4
        doc: All 0x00.
      - id: character_id
        type: u4
        doc: From pangya_xx.iff/Character.iff. Record set with this character.
      - id: unknown_k
        type: s1
        doc: All 0xFA.

enums:
  request_types:
    0x00: blank_original
    0x05: mode_original
    0x0a: blank_natural
    0x0b: blank_grand_prix
    0x33: mode_natural
    0x34: mode_grand_prix
  course_ids:
    0x00: blue_lagoon
    0x01: blue_water
    0x02: sepia_wind
    0x03: wind_hill
    0x04: wiz_wiz
    0x05: west_wiz
    0x06: blue_moon
    0x07: silvia_cannon
    0x08: ice_cannon
    0x09: white_wiz
    0x0a: shining_sand
    0x0b: pink_wind
    0x0d: deep_inferno
    0x0e: ice_spa
    0x0f: lost_seaway
    0x10: eastern_valley
    0x12: ice_inferno
    0x13: wiz_city
    0x14: abbot_mine
