#pragma.examples gameservice/server 010b
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_010b_rare_shop_open_response
  title: GameService Server Rare Shop Open Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges the player has opened the rare shop.
  
  This is a response to [GameService Client 0x0098 Rare Shop Open](/packets/gameservice/client/0098.ksy).

seq:
  - id: unknown_a
    type: s4
    doc: All examples show -1 (0xFFFFFFFF)
  - id: unknown_b
    type: s4
    doc: All examples show -1 (0xFFFFFFFF)
  - id: unknown_c
    type: u4
    doc: All examples show 0 (0x00000000)
