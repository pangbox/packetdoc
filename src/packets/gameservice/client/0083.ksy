#pragma.examples gameservice/client 0083
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0083_sub_server_connect_multiplayer_mode
  title: GameService Client Sub-Server Connect (Multiplayer Mode)
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet directs the server to connect the client to the sub-server specified, as identified in [GameService Server 0x004D Sub-Server List](/packets/gameservice/server/004d.ksy) or [GameService Server 0x009F Server List](/packets/gameservice/server/009f.ksy).
  
  It is used when the user is in multiplayer or grand prix mode, and is effectively a combination of [GameService Client 0x0004 Sub-Server Connect](/packets/gameservice/client/0004.ksy) and either [GameService Client 0x0081 Multiplayer Mode Join](/packets/gameservice/client/0081.ksy) or [GameService Client 0x0176 Event Mode Join](/packets/gameservice/client/0176.ksy).
  
  The response is:
  * [GameService Server 0x004E Connect to Sub-Server Response](/packets/gameservice/server/004e.ksy).
  
  **Aliases:**
  * `eantoniobr/UGPangya`: `PLAYER_SELECT_LOBBY_WITH_ENTER_CHANNEL`
  
  **See Also:**
  * [GameService Client 0x0004 Sub-Server Connect](/packets/gameservice/client/0004.ksy).
  
seq:
  - id: sub_server_id
    type: u1
    doc: |
      The Sub-server's ID
