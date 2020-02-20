#pragma.examples gameservice/client 0144
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0144_mail_read_request
  title: GameService Client Mail Read Request
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet requests the contents of a piece of mail.
  
  The response is [Gameservice Server 0x0212 Mail Read Response](/packets/gameservice/server/0212.ksy).
  
seq:
  - id: mail_id
    type: u4
    doc: From [Gameservice Server 0x0211 Mailbox Response](/packets/gameservice/server/0211.ksy).
