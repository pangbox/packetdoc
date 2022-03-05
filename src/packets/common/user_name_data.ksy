---
meta:
  id: user_name_data
  title: User Name Data
  encoding: ASCII
  endian: le
  imports:
  - id_bank

doc: |
  Oft-recurring format for communicating a user's display name and guild to clients, including:
  * [Gameservice Server 0x0044 Unknown](/packets/gameservice/server/0044.ksy)
  * [Gameservice Server 0x0157 User Name Response](/packets/gameservice/server/0157.ksy)

  **See Also**:
  * [User Caddie Data](/packets/common/user_caddie_data.ksy)
  * [User Character Data](/packets/common/user_character_data.ksy)
  * [User Course Record Data](/packets/common/user_course_record_data.ksy)
  * [User Equipment Data](/packets/common/user_equipment_data.ksy)
  * [User Name Data](/packets/common/user_name_data.ksy)
  * [User Statistic Data](/packets/common/user_statistic_data.ksy)

seq:
  - id: room_id
    type: u2
    doc: Unconfirmed. 0xFFFF (-1) when not in room.
  - id: username
    type: strz
    size: 22
    doc: User's account name.
  - id: user_nickname
    type: strz
    size: 22
    doc: User's display name.
  - id: guild_name
    type: strz
    size: 21
  - id: guild_emblem_id
    type: strz
    size: 24
    doc: Local user's guild's emblem ID. If present, for instance "13579ace", PNG image is downloaded over HTTP from (PangyaTH) 203.107.140.35:50008/_Files/GuildEmblem/13579ace.png
  - id: connection_id
    type: u4
    doc: Unused in GSS-0157.
  - id: unknown_user_name_data_a
    size: 12
    doc: All 0x00?
  - id: unknown_user_name_data_b
    type: u4
  - id: unknown_user_name_data_c
    size: 4
    doc: All 0x00?
  - id: unknown_user_name_data_d
    type: u2
  - id: unknown_user_name_data_e
    size: 6
    doc: All 0xFF?
  - id: unknown_user_name_data_f
    size: 16
  - id: username_atnt
    type: strz
    size: 128
    doc: |
      Typically the local player's username, appended with "@NT".
      Possibly some sort of email or messaging integration?
      Occasionally this field is empty.
      "faceb###############@NT" also witnessed, suggesting a link to Login-via-Facebook functionality.
  - id: user_id
    type: u4
    doc: Unique ID representing the user.
