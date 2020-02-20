#pragma.examples gameservice/client 002f
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_002f_user_information_request
  title: GameService Client User Information Request
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet requests information on a user.
  
  The response for type $00 is Gameservice Server 0x0158 Unknown (to do.)
  
  The response for type $05 is [Gameservice Server 0x0157 Room Information Response](/packets/gameservice/server/0157.ksy).
  
seq:
  - id: user_id
    type: u4
    doc: ID of target.
  - id: request_type
    type: u1
    doc: Only $00 and $05 witnessed.
