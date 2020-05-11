#pragma.examples gameservice/server 0066
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0066_room_match_results
  title: GameService Server Room Match Results
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains the final results of the match.
  
  It is sent at the end of a match.

seq:
  - id: user_count
    type: u1
  - id: connection_id_battle_mode
    type: u4
    repeat: expr
    repeat-expr: user_count
    doc: Only appears as a result of battle mode.
  - id: users
    type: user
    repeat: expr
    repeat-expr: user_count

types:
  user:
    seq:
      - id: connection_id
        type: u4
      - id: user_placement
        type: u1
        doc: Counts from 1. Final placement of the user (i.e. 1st, 2nd, 3rd, 4th).
      - id: user_score
        type: s1
        doc: Final overall score for the match.
      - id: user_stroke_quantity
        type: u1
        doc: Final stroke count for the match.
      - id: user_experience_gain
        type: u1
        doc: Final XP gain for the match.
      - id: unknown_a
        type: u1
        doc: All examples 0 (0x00).
      - id: user_pang_gain
        type: u4
        doc: Final standard pang gain for the match.
      - id: unknown_b
        size: 4
        doc: All 0x00.
      - id: user_bonus_pang_gain
        type: u4
        doc: Final bonus pang gain for the match.
      - id: unknown_c
        size: 4
        doc: All 0x00.
      - id: user_battle_pang_winnings
        type: s8
        doc: God only knows why this is a 64-bit value.
