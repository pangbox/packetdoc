#pragma.examples gameservice/client 0108
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0108_guild_list_request
  title: GameService Client Guild List Request
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet requests a page from the guild directory.
  
  The response is [Gameservice Server 0x01BC Guild List](/packets/gameservice/server/01bc.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_GUILD_LIST`
  * `eantoniobr/UGPangya`: `PLAYER_CALL_GUILD_LIST`

seq:
  - id: page_number
    type: u4
    doc: Counts from 1. Response will contain largest valid page number.
