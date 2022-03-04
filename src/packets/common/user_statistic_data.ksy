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
  
  **See Also**:
  * [User Character Data](/packets/common/user_character_data.ksy)
  * [User Equipment Data](/packets/common/user_equipment_data.ksy)

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
    size: 4
    doc: Always 0x00?
  - id: unknown_user_statistic_data_l
    type: u4
  - id: unknown_user_statistic_data_m
    type: u2
  - id: unknown_user_statistic_data_n
    type: u4
  - id: unknown_user_statistic_data_o
    type: u4
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
    size: 4
    doc: All 0x00?
  - id: unknown_user_statistic_data_ad
    type: u4
  - id: unknown_user_statistic_data_ae
    type: u4
  - id: unknown_user_statistic_data_af
    size: 16
    doc: All 0x00?
  - id: user_stat_quit_rate_unknown_a
    type: u4
    doc: Unconfirmed. Possibly quit rate or total matches played.
  - id: user_stat_quit_rate_unknown_b
    type: u4
    doc: Unconfirmed. Possibly quit rate or total matches played.
  - id: unknown_user_statistic_data_al
    size: 4
    doc: All 0x00?
  - id: unknown_user_statistic_data_am
    type: s4
  - id: unknown_user_statistic_data_an
    type: s4
    doc: Always -1?
  - id: unknown_user_statistic_data_ao
    size: 4
    doc: All 0x00?
  - id: unknown_user_statistic_data_ap
    type: u4
  - id: unknown_user_statistic_data_aq
    type: u4
  - id: unknown_user_statistic_data_ai
    size: 14
    doc: All 0x00?
  - id: unknown_user_statistic_data_aj
    type: u4
  - id: unknown_user_statistic_data_ak
    size: 64
    doc: All 0x00?
  - id: unknown_user_statistic_data_ar
    type: u4
  - id: unknown_user_statistic_data_as
    size: 18
