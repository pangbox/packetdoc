#pragma.examples gameservice/client 0015
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0015_shot_power
  title: GameService Client Shot Power
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet relays if the user will use extra power, and how much.
  
  The response is [GameService Server 0x0058 Shot Power Announce](/packets/gameservice/server/0058.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_POWER_SHOT`
  * `eantoniobr/UGPangya`: `PLAYER_POWER_SHOT`

seq:
  - id: power_level
    type: u1
    enum: power_level
    doc: 0x00 is used if power has been set and user reverts to a standard shot.

enums:
  power_level:
    0x00: normal
    0x01: power
    0x02: double_power
