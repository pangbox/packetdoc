#pragma.examples gameservice/server 0199
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0199_room_resync_user_finish
  title: GameService Server 0199 Room Resync User Finish
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet denotes that the player who most recent shot holed-out on the last hole of the match.
  
  It has no payload.
  
  Its one of the responses to [GameService Client 0x001C Room Resync](/packets/gameservice/client/001c.ksy).
