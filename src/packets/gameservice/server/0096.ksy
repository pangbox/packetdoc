#pragma.examples gameservice/server 0096
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0096_cookie_balance
  title: GameService Server 0096 Cookie Balance
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This is the response to [GameService Client 0x0002 Hello](/packets/gameservice/client/0002.ksy)
  and [GameService Client 0x003D Unknown Cookies Related](/packets/gameservice/client/003d.ksy).

seq:
  - id: unknown_a
    size: 8
    doc: One of these longs is the cookie balance, but no examples with a non-zero balance currently are available.
