#pragma.examples gameservice/client 0070
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0070_scratchy_play
  title: GameService Client Scratchy Play
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet uses a scratchy card to reveal a prize.
  
  This packet has no payload.
  
  The responses are:
  * [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy) to award prizes and deduct a card, and
  * [GameService Server 0x00DD Scratchy Play Result](/packets/gameservice/server/00dd.ksy) to acknowledge the play.
