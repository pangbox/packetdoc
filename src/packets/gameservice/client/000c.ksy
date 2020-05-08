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
        equipment_type::equipped_04_unknown: change_04_unknown
        equipment_type::equipped_07_unknown: change_07_unknown

types:
  change_caddie:
    seq:
      - id: unknown_id_caddie
        type: u4
        doc: Caddie ID of unknown origin. Requires further investigation.
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
  change_04_unknown:
    doc: Believed to be change character.
    seq:
      - id: unknown_id_04
        type: u4
        doc: Unknown ID of unknown origin. Has been seen elsewhere. Possibly character inventory slot?
  change_07_unknown:
    seq:
      - id: unknown_id_07_04
        type: u4
        doc: Same as unknown_id_04.
      - id: unknown_id_07_caddie
        type: u4
        doc: Same as unknown_id_caddie.
      - id: item_id_07_ball
        type: u4
        doc: Same as item_id_ball.

enums:
  equipment_type:
    0x01: equipped_caddie
    0x02: equipped_ball
    0x03: equipped_clubs
    0x04: equipped_04_unknown
    0x07: equipped_07_unknown
