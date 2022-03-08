#pragma.examples gameservice/client 0019
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0019_shot_comet_relief
  title: GameService Client Shot Comet Relief
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet submits the new location the user has selected for relocating/relieving their comet.
  
  The response is [Gameservice Server 0x0060 Shot Comet Relief Announce](/packets/gameservice/server/0060.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_MOVE_AZTEC`
  * `eantoniobr/UGPangya`: `PLAYER_DROP_BALL`

seq:
  - id: unknown_axis_position_a
    type: f4
  - id: unknown_axis_position_b
    type: f4
  - id: unknown_axis_position_c
    type: f4
