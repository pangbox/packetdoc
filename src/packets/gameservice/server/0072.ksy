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
  - id: unknown_user_id
    type: u4
    doc: Looks like a user ID, but doesn't correspond to local user. 0x00000000 and 0x004519DE seen.
  - id: unknown_b
    size: 4
    doc: 0x00946599 seen.
  - id: comet_inventory_slot
    type: u4
    doc: From [GameService Server 0x0073 User Inventory](/packets/gameservice/server/0073.ksy). Currently equipped comet.
  - id: comet_item_id
    type: u4
    doc: From pangya_xx.iff/Ball.iff.
  - id: consumable_item_id
    type: u4
    repeat: expr
    repeat-expr: 10
    doc: From pangya_xx.iff/Item.iff. Corresponds with the 10 slots available to the user.
  - id: unknown_c
    size: 8
  - id: unknown_inv_slot_d
    type: u4
    doc: Looks like an inventory slot ID.
  - id: unknown_e
    size: 4
  - id: unknown_inv_slot_f
    type: u4
  - id: unknown_g
    size: 12
  - id: unknown_asset_id_h
    type: u4
    doc: Looks like some sort of asset ID (item_id, etc.)
  - id: unknown_i
    size: 4
  - id: unknown_asset_id_j
    type: u4
  - id: unknown_k
    size: 24
