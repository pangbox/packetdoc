#pragma.examples gameservice/server 006c
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_006c_tournament_user_finish
  title: GameService Server Tournament User Finish
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet announces that a user has finished the tournament.
  
  This is paired with [GameService Server 0x0040 Message Data](/packets/gameservice/server/0040.ksy), type 0x11.

seq:
  - id: connection_id
    type: u4
    doc: The user's connection ID who finished.
  - id: unknown_a
    type: u1
    doc: Known examples show 2 (0x02) or 3 (0x03).
