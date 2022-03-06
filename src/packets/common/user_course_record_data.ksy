---
meta:
  id: user_course_record_data
  title: User Course Record Data
  encoding: ASCII
  endian: le
  imports:
    - id_bank

doc: |
  Oft-recurring format for communicating a user's course records to clients, including:
  * [GameService Server 0x0045 User Statistics](/packets/gameservice/server/0045.ksy)
  * [GameService Server 0x015C User Course Records Response](/packets/gameservice/server/015c.ksy)
  
  Its client-side counterpart is [User Course Result Data](/packets/common/user_course_result_data.ksy).
  
  **See Also**:
  * [User Caddie Data](/packets/common/user_caddie_data.ksy)
  * [User Character Data](/packets/common/user_character_data.ksy)
  * [User Course Record Data](/packets/common/user_course_record_data.ksy)
  * [User Course Result Data](/packets/common/user_course_result_data.ksy)
  * [User Equipment Data](/packets/common/user_equipment_data.ksy)
  * [User Name Data](/packets/common/user_name_data.ksy)
  * [User Statistic Data](/packets/common/user_statistic_data.ksy)

seq:
  - id: course_id
    type: s1
    doc: ID of relevant course
    enum: id_bank::course_id
  - id: course_record_total_strokes
    type: u4
    doc: User's total strokes on this course, across all matches.
  - id: course_record_total_putts
    type: u4
    doc: User's total putts on this course, across all matches.
  - id: match_stat_holes
    type: u4
    doc: The number of holes played this match.
  - id: unknown_user_course_record_d
    type: u4
  - id: unknown_user_course_record_e
    type: u4
  - id: unknown_user_course_record_f
    type: u4
  - id: match_stat_total_score
    type: s4
    doc: User's total score in this match.
  - id: course_record_best_score
    type: s1
    doc: User's best score on this course for a 18-hole match. 0x7F (127) if not set.
  - id: course_record_best_pang
    type: u4
    doc: User's best pang earnt on this course for a 18-hole match.
  - id: unknown_user_course_record_j
    size: 4
    doc: Always 0x00?
  - id: course_record_item_id_character
    enum: id_bank::item_id_character
    type: u4
    doc: From pangya_xx.iff/Character.iff. User's best character on this course for an 18-hole match. 0 if not set.
  - id: unknown_user_course_record_k
    type: s1
