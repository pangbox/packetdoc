#pragma.examples gameservice/client 0029
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0029_room_invite_send
  title: GameService Client Room Invite Send
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is an invitation to another player to join a particular gameroom.
  
  It is sent in tandem with [GameService Client 0x00BA Room Invite Send](/packets/gameservice/server/00ba.ksy).
  
  The response is [GameService Server 0x0130 Room Invite Send Response](/packets/gameservice/server/0130.ksy).

seq:
  - id: user_id_invitee
    type: u4
