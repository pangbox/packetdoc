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
    - ../../common/pangyachar

doc: |
  This packet acknowledges changes to equipment from [GameService Client 0x0020 Equipment Update](/packets/gameservice/client/0020.ksy).

seq:
  - id: unknown_a
    size: 1
  - id: equipment_type
    type: u1
    enum: equipment_type
  - id: equipment_data
    type:
      switch-on: equipment_type
      cases:
        equipment_type::character: pangyachar
        equipment_type::unknown_01: equipment_response_01_unknown
        equipment_type::consumables: equipment_response_02_consumables
        equipment_type::ball: equipment_response_03_comet
        equipment_type::card_decoration: equipment_response_04_card_decoration
        equipment_type::unknown_05: equipment_response_05_unknown
        equipment_type::unknown_08: equipment_response_08_unknown
        equipment_type::unknown_09: equipment_response_09_unknown

types:
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

enums:
  equipment_type:
    0x00: character
    0x01: unknown_01
    0x02: consumables
    0x03: ball
    0x04: card_decoration
    0x05: unknown_05
    0x08: unknown_08
    0x09: unknown_09
