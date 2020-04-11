#pragma.examples gameservice/server 00e7
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_00e7_user_shop_leave_response
  title: GameService Server User Shop Leave Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges a user has stopped browsing a shop.
  
  It is the response to [GameService Client 0x0078 User Shop Leave](/packets/gameservice/client/0078.ksy).

seq:
  - id: unknown_a
    type: u4
    doc: All examples show 1 (0x00000001)
