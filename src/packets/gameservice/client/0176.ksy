#pragma.examples gameservice/client 0176
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0176_event_mode_join
  title: GameService Client Event Mode Join
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet announces the client has entered Grand Prix event mode.
  This gets set when the client opens the Grand Prix event lobby / game room directory,
  remains set while the client is in any event room, and only becomes unset
  once the client leaves all event rooms and the directory.
  
  There is no payload.
  
  The response is [GameService Server 0x0250 Event Mode Join Response](/packets/gameservice/server/0250.ksy).
  
  **See Also:**
  * [GameService Client 0x0081 Multiplayer Mode Join](/packets/gameservice/client/0081.ksy)
  * [GameService Client 0x0082 Multiplayer Mode Leave](/packets/gameservice/client/0082.ksy)
  * [GameService Client 0x0177 Event Mode Leave](/packets/gameservice/client/0177.ksy)
