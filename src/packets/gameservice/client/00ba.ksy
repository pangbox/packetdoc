#pragma.examples gameservice/client 00ba
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_00ba_room_invite_send
  title: GameService Client Room Invite Send
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is an invitation to another player to join a particular gameroom.
  
  It is sent in tandem with [GameService Client 0x0029 Room Invite Send](/packets/gameservice/server/0029.ksy).
  
  The responses are:
  * [GameService Server 0x0083 Room Invite](/packets/gameservice/server/0083.ksy) (to the invitee), and
  * [GameService Server 0x012F Room Invite Send Response](/packets/gameservice/server/012f.ksy) (to the inviter).

seq:
  - id: user_nickname_invitee
    type: pstring
  - id: user_id_invitee
    type: u4
