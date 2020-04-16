#pragma.examples gameservice/server 027d
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_027d_unknown_cookies_related_response
  title: GameService Server 027d Unknown Response (Cookies Related)
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This is the response to [GameService Client 0x0195 Unknown Cookies Related](/packets/gameservice/client/0195.ksy).

seq:
  - id: unknown_a
    size: 4
