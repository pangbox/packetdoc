#pragma.examples gameservice/server 0216
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0216_user_status_update
  title: GameService Server User Status Update
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet can add or subtract items, quest/achievement progress, character mastery,
  and likely others. The meaning of each element can vary based on context.
  
  This packet is a complete mess.
  
seq:
  - id: status_date_unix_time
    size: 4
  - id: status_change_count
    type: u4
  - id: status_changes
    type: status_change
    repeat: expr
    repeat-expr: status_change_count

types:
  status_change:
    seq:
      - id: subtype
        type: u1
      - id: subtype_data
        type:
          switch-on: subtype
          cases:
            0x02: status_change_02_items_achievements_quests
            0xc9: status_change_c9_character_mastery
            0xcc: status_change_cc_unknown

  status_change_02_items_achievements_quests:
    seq:      
      - id: status_id
        type: u4
        doc: item_id, achievement_status_id, quest_status_id
      - id: status_slot
        type: u4
        doc: inventory_slot, achievement_status_slot, quest_status_slot
      - id: unknown_a
        size: 4
        doc: Likely padding?
      - id: status_amount_old
        type: u4
        doc: Value of item/achievement/quest before change.
      - id: status_amount_new
        type: u4
        doc: Value of item/achievement/quest after change.
      - id: status_amount_delta
        type: s4
        doc: Change in value of item/achievement/quest. Can be negative.
      - id: unknown_d
        size: 25
  status_change_c9_character_mastery:
    seq:      
      - id: character_id
        type: u4
      - id: status_slot
        type: u4
        doc: mastery_id?
      - id: unknown_e
        size: 16
      - id: mastery_power_up_count
        type: u2
      - id: mastery_control_up_count
        type: u2
      - id: mastery_impact_up_count
        type: u2
      - id: mastery_spin_up_count
        type: u2
      - id: mastery_curve_up_count
        type: u2
      - id: unknown_f
        size: 15
  status_change_cc_unknown:
    seq:
      - id: unknown_g
        size: 72
