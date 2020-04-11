#pragma.examples gameservice/client 016f
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_016f_login_bonus_claim
  title: GameService Client Login Bonus Claim
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is to claim the Login Bonus. It's always and only called after
  [GameService Server 0x0248 Login Bonus Status Response](/packets/gameservice/server/0248.ksy)
  shows an unclaimed bonus.
  
  This packet contains no payload.
  
  Its responses are [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy) (to award the item),
  then [GameService Server 0x0249 Login Bonus Claim Response](/packets/gameservice/server/0249.ksy).
