#pragma.examples gameservice/client 0082
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0082_multiplayer_mode_leave
  title: GameService Client Multiplayer Mode Leave
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet announces the client has left multiplayer mode.
  This mode gets set when the client opens the multiplayer lobby / game room directory,
  remains set while the client is in any multiplayer room, and only becomes unset once the client leaves all rooms and the directory.
  
  There is no payload.
  
  The response is [GameService Server 0x00F6 Multiplayer Mode Leave Response](/packets/gameservice/server/00f6.ksy).
  
  ** See Also ** [GameService Client 0x0081 Multiplayer Mode Join](/packets/gameservice/client/0081.ksy).
