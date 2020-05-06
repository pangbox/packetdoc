#pragma.examples gameservice/client 000a
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_000a_room_settings_change
  title: GameService Client Room Settings Change
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet changes the room settings.
  
  The responses are:
  * [GameService Server 0x004A Room Settings Announce](/packets/gameservice/server/004a.ksy), and
  * [GameService Server 0x0047 Room List](/packets/gameservice/server/0047.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_CHANGE_GAME_SETTINGS`
  * `eantoniobr/UGPangya`: `PLAYER_CHANGE_GAME_OPTION`

seq:
  - id: unknown_a
    type: s2
    doc: Always -1 (0xFFFF).
  - id: setting_count
    type: u1
  - id: settings
    type: setting
    repeat: expr
    repeat-expr: setting_count

types:
  setting:
    seq:
      - id: setting_type
        type: u1
        enum: setting_type
      - id: setting_data
        type:
          switch-on: setting_type
          cases:
            setting_type::change_name: set_name
            setting_type::change_password: set_password
            setting_type::change_mode: set_mode
            setting_type::change_course: set_course
            setting_type::change_hole_amount: set_hole_amount
            setting_type::change_hole_progression: set_hole_progression
            setting_type::change_shot_timer: set_shot_timer
            setting_type::change_user_max: set_user_max
            setting_type::change_game_timer: set_game_timer
            setting_type::change_artifact: set_artifact
            setting_type::change_natural_wind: set_natural_wind
  set_name:
    seq:
      - id: room_name
        type: pstring
  set_password:
    seq:
      - id: room_password
        type: pstring
  set_mode:
    doc: Used in VS rooms. Does not work in Tournaments or Battles.
    seq:
      - id: room_mode
        type: u1
        enum: room_mode
  set_course:
    seq:
      - id: room_course
        type: u1
        enum: room_course
  set_hole_amount:
    seq:
      - id: room_hole_amount
        type: u1
        doc: 3, 6, 9, 18 are valid.
  set_hole_progression:
    seq:
      - id: room_hole_progression
        type: u1
        enum: hole_progression
  set_shot_timer:
    doc: Used in VS rooms.
    seq:
      - id: room_shot_timer_second
        type: u2
        doc: 30, 60, 120, 300 are valid. Individual shot timer, in seconds.
  set_user_max:
    seq:
      - id: room_user_max
        type: u1
        doc: (VS) 2, 3, 4, (Tourney) 10, 20, 30 are valid.
  set_game_timer:
    doc: Used in tournaments.
    seq:
      - id: room_game_timer_minute
        type: u1
        doc: (standard 9) 15, 20, 25, 30, (standard 18) 30, 35, 40, 45, 50, (short) 15, 20, 25, 30, 35 are valid. Overall game timer, in minutes.
  set_artifact:
    seq:
      - id: item_id
        type: u4
        doc: From pangya_xx.iff/Item.iff. ID of active artifact. 0 for no artifact.
  set_natural_wind:
    seq:
      - id: room_natural_wind
        type: u4
        doc: 0 and 1 are valid.

enums:
  setting_type:
    0x00: change_name
    0x01: change_password
    0x02: change_mode
    0x03: change_course
    0x04: change_hole_amount
    0x05: change_hole_progression
    0x06: change_shot_timer
    0x07: change_user_max
    0x08: change_game_timer
    0x0d: change_artifact
    0x0e: change_natural_wind
  room_mode:
    0x00: vs_stroke
    0x01: vs_match
  room_course:
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
    0x7f: random_course
  hole_progression:
    0x00: front_start
    0x01: back_start
    0x02: random_start
    0x03: shuffle_all
