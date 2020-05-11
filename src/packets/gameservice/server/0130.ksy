#pragma.examples gameservice/server 0130
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0130_room_invite_send_response
  title: GameService Server Room Invite Send Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges an invitation has been sent.
  
  This is the response to [GameService Client 0x0029 Room Invite Send](/packets/gameservice/client/0029.ksy).

seq:
  - id: user_id_invitee
    type: u4
