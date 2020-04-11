#pragma.examples gameservice/server 0248
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0248_login_bonus_status_response
  title: GameService Server Login Bonus Status Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains what the current login bonus item is, whether
  it's been collected or not, as well as the next login bonus item.
  
  This packet is sent as the response to [GameService Client 0x016e Login Bonus Status Request](/packets/gameservice/client/016e.ksy).

seq:
  - id: unknown_a
    size: 4
    doc: Possibly padding?
  - id: bonus_collected
    type: u1
    doc: 00 if uncollected, 01 if previously collected.
  - id: current_item_id
    type: u4
    doc: From pangya_xx.iff/Item.iff. The current login bonus item.
  - id: current_item_quantity
    type: u4
  - id: bonus_preview
    type:
      switch-on: bonus_collected
      cases:
        0x00: current_bonus
        0x01: preview_bonus

types:
  current_bonus:
    doc: This only occurs on first login of the day, before the bonus has been collected.
    seq:
      - id: padding_a
        size: 8
        doc: Unused.
      - id: current_bonus_day
        type: u4
        doc: Current bonus is for the nth day.
  preview_bonus:
    doc: This only occurs on all subsequent logins after collecting the daily bonus.
    seq:
      - id: future_item_id
        type: u4
        doc: From pangya_xx.iff/Item.iff. The next login bonus item.
      - id: future_item_quantity
        type: u4
      - id: future_bonus_day
        type: u4
        doc: Next bonus will be awarded on nth day.
