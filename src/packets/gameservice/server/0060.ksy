#pragma.examples gameservice/server 0060
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0060_shot_comet_relief_announce
  title: GameService Server Shot Comet Relief Announce
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet announces the new location for a user's comet after relocation/relief.
  
  It is a response to:
  * [GameService Client 0x0019 Shot Comet Relief](/packets/gameservice/client/0019.ksy).

seq:
  - id: unknown_axis_position_a
    type: f4
  - id: unknown_axis_position_b
    type: f4
  - id: unknown_axis_position_c
    type: f4
