#pragma.examples gameservice/client 0157
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0157_achievement_status_request
  title: GameService Client Achievement Status Request
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet requests the user's current progress for all achievements. This is most often called for the local user,
  but can be called for other users as well.
  
  The responses are:
  * [GameService Server 0x022D Achievement Status Response](/packets/gameservice/server/022d.ksy), and
  * [GameService Server 0x022C Unknown Achievement-Related Response](/packets/gameservice/server/022c.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_REQUEST_ACHIEVEMENTS`
  * `eantoniobr/UGPangya`: `PLAYER_CALL_ACHIEVEMENT`

seq:
  - id: user_id
    type: u4
    doc: Target user's ID.
