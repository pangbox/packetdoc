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
  
  This packet is sent during the response to [GameService Client 0x0002 Hello](/packets/gameservice/client/0002.ksy).

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
        doc: A globally-unique ID for a combination of item and user. Assigned sequentially as needed and never reallocated.
      - id: item_id
        type: u4
        doc: From pangya_xx.iff/Item.iff, /ClubSet.iff, etc.
      - id: unknown_gss0073_a
        type: u4
      - id: item_quantity
        type: u4
        doc: 0 appears to be used for infinite-use items, like the basic comet.
      - id: unknown_gss0073_b
        size: 7
        doc: Padding with 0x00?
      - id: unknown_gss0073_c
        type: u1
        doc: Type of item? Seen 0 - Miscellaneous, 1 - Clubs, Comets, Amulet of Fortune, 5 - Consumables, 0x21 - Rental Club
      - id: rental_date_start
        type: u4
        doc: Unix time stamp. 0 if not a rental.
      - id: padding_gss0073_d
        size: 4
        doc: Padding with 0x00
      - id: rental_date_end
        type: u4
        doc: Unix time stamp. 0 if not a rental.
      - id: padding_gss0073_e
        size: 4
        doc: Padding with 0x00
      - id: unknown_gss0073_f
        type: u1
        doc: Always 0x02?
      - id: unknown_gss0073_g
        size: 155
        doc: Padding with 0x00?
