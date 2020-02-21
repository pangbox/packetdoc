#pragma.examples gameservice/client 0179
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0179_join_event_room
  title: GameService Client Join Event Room
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is a request to join a particular event room.
  
  Its response is [Gameservice Server 0x0049 Join Room Response](/packets/gameservice/server/0049.ksy).
  
seq:
  - id: event_number
    type: u4
    doc: It is currently unknown where this number comes from. Still investigating.
