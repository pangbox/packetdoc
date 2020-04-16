#pragma.examples gameservice/server 0058
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0058_shot_power_announce
  title: GameService Server Shot Power Announce
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet relays the user's power use to all players.
  
  As with all other shot announce packets, it is not relayed during tournaments/simultaneous play.
  
  This is the response to [GameService Client 0x0015 Shot Power](/packets/gameservice/client/0015.ksy).

seq:
  - id: connection_id
    type: u4
    doc: The user's connection ID who has rotated their shot.
  - id: power_level
    type: u1
    doc: 0x01 for a power shot, and 0x02 for a double power shot. 0x00 is used if power has been set and user reverts to a standard shot.
