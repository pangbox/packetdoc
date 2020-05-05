#pragma.examples gameservice/client 0154
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0154_quest_dismiss
  title: GameService Client Quest Dismiss
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet dismisses all incomplete quests.
  
  Its responses are:
  * [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy), and
  * [GameService Server 0x0228 Quest Dismiss Response](/packets/gameservice/server/0227.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_GIVEUP_DAILY_QUEST`

seq:
  - id: quest_count
    type: u4
  - id: quest_status_slot
    type: u4
    repeat: expr
    repeat-expr: quest_count
