#pragma.examples gameservice/server 0071
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0071_user_caddie_roster
  title: GameService Server User Caddie Roster
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring
    - ../../common/user_caddie_data

doc: |
  This packet contains the caddie roster for the user.
  
  It is one of the responses to [GameService Client 0x0002 Hello / Login](/packets/gameservice/client/0002.ksy).

seq:
  - id: caddie_count_a
    type: u2
    doc: Unconfirmed. Max be count or max.
  - id: caddie_count_b
    type: u2
    doc: Unconfirmed. May be count or max.
  - id: caddies
    type: user_caddie_data
    repeat: expr
    repeat-expr: caddie_count_b
