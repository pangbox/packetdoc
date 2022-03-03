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
    type: caddie
    repeat: expr
    repeat-expr: caddie_count_b

types:
  caddie:
    seq:
      - id: roster_slot_caddie
        type: u4
      - id: item_id_caddie
        type: u4
        doc: From pangya_xx.iff/Caddie.iff
      - id: unknown_a
        size: 4
        doc: All 0x00.
      - id: unknown_b
        type: u1
      - id: unknown_c
        type: u4
        doc: Increments over gameplay. Might be some sort of XP amount?
      - id: unknown_d
        size: 8
        doc: All 0x00.
