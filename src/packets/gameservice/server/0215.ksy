#pragma.examples gameservice/server 0215
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0215_mail_delete_response
  title: GameService Server Mail Delete Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains a page of the user's mailbox to display after the user has deleted a message. It is identical to
  [GameService Server 0x0211 Mailbox Response](/packets/gameservice/server/0211.ksy).
  
  This packet is a response to [Gameservice Client 0x0147 Mail Delete](/packets/gameservice/client/0147.ksy).

seq:
  - id: unknown_d
    size: 4
  - id: page_number
    type: u4
    doc: Page number requested from the Mailbox.
  - id: page_number_max
    type: u4
    doc: Unconfirmed. Total page count in Mailbox.
  - id: mail_count
    type: u2
  - id: mails
    type: mail
    repeat: expr
    repeat-expr: mail_count

types:
  mail:
    seq:
      - id: mail_id
        type: u4
      - id: mail_sender_user_nickname
        type: strz
        size: 135
      - id: mail_attachment_count
        type: u4
      - id: mail_attachments
        if: mail_attachment_count != 0
        type: mail_attachment
  mail_attachment:
    doc: At most 1 attachment will be listed in the mailbox. Identical to [GameService Server 0x0212 Mail Read Response](/packets/gameservice/server/0212.ksy).
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
