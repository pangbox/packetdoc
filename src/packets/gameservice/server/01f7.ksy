#pragma.examples gameservice/server 01f7
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_01f7_unknown_tourney_related_announce
  title: GameService Server 01F7 Unknown Announce (Tourney Related)
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is some sort of announcement after a player has taken a shot in a tournament/simultaneous play.
  
  It is paired with [GameService Server 0x006E Unknown Announce (Tourney Related)](/packets/gameservice/server/006e.ksy).

seq:
  - id: connection_id
    type: u4
    doc: The connection ID of the relevant user.
  - id: unknown_a_paired
    type: u1
    doc: Identical in corresponding packet of [GameService Server 0x006E Unknown Announce (Tourney Related)](/packets/gameservice/server/006e.ksy).
  - id: unknown_b
    type: f4
  - id: unknown_c
    type: f4
  - id: unknown_d
    type: f4
  - id: unknown_e
    type: f4
  - id: unknown_f
    type: u1
  - id: unknown_g
    type: f4
  - id: unknown_h
    type: f4
  - id: unknown_i
    type: f4
  - id: unknown_j
    type: f4
  - id: unknown_k
    type: u4
    doc: All examples show 0 (0x00000000).
  - id: unknown_l
    type: f4
  - id: unknown_m
    type: f4
  - id: unknown_n
    type: f4
  - id: unknown_o
    type: u4
  - id: unknown_p
    type: f4
  - id: unknown_q
    type: f4
  - id: unknown_r
    type: u2
  - id: unknown_s
    type: f4
  - id: unknown_t
    type: f4
  - id: unknown_u
    type: f4
  - id: unknown_v
    type: f4
  - id: unknown_w
    type: f4
  - id: unknown_x
    type: u4
