#pragma.examples gameservice/server 004c
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_004c_room_leave_response
  title: GameService Server Room Leave Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges the user has left a room and returned to the multiplayer lobby.
  
  It is a response to:
  * [GameService Client 0x000F Room Leave](/packets/gameservice/client/000f.ksy).
  * [GameService Client 0x00AA Match Statistics Submit (Tiki Report)](/packets/gameservice/client/00aa.ksy).

seq:
  - id: room_number
    type: s2
    doc: The new room number, which is always -1 (0xFFFF) for the lobby.
