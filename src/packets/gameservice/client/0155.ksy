#pragma.examples gameservice/client 0155
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0155_tiki_shop_exchange_cards
  title: GameService Client Tiki Shop Exchange Cards
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet converts 3 cards into a new card in the Card Exchange section of Tiki's Shop.
  
  The responses are:
  * [GameService Server 0x0229 Tiki Shop Exchange Cards Response A](/packets/gameservice/server/0229.ksy),
  * [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy) to remove used cards and add created card,
  * [GameService Server 0x022A Tiki Shop Exchange Cards Response B](/packets/gameservice/server/022a.ksy),
  * [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy) for setting tiki shop achievement progress,
  * [GameService Server 0x022E Achievement Unlocked](/packets/gameservice/server/022e.ksy), and
  * [GameService Server 0x0220 Achievement Update](/packets/gameservice/server/0220.ksy).

seq:
  - id: pang_cost
    type: u4
    doc: Cost of exchange in pang.
  - id: unknown_a
    size: 4
    doc: All 0x00?
  - id: card_id
    type: u4
    repeat: expr
    repeat-expr: 3
    doc: From pangya_xx.iff/Card.iff. ID of each of the cards used.
