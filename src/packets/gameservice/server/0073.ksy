#pragma.examples gameservice/server 0073
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0073_user_inventory
  title: GameService Server User Inventory
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet lists all the user's inventory items and assigns slot IDs to each
  unique stack.
  
  **Important**: This packet is segmented into 50-entry lists. When more than
  50 entries exist, multiple of this packet will be sent consecutively. The
  'pending' integer in each is the total count of entries in the current packet
  plus all future packets in the series.
  
  This packet is sent during the response to
  GameService Client 0x0002 Hello. (TODO: Add link.)

seq:
  - id: unique_items_pending
    type: u2
  - id: unique_items_count
    type: u2
  - id: unique_items
    type: unique_item
    repeat: expr
    repeat-expr: unique_items_count

types:
  unique_item:
    seq:
      - id: inventory_slot
        type: u4
        doc: |
          This value is often referred to in lieu of or in conjunction with
          a given item's canonical item ID, especially in the contexts of
          receiving or equipping items.
      - id: item_id
        type: u4
        doc: From pangya_xx.iff/Item.iff
      - id: unknown_a
        size: 4
      - id: item_quantity
        type: u4
        doc: 0 appears to be used for infinite-use items, like the basic comet.
      - id: unknown_b
        size: 180
