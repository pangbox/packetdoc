#pragma.examples gameservice/client 0009
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0009_send_room_password
  title: GameService Client Send Room Password
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains a game room password attempt.
  
seq:
  - id: room_number
    type: u2
    doc: |
      The game room's ID as identified in [Gameserver Server 0x0047 Sub-Server Room List](/packets/gameservice/server/0047.ksy).
  - id: room_password
    type: pstring
    doc: |
      The password attempt.
