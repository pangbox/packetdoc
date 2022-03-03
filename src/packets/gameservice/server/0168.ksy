#pragma.examples gameservice/server 006b
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0168_user_information
  title: GameService Server User Information
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring
    - ../../common/user_character_data

doc: |
  This packet includes a large amount of information about the local user. It's possible that, since the other
  response is My Room related, this packet might exist to help render the user in the My Room environment.
  
  It is one of the responses to [GameService Client 0x00B7 Open Inventory B](/packets/gameservice/client/00b7.ksy).

seq:
  - id: connection_id
    type: u4
  - id: user_nickname
    type: strz
    size: 43
  - id: unknown_a
    size: 13
  - id: user_background
    type: u4
    doc: From pangya_xx.iff/Skin.iff. Background image for portrait card.
  - id: unknown_i
    size: 4
  - id: user_skin
    type: u4
    doc: From pangya_xx.iff/Skin.iff.
  - id: unknown_b
    size: 21
  - id: guild_emblem_id
    type: strz
    size: 13
  - id: user_id
    type: u4
  - id: unknown_c
    size: 10
  - id: unknown_id_a
    type: u4
    doc: Some sort of ID?
  - id: unknown_id_b
    type: u4
    doc: Some sort of ID?
  - id: unknown_id_c
    type: u4
    doc: Some sort of ID?
  - id: unknown_d
    size: 78
  - id: username_atnt
    type: strz
    size: 128
  - id: unknown_e
    size: 8
  - id: user_character
    type: user_character_data
