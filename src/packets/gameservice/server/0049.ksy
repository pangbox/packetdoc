#pragma.examples gameservice/server 0049
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0049_room_join_response
  title: GameService Server Room Join Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges joining a room.
  
  It is one of the responses to:
  * [Gameservice Client 0x0009 Room Join](/packets/gameservice/client/0009.ksy), and
  * [Gameservice Client 0x0179 Event Room Join](/packets/gameservice/client/0179.ksy).

seq:
  - id: unknown_a
    size: 2
  - id: room_name
    type: strz
    size: 64
    doc: The joined room's name.
  - id: unknown_b
    size: 25
  - id: room_number
    type: u2
    doc: The joined room's number, as per [Gameservice Client 0x0009 Room Join](/packets/gameservice/client/0009.ksy).
  - id: unknown_c
    size: 111
  - id: event_number
    type: u4
    doc: The joined event's number, as per [Gameservice Client 0x0179 Event Room Join](/packets/gameservice/client/0179.ksy).
  - id: unknown_d
    size: 12
