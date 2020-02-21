#pragma.examples gameservice/client 014b
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_014b_black_papel_play
  title: GameService Client Black Papel Play
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet signals a request to play the Black Papel gacha game. It has no payload.
  
  The responses are:
  
  * [Gameservice Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy) to award prizes and deduct a BP coupon if applicable,
  * [Gameservice Server 0x00FB Unknown](/packets/gameservice/server/00fb.ksy) for an unknown reason,
  * [Gameservice Server 0x021B Black Papel Result](/packets/gameservice/server/021b.ksy) for the actual results, and
  * [Gameservice Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy) again to award quest progress, which triggers
  * [Gameservice Server 0x022E Achievement Unlocked](/packets/gameservice/server/022e.ksy) (even if blank) and,
  * [Gameservice Server 0x0220 Achievement List](/packets/gameservice/server/0220.ksy)
