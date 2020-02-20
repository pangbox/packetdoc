#pragma.examples gameservice/client 0143
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0143_mailbox_request
  title: GameService Client Mailbox Request
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet requests a listing of mail from a page in the user's mailbox.
  
  The response is [Gameservice Server 0x0211 Mailbox Response](/packets/gameservice/server/0211.ksy).
  
seq:
  - id: page_number
    type: u4
    doc: Counts from 1. Response will contain largest valid page number.
