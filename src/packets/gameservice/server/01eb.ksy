#pragma.examples gameservice/server 010b
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_01eb_scratchy_menu_open_response
  title: GameService Server Scratchy Menu Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges the player has opened the scratchy card menu.
  
  This is a response to [GameService Client 0x012A Scratchy Menu Open](/packets/gameservice/client/012a.ksy).

seq:
  - id: unknown_a
    size: 5
    doc: All examples show 0.
