---
meta:
  id: user_course_result_data
  title: User Course Result Data
  encoding: ASCII
  endian: le
  imports:
    - id_bank

doc: |
  Oft-recurring format for reporting a user's hole or match statistics to the server, including:
  * [GameService Client 0x0006 Match Statistics Submit](/packets/gameservice/client/0006.ksy)
  * [GameService Client 0x0031 Hole Statistics Submit](/packets/gameservice/client/0031.ksy)
  * [GameService Client 0x00AA Match Statistics Submit (Tiki Report)](/packets/gameservice/client/00aa.ksy)
  
  Its server-side counterpart is [User Course Record Data](/packets/common/user_course_record_data.ksy).
  
  **See Also**:
  * [User Caddie Data](/packets/common/user_caddie_data.ksy)
  * [User Character Data](/packets/common/user_character_data.ksy)
  * [User Course Record Data](/packets/common/user_course_record_data.ksy)
  * [User Course Result Data](/packets/common/user_course_result_data.ksy)
  * [User Equipment Data](/packets/common/user_equipment_data.ksy)
  * [User Name Data](/packets/common/user_name_data.ksy)
  * [User Statistic Data](/packets/common/user_statistic_data.ksy)

seq:
  - id: user_stat_strokes
    type: u4
    doc: Number of strokes (excluding putts) made during the match.
  - id: user_stat_putts
    type: u4
    doc: Number of putts made during the match.
  - id: unknown_user_course_result_data_c
    size: 4
    doc: Always 0?
  - id: unknown_user_course_result_data_d_delta
    type: u4
    doc: Changes unknown_userdata_d in GSS-0045.
  - id: user_stat_longest_drive
    type: f4
    doc: User's longest drive of the match.
  - id: unknown_user_course_result_data_f
    type: u4
  - id: unknown_user_course_result_data_g
    size: 8
  - id: user_stat_distance
    type: u4
    doc: User's total distance travelled in the match. Calculated as the sum of floors of the straight-line distance between initial and final resting positions of the comet.
  - id: user_stat_holes_played
    type: u4
    doc: Unconfirmed. Increments by 1 per hole played.
  - id: unknown_user_course_result_data_j
    size: 8
    doc: Always 0?
  - id: unknown_user_course_result_data_s
    type: u2
  - id: unknown_user_course_result_data_k
    type: u4
  - id: unknown_user_course_result_data_l
    type: u4
  - id: user_stat_holes_completed
    type: u4
    doc: Unconfirmed. Increments by 1 per hole completed. Battle matches can result in failing to hole out, for example, resulting in this number not incrementing.
  - id: user_stat_holes_completed_by_putting
    type: u4
    doc: Unconfirmed. Increments by 1 per hole completed by putting. Chip-ins result in this number not incrementing.
  - id: user_stat_longest_putt
    type: f4
    doc: User's longest successful putt of the match. 0 if no successful putts.
  - id: user_stat_longest_chip
    type: f4
    doc: User's longest successful chip-in of the match. 0 if no successful chip-ins.
  - id: unknown_user_course_result_data_q
    type: s4
    doc: 0xFFFFFFFF (-1) in VS matches and per-hole in tournaments, small positive values at end of tournaments.
  - id: unknown_user_course_result_data_r
    size: 161
    doc: Always 0?
