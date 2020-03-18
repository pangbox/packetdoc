#pragma.examples gameservice/client 009c
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_009c_unknown_friends_related_request
  title: GameService Client 009C Unknown Request (Friends Related?)
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet has no payload.

  The response is [Gameservice Server 0x010E Unknown Response (Friends Related?)](/packets/gameservice/server/010e.ksy).
