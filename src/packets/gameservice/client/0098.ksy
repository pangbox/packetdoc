#pragma.examples gameservice/client 0098
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0098_rare_shop_open
  title: GameService Client Rare Shop Open
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet opens the rare shop ('Black Papel', 'Memorial', etc.)
  
  This packet has no payload.
  
  The response is [GameService Server 0x010B Rare Shop Open Response](/packets/gameservice/server/010b.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_OPEN_RARE_SHOP`
  * `eantoniobr/UGPangya`: `PLAYER_OPEN_PAPEL`
