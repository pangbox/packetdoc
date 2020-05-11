#pragma.examples gameservice/server 00cc
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_00cc_shot_resync_collectables
  title: GameService Server Shot Resync Collectables
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet relates to game state resynching.
  
  Its one of the responses to:
  * GameService Client 0x001B Undocumented (only if a field collectable is collected), and
  * [GameService Client 0x001C Room Resync](/packets/gameservice/client/001c.ksy) (one for each player).

seq:
  - id: connection_id
    type: u4
  - id: item_count
    type: u1
  - id: items
    type: item
    repeat: expr
    repeat-expr: item_count
  - id: padding
    size: 2048 - item_count * 16
    if: item_count > 0
    doc: All 0x00. Padded so packet is always 2055 bytes long (128 item slots available), but only if there is at least 1 item.

types:
  item:
    seq:
      - id: item_id_collectable
        type: u4
        doc: From pangya_xx.iff/Item.iff. Appears to always be a field collectable (coin, spin cube, etc.)
      - id: room_course
        type: u1
        enum: room_course
      - id: hole_number
        type: u1
      - id: unknown_a
        type: u2
        doc: Non-zero. Consistent for similar items (all coins have same value, etc.)
      - id: unknown_b
        type: u4
        doc: Non-zero. Consistent for similar items (all coins have same value, etc.)
      - id: unknown_c
        size: 4
        doc: All 0x00.

enums:
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
