#pragma.examples gameservice/server 0250
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0250_event_mode_join_response
  title: GameService Server Event Mode Join Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges a user has entered Grand Prix event mode.
  
  It is a response to [GameService Client 0x0176 Event Mode Join](/packets/gameservice/client/0176.ksy).

seq:
  - id: unknown_a
    type: u4
  - id: unknown_b
    type: u4
  - id: unknown_c
    type: u4
  - id: unknown_d
    type: u4
  - id: unknown_e
    type: u4
  - id: entry_count
    type: u4
  - id: unknown_f
    type: u4
  - id: entries
    type: entry
    repeat: expr
    repeat-expr: entry_count

types:
  entry:
    seq:
      - id: unknown_g
        type: u4
      - id: unknown_id
        type: u4
        doc: Perhaps some sort of ID?
