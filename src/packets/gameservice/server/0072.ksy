#pragma.examples gameservice/server 0072
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0072_user_equipment
  title: GameService Server User Equipment
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet lists current equipped consumables, and potentially other things.
  
  This packet is sent during the response to [GameService Client 0x0002 Hello](/packets/gameservice/client/0002.ksy).

seq:
  - id: roster_slot_caddie
    type: u4
    doc: From GameService Server 0x0071 User Caddie Roster. Equipped Caddie. 0 if unused.
  - id: roster_slot_character
    type: u4
    doc: From GameService Server 0x0070 User Character Roster. Equipped Character.
  - id: inventory_slot_comet
    type: u4
    doc: From GameService Server 0x0073 User Inventory. Equipped Comet
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
    doc: From GameService Server 0x0073 User Inventory. Equipped Portrait Background. 0 if unused.
  - id: inventory_slot_portrait_frame
    type: u4
    doc: Unconfirmed. From GameService Server 0x0073 User Inventory. Equipped Portrait Frame. 0 if unused.
  - id: inventory_slot_portrait_sticker
    type: u4
    doc: From GameService Server 0x0073 User Inventory. Equipped Portrait Sticker. 0 if unused.
  - id: inventory_slot_portrait_slot
    type: u4
    doc: From GameService Server 0x0073 User Inventory. Equipped Portrait Slot. 0 if unused.
  - id: unknown_gss0072_a
    size: 8
    doc: All 0?
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
  - id: unknown_gss0072_b
    size: 20
    doc: All 0?
