#pragma.examples gameservice/server 0171
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0171_locker_pang_transact_response
  title: GameService Server Locker Pang Transact Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges a change to the user's pang balance within the locker.

  This is one of the responses to [GameService Client 0x00D4 Locker Pang Transact](/packets/gameservice/client/00d4.ksy).

seq:
  - id: unknown_a
    size: 4
    doc: All 0x00.
