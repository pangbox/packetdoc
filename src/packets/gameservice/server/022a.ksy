#pragma.examples gameservice/server 022a
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_022a_tiki_shop_exchange_cards_response_b
  title: GameService Server Tiki Shop Exchange Cards Response B
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges converting cards in the Card Exchange section of Tiki's Shop.
  
  This is one of the responses to [GameService Client 0x0155 Tiki Shop Exchange Cards](/packets/gameservice/client/0155.ksy).

seq:
  - id: unknown_a
    size: 4
    doc: All 0x00?
  - id: card_id
    type: u4
    doc: From pangya_xx.iff/Card.iff. The item ID of the new card from the exchange.
