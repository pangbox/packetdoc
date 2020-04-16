#pragma.examples gameservice/client 0022
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0022_shot_active_user_acknowledge
  title: GameService Client Shot Active User Acknowledge
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges that it is the local user's turn to play.
  
  There is no payload.
  
  This is the response to [GameService Server 0x0063 Shot Active User Announce](/packets/gameservice/server/0063.ksy).
