#pragma.examples gameservice/server 004b
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_004b_user_equipment_announce
  title: GameService Server User Equipment Change Announce
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet announces changes to a user's loadout to all other users in the same room.
  
  It is the response to [GameService Client 0x000C User Equipment Change](/packets/gameservice/client/000c.ksy).

seq:
  - id: unknown_a
    size: 4
    doc: All 0x00.
  - id: equipment_type
    type: u1
    enum: equipment_type
  - id: connection_id
    type: u4
    doc: The relevant connection ID for the user making changes.
  - id: equipment_payload
    type:
      switch-on: equipment_type
      cases:
        equipment_type::equipped_caddie: change_caddie
        equipment_type::equipped_ball: change_ball
        equipment_type::equipped_clubs: change_clubs
        equipment_type::equipped_04_unknown: change_04_unknown

types:
  change_caddie:
    seq:
      - id: unknown_id_a_caddie
        type: u4
        doc: Caddie ID of unknown origin. Requires further investigation.
      - id: item_id_caddie
        type: u4
        doc: From pangya_xx.iff/Caddie.iff. Item ID of the chosen caddie.
      - id: unknown_b_caddie
        size: 17
  change_ball:
    seq:
      - id: item_id_ball
        type: u4
        doc: From pangya_xx.iff/Ball.iff. Item ID of the chosen balls.
  change_clubs:
    seq:
      - id: inventory_slot_clubs
        type: u4
        doc: Inventory slot of the chosen clubset.
      - id: item_id_clubs
        type: u4
        doc: From pangya_xx.iff/ClubSet.iff. Item ID of the chosen clubset.
      - id: unknown_a_clubs
        size: 20
  change_04_unknown:
    doc: |
      Strongly resembles structure seen elsewhere, e.g. [Gameservice Server 0x0168 User Information](/packets/gameservice/server/0168.ksy).
    seq:
      - id: item_id_character_type04
        type: u4
        doc: From pangya_xx.iff/Character.iff.
      - id: unknown_id_a_type04
        type: u4
        doc: Recurring ID of unknown meaning.
      - id: unknown_b_type04
        size: 4
      - id: item_id_array_part_type04
        type: u4
        repeat: expr
        repeat-expr: 24
        doc: From pangya_xx.iff/Part.iff. Item IDs for 24 parts.
      - id: inventory_slot_array_part_type04
        type: u4
        repeat: expr
        repeat-expr: 24
        doc: Inventory slots for 24 parts. Corresponds with above.
      - id: unknown_c_type04
        size: 216
        doc: All 0x00.
      - id: unknown_id_d_part04
        type: u4
        doc: In 0x70xxxxxx range.
      - id: unknown_id_e_part04
        type: u4
        doc: In 0x70xxxxxx range.
      - id: unknown_f_part04
        size: 12
        doc: All 0x00.
      - id: unknown_g_part04
        type: f4
      - id: unknown_h_part04
        size: 12
        doc: All 0x00.
      - id: unknown_i_part04
        size: 9
      - id: item_id_array_card_type04
        type: u4
        repeat: expr
        repeat-expr: 10
        doc: From pangya_xx.iff/Card.iff. Item IDs for 10 cards.
      - id: unknown_j
        size: 8
        doc: All 0x00.

enums:
  equipment_type:
    0x01: equipped_caddie
    0x02: equipped_ball
    0x03: equipped_clubs
    0x04: equipped_04_unknown
    0x07: equipped_07_unknown
