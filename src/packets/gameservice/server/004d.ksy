#pragma.examples gameservice/server 004d
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_004d_sub_server_list
  title: GameService Server Sub-Server List
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet lists all sub-servers on the connected server
  ("Free#1", "Rookie", etc.)
  
  This packet is sent during the response to
  GameService Client 0x0002 Hello. (TODO: Add link.)

seq:
  - id: sub_server_count
    type: u1
  - id: sub_server_list
    type: sub_server
    repeat: expr
    repeat-expr: sub_server_count

types:
  sub_server:
    seq:
      - id: sub_server_name
        type: strz
        size: 21
      - id: unknown_a
        size: 47
      - id: sub_server_id
        type: u1
      - id: unknown_b
        size: 8

      