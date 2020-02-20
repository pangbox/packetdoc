#pragma.examples gameservice/client 002d
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_002d_room_information_request
  title: GameService Client Room Information Request
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet requests information on a game room. There is client-side protection against
  sending this packet for private rooms.
  
  The response is [Gameservice Server 0x0086 Room Information Response](/packets/gameservice/server/0086.ksy).
  
seq:
  - id: room_number
    type: u2
    doc: |
      From [Gameservice Server 0x0047 Room List](/packets/gameservice/server/0047.ksy).
