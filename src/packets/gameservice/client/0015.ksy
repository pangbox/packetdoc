#pragma.examples gameservice/client 0015
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0015_shot_power
  title: GameService Client Shot Power
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet relays if the user will use extra power, and how much.
  
  The response is [GameService Server 0x0058 Shot Power Announce](/packets/gameservice/server/0058.ksy).
  
seq:
  - id: power_level
    type: u1
    doc: 0x01 for a power shot, and 0x02 for a double power shot. 0x00 is used if power has been set and user reverts to a standard shot.
