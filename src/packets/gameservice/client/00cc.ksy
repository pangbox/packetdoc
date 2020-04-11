#pragma.examples gameservice/client 00cc
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_00cc_locker_combination_attempt
  title: GameService Client Locker Combination Attempt
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains a locker combination attempt.
  
  The response is [Gameservice Server 0x016C Locker Combination Response](/packets/gameservice/server/016c.ksy).

seq:
  - id: locker_combination
    type: pstring
    doc: e.g. "1234".
