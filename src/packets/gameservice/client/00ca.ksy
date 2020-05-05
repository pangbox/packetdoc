#pragma.examples gameservice/client 00ca
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_00ca_cardholic_pack_open
  title: GameService Client Cardholic Pack Open
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet opens a card pack ('Gold Card Ticket', etc.)
  
  The response is [GameService Server 0x0154 Cardholic Pack Open Response](/packets/gameservice/server/0154.ksy).
  
  **Aliases:**
  * `eantoniobr/UGPangya`: `PLAYER_OPEN_CARD`

seq:
  - id: item_id
    type: u4
    doc: From pangya_xx.iff/Card.iff. Item ID of card pack opened.
  - id: unknown_id
    type: u4
    doc: Possibly an inventory id of some kind? Reappears in response.
