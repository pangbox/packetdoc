#pragma.examples gameservice/server 00f6
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_00f6_multiplayer_mode_leave_response
  title: GameService Server Multiplayer Mode Leave Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges a user has left multiplayer mode.
  
  It has no payload.
  
  It is a response to [GameService Client 0x0082 Multiplayer Mode Leave](/packets/gameservice/client/0082.ksy).
  
  **See Also** [GameService Server 0x00F5 Multiplayer Mode Join Response](/packets/gameservice/server/00f5.ksy).
