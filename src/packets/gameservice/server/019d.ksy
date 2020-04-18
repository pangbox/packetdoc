#pragma.examples gameservice/server 019d
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_019d_lootbox_open_result
  title: GameService Server Lootbox Open Result
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet details the contents of the lootbox opened by the user.
  
  This is one of the responses to [GameService Client 0x00EF Lootbox Open](/packets/gameservice/client/00ef.ksy).

seq:
  - id: unknown_a
    size: 4
  - id: lootbox_item_id
    type: u4
    doc: From pangya_xx.iff/Item.iff. Lootbox's item ID.
  - id: contents_item_id
    type: u4
    doc: From pangya_xx.iff/Item.iff. Contents' item ID.
  - id: contents_item_quantity
    type: u4
