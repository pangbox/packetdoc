#pragma.examples gameservice/server 0095
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0095_update_money
  title: GameService Server Update Money
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  Subtype 0x0102 appears for an unknown reason after every [GameService Client 0x0004 Sub-server Connect](/packets/gameservice/client/0004.ksy).
  
  Subtype 0x0111 updates the player's pang amount after sending [GameService Client 0x003c Send Note](/packets/gameservice/client/003c.ksy).
  
seq:
  - id: subtype
    type: u2
  - id: payload
    type:
      switch-on: subtype
      cases:
        0x0102: update_money_0102_unknown
        0x0111: update_money_0111_update_money

types:
  update_money_0102_unknown:
    seq:
      - id: unknown_b
        size: 1
  update_money_0111_update_money:
    seq:
      - id: unknown_c
        size: 4
      - id: pang_amount
        type: u4
        doc: Player's new pang balance.
      - id: unknown_d
        size: 4
