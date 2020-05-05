#pragma.examples gameservice/client 0145
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0145_mail_send
  title: GameService Client Mail Send
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet sends a letter to the mailbox of another user at the cost of 100 pang.
  Attachments can be added at a cost of 500 pang each, with a 100 pang discount for the first.
  
  The response is [GameService Server 0x0213 Mail Send Response](/packets/gameservice/server/0213.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_SEND_MAIL`

seq:
  - id: local_user_id
    type: u4
    doc: Sender's user ID
  - id: remote_user_id
    type: u4
    doc: Recipient's user ID
  - id: remote_user_name
    type: pstring
    doc: Recipient's user name
  - id: unknown_a
    size: 2
    doc: Possibly padding?
  - id: mail_body
    type: pstring
    doc: The body of the message.
  - id: mail_cost
    type: u4
    doc: The pang cost to send this message.
  - id: unknown_b
    size: 4
  - id: unknown_c
    size: 1
  - id: inventory_id
    type: u4
    doc: Inventory ID of first attached item.
  - id: item_id
    type: u4
    doc: From pangya_xx.iff/Item.iff. Item ID of first attached item.
  - id: unknown_d
    size: 47
