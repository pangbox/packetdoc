#pragma.examples gameservice/server 0048
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0048_room_census
  title: GameService Server Room Census
  encoding: ASCII
  endian: le
  imports:
    - ../../common/id_bank
    - ../../common/pstring
    - ../../common/user_character_data

doc: |
  This packet maintains the list of all users in the currently joined room.
  
  This is a response to any user sending:
  * [Gameservice Client 0x0008 Room Create](/packets/gameservice/client/0008.ksy),
  * [Gameservice Client 0x0009 Room Join](/packets/gameservice/client/0009.ksy), and
  * [Gameservice Client 0x000F Room Leave](/packets/gameservice/client/000f.ksy).

seq:
  - id: list_type
    type: u1
    enum: list_type
  - id: unknown_a
    type: s2
    doc: All examples show -1 (0xFFFF).
  - id: list
    type:
      switch-on: list_type
      cases:
        list_type::list_initial: census_initial
        list_type::list_additions: census_addition
        list_type::list_removals: census_removal
        list_type::list_modifications: census_modification
        list_type::list_lounge_initial: census_lounge_initial

types:
  census_initial:
    seq:
      - id: user_count
        type: u1
      - id: users_initial
        type: user
        repeat: expr
        repeat-expr: user_count
      - id: user_additional_initial
        type: user_character_data
        doc: Is either 1 byte (0x00) or 513 bytes long.
  census_addition:
    seq:
      - id: user_addition
        type: user
      - id: user_additional_addition
        type: user_character_data
        doc: Is either 0 bytes or 513 bytes long.
  census_removal:
    seq:
      - id: connection_id_removal
        type: u4
        doc: Connection ID of the user to remove.
  census_modification:
    seq:
      - id: connection_id_modification
        type: u4
        doc: Connection ID of the user to modify. Note - not an error, it does appear twice in a row.
      - id: user_modification
        type: user
  census_lounge_initial:
    doc: |
      Unlike type 0x00 census_initial, a type 0x07 is sent for each user in a lounge, with only their record contained therein.
    seq:
      - id: user_count_lounge
        type: u1
        doc: As all type 0x07s are individual records, this value is trivial, not structural.
      - id: user_lounge
        type: user
      - id: user_additional_lounge
        type: user_character_data
        doc: Is always present at 513 bytes.
  user:
    seq:
      - id: connection_id
        type: u4
        doc: Connection ID of the relevant user.
      - id: user_nickname
        type: strz
        size: 22
        doc: Nickname of the relevant user.
      - id: guild_name
        type: strz
        size: 21
        doc: Guild name to which the relevant user belongs.
      - id: room_user_slot
        type: u1
        doc: Every user in the room has a unique slot number, from 1 to the user_max.
      - id: unknown_c
        size: 4
        doc: All 0x00.
      - id: item_id_title
        type: u4
        doc: From pangya_xx.iff/Skin.iff. ID of the custom title badge.
      - id: item_id_character
        type: u4
        doc: From pangya_xx.iff/Character.iff. ID of the character used.
      - id: item_id_portrait_background
        type: u4
        doc: From pangya_xx.iff/Skin.iff. ID of the portrait background. 0 if unused.
      - id: item_id_portrait_frame
        type: u4
        doc: From pangya_xx.iff/Skin.iff. ID of the portrait frame. 0 if unused.
      - id: item_id_portrait_sticker
        type: u4
        doc: From pangya_xx.iff/Skin.iff. ID of the portrait sticker. 0 if unused.
      - id: item_id_portrait_slot
        type: u4
        doc: From pangya_xx.iff/Skin.iff. ID of the portrait slot. 0 if unused.
      - id: unknown_d
        size: 4
        doc: All 0x00.
      - id: item_id_title_b
        type: u4
        doc: Duplicate of item_id_title
      - id: unknown_e
        size: 2
      - id: user_rank
        type: u1
        doc: Unconfirmed. From 0x00 ('Rookie F') through 0x46 ('Infinity Legend I').
        enum: id_bank::rank
      - id: unknown_f
        type: u1
        doc: All examples either 0 (0x00) or 40 (0x28).
      - id: unknown_g
        type: u1
        doc: All examples 10 (0x0A).
      - id: unknown_h
        size: 4
      - id: guild_emblem_id
        type: strz
        size: 12
        doc: If missing, 'guildmark'.
      - id: unknown_k
        type: u1
      - id: user_id
        type: u4
      - id: unknown_l
        size: 4
        doc: All 0x00.
      - id: unknown_m
        size: 2
        doc: Always C7,0A.
      - id: unknown_n
        type: u4
        doc: All examples either 0 (0x00000000) or 1 (0x00000001).
      - id: unknown_o
        type: f4
      - id: unknown_p
        type: f4
      - id: unknown_q
        type: f4
      - id: unknown_z
        type: u4
        doc: Seen 0-2.
      - id: garbage_r
        size: 64
        doc: Likely garbage data; contains local user's data.
      - id: item_id_mascot
        type: u4
        doc: From pangya_xx.iff/Mascot.iff. ID for user's mascot.
        enum: id_bank::item_id_mascot
      - id: username_atnt
        type: strz
        size: 128
      - id: unknown_s
        size: 4
      - id: unknown_t
        type: u4
        doc: All examples 66 (0x00000042).

enums:
  list_type:
    0x00: list_initial
    0x01: list_additions
    0x02: list_removals
    0x03: list_modifications
    0x07: list_lounge_initial
