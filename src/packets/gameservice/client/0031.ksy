#pragma.examples gameservice/client 0031
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0031_hole_statistics_submit
  title: GameService Client Hole Statistics Submit
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring
    - ../../common/user_course_result_data

doc: |
  This packet is sent at the end of most (all?) holes to report the user's statistics for that particular match up until that point.
  
  There is no response.
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_HOLE_COMPLETE`
  * `eantoniobr/UGPangya`: `PLAYER_HOLE_COMPLETE`
  
  **See Also:**
  * [GameService Client 0x0006 Match Statistics Submit](/packets/gameservice/client/0006.ksy).
  * [GameService Client 0x00AA Match Statistics Submit (Tiki Report)](/packets/gameservice/client/00aa.ksy).

seq:
  - id: user_course_result_data
    type: user_course_result_data
    doc: More details can be found in type definition file. Data is cumulative of match up until this point.
