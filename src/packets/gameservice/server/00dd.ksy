#pragma.examples gameservice/server 00dd
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_00dd_scratchy_play_result
  title: GameService Server Scratchy Play Result
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet reports the results of playing a scratchy card.
  
  This is one of the responses to [GameService Client 0x0070 Scratchy Play](/packets/gameservice/client/0070.ksy).

seq:
  - id: unknown_a
    size: 4
  - id: item_count
    type: u4
  - id: items
    type: item
    repeat: expr
    repeat-expr: item_count

types:
  item:
    seq:
      - id: unknown_b
        size: 4
      - id: item_id
        type: u4
      - id: inventory_slot
        type: u4
      - id: item_quantity
        type: u4
      - id: unknown_c
        size: 4
