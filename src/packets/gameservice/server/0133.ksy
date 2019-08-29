#pragma.examples gameservice/server 0133
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0133_treasure_point_result
  title: GameService Server Treasure Point Result
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains the result of the Treasure Point mechanism that gives
  away items at the end of matches.

seq:
  - id: treasure_count
    type: u1
  - id: treasure_list
    type: treasure
    repeat: expr
    repeat-expr: treasure_count

types:
  treasure:
    seq:
      - id: user_id
        type: u4
      - id: item_id
        type: u4
      - id: item_quantity
        type: u2
      - id: unknown_a
        size: 1
