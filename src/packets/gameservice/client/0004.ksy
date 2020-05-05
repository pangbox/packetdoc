#pragma.examples gameservice/client 0004
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0004_sub_server_connect
  title: GameService Client Connect to Sub-Server
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet directs the server to connect the client to the sub-server specified,
  as identified in [GameService Server 0x004D Sub-Server List](/packets/gameservice/server/004d.ksy)
  or [GameService Server 0x009F Server List](/packets/gameservice/server/009f.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_JOIN_LOBBY`
  * `eantoniobr/UGPangya`: `PLAYER_SELECT_LOBBY`

seq:
  - id: sub_server_id
    type: u1
    doc: |
      The Sub-server's ID
