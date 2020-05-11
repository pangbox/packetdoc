#pragma.examples gameservice/server 0065
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0065_room_resync_unknown
  title: GameService Server Room Resync Unknown
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet has an unknown purpose.
  
  It is one of the responses to [GameService Client 0x001C Room Resync](/packets/gameservice/client/001c.ksy).

seq:
  - id: connection_id
    type: s4
    doc: Only appears in battle mode. Connection ID of the winner of the hole. -1 (0xFFFFFFFF) if tied.
