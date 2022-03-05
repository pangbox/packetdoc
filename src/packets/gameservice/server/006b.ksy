#pragma.examples gameservice/server 006b
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_006b_equipment_update_response
  title: GameService Server Equipment Update Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring
    - ../../common/user_character_data

doc: |
  This packet acknowledges changes to equipment.

  It is the response of [GameService Client 0x0020 Equipment Update](/packets/gameservice/client/0020.ksy).

seq:
  - id: unknown_gss006b_a
    size: 1
    doc: Only 0x04 seen.
  - id: equipment_type
    type: u1
    enum: equipment_update_type
  - id: equipment_data
    type:
      switch-on: equipment_type
      cases:
        equipment_update_type::character_full: user_character_data
        equipment_update_type::caddie: equipment_response_01_caddie
        equipment_update_type::consumables: equipment_response_02_consumables
        equipment_update_type::comet: equipment_response_03_comet
        equipment_update_type::decoration: equipment_response_04_decoration
        equipment_update_type::character: equipment_response_05_character
        equipment_update_type::unknown_08: equipment_response_08_unknown
        equipment_update_type::unknown_09: equipment_response_09_unknown

types:
  equipment_response_01_caddie:
    seq:
      - id: roster_slot_caddie
        type: u4
        doc: Roster slot of the relevant caddie.
  equipment_response_02_consumables:
    doc: These are the 8-10 items available for use in matches.
    seq:
      - id: item_id
        type: u4
        repeat: expr
        repeat-expr: 10
        doc: |
          Always exactly 10 entries, corresponding to 10 consumable item slots in-game (no distinction between the 8 default slots and 2 unlockable slots). IDs from pangya_xx.iff/Item.iff.
  equipment_response_03_comet:
    doc: This is the equipped comet (ball).
    seq:
      - id: item_id_comet
        type: u4
        doc: From pangya_xx.iff/Ball.iff
      - id: inventory_slot_comet
        type: u4
        doc: From Server 0x0073.
  equipment_response_04_decoration:
    doc: |
      This is the decoration on the gamercard that appears in the user profile
      and on inter-hole tournament standings screens.
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
  equipment_response_05_character:
    seq:
      - id: roster_slot_character
        type: u4
        doc: Roster slot for the relevant character.
  equipment_response_08_unknown:
    seq:
      - id: unknown_gss006b_08
        size: 62
        doc: All 0x00?
  equipment_response_09_unknown:
    seq:
      - id: roster_slot_character_subtype09
        type: u4
        doc: Roster slot for the relevant character.
      - id: unknown_gss006b_09
        size: 16

enums:
  equipment_update_type:
    0x00: character_full
    0x01: caddie
    0x02: consumables
    0x03: comet
    0x04: decoration
    0x05: character
    0x08: gsc0020_08_unknown
    0x09: gsc0020_09_unknown