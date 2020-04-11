#pragma.examples gameservice/client 0007
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0007_user_status_request
  title: GameService Client User Status Request
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet requests status information on a specified user.
  
  The response is [GameService Server 0x00A1 User Status Response](/packets/gameservice/server/00a1.ksy).

seq:
  - id: unknown_a
    type: u1
    doc: Known examples show 1 (0x01).
  - id: user_name
    type: pstring
    doc: User's name being requested.
