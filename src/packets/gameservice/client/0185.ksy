#pragma.examples gameservice/client 0145
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0185_shot_assist_activate
  title: GameService Client Shot Assist Activate
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet activates shot assist for a given shot during a match.
  
  The response is [GameService Server 0x026B Shot Assist Activate Response](/packets/gameservice/server/026b.ksy).
  
  **Aliases:**
  * `eantoniobr/UGPangya`: `PLAYER_CALL_ASSIST_PUTTING`

seq:
  - id: item_id
    type: u4
    doc: From pangya_xx.iff/Item.iff. The 'Play Assist' item ID (0x1BE00016).
