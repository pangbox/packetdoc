---
meta:
  id: user_equipment_data
  title: User Equipment Data
  encoding: ASCII
  endian: le

doc: |
  Oft-recurring format for communicating a user's equipment data to clients, including:
  * [GameService Server 0x0044 Unknown](/packets/gameservice/server/0044.ksy)
  * [GameService Server 0x0072 User Equipment](/packets/gameservice/server/0072.ksy)
  * [GameService Server 0x0076 Room User Data](/packets/gameservice/server/0076.ksy)
  * [GameService Server 0x0156 User Equipment Response](/packets/gameservice/server/0156.ksy)
  
  **See Also**:
  * [Common Data Structures](/packets/common/index.md)

seq:
  - id: roster_slot_caddie
    type: u4
    doc: From GameService Server 0x0071 User Caddie Roster. Equipped Caddie. 0 if unused.
  - id: roster_slot_character
    type: u4
    doc: From GameService Server 0x0070 User Character Roster. Equipped Character.
  - id: inventory_slot_comet
    type: u4
    doc: From GameService Server 0x0073 User Inventory. Equipped Comet.
  - id: item_id_comet
    type: u4
    doc: From pangya_xx.iff/Ball.iff.
  - id: item_id_consumable
    type: u4
    repeat: expr
    repeat-expr: 10
    doc: From pangya_xx.iff/Item.iff. Corresponds with the 10 slots available to the user. 0 if unused.
  - id: inventory_slot_portrait_background
    type: u4
    doc: Inventory slot of equipped Portrait Background. 0 if unused.
  - id: inventory_slot_portrait_frame
    type: u4
    doc: Unconfirmed. Inventory slot of equipped Portrait Frame. 0 if unused.
  - id: inventory_slot_portrait_sticker
    type: u4
    doc: Inventory slot of equipped Portrait Sticker. 0 if unused.
  - id: inventory_slot_portrait_slot
    type: u4
    doc: Inventory slot of equipped Portrait Slot. 0 if unused.
  - id: inventory_slot_cut_in
    type: u4
    doc: Unconfirmed. Inventory slot of equipped Power Shot Cut-In. 0 if unused.
  - id: inventory_slot_rank_banner
    type: u4
    doc: Unconfirmed. Inventory slot of equipped Rank Banner. 0 if unused.
  - id: item_id_portrait_background
    type: u4
    doc: From pangya_xx.iff/Skin.iff. 0 if unused.
  - id: item_id_portrait_frame
    type: u4
    doc: Unconfirmed. From pangya_xx.iff/Skin.iff. 0 if unused.
  - id: item_id_portrait_sticker
    type: u4
    doc: From pangya_xx.iff/Skin.iff. 0 if unused.
  - id: item_id_portrait_slot
    type: u4
    doc: From pangya_xx.iff/Skin.iff. 0 if unused.
  - id: item_id_cut_in
    type: u4
    doc: Unconfirmed. From pangya_xx.iff/Skin.iff. 0 if unused.
  - id: item_id_rank_banner
    type: u4
    doc: Unconfirmed. From pangya_xx.iff/Skin.iff. 0 if unused. Banner displayed instead of rank.
  - id: unknown_user_equipment_data_b
    size: 4
    doc: All 0?
  - id: item_id_furniture
    type: u4
    repeat: expr
    repeat-expr: 2
    doc: From pangya_xx.iff/Furniture.iff. 2 IDs in series. Appears to be posters. No idea why this is here.

