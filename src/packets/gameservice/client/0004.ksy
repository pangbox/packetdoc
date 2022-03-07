#pragma.examples gameservice/client 0004
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0004_sub_server_connect
  title: GameService Client Sub-Server Connect
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet directs the server to connect the client to the sub-server specified, as identified in [GameService Server 0x004D Sub-Server List](/packets/gameservice/server/004d.ksy) or [GameService Server 0x009F Server List](/packets/gameservice/server/009f.ksy).
  
  The response is:
  * [GameService Server 0x004E Connect to Sub-Server Response](/packets/gameservice/server/004e.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_JOIN_LOBBY`
  * `eantoniobr/UGPangya`: `PLAYER_SELECT_LOBBY`
  
  **See Also:**
  * [GameService Client 0x0083 Sub-Server Connect (Multiplayer Mode)](/packets/gameservice/client/0083.ksy).
  
seq:
  - id: sub_server_id
    type: u1
    doc: |
      The Sub-server's ID
