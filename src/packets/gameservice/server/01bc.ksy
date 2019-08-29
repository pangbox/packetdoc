#pragma.examples gameservice/server 01bc
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_01bc_guild_list
  title: GameService Server Guild List
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains a page of the guild directory.
  
  The number of guilds on a page is set at 15 in PangyaTH.
  
  This packet is a response to
  GameService Client 0x0108 Guild List Request. (TODO: Add link.)

seq:
  - id: unknown_a
    size: 4
  - id: page_number
    type: u4
    doc: Page number requested from the Guild Directory.
  - id: page_number_max
    type: u4
    doc: Unconfirmed. Total page count in Guild Directory.
  - id: guild_count
    type: u2
  - id: guilds
    type: guild
    repeat: expr
    repeat-expr: guild_count

types:
  guild:
    seq:
      - id: unknown_b
        size: 4
      - id: guild_name
        type: strz
        size: 21
      - id: guild_pang_amount
        type: u4
      - id: guild_point_amount
        type: u4
      - id: guild_member_amount
        type: u4
      - id: unknown_c
        size: 16
      - id: guild_description
        type: strz
        size: 105
      - id: guild_leader_user_id
        type: u4
      - id: guild_leader_user_nickname
        type: strz
        size: 22
      - id: guild_emblem_id
        type: strz
        size: 12
        doc: If missing, "GUILDMARK"
