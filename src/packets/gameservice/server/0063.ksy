#pragma.examples gameservice/server 0063
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0063_user_at_play_announce
  title: GameService Server User At Play Announce
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet announces which user in a VS room is currently up to play.

seq:
  - id: connection_id
    type: u4
    doc: The user's connection ID who is up.
