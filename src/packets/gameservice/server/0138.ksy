#pragma.examples gameservice/server 0138
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0138_user_cardholic_inventory
  title: GameService Server User Cardholic Inventory
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet details the user's cardholic collection.

  This is one of the responses to [GameService Client 0x0002 Hello / Login](/packets/gameservice/client/0002.ksy).

seq:
  - id: unknown_a
    size: 4
    doc: Always 0x00.
  - id: card_count
    type: u2
  - id: cards
    type: card
    repeat: expr
    repeat-expr: card_count

types:
  card:
    seq:
      - id: inventory_slot_card
        type: u4
      - id: item_id_card
        type: u4
        doc: From pangya_xx.iff/Card.iff.
      - id: unknown_b
        size: 12
        doc: All 0x00.
      - id: item_quantity_card
        type: u4
      - id: unknown_c
        size: 32
        doc: All 0x00.
      - id: unknown_d
        type: u2
        doc: All examples 1 (0x0001).
