#pragma.examples gameservice/client 00aa
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_00aa_match_statistics_submit_tiki_report
  title: GameService Client Match Statistics Submit (Tiki Report)
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring
    - ../../common/user_course_result_data

doc: |
  This packet is sent when a Tiki Report is used to leave a tournament early to report the user's statistics for that particular match in total.
  
  Behaviourally, it's a combination of [GameService Client 0x0006 Match Statistics Submit](/packets/gameservice/client/0006.ksy), [GameService Client 0x000F Client Room Leave](/packets/gameservice/client/000f.ksy), and simulating an early end to a tournament to trigger any relevant server-originating packets.
  
  The responses are:
  * [GameService Server 0x012A Tiki Report Use Response](/packets/gameservice/server/012a.ksy),
  * [GameService Server 0x0045 User Statistics](/packets/gameservice/server/0045.ksy),
  * [GameService Server 0x004C Room Leave Response](/packets/gameservice/server/004c.ksy), and
  * [Event - Tournament/Match End](/events/match_end.md).
  
  **See Also:**
  * [GameService Client 0x0006 Match Statistics Submit](/packets/gameservice/client/0006.ksy).
  * [GameService Client 0x0031 Hole Statistics Submit](/packets/gameservice/client/0031.ksy).

seq:
  - id: user_course_result_data
    type: user_course_result_data
    doc: More details can be found in type definition file. Data is sum of entire match.
