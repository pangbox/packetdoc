#pragma.examples gameservice/server 0214
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0214_mail_take_attachments_response
  title: GameService Server Mail Take Attachments Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is always and only issued after a [Gameservice Client 0x0146 Mail Take Attachments](/packets/gameservice/client/0143.ksy).
  It might be an acknowledgement that the attachments have been taken, but it seems odd that it doesn't contain any reference to the
  attachments being taken or the piece of mail whence they came.

seq:
  - id: unknown_a
    type: u4
    doc: Appears to always be 0 (0x00000000). Possibly padding for some reason?
