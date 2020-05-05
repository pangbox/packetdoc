#pragma.examples gameservice/client 012a
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_012a_scratchy_menu_open
  title: GameService Client Scratchy Menu Open
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet opens the scratchy card menu.
  
  This packet has no payload.
  
  The response is [GameService Server 0x01EB Scratchy Menu Open Response](/packets/gameservice/server/01eb.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_OPEN_SCRATCHY_CARD`
  * `eantoniobr/UGPangya`: `PLAYER_OPENUP_SCRATCHY`
