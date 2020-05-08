#pragma.examples gameservice/server 0068
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0068_pangya_shop_purchase_response
  title: GameService Server Pangya Shop Purchase Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges a purchase from the Pangya Shop.
  
  This is the response to [GameService Client 0x001D Pangya Shop Purchase](/packets/gameservice/client/001d.ksy).

seq:
  - id: unknown_a
    size: 4
  - id: balance_pang
    type: u4
    doc: New pang balance after purchase.
  - id: balance_cookie
    type: u4
    doc: Unconfirmed. New cookie balance after purchase.
  - id: unknown_b
    size: 8
