#pragma.examples gameservice/server 0056
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0056_shot_rotate_announce
  title: GameService Server Shot Rotate/Aim Announce
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet relays the user's new rotation value to all players.
  
  This is a response to [GameService Client 0013 Shot Rotate/Aim](/packets/gameservice/client/0013.ksy).

seq:
  - id: connection_id
    type: u4
    doc: The user's connection ID who has rotated their shot.
  - id: rotation_angle
    type: s4
    doc: Increments counterclockwise.
