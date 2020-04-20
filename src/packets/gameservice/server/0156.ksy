#pragma.examples gameservice/server 0156
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0156_user_information_consumables
  title: GameService Server User Information Consumables
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains details about the requested user's equipped consumable items.
  
  This packet is a response to [GameService Client 0x002F User Information Request](/packets/gameservice/client/002f.ksy).

seq:
  - id: request_type
    type: u1
    doc: Matches [GameService Client 0x002F User Information Request](/packets/gameservice/client/002f.ksy). Only sent on type 0x05.
  - id: user_id
    type: u4
  - id: unknown_id_a
    type: u4
  - id: unknown_id_b
    type: u4
  - id: inventory_slot_c
    type: u4
  - id: item_id
    type: u4
    repeat: expr
    repeat-expr: 10
    doc: From pangya_xx.iff/Item.iff. 10 IDs in series. Consumable items. Corresponds with inventory_slot.
  - id: unknown_d
    size: 4
    doc: All 0x00.
  - id: inventory_slot
    type: u4
    repeat: expr
    repeat-expr: 10
    doc: 10 slots in series. Corresponds with item_id.
  - id: unknown_e
    size: 4
    doc: All 0x00.
  - id: inventory_slot_f
    type: u4
  - id: unknown_id_g
    type: u4
  - id: furniture_id
    type: u4
    repeat: expr
    repeat-expr: 2
    doc: From pangya_xx.iff/Furniture.iff. 2 IDs in series. Appears to be posters. No idea why this is here.
