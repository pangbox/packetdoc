#pragma.examples gameservice/client 0010
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0010_user_team_change
  title: GameService Client User Team Change
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet signals a user switching teams in a team-based room.
  
  The response is [GameService Server 0x007D User Team Change Announce](/packets/gameservice/server/007d.ksy).
  
  **Aliases:**
  * `eantoniobr/UGPangya`: `PLAYER_CHANGE_TEAM`

seq:
  - id: team_value
    type: u1
    enum: team_value

enums:
  team_value:
    0x00: team_red
    0x01: team_blue
