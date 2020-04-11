#pragma.examples gameservice/client 00cd
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_00cd_locker_deposit_item
  title: GameService Client Locker Deposit Item
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is used to add an item to the locker.
  
  Insufficient packets were (as of yet) captured to attempt proper documentation.
  
  The response is [GameService Server 0x016D Locker Deposit Item Response](/packets/gameservice/server/016d.ksy).

seq:
  - id: unknown_a
    size: 6
