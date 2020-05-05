#pragma.examples gameservice/client 00d5
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_00d5_locker_pang_balance_request
  title: GameService Client Locker Pang Balance Request
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet requests the pang balance currently within the locker.
  
  It has no payload.
  
  The response is [GameService Server 0x0172 Locker Pang Balance](/packets/gameservice/server/0172.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_REQUEST_LOCKER_PANGS`
  * `eantoniobr/UGPangya`: `PLAYER_GET_LOCKERPANG`
