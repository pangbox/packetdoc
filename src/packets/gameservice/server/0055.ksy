#pragma.examples gameservice/server 0055
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0055_shot_commit_announce
  title: GameService Server Shot Commit Announce
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet relays the user's committed shot to all players.
  
  As with all other shot announce packets, it is not relayed during tournaments/simultaneous play.
  
  This is the response to [GameService Client 0x0012 Shot Commit](/packets/gameservice/client/0012.ksy).

seq:
  - id: connection_id
    type: u4
    doc: The user's connection ID who has rotated their shot.
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
