#pragma.examples gameservice/server 0172
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0172_locker_pang_balance
  title: GameService Server Locker Pang Balance
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains the user's current pang balance within the locker.

  This is the response to [GameService Client 0x00D5 Locker Pang Balance Request](/packets/gameservice/client/00d5.ksy),
  and one of the responses to [GameService Client 0x00D4 Locker Change Pang](/packets/gameservice/client/00d4.ksy).

seq:
  - id: pang_balance
    type: u4
  - id: unknown_a
    size: 4
    doc: All 0x00.
