#pragma.examples gameservice/server 004a
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_004a_room_status_update
  title: GameService Server Room Status Update
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet details some particulars of the room currently joined.
  
  This packet is sent during the response to [GameService Client 0x0009 Join Room](/packets/gameservice/client/0009.ksy),
  and periodically thereafter as changes occur.

seq:
  - id: unknown_a
    size: 2
    doc: All examples show 0xFFFF (-1).
  - id: room_mode
    type: u1
    enum: room_mode
    doc: Unconfirmed.
  - id: room_course
    type: u1
    enum: room_course
    doc: Unconfirmed.
  - id: room_hole
    type: u1
    doc: Starting hole in stroke rooms, current hole in lounge rooms.
  - id: unknown_c
    size: 5
  - id: room_max_users
    type: u1
    doc: Unconfirmed.
  - id: unknown_d
    type: u1
    doc: All examples show 0x1E (30).
  - id: unknown_e
    size: 14
  - id: room_name
    type: pstring

enums:
  room_mode:
    0x00: vs_stroke
    0x02: chat_lounge
  room_course:
    0x00: blue_lagoon
    0x06: blue_moon
    0x13: wiz_city