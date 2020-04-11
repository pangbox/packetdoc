#pragma.examples gameservice/client 0081
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0081_multiplayer_mode_join
  title: GameService Client Multiplayer Mode Join
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet announces the client has entered multiplayer mode.
  This gets set when the client opens the multiplayer lobby / game room directory,
  remains set while the client is in any multiplayer room, and only becomes unset once the client leaves all rooms and the directory.
  
  There is no payload.
  
  The response is [GameService Server 0x00F5 Multiplayer Mode Join Response](/packets/gameservice/server/00f5.ksy).
  
  ** See Also ** [GameService Client 0x0082 Multiplayer Mode Leave](/packets/gameservice/client/0082.ksy).
