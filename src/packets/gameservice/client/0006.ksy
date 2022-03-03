#pragma.examples gameservice/client 0006
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0006_match_statistics_submit
  title: GameService Client 0006 Match Statistics Submit
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is sent at the end of most (all?) games to report the user's statistics for that particular match.
  
  The response is [GameService Server 0x0045 User Statistics](/packets/gameservice/server/0045.ksy).
  
  **Aliases:**
  * `eantoniobr/UGPangya`: `PLAYER_SEND_GAMERESULT`

seq:
  - id: match_stat_strokes
    type: u4
    doc: Number of strokes (excluding putts) made during the match.
  - id: match_stat_putts
    type: u4
    doc: Number of putts made during the match.
  - id: unknown_gsc0006_c
    size: 4
    doc: Always 0?
  - id: unknown_user_statistic_data_d_delta
    type: u4
    doc: Changes unknown_userdata_d in GSS-0045.
  - id: match_stat_longest_drive
    type: f4
    doc: User's longest drive of the match.
  - id: unknown_gsc0006_f
    type: u4
  - id: unknown_gsc0006_g
    size: 8
  - id: unknown_gsc0006_h
    type: u4
  - id: unknown_gsc0006_i
    type: u4
  - id: unknown_gsc0006_j
    size: 8
    doc: Always 0?
  - id: unknown_gsc0006_s
    type: u2
  - id: unknown_gsc0006_k
    type: u4
  - id: unknown_gsc0006_l
    type: u4
  - id: unknown_gsc0006_m
    type: u4
  - id: unknown_gsc0006_n
    type: u4
  - id: match_stat_longest_putt
    type: f4
    doc: Unconfirmed. User's longest successful putt of the match. 0 if no successful putts.
  - id: match_stat_longest_chip
    size: f4
    doc: Unconfirmed. User's longest successful chip-in of the match. 0 if no successful chip-ins.
  - id: unknown_gsc0006_q
    type: s4
    doc: 0xFFFFFFFF (-1) in VS matches, small positive values in tournaments.
  - id: unknown_gsc0006_r
    size: 160
    doc: Always 0?
