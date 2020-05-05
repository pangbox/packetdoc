#pragma.examples gameservice/client 0151
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0151_quest_status_request
  title: GameService Client Quest Status Request
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet requests the user's active quests.
  
  It has no payload.
  
  Its responses are:
  * [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy), and
  * [GameService Server 0x0225 Quest Status Response](/packets/gameservice/server/0225.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_REQUEST_DAILY_QUEST`
  * `eantoniobr/UGPangya`: `PLAYER_LOAD_QUEST`
