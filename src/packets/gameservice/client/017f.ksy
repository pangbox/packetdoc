#pragma.examples gameservice/client 017f
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_017f_memorial_coin_play
  title: GameService Client Memorial Coin Play
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet redeems a coin for one play of the Memorial Coin gacha game.
  
  The responses are, in order:
  * [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy) to remove the coin and award the prize,
  * [GameService Server 0x0264 Memorial Coin Result](/packets/gameservice/server/0264.ksy) to show the result,
  * [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy) to increase a hidden counter,
  * [GameService Server 0x022E Achievement Unlocked](/packets/gameservice/server/022e.ksy) to increase achievement progress, and
  * [GameService Server 0x0220 Achievement Update](/packets/gameservice/server/0220.ksy).

seq:
  - id: item_id
    type: u4
    doc: From pangya_xx.iff/Item.iff. Item ID of coin to redeem.
