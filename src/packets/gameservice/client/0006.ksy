#pragma.examples gameservice/client 0006
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0006_match_statistics_submit
  title: GameService Client Match Statistics Submit
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring
    - ../../common/user_course_result_data

doc: |
  This packet is sent at the end of most matches to report the user's statistics for that particular match in total.
  
  It is part of the response to:
  * [Event - Tournament / Match End](/events/match_end.md)
  
  The response is:
  * [GameService Server 0x0045 User Statistics](/packets/gameservice/server/0045.ksy).
  
  **Aliases:**
  * `eantoniobr/UGPangya`: `PLAYER_SEND_GAMERESULT`
  
  **See Also:**
  * [GameService Client 0x0031 Hole Statistics Submit](/packets/gameservice/client/0031.ksy).
  * [GameService Client 0x00AA Match Statistics Submit (Tiki Report)](/packets/gameservice/client/00aa.ksy).

seq:
  - id: user_course_result_data
    type: user_course_result_data
    doc: More details can be found in type definition file. Data is sum of entire match.
