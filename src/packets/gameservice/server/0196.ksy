#pragma.examples gameservice/server 0196
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0196_unknown_lounge_related_response
  title: GameService Server 0196 Unknown Response (C-00EB, Lounge Related)
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This is the response to [Gameservice Client 0x00EB Unknown Request (Lounge Related)](/packets/gameservice/client/00eb.ksy).
  
  It is also sent once with the local user's connection ID upon joining a lounge without prompting.

seq:
  - id: connection_id
    type: u4
    doc: Targer user's connection ID from [Gameservice Server 0x0046 User Census](/packets/gameservice/server/0046.ksy).
  - id: unknown_a
    size: 20
    doc: All known examples show 0x3F800000, 5 times.
