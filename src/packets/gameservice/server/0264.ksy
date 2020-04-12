#pragma.examples gameservice/server 0264
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0264_memorial_coin_result
  title: GameService Server Memorial Coin Result
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains the result of a Memorial Coin play.
  
  This is one of the responses to [GameService Client 0x017F Memorial Coin Play](/packets/gameservice/client/017f.ksy).

seq:
  - id: unknown_a
    type: u4
    doc: All examples show 0 (0x00000000).
  - id: unknown_b
    type: u4
    doc: All examples show 1 (0x00000001).
  - id: unknown_c
    type: s4
    doc: All examples show -1 (0xFFFFFFFF).
  - id: item_id
    type: u4
    doc: From pangya_xx.iff/Item.iff. Item ID of prize won.
  - id: item_quantity
    type: u4
    doc: Number of specified items won.
