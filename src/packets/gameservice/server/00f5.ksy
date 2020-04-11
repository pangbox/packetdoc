#pragma.examples gameservice/server 00f5
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_00f5_multiplayer_mode_join_response
  title: GameService Server Multiplayer Mode Join Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges a user has entered multiplayer mode.
  
  It has no payload.
  
  It is a response to [GameService Client 0x0081 Multiplayer Mode Join](/packets/gameservice/client/0081.ksy).
  
  **See Also** [GameService Server 0x00F6 Multiplayer Mode Leave Response](/packets/gameservice/server/00f6.ksy).
