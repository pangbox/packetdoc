#pragma.examples gameservice/client 0147
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0147_mail_delete
  title: GameService Client Mail Delete
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet requests a piece of mail be deleted.
  
  The response is [Gameservice Server 0x0215 Mail Delete Response](/packets/gameservice/server/0215.ksy),
  which provides a new mailbox listing to display.

seq:
  - id: unknown_a
    type: u4
    doc: Always seems to be 1 (0x00000001)
  - id: mail_id
    type: u4
    doc: From [Gameservice Server 0x0211 Mailbox Response](/packets/gameservice/server/0211.ksy).
  - id: unknown_b
    type: u4
    doc: Always seems to be 1 (0x00000001)
