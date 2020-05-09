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
    - ../../common/pangyachar

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
        equipment_type::equipped_character: pangyachar

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

enums:
  equipment_type:
    0x01: equipped_caddie
    0x02: equipped_ball
    0x03: equipped_clubs
    0x04: equipped_character
