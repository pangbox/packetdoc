#pragma.examples gameservice/client 0109
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0109_guild_search_request
  title: GameService Client Guild Search Request
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet requests a list of all guilds containing the search query from the guild directory.
  
  The response is [Gameservice Server 0x01BD Guild Search Response](/packets/gameservice/server/01bd.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_GUILD_LIST_SEARCH`
  * `eantoniobr/UGPangya`: `PLAYER_SEARCH_GUILD`

seq:
  - id: page_number
    type: u4
    doc: Counts from 1.
  - id: search_term
    type: pstring
