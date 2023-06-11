---
meta:
  id: user_statistic_data
  title: User Statistic Data
  encoding: ASCII
  endian: le
  imports:
    - id_bank

doc: |
  Oft-recurring format for communicating a user's in-game statistics to clients, including:
  * [GameService Server 0x0044 Unknown](/packets/gameservice/server/0044.ksy)
  * [GameService Server 0x0045 User Statistics](/packets/gameservice/server/0045.ksy)
  * [GameService Server 0x0076 Room User Data](/packets/gameservice/server/0076.ksy)
  * [GameService Server 0x0158 User Statistics Response](/packets/gameservice/server/0158.ksy)
  
  Occasionally followed by [User Statistic Data Extension](/packets/common/user_statistic_data_ext.ksy)
  
  **See Also**:
  * [Common Data Structures](/packets/common/index.md)

seq:
  - id: user_stat_total_strokes
    type: u4
    doc: Number of strokes (excluding putts) done ever, across all courses.
  - id: user_stat_total_putts
    type: u4
    doc: Number of putts done ever, across all courses.
  - id: unknown_user_statistic_data_c
    type: u4
  - id: unknown_user_statistic_data_d
    type: u4
  - id: user_stat_longest_drive
    type: f4
    doc: User's longest drive done ever, across all courses.
  - id: unknown_user_statistic_data_f
    type: u4
  - id: unknown_user_statistic_data_g
    size: 4
    doc: Always 0x00?
  - id: unknown_user_statistic_data_h
    type: u4
  - id: unknown_user_statistic_data_i
    type: u4
  - id: user_stat_total_holes
    type: u4
    doc: User's total holes played, across all courses and matches.
  - id: unknown_user_statistic_data_k
    type: u4
  - id: user_stat_hio
    type: u4
    doc: User's total number of holes-in-one.
  - id: unknown_user_statistic_data_m
    type: u2
  - id: unknown_user_statistic_data_n
    type: u4
  - id: user_stat_albatross
    type: u4
    doc: User's total number of albatrosses.
  - id: unknown_user_statistic_data_p
    size: 4
    doc: Always 0x00?
  - id: unknown_user_statistic_data_q
    type: u4
  - id: user_stat_longest_putt
    type: f4
    doc: User's longest successful putt, across all courses.
  - id: user_stat_longest_chip
    type: f4
    doc: User's longest successful chip-in, across all courses.
  - id: user_xp_amount
    type: u4
    doc: User's total XP amount
  - id: user_rank
    enum: id_bank::rank
    type: u1
    doc: User's current rank, from 0x00 ('Rookie F') through 0x46 ('Infinity Legend I').
  - id: pang_balance
    type: u4
    doc: User's new pang balance.
  - id: unknown_user_statistic_data_w
    size: 4
    doc: Always 0x00?
  - id: user_stat_total_score
    type: s4
    doc: The user's overall total score, across all courses and matches. Almost always negative, being golf. All birdies subtract one from this value, eagles two, bogeys add one, etc.
  - id: unknown_user_statistic_data_y
    size: 5
    doc: All 0x7F?
  - id: unknown_user_statistic_data_z
    size: 49
    doc: All 0x00?
  - id: unknown_user_statistic_data_aa
    type: u4
  - id: unknown_user_statistic_data_ab
    type: u4
  - id: unknown_user_statistic_data_ac
    type: u4
  - id: unknown_user_statistic_data_ad
    type: u4
  - id: unknown_user_statistic_data_ae
    type: u4
  - id: unknown_user_statistic_data_af
    size: 16
    doc: All 0x00?
  - id: user_stat_combo_unknown_a
    type: u4
    doc: User's combo, numerator?
  - id: user_stat_combo_unknown_b
    type: u4
    doc: User's combo, denominator?
  - id: unknown_user_statistic_data_al
    type: u4
    doc: All 0x00?
  - id: user_stat_pang_battle
    type: s4
    doc: Total earnt or lost in Pang Battle mode.
  - id: unknown_user_statistic_data_an
    type: s4
    doc: Always -1?
  - id: unknown_user_statistic_data_ao
    type: u4
  - id: unknown_user_statistic_data_ap
    type: u4
  - id: unknown_user_statistic_data_aq
    type: u4
  - id: unknown_user_statistic_data_at
    type: u4
  - id: unknown_user_statistic_data_ai
    size: 10
    doc: All 0x00?
  - id: unknown_user_statistic_data_aj
    type: u4
  - id: unknown_user_statistic_data_ak
    size: 8
