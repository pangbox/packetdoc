#pragma.examples gameservice/server 004a
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_004a_room_settings_announce
  title: GameService Server Room Settings Announce
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet details some particulars of the room currently joined.
  
  It is one of the responses to [GameService Client 0x0009 Join Room](/packets/gameservice/client/0009.ksy),
  and periodically thereafter as changes occur with [GameService Client 0x000A Room Settings Change](/packets/gameservice/client/000a.ksy).

seq:
  - id: unknown_a
    size: 2
    doc: All examples show 0xFFFF (-1).
  - id: room_type
    type: u1
    enum: room_type
  - id: room_course
    type: u1
    enum: room_course
  - id: room_hole_amount
    type: u1
  - id: room_hole_progression
    type: u1
    enum: hole_progression
  - id: room_natural_wind
    type: u4
    enum: natural_wind
  - id: room_user_max
    type: u1
    doc: Upper user limit in room.
  - id: unknown_d
    type: u2
    doc: All examples show 30 (0x001E).
  - id: room_shot_timer_ms
    type: u4
    doc: Used in VS and Chat modes. Individual shot timer, in milliseconds.
  - id: room_game_timer_ms
    type: u4
    doc: Used in Tournament and Battle modes. Overall game timer, in milliseconds.
  - id: unknown_special_room_value
    size: 4
    doc: 00,00,00,00 in VS and Chat, 00,00,03,2C in Tournament and Battle.
  - id: room_master_status
    type: u1
    enum: master_status
    doc: Unconfirmed. Denotes if user is master of room (can change settings, etc.)
  - id: room_name
    type: pstring

enums:
  room_type:
    0x00: vs
    0x02: chat
    0x04: tournament
    0x0a: battle
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
  natural_wind:
    0x00000000: disabled
    0x00000001: enabled
  master_status:
    0x00: master_user
    0x01: normal_user
