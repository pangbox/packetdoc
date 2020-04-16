#pragma.examples gameservice/server 006e
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_006e_unknown_tourney_related_announce
  title: GameService Server 006E Unknown Announce (Tourney Related)
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is some sort of announcement after a player has taken a shot in a tournament/simultaneous play.
  
  It is paired with [GameService Server 0x01F7 Unknown Announce (Tourney Related)](/packets/gameservice/server/01f7.ksy).

seq:
  - id: connection_id
    type: u4
    doc: The connection ID of the relevant user.
  - id: unknown_a_paired
    type: u1
    doc: Identical in corresponding packet of [GameService Server 0x01F7 Unknown Announce (Tourney Related)](/packets/gameservice/server/01f7.ksy).
  - id: unknown_b
    type: f4
  - id: unknown_c
    type: f4
  - id: unknown_d
    size: 6
