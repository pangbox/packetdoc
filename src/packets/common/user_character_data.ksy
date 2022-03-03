---
meta:
  id: user_character_data
  title: User Character Data
  encoding: ASCII
  endian: le
  imports:
  - id_bank

doc: |
  Oft-recurring format for communicating a user's character data to clients, including:
  * [Gameservice Server 0x0048 Room Census](/packets/gameservice/server/0048.ksy)
  * [Gameservice Server 0x004B User Equipment Announce](/packets/gameservice/server/004b.ksy)
  * [Gameservice Server 0x006B Equipment Response](/packets/gameservice/server/006b.ksy)
  * [Gameservice Server 0x0070 User Character Roster](/packets/gameservice/server/0070.ksy)
  * [Gameservice Server 0x015E User Information Equipment](/packets/gameservice/server/015e.ksy)
  * [Gameservice Server 0x0168 User Information](/packets/gameservice/server/0168.ksy)

  **See Also**:
  * [User Equipment Data](/packets/common/user_equipment_data.ksy)
  * [User Statistic Data](/packets/common/user_statistic_data.ksy)

seq:
  - id: item_id_character
    type: u4
    doc: From pangya_xx.iff/Character.iff.
    enum: id_bank::item_id_character
  - id: roster_slot_character
    type: u4
    doc: Unconfirmed. Roster slot for the character.
  - id: unknown_user_character_data_a
    size: 4
  - id: item_id_array_part
    type: u4
    repeat: expr
    repeat-expr: 24
    doc: From pangya_xx.iff/Part.iff. Item IDs for 24 parts. Estimated order - Head, Face, Top, Hand/Arm, Hand?, Bottoms, Legs, Feet, Unk x5, Hat, Unk x10.
  - id: inventory_slot_array_part
    type: u4
    repeat: expr
    repeat-expr: 24
    doc: Inventory slots for 24 parts. Corresponds with above.
  - id: unknown_user_character_data_b
    size: 216
    doc: All 0x00.
  - id: unknown_user_character_data_c
    type: u4
    doc: In 0x70xxxxxx range.
  - id: unknown_user_character_data_d
    type: u4
    doc: In 0x70xxxxxx range.
  - id: unknown_user_character_data_e
    size: 12
    doc: All 0x00.
  - id: unknown_user_character_data_f
    type: f4
  - id: unknown_user_character_data_g
    size: 12
    doc: All 0x00.
  - id: unknown_user_character_data_h
    size: 9
    doc: Believed to be character mastery, need more testing.
  - id: item_id_array_card
    type: u4
    repeat: expr
    repeat-expr: 10
    doc: From pangya_xx.iff/Card.iff. Item IDs for 10 cards.
  - id: unknown_user_character_data_i
    size: 8
    doc: All 0x00.
