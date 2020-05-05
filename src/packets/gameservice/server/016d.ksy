#pragma.examples gameservice/server 016d
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_016d_locker_page_response
  title: GameService Server Locker Page Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains the request page of the locker inventory.
  
  This is a response to [GameService Client 0x00CD Locker Page Request](/packets/gameservice/client/00cd.ksy).

seq:
  - id: page_max
    type: u2
    doc: Unconfirmed.
  - id: page_current
    type: u2
    doc: Unconfirmed.
  - id: item_count
    type: u1
  - id: items
    type: item
    repeat: expr
    repeat-expr: item_count

types:
  item:
    seq:
      - id: unknown_id
        type: u4
        doc: Appears to all be the same value?
      - id: unknown_a
        size: 4
        doc: All 0x00.
      - id: item_id
        type: u4
        doc: From pangya_xx.iff/Item.iff
      - id: unknown_b
        size: 4
        doc: All 0x00.
      - id: item_quantity
        type: u4
        doc: Unconfirmed.
      - id: unknown_c
        size: 156
        doc: All 0x00.
