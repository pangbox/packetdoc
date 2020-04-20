#pragma.examples gameservice/server 015e
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_015e_user_information_equipment
  title: GameService Server User Information Equipment
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet details a user's equipment.

  This is one of the responses to [GameService Client 0x002F User Information Request](/packets/gameservice/client/002f.ksy).

seq:
  - id: user_id
    type: u4
  - id: character_id
    type: u4
    doc: From pangya_xx.iff/Character.iff.
  - id: unknown_a
    type: u4
  - id: unknown_b
    type: u2
  - id: unknown_c
    type: u2
  - id: equipment_id
    type: u4
    doc: From pangya_xx.iff/Part.iff. Corresponds with inventory_slot. 24 IDs in series.
    repeat: expr
    repeat-expr: 24
  - id: inventory_slot
    type: u4
    doc: Corresponds with equipment_id. 24 slots in series.
  - id: unknown_d
    size: 216
    doc: All 0x00.
  - id: unknown_e
    type: u4
    doc: ID of some kind? 0x70- range.
  - id: unknown_f
    type: u4
    doc: ID of some kind? 0x70- range.
  - id: unknown_g
    size: 12
    doc: All 0x00.
  - id: inventory_slot_h
    type: u4
  - id: unknown_i
    size: 12
    doc: All 0x00.
  - id: unknown_j
    size: 9
    doc: Non-zero in most cases.
  - id: card_id
    type: u4
    repeat: expr
    repeat-expr: 10
    doc: From pangya_xx.iff/Card.iff. 10 IDs in series. Equipped cards?
  - id: unknown_k
    size: 8
    doc: All 0x00.
