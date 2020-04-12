#pragma.examples gameservice/client 0177
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0177_event_mode_leave
  title: GameService Client Event Mode Leave
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet announces the client has left Grand Prix event mode.
  
  The response is [GameService Server 0x0251 Event Mode Leave Response](/packets/gameservice/server/0251.ksy).
  
  **See Also:**
  * [GameService Client 0x0081 Multiplayer Mode Join](/packets/gameservice/client/0081.ksy)
  * [GameService Client 0x0082 Multiplayer Mode Leave](/packets/gameservice/client/0082.ksy)
  * [GameService Client 0x0176 Event Mode Join](/packets/gameservice/client/0176.ksy)
