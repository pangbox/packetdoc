#pragma.examples gameservice/client 00eb
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_00eb_unknown_lounge_related_request
  title: GameService Client 00EB Unknown Request (S-0196, Lounge Related)
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is called for each user in a lounge room in no particular order. It will also be called as new users join the lounge.

  The response is [Gameservice Server 0x0196 Unknown Response (Lounge Related)](/packets/gameservice/server/0196.ksy).

seq:
  - id: connection_id
    type: u4
    doc: Targer user's connection ID from [Gameservice Server 0x0046 User Census](/packets/gameservice/server/0046.ksy).
