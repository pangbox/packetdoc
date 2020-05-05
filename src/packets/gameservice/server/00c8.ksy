#pragma.examples gameservice/server 00c8
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_00c8_pang_balance
  title: GameService Server Pang Balance
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains the user's pang balance.
  
  It is a response to many, many packets.

seq:
  - id: pang_balance
    type: u4
  - id: unknown_a
    size: 12
    doc: All 0x00.
