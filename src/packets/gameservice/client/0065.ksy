#pragma.examples gameservice/client 0065
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0065_time_booster_activate
  title: GameService Client Time Booster Activate
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet activates a time booster / fast forward.
  
  The response is:
  * [GameService Server 0x00C7 Time Booster Announce](/packets/gameservice/server/00c7.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_FAST_FORWARD`
  * `eantoniobr/UGPangya`: `PLAYER_USE_TIMEBOOSTER`

seq:
  - id: item_id
    type: u4
    doc: From pangya_xx.iff/Item.iff. Item ID for the Time Booster used.
