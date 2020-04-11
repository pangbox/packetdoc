#pragma.examples gameservice/client 003c
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_003c_note_send
  title: GameService Client Note Send
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This sends a note to another user, which costs 10 pang to do.
  
  The response is [Gameservice Server 0x0095 Money Update](/packets/gameservice/server/0095.ksy), to update
  the player's amount of money.

seq:
  - id: subtype
    type: u2
    doc: Appears to correspond with the subtype on [Gameservice Server 0x0095 Money Update](/packets/gameservice/server/0095.ksy).
  - id: user_id
    type: u4
    doc: Recipient's user ID.
  - id: message_body
    type: pstring
  - id: unknown_a
    size: 1
    doc: Possibly padding?
