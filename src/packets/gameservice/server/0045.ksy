#pragma.examples gameservice/server 0045
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0045_user_statistics
  title: GameService Server 0045 User Statistics
  encoding: ASCII
  endian: le
  imports:
    - ../../common/id_bank
    - ../../common/pstring
    - ../../common/user_statistic_data

doc: |
  This packet contains statistics for the current user, which are relayed before and after every match.
  
  This is a response to:
  * [GameService Client 0x0006 Match Statistics Submit](/packets/gameservice/client/0006.ksy),
  * GameService Client 0x000E Game Start,
  * and possibly others.

seq:
  - id: user_statistics
    type: user_statistic_data
    doc: More details can be found in type definition file.
  - id: course_stat_slots
    doc: 12 extra data slots. Typically used in response to GSC-0006 only.
    type: course_stat_slot
    repeat: expr
    repeat-expr: 12

types:
  course_stat_slot:
    seq:
      - id: course_id_a
        doc: From pangya_xx.iff/Course.iff. Course for match just played. 0xFF (-1) if empty/unused.
        enum: id_bank::course_id
        type: s1
      - id: course_stat_data
        type: course_stat_data
        if: course_id_a != id_bank::course_id::empty

  course_stat_data:
    seq:
      - id: course_id_b
        type: s1
        doc: Repetition of course_id
        enum: id_bank::course_id
      - id: course_stat_total_strokes
        type: u4
        doc: User's total strokes on this course, across all matches.
      - id: course_stat_total_putts
        type: u4
        doc: User's total putts on this course, across all matches.
      - id: match_stat_holes
        type: u4
        doc: The number of holes played this match.
      - id: unknown_gss0045_d
        type: u4
      - id: unknown_gss0045_e
        type: u4
      - id: unknown_gss0045_f
        type: u4
      - id: match_stat_total_score
        type: s4
        doc: User's total score in this match.
      - id: course_stat_best_score
        type: s1
        doc: User's best score on this course for a 18-hole match. 0x7F (127) if not set.
      - id: course_stat_best_pang
        type: u4
        doc: User's best pang earnt on this course for a 18-hole match.
      - id: unknown_gss0045_j
        size: 4
        doc: Always 0x00?
      - id: course_stat_best_item_id_character
        enum: id_bank::item_id_character
        type: u4
        doc: From pangya_xx.iff/Character.iff. User's best character on this course for an 18-hole match. 0 if not set.
      - id: unknown_gss0045_k
        type: s1
