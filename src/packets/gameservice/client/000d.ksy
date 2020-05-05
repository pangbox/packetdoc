#pragma.examples gameservice/client 000d
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_000d_room_user_ready_state
  title: GameService Client Room User Ready State
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet announces the user's ready state in a game room after clicking the 'Ready' button.
  
  The response is [Gameservice Server 0x0078 Room User Ready State Response](/packets/gameservice/server/0078.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_READY`
  * `eantoniobr/UGPangya`: `PLAYER_PRESS_READY`

seq:
  - id: user_readiness
    type: u1
    enum: user_readiness
    doc: Unconfirmed.

enums:
  user_readiness:
    0x00: ready
    0x01: not_ready_unconfirmed
