#pragma.examples gameservice/server 012f
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_012f_room_invite_send_response
  title: GameService Server Room Invite Send Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges an invitation has been sent.
  
  This is one of the responses to [GameService Client 0x00BA Room Invite Send](/packets/gameservice/client/00ba.ksy).

seq:
  - id: unknown_a
    size: 2
  - id: server_id
    type: u4
  - id: sub_server_id
    type: u1
  - id: room_id
    type: u2
  - id: user_id_inviter
    type: u4
  - id: user_nickname_inviter
    type: pstring
  - id: user_id_invitee
    type: u4
