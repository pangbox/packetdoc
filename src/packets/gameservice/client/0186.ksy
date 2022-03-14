#pragma.examples gameservice/client 0186
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0186_big_black_papel_play
  title: GameService Client Big Black Papel Play
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet signals a request to play the Big Black Papel gacha game. It has no payload.
  
  The responses are:
  * [GameService Server 0x00C8 Pang Balance](/packets/gameservice/server/00c8.ksy),
  * [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy) to award prizes and deduct a BP coupon if applicable,
  * [GameService Server 0x00FB Unknown](/packets/gameservice/server/00fb.ksy) for an unknown reason,
  * [GameService Server 0x026C Big Black Papel Result](/packets/gameservice/server/026c.ksy),
  * [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy) again to award quest progress, which triggers
  * [GameService Server 0x022E Achievement Unlocked](/packets/gameservice/server/022e.ksy) (even if blank) and,
  * [GameService Server 0x0220 Achievement List](/packets/gameservice/server/0220.ksy).
  
  **Aliases:**
  * `eantoniobr/UGPangya`: `PLAYER_OPEN_BIG_BONGDARI`
  
  **See Also:**
  * [GameService Client 0x014B Black Papel Play](/packets/gameservice/client/014b.ksy).
