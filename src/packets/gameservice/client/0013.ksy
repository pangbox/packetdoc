#pragma.examples gameservice/client 0013
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0013_user_rotate_shot
  title: GameService Client User Rotate/Aim Shot
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet relays how the user has rotated/adjusted the aim of their shot, so it can be relayed to all other
  players in the room.
  
  The response is [GameService Server 0056 User Rotate Shot Announce](/packets/gameservice/server/0056.ksy).
  
seq:
  - id: rotation_angle
    type: s4
    doc: Increments counterclockwise.
