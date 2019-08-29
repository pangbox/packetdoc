#pragma.examples gameservice/server 006b
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_006b_equipment_response
  title: GameService Server Equipment Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges changes to equipment from
  GameService Client 0x0020 Equipment Update. (TODO: Add link.)

seq:
  - id: unknown_a
    size: 1
  - id: subtype
    type: u1
  - id: payload
    type:
      switch-on: subtype
      cases:
        0x00: equipment_response_00_character
        0x01: equipment_response_01_unknown
        0x02: equipment_response_02_consumables
        0x03: equipment_response_03_comet
        0x04: equipment_response_04_card_decoration
        0x05: equipment_response_05_unknown
        0x08: equipment_response_08_unknown
        0x09: equipment_response_09_unknown

types:
  equipment_response_00_character:
    doc: This is the equipped character and clothing.
    seq:
      - id: character_id
        type: u4
        doc: From pangya_xx.iff/Character.iff
      - id: unknown_e
        size: 4
        doc: Same as 05_unknown?
      - id: unknown_h
        size: 4
      - id: clothing_id
        type: u4
        doc: From pangya_xx.iff/Part.iff. Equipped clothing, in order of Hat, Mask, Shirt, Gloves, Pants, Shoes.
        repeat: expr
        repeat-expr: 6
      - id: unknown_i
        size: 72
        doc: Likely padding, reserved for future clothing slots.
      - id: inventory_slot
        type: u4
        repeat: expr
        repeat-expr: 6
        doc: From Server 0x0073. Same order as clothing_id. 0 = no slot (placeholder item)
      - id: unknown_j
        size: 381
  equipment_response_01_unknown:
    seq:
      - id: unknown_b
        size: 4
  equipment_response_02_consumables:
    doc: These are the 8-10 items available for use in matches.
    seq:
      - id: item_id
        type: u4
        repeat: expr
        repeat-expr: 10
        doc: 0 if no item is equipped in a given slot.
  equipment_response_03_comet:
    doc: This is the equipped comet (ball).
    seq:
      - id: ball_id
        type: u4
        doc: From pangya_xx.iff/Ball.iff
      - id: inventory_slot
        type: u4
        doc: From Server 0x0073.
  equipment_response_04_card_decoration:
    doc: |
      This is the decoration on the gamercard that appears in the user profile
      and on inter-hole tournament standings screens.
    seq:
      - id: card_background_id
        type: u4
        doc: From pangya_xx.iff/Skin.iff.
      - id: unknown_1
        size: 4
      - id: card_sticker_id
        type: u4
        doc: From pangya_xx.iff/Skin.iff.
      - id: unknown_2
        size: 12
  equipment_response_05_unknown:
    seq:
      - id: unknown_e
        size: 4
  equipment_response_08_unknown:
    seq:
      - id: unknown_f
        size: 62
  equipment_response_09_unknown:
    seq:
      - id: unknown_g
        size: 20
