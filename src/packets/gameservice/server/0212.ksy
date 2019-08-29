#pragma.examples gameservice/server 0212
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0212_mail_read_response
  title: GameService Server Mail Read Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains the contents of a piece of mail.
  
  This packet is a response to
  GameService Client 0x0144 Mail Read Request (TODO: Add link.)
  
  **See Also**:
  [GameService Server 0x0211 Mailbox Response](/packets/gameservice/server/0211.ksy)

seq:
  - id: unknown_d
    size: 4
  - id: mail_id
    type: u4
  - id: mail_sender_user_nickname
    type: pstring
  - id: mail_date
    type: pstring
    doc: Formatted as 'YYYY-MM-DD hh:ii:ss'
  - id: mail_body
    type: pstring
  - id: unknown_e
    size: 1
  - id: mail_attachment_count
    type: u4
  - id: mail_attachments
    type: mail_attachment
    repeat: expr
    repeat-expr: mail_attachment_count

types:
  mail_attachment:
    doc: Identical to Server 0x0211.
    seq:
      - id: unknown_a
        size: 4
      - id: item_id
        type: u4
      - id: unknown_b
        size: 1
      - id: item_quantity
        type: u4
      - id: unknown_c
        size: 42
