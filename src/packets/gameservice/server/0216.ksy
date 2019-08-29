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
  This packet can add or subtract items, quest progress, character mastery,
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
        size: 1
        doc: $02 if item/quest. $C9 if character mastery.
      - id: status_id
        type: u4
        doc: item_id or quest_id or character_id
      - id: status_slot
        type: u4
        doc: inventory_slot or quest_slot or mastery_id?
      - id: unknown_c
        size: 12
      - id: status_amount_delta
        type: s4
        doc: item_quantity or quest_progress. Can be negative.
      - id: status_flag_a
        type: u2
        doc: mastery_power_up_count
      - id: status_flag_b
        type: u2
        doc: mastery_control_up_count
      - id: status_flag_c
        type: u2
        doc: mastery_impact_up_count
      - id: status_flag_d
        type: u2
        doc: mastery_spin_up_count
      - id: status_flag_e
        type: u2
        doc: mastery_curve_up_count
      - id: unknown_d
        size: 15
