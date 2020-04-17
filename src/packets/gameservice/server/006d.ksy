#pragma.examples gameservice/server 006d
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_006d_tournament_user_update
  title: GameService Server Tournament User Update
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet provides a public update on the progress on a player after they finish a hole.
  
seq:
  - id: connection_id
    type: u4
    doc: The connection ID of the user that finished a hole.
  - id: unknown_a_paired
    type: u1
    doc: Identical to packets belonging to same connection_id of types [GameService Server 0x006E Unknown Announce (Tourney Related)](/packets/gameservice/server/006e.ksy) and [GameService Server 0x01F7 Unknown Announce (Tourney Related)](/packets/gameservice/server/01f7.ksy).
  - id: unknown_b
    type: u1
  - id: user_score
    type: s4
    doc: Current overall score.
  - id: user_pang
    type: u4
    doc: User's earnt pang this game.
  - id: unknown_c
    size: 4
  - id: user_bonus
    type: u4
    doc: User's earnt bonus pang this game.
  - id: unknown_d
    size: 5
