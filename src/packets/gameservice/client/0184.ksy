#pragma.examples gameservice/client 0184
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0184_shot_assist_toggle
  title: GameService Client Shot Assist Toggle
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet enables or disables the shot assist feature.
  
  It has no payload.
  
  The responses are, in order:
  * [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy) which removes (enable) or adds (disable) a 'Play Assist' item, and
  * [GameService Server 0x026A Shot Assist Toggle Response](/packets/gameservice/server/026a.ksy).

  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_SET_ASSIST_MODE`
  * `eantoniobr/UGPangya`: `PLAYER_ASSIST_CONTROL`
