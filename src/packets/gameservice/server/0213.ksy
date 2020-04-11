#pragma.examples gameservice/server 0213
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0213_mail_send_response
  title: GameService Server Mail Send Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges mail being sent by the client.
  
  This is a response to [GameService Client 0x0145 Mail Send](/packets/gameservice/client/0145.ksy).

seq:
  - id: unknown_status
    type: u4
    doc: Possibly an status or error code. Only example shows 0, presumably success. (0x00000000)
