#pragma.examples gameservice/server 0076
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0076_room_user_data
  title: GameService Server Room User Data
  encoding: ASCII
  endian: le
  imports:
    - ../../common/ms_systemtime
    - ../../common/pstring
    - ../../common/user_caddie_data
    - ../../common/user_character_data
    - ../../common/user_course_record_data
    - ../../common/user_equipment_data
    - ../../common/user_name_data
    - ../../common/user_statistic_data

doc: |
  This packet relays user info for all users once a VS match is launched, or merely timestamp in other modes.
  
seq:
  - id: subtype
    type: u1
  - id: payload
    type:
      switch-on: subtype
      cases:
        0x00: full_payload
        0x04: minimal_payload

types:
  full_payload:
    seq:
      - id: user_count
        type: u1
      - id: user_entry
        type: user_entry
        repeat: expr
        repeat-expr: user_count
  minimal_payload:
    seq:
      - id: unknown_04_a
        size: 4
      - id: ms_systemtime_04
        type: ms_systemtime
  user_entry:
    seq:
      - id: user_name_data
        type: user_name_data
      - id: user_statistic_data
        type: user_statistic_data
      - id: user_entry_unknown_a
        size: 78
        doc: 78 B
      - id: user_equipment_data
        type: user_equipment_data
      - id: user_course_season_data
        type: user_course_season_data
        repeat: expr
        repeat-expr: 12
        doc: 12 sets
      - id: user_character_data
        type: user_character_data
      - id: user_caddie_data
        type: user_caddie_data
      - id: inventory_slot_clubset
        type: u4
      - id: item_id_clubset
        type: u4
      - id: user_entry_unknown_c
        size: 10
        doc: 10 B
      - id: user_entry_unknown_d
        type: u2
        repeat: expr
        repeat-expr: 5
        doc: 5x 2 B values. Likely club stat upgrades? (Power, Accuracy, Impact, Spin, Curve)
      - id: user_entry_unknown_e
        size: 62
        doc: 62 B
      - id: ms_systemtime_01
        type: ms_systemtime
      - id: user_card_count
        type: u1
      - id: user_card_data
        type: user_card_data
        repeat: expr
        repeat-expr: user_card_count
  user_card_data:
    seq:
      - id: user_card_unknown_a
        type: u4
      - id: item_id_card
        type: u4
      - id: item_id_character
        type: u4
      - id: inventory_slot_card
        type: u4
      - id: user_card_unknown_b
        type: u4
      - id: user_card_unknown_c
        type: u4
      - id: user_card_unknown_d
        type: u4
      - id: user_card_unknown_e
        size: 32
        doc: 32 B
      - id: user_card_unknown_f
        type: u4
      - id: user_card_unknown_g
        type: u1
  user_course_season_data:
    seq:
      - id: user_course_record_data
        type: user_course_record_data
        repeat: expr
        repeat-expr: 21
        doc: 21 courses

