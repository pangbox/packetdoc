#pragma.examples gameservice/server 012d
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_012d_my_room_layout
  title: GameService Server My Room Layout
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is believed to contain the layout details of the user's 'My Room' furniture decoration layout.
  
  It is one of the responses to [GameService Client 0x00B7 Inventory Open B](/packets/gameservice/client/00b7.ksy).

seq:
  - id: unknown_a
    size: 4
    doc: All examples show 0x01000000.
  - id: furniture_count
    type: u2
  - id: furniture_entries
    type: furniture
    repeat: expr
    repeat-expr: furniture_count

types:
  furniture:
    seq:
      - id: unknown_b
        size: 4
      - id: item_id
        type: u4
        doc: From pangya_xx.iff/Furniture.iff.
      - id: unknown_c
        size: 19
