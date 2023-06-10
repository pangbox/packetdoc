#pragma.examples gameservice/client 0189
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0189_character_mastery_downgrade
  title: GameService Client Character Mastery Downgrade
  encoding: ASCII
  endian: le
  imports:
    - ../../common/id_bank
    - ../../common/pstring

doc: |
  This packet is to downgrade the character mastery of a given character.
  
  Its responses are:
  * [GameService Server 0x026F Character Mastery Upgrade Response](/packets/gameservice/server/026f.ksy),
  * [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy),
  * [GameService Server 0x022E Achievement Unlocked](/packets/gameservice/server/022e.ksy), and
  * [GameService Server 0x0220 Achievement Update](/packets/gameservice/server/0220.ksy).
  
  **Aliases:**
  * `eantoniobr/UGPangya`: `PLAYER_DOWNGRADE_STATUS`
  
  **See Also:**
  * [GameService Server 0x0187 Character Mastery Slot Unlock](/packets/gameservice/client/0187.ksy),
  * [GameService Server 0x0188 Character Mastery Upgrade](/packets/gameservice/client/0188.ksy),
  * [GameService Server 0x018A Character Mastery Card Apply](/packets/gameservice/client/018a.ksy).
  
seq:
  - id: mastery_type
    type: u4
    doc: Denotes character mastery stat being downgraded.
  - id: item_id_character
    type: u4
    doc: From pangya_xx.iff/Character.iff. Item ID of relevant character.
    enum: id_bank::item_id_character
  - id: roster_slot_character
    type: u4
    doc: User-specific roster slot for relevant character.
  - id: unknown_gsc0189_a
    size: 4
  - id: item_id_parts
    type: u4
    doc: From pangya_xx.iff/Part.iff. Equipped parts on character. 24 slots?
    repeat: expr
    repeat-expr: 24
  - id: unknown_gsc0189_b
    size: 8
    doc: All 0x00?
  - id: inventory_slot_parts
    type: u4
    doc: Inventory slots for above equipped parts. 24 slots?
    repeat: expr
    repeat-expr: 24
  - id: unknown_gsc0189_c
    size: 244
    doc: All 0x00?
  - id: mastery_power_level
    type: u1
    doc: Existing mastery level, before upgrade
  - id: mastery_control_level
    type: u1
    doc: Existing mastery level, before upgrade
  - id: mastery_impact_level
    type: u1
    doc: Existing mastery level, before upgrade
  - id: mastery_spin_level
    type: u1
    doc: Existing mastery level, before upgrade
  - id: mastery_curve_level
    type: u1
    doc: Existing mastery level, before upgrade
  - id: mastery_slot_bonus_count
    type: u1
    doc: Bonuses on second tab of Character Mastery screen.
  - id: unknown_gsc0189_d
    size: 51
    doc: All 0x00?
    
enums:
  masteries:
    0x00000000: power
    0x00000001: control
    0x00000002: impact
    0x00000003: spin
    0x00000004: curve
