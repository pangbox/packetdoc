#pragma.examples gameservice/client 0020
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0020_equipment_update
  title: GameService Client Equipment Update
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet commits any changes to the player's equipment.
  
  The response is [Gameservice Server 0x006B Equipment Response](/packets/gameservice/server/006b.ksy).

seq:
  - id: subtype
    type: u1
    doc: |
      Type of message.
  - id: payload
    type:
      switch-on: subtype
      cases:
        0x02: equipment_update_02_consumables
        0x09: equipment_update_09_unknown

types:
  equipment_update_02_consumables:
    seq:
      - id: item_id
        type: u4
	repeat: expr
	repeat-expr: 10
	doc: |
	  Always exactly 10 entries, corresponding to 10 consumable item slots in-game (no distinction between the 8 default slots and 2 unlockable slots). IDs from pangya_xx.iff/Item.iff.
  equipment_update_09_unknown:
    seq:
      - id: unknown_a
        size: 20
