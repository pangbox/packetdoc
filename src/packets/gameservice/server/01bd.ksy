#pragma.examples gameservice/server 01bd
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_01bd_guild_search_response
  title: GameService Server Guild Search Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains search results from a query against the guild directory.
  
  The number of guilds on a page is set at 15 in PangyaTH.
  
  This packet is a response to [GameService Client 0x0109 Guild Search Request](/packets/gameservice/client/0109.ksy).
  
  **See Also:**
  * [GameService Server 0x01BC Guild List](/packets/gameservice/server/01bc.ksy)

seq:
  - id: unknown_a
    size: 4
  - id: page_number
    type: u4
    doc: Page number requested from the Search Results.
  - id: guild_count_total
    type: u4
    doc: Number of guilds matching the search term in total.
  - id: guild_count
    type: u2
    doc: Number of guilds matching the search term on requested page. Seen maximum of 15 (0x0F).
  - id: guilds
    type: guild
    repeat: expr
    repeat-expr: guild_count

types:
  guild:
    seq:
      - id: unknown_b
        size: 4
        doc: Possibly a guild ID?
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
        doc: If missing, "guildmark".
