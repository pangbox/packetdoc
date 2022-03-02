#pragma.examples gameservice/client 000b
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_000b_user_equipment_change
  title: GameService Client User Equipment Change
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet appears to set the user's equipped character when starting a tournament. It may end up being syntactically and functionally identical to [GameService Client 0x000C User Equipment Change](/packets/gameservice/client/000c.ksy).
  
  The response is [GameService Server 0x004B User Equipment Change Announce](/packets/gameservice/server/004b.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_CHANGE_EQUPMENT_A`
  * `eantoniobr/UGPangya`: `PLAYER_SAVE_BAR`

seq:
  - id: equipment_type
    type: u1
    enum: equipment_type
  - id: equipment_payload
    type:
      switch-on: equipment_type
      cases:
        equipment_type::equipped_character: change_character

types:
  change_character:
    seq:
      - id: roster_slot_character
        type: u4
        doc: Roster slot of the chosen character.

enums:
  equipment_type:
    0x04: equipped_character
