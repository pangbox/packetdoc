#pragma.examples gameservice/server 0096
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0096_unknown_cookies_related_response
  title: GameService Server 0096 Unknown Response (Cookies Related)
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This is the response to [GameService Client 0x003D Unknown Cookies Related](/packets/gameservice/client/003d.ksy).

seq:
  - id: unknown_a
    size: 8
