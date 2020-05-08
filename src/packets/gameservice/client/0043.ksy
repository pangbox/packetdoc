#pragma.examples gameservice/client 0043
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0043_server_list_request
  title: GameService Client Server List Request
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet requests a server and sub-server list. It has no payload.
  
  The response is [Gameservice Server 0x009F Server List](/packets/gameservice/server/009f.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_REQUEST_SERVERS_LIST`
  * `eantoniobr/UGPangya`: `PLAYER_REQUEST_LOBBY_INFO`
