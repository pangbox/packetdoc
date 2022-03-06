#pragma.examples gameservice/server 012a
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_012a_tiki_report_use_response
  title: GameService Server Tiki Report Use Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges the use of a Tiki Report.
  
  It is a response to:
  * [GameService Client 0x00AA Match Statistics Submit (Tiki Report)](/packets/gameservice/client/00aa.ksy).

seq:
  - id: unknown_gss012a
    size: 4
    doc: All 0x00?
