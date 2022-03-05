#pragma.examples gameservice/client 0020
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0020_equipment_update
  title: GameService Client Equipment Update
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet commits any changes to the player's equipment.
  
  The response is [Gameservice Server 0x006B Equipment Response](/packets/gameservice/server/006b.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_CHANGE_EQUIP`
  * `eantoniobr/UGPangya`: `PLAYER_CHANGE_EQUIPMENTS`

seq:
  - id: equipment_type
    type: u1
    doc: |
      Type of message.
    enum: equipment_update_type
  - id: equipment_data
    type:
      switch-on: equipment_type
      cases:
        equipment_update_type::caddie: equipment_update_01_caddie
        equipment_update_type::consumables: equipment_update_02_consumables
        equipment_update_type::comet: equipment_update_03_comet
        equipment_update_type::decoration: equipment_update_04_decoration
        equipment_update_type::character: equipment_update_05_character
        equipment_update_type::gsc0020_08_unknown: equipment_update_08_unknown
        equipment_update_type::gsc0020_09_unknown: equipment_update_09_unknown

types:
  equipment_update_01_caddie:
    seq:
      - id: roster_slot_caddie
        type: u4
        doc: Roster slot for the relevant caddie.
  equipment_update_02_consumables:
    seq:
      - id: item_id
        type: u4
        repeat: expr
        repeat-expr: 10
        doc: |
          Always exactly 10 entries, corresponding to 10 consumable item slots in-game (no distinction between the 8 default slots and 2 unlockable slots). IDs from pangya_xx.iff/Item.iff.
  equipment_update_03_comet:
    seq:
      - id: item_id_comet
        type: u4
        doc: From pangya_xx.iff/Ball.iff. Item ID of the relevant comet.
  equipment_update_04_decoration:
    seq:
      - id: item_id_portrait_background
        type: u4
        doc: From pangya_xx.iff/Skin.iff. 0 if unused. Player card background.
      - id: item_id_portrait_frame
        type: u4
        doc: From pangya_xx.iff/Skin.iff. 0 if unused. Player card frame.
      - id: item_id_portrait_sticker
        type: u4
        doc: From pangya_xx.iff/Skin.iff. 0 if unused. Player card sticker.
      - id: item_id_portrait_slot
        type: u4
        doc: From pangya_xx.iff/Skin.iff. 0 if unused. Player card 'slot'.
      - id: item_id_cut_in
        type: u4
        doc: Unconfirmed. From pangya_xx.iff/Skin.iff. 0 if unused. Power shot cut-in.
      - id: item_id_rank_banner
        type: u4
        doc: Unconfirmed. From pangya_xx.iff/Skin.iff. 0 if unused. Banner displayed instead of rank.
  equipment_update_05_character:
    seq:
      - id: roster_slot_character
        type: u4
        doc: Roster slot for the relevant character.
  equipment_update_08_unknown:
    seq:
      - id: unknown_gsc0020_08_a
        size: 4
        doc: All 0x00?
  equipment_update_09_unknown:
    seq:
      - id: roster_slot_character_subtype09
        type: u4
        doc: Roster slot for the relevant character.
      - id: unknown_gsc0020_09_a
        size: 16

enums:
  equipment_update_type:
    0x01: caddie
    0x02: consumables
    0x03: comet
    0x04: decoration
    0x05: character
    0x08: gsc0020_08_unknown
    0x09: gsc0020_09_unknown
