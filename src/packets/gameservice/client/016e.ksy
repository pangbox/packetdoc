#pragma.examples gameservice/client 016e
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_016e_login_bonus_request
  title: GameService Client Login Bonus Request
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet requests the Login Bonus information.
  It's always called after [Gameservice Client 0x0004 Sub-Server Connect](/packets/gameservice/client/0004.ksy),
  but is called at other times, too.
  
  This packet contains no payload.
  
  The response is [Gameservice Server 0x0248 Login Bonus Response](/packets/gameservice/server/0248.ksy).
