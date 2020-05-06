#pragma.examples gameservice/client 0008
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0008_room_create
  title: GameService Client Room Create
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet creates a game room on the sub-server. This also counts as having joined the created room.
  
  The responses are:
  * [GameService Server 0x004A Room Status Update](/packets/gameservice/server/004a.ksy),
  * [GameService Server 0x0049 Room Join Response](/packets/gameservice/server/0049.ksy), and
  * everything else that follows joining a room and the room list changing.
    
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_CREATE_GAME`
  * `eantoniobr/UGPangya`: `PLAYER_CREATE_GAME`

seq:
  - id: unknown_a
    type: u1
    doc: All 0x00.
  - id: room_shot_timer_ms
    type: u4
    doc: Used for VS and Chat modes. Shot timer, in milliseconds.
  - id: room_game_timer_ms
    type: u4
    doc: Used for Tournament and Battle modes. Game timer, in milliseconds.
  - id: room_user_max
    type: u1
    doc: Upper user limit for room.
  - id: room_type
    type: u1
    enum: room_type
  - id: room_hole_amount
    type: u1
    doc: Number of holes; set hole in Chat mode.
  - id: room_course
    type: u1
    enum: room_course
  - id: unknown_b
    size: 5
  - id: room_name
    type: pstring
  - id: room_password
    type: pstring
  - id: unknown_c
    size: 4
    doc: All 0x00.

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
