#pragma.examples gameservice/server 0063
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0063_shot_active_user_announce
  title: GameService Server Shot Active User Announce
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet announces which user is currently up to play.
  
  As with all other shot announce packets, it is not relayed during tournaments/simultaneous play.
  
  The response (from the appropriate client) is [GameService Client 0x0022 Shot Active User Acknowledge](/packets/gameservice/client/0022.ksy).

seq:
  - id: connection_id
    type: u4
    doc: The user's connection ID who is up.
