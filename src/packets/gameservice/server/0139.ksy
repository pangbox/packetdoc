#pragma.examples gameservice/server 0139
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0139_locker_deposit_item_response_a
  title: GameService Server Locker Deposit Item Response A
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains the user's all-time course records as shown in the User Info screen.

  This is one of the responses to [GameService Client 0x00CE Locker Deposit Item](/packets/gameservice/client/00ce.ksy).

seq:
  - id: unknown_a
    size: 2
    doc: All 0x00.
