#pragma.examples gameservice/server 015c
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_015c_user_course_records_response
  title: GameService Server User Course Records Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring
    - ../../common/user_course_record_data

doc: |
  This packet contains the user's all-time course records as shown in the User Info screen.

  This is one of the responses to [GameService Client 0x002F User Information Request](/packets/gameservice/client/002f.ksy).

seq:
  - id: request_type
    type: u1
    enum: request_type
    doc: Total/Season matches request packet.
  - id: user_id
    type: u4
    doc: Matches request packet.
  - id: user_course_record_count_standard
    type: u4
  - id: user_course_record_data_standard
    type: user_course_record_data
    repeat: expr
    repeat-expr: user_course_record_count_standard
    doc: Standard records.
  - id: user_course_record_count_assist
    type: u4
  - id: user_course_record_data_assist
    type: user_course_record_data
    repeat: expr
    repeat-expr: user_course_record_count_assist
    doc: Assist-mode records.

enums:
  request_type:
    0x00: total_original
    0x05: season_original
    0x0a: total_natural
    0x0b: total_grand_prix
    0x33: season_natural
    0x34: season_grand_prix
