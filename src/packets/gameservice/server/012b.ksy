#pragma.examples gameservice/server 012b
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_012b_inventory_open_a_response
  title: GameService Server Inventory Open A Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet doesn't appear to change.
  
  This is the response to [GameService Client 0x00B5 Inventory Open A](/packets/gameservice/client/00b5.ksy).

seq:
  - id: unknown_a
    size: 4
    doc: All examples show 0x01000000
  - id: user_id
    type: u4
    doc: Local user's ID
  - id: unknown_b
    size: 4
    doc: All examples show 0x01000000
  - id: unknown_c
    size: 99
    doc: All examples are zeroed.
