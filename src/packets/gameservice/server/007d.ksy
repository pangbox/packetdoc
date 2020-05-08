#pragma.examples gameservice/server 007d
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_007d_user_team_change_announce
  title: GameService Server User Team Change Announce
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet announces a user changing teams to all other users in the team-based room.
  
  It is the response to [GameService Client 0x0010 User Team Change](/packets/gameservice/client/0010.ksy).

seq:
  - id: connection_id
    type: u4
    doc: Connection ID of the relevant user.
  - id: team_value
    type: u1
    enum: team_value

enums:
  team_value:
    0x00: team_red
    0x01: team_blue
