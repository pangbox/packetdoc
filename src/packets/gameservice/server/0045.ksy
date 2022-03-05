#pragma.examples gameservice/server 0045
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0045_user_statistics
  title: GameService Server User Statistics
  encoding: ASCII
  endian: le
  imports:
    - ../../common/id_bank
    - ../../common/pstring
    - ../../common/user_course_record_data
    - ../../common/user_statistic_data
    - ../../common/user_statistic_data_ext

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
  - id: user_statistics_ext
    type: user_statistic_data_ext
    doc: More details can be found in type definition file.
  - id: course_stat_slots
    doc: 12 extra data slots. Typically used in response to GSC-0006 only.
    type: course_stat_slot
    repeat: expr
    repeat-expr: 12

types:
  course_stat_slot:
    seq:
      - id: course_id
        doc: From pangya_xx.iff/Course.iff. Course for match just played. 0xFF (-1) if empty/unused.
        enum: id_bank::course_id
        type: s1
      - id: user_course_record_data
        type: user_course_record_data
        if: course_id != id_bank::course_id::empty
        doc: Present only if `course_id` is not 0xFF (-1).
