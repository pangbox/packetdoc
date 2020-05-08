#pragma.examples gameservice/server 0229
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0229_tiki_shop_card_exchange_response_a
  title: GameService Server Tiki Shop Card Exchange Response A
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges converting cards in the Card Exchange section of Tiki's Shop.
  
  This is one of the responses to [GameService Client 0x0155 Tiki Shop Card Exchange](/packets/gameservice/client/0155.ksy).

seq:
  - id: unknown_a
    size: 4
    doc: All 0x00?
