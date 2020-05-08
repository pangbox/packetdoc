#pragma.examples gameservice/server 0214
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0214_mail_attachments_take_response
  title: GameService Server Mail Attachments Take Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges attachments have been taken from a piece of mail.
  
  It is a response to [Gameservice Client 0x0146 Mail Attachments Take](/packets/gameservice/client/0146.ksy).

seq:
  - id: unknown_a
    size: 4
    doc: All 0x00.
