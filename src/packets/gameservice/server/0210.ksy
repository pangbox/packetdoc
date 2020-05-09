#pragma.examples gameservice/server 0210
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0210_mail_unread_list
  title: GameService Server Mail Unread List
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains a list of unread messages in the mailbox.

  This is one of the responses to [GameService Client 0x0002 Hello / Login](/packets/gameservice/client/0002.ksy).

seq:
  - id: unknown_a
    size: 4
    doc: Always 0x00.
  - id: message_count
    type: u2
  - id: messages
    type: message
    repeat: expr
    repeat-expr: message_count

types:
  message:
    seq:
      - id: mail_id
        type: u4
      - id: user_nickname_sender
        type: strz
        size: 128
      - id: unknown_a_message
        size: 5
      - id: attachment_count
        type: u4
      - id: attachments
        type: attachment
        repeat: expr
        repeat-expr: attachment_count
  attachment:
    seq:
      - id: unknown_a_attachment
        type: s4
        doc: All examples -1 (0xFFFFFFFF).
      - id: item_id_attachment
        type: u4
        doc: From pangya_xx.iff/Item.iff
      - id: unknown_b_attachment
        type: u1
      - id: item_quantity_attachment
        type: u4
      - id: unknown_c_attachment
        size: 42
