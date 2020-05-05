#pragma.examples gameservice/client 016e
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_016e_login_bonus_status_request
  title: GameService Client Login Bonus Status Request
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet requests the Login Bonus information.
  It's always called after [GameService Client 0x0004 Sub-Server Connect](/packets/gameservice/client/0004.ksy),
  but is called at other times, too.
  
  This packet contains no payload.
  
  The response is [GameService Server 0x0248 Login Bonus Status Response](/packets/gameservice/server/0248.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_REQUEST_DAILY_REWARD`
  * `eantoniobr/UGPangya`: `PLAYER_REQUEST_CHECK_DAILY_ITEM`
