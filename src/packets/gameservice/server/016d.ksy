#pragma.examples gameservice/server 016d
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_016d_locker_deposit_item_response
  title: GameService Server Locker Deposit Item Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  Insufficient packets were (as of yet) captured to attempt proper documentation.
  
  This is a response to [GameService Client 0x00CD Locker Deposit Item](/packets/gameservice/client/00cd.ksy).

seq:
  - id: unknown_a
    size: 5
