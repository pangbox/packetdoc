#pragma.examples gameservice/server 00a1
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_00a1_user_status_response
  title: GameService Server User Status Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet (presumably) returns the status of the user requested.
  
  This is a response to [GameServer Client 0x0007 User Status Request](/packets/gameservice/client/0007.ksy).

seq:
  - id: unknown_a
    type: u1
    doc: Known examples show 2 (0x02).
