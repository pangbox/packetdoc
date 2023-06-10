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
  * [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy) to award prizes and deduct a BP coupon if applicable,
  * [GameService Server 0x00FB Unknown](/packets/gameservice/server/00fb.ksy) for an unknown reason,
  * [GameService Server 0x021B Black Papel Result](/packets/gameservice/server/021b.ksy) for the actual results, and
  * [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy) again to award quest progress, which triggers
  * [GameService Server 0x022E Achievement Unlocked](/packets/gameservice/server/022e.ksy) (even if blank) and,
  * [GameService Server 0x0220 Achievement List](/packets/gameservice/server/0220.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_PLAY_BONGDARI_SHOP`
  * `eantoniobr/UGPangya`: `PLAYER_OPEN_NORMAL_BONGDARI`
  
  **See Also:**
  * [GameService Client 0x0186 Big Black Papel Play](/packets/gameservice/client/0186.ksy).
