#pragma.examples gameservice/client 0013
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0013_shot_rotate
  title: GameService Client Shot Rotate/Aim
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet relays how the user has rotated/adjusted the aim of their shot, so it can be relayed to all other
  players in the room.
  
  The response is [GameService Server 0x0056 Shot Rotate Announce](/packets/gameservice/server/0056.ksy).
  
seq:
  - id: rotation_angle
    type: f4
    doc: Increments counterclockwise.
