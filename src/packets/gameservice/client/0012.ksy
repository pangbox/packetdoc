#pragma.examples gameservice/client 0012
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0012_shot_commit
  title: GameService Client Shot Commit
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet relays that the user has committed to a shot, and supplies some additional information.
  
  The response is [GameService Server 0x0055 Shot Commit Announce](/packets/gameservice/server/0055.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_ACTION_SHOT`
  * `eantoniobr/UGPangya`: `PLAYER_ACTION_SHOT`

seq:
  - id: shot_subtype
    type: u2
  - id: shot_subdata
    type:
      switch-on: shot_subtype
      cases:
        0x00: shot_commit_00_normal
        0x01: shot_commit_01_putt
  - id: shot_strength
    type: f4
    doc: From [GameService Client 0x0014 Shot Meter Input](/packets/gameservice/client/0014.ksy). Strength of shot (max 500).
  - id: shot_accuracy
    type: f4
    doc: From [GameService Client 0x0014 Shot Meter Input](/packets/gameservice/client/0014.ksy). Accuracy of shot (abt 140).
  - id: shot_english_curve
    type: f4
    doc: Unconfirmed. +Right, from -1 to +1.
  - id: shot_english_spin
    type: f4
    doc: Unconfirmed. +Down, from -1 to +1.
  - id: unknown_dc
    size: 16
  - id: unknown_fb
    type: f4
  - id: unknown_dd
    size: 4
  - id: shot_angle
    type: f4
    doc: From [GameService Client 0x0013 Shot Rotate](/packets/gameservice/client/0013.ksy). Rotation/aim of shot. May differ very slightly.
  - id: unknown_de
    size: 4
  - id: shot_pangya_bar
    type: f4
    doc: From [GameService Client 0x0014 Shot Meter Input](/packets/gameservice/client/0014.ksy). Location of the pangya bar (oft 140).
  - id: shot_club
    type: u4
    doc: From [GameService Client 0x0016 Shot Club Change](/packets/gameservice/client/0016.ksy). Used club of shot.
  - id: unknown_df
    size: 13
  - id: unknown_sa
    type: s4
  - id: unknown_fa
    type: f4

types:
  shot_commit_00_normal:
    doc: This field does not exist for non-putting shots.
  shot_commit_01_putt:
    seq:
      - id: unknown_da
        size: 5
      - id: unknown_ua
        type: u4
