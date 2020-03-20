#pragma.examples gameservice/client 009c
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_009c_unknown_opponent_related_request
  title: GameService Client 009C Unknown Request (VS Mode Opponent Related)
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is sent at the beginning of each hole in VS rooms, presumably to information about the opponent(s).
  
  This packet has no payload.

  The response is [Gameservice Server 0x010E Unknown Response (VS Mode Opponent Related)](/packets/gameservice/server/010e.ksy).
