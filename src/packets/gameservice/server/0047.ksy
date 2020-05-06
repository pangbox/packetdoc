#pragma.examples gameservice/server 0047
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0047_room_list
  title: GameService Server Room List
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet lists all rooms currently present (open or closed) on a given
  sub-server.
  
  This packet is sent periodically by the server without prompting when changes occur,
  such as from [Gameservice Client 0x000A Room Settings Change](/packets/gameservice/client/000a.ksy).

seq:
  - id: room_count
    type: u1
  - id: list_type
    type: u1
    enum: list_type
  - id: unknown_a
    type: s2
    doc: Always -1 (0xFFFF).
  - id: rooms
    type: room
    repeat: expr
    repeat-expr: room_count

types:
  room:
    seq:
      - id: room_name
        type: strz
        size: 64
      - id: room_privacy
        type: u1
        enum: room_privacy
      - id: unknown_b
        size: 2
      - id: room_user_max
        type: u1
        doc: Upper user limit of room.
      - id: room_user_count
        type: u1
        doc: Current user count of room.
      - id: unknown_c
        size: 18
      - id: room_hole_amount
        type: u1
        doc: Hole amount; current hole in chat rooms.
      - id: room_type
        type: u1
        enum: room_type
      - id: room_number
        type: u2
      - id: room_hole_progression
        type: u1
        enum: hole_progression
      - id: room_course
        type: u1
        enum: room_course
      - id: room_shot_timer_ms
        type: u4
        doc: 0 if event or not applicable. Individual shot timer, in milliseconds.
      - id: room_game_timer_ms
        type: u4
        doc: 0 if event or not applicable. Overall game timer, in milliseconds.
      - id: unknown_special_room_value
        size: 4
        doc: 00,00,00,00 in VS and Chat, 00,00,xx,2C in Tournament and Battle.
      - id: unknown_e
        size: 76
        doc: All 0x00.
      - id: unknown_f
        type: u4
        doc: All examples show 100 (0x00000064).
      - id: unknown_g
        type: u4
        doc: All examples show 100 (0x00000064).
      - id: room_master_user_id
        type: s4
        doc: User ID of room master. -1 (0xFFFFFFFF) if no master (deletion, event).
      - id: room_class
        type: s1
        enum: room_class
        doc: Unconfirmed. Appears to identify special event rooms vs standard multiplayer rooms.
      - id: room_artifact_id
        type: u4
        doc: From pangya_xx.iff/Item.iff. Item ID for active artifact.
      - id: unknown_h
        type: u4
        doc: Appears to vary from 0 to 3.
      - id: event_number
        type: u4
        doc: 0 if non-event.
      - id: event_number_rounded
        type: u4
        doc: Only top 3 bytes of event_number. Low byte zeroed.
      - id: event_shot_timer_ms
        type: u4
        doc: 0 if non-event. Individual shot timer, in milliseconds.
      - id: unknown_event_j
        type: u4
        doc: 0 if non-event. All examples show 1 (0x00000001).

enums:
  list_type:
    0x00: list_initial
    0x01: list_additions
    0x02: list_removals
    0x03: list_modifications
  room_privacy:
    0x00: private_needs_password
    0x01: public
  room_type:
    0x00: vs
    0x02: chat
    0x04: tournament
    0x0a: battle
  hole_progression:
    0x00: front_start
    0x01: back_start
    0x02: random_start
    0x03: shuffle_all
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
  room_class:
    0x14: grand_prix_room
    0xFF: standard_room
