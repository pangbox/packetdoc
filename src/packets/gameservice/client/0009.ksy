#pragma.examples gameservice/client 0009
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0009_room_join
  title: GameService Client Room Join
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is a request to join a particular game room. If the room is passworded, the password attempt is sent
  here. If the room is not passworded, the password length is 0.
  
  The responses are:
  * [GameService Server 0x004A Room Settings Announce](/packets/gameservice/server/004a.ksy), and 
  * [GameService Server 0x0049 Room Join Response](/packets/gameservice/server/0049.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_JOIN_GAME`
  * `eantoniobr/UGPangya`: `PLAYER_JOIN_GAME`

seq:
  - id: room_number
    type: u2
    doc: |
      The game room's ID as identified in [Gameserver Server 0x0047 Sub-Server Room List](/packets/gameservice/server/0047.ksy).
  - id: room_password
    type: pstring
    doc: |
      The password attempt, if applicable. Non-passworded rooms have a password length of 0.
