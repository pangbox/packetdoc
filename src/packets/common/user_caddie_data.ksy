---
meta:
  id: user_caddie_data
  title: User Caddie Data
  encoding: ASCII
  endian: le
  imports:
    - id_bank

doc: |
  Oft-recurring format for communicating a user's in-game statistics to clients, including:
  * [GameService Server 0x004B User Equipment Change Announce](/packets/gameservice/server/004b.ksy)
  * [GameService Server 0x0071 User Caddie Roster](/packets/gameservice/server/0071.ksy)
  * [GameService Server 0x0076 Room User Data](/packets/gameservice/server/0076.ksy)
  
  If no caddie is specified (`roster_slot_caddie` and `item_id_caddie` are both 0), the remaining fields may contain garbage data.
  
  **See Also**:
  * [Common Data Structures](/packets/common/index.md)

seq:
  - id: roster_slot_caddie
    type: u4
    doc: User-specific roster slot of the relevant caddie.
  - id: item_id_caddie
    type: u4
    doc: From pangya_xx.iff/Caddie.iff. Item ID of the relevant caddie.
    enum: id_bank::item_id_caddie
  - id: unknown_user_caddie_data_a
    size: 4
  - id: caddie_level
    type: u1
    doc: Caddie's achieved level. Can be checked by right clicking on them in My Room.
  - id: caddie_xp_amount
    type: u4
    doc: Caddie's earnt XP. Can be checked by right clicking on them in My Room.
  - id: unknown_user_caddie_data_d
    size: 8
