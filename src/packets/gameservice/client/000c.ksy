#pragma.examples gameservice/client 000c
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_000c_user_equipment_change
  title: GameService Client User Equipment Change
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet changes the user's equipment while in a room.
  
  The response is [GameService Server 0x004B User Equipment Change Announce](/packets/gameservice/server/004b.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_CHANGE_EQUPMENT_B`
  * `eantoniobr/UGPangya`: `PLAYER_CHANGE_EQUIPMENT`

seq:
  - id: equipment_type
    type: u1
    enum: equipment_type
  - id: equipment_payload
    type:
      switch-on: equipment_type
      cases:
        equipment_type::equipped_caddie: change_caddie
        equipment_type::equipped_ball: change_ball
        equipment_type::equipped_clubs: change_clubs
        equipment_type::equipped_character: change_character
        equipment_type::equipped_07_unknown: change_07_unknown

types:
  change_caddie:
    seq:
      - id: roster_slot_caddie
        type: u4
        doc: Roster slot of chosen caddie.
  change_ball:
    seq:
      - id: item_id_ball
        type: u4
        doc: From pangya_xx.iff/Ball.iff. Item ID of the chosen comet.
  change_clubs:
    seq:
      - id: inventory_slot_clubs
        type: u4
        doc: Inventory slot of the chosen clubset.
  change_character:
    seq:
      - id: roster_slot_character
        type: u4
        doc: Roster slot of the chosen character.
  change_07_unknown:
    seq:
      - id: roster_slot_character_type07
        type: u4
        doc: Same as in type 0x04.
      - id: unknown_id_caddie_type07
        type: u4
        doc: Same as in type 0x01.
      - id: item_id_ball_type07
        type: u4
        doc: Same as in type 0x02.

enums:
  equipment_type:
    0x01: equipped_caddie
    0x02: equipped_ball
    0x03: equipped_clubs
    0x04: equipped_character
    0x07: equipped_07_unknown
