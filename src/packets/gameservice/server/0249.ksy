#pragma.examples gameservice/server 0249
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0249_login_bonus_claim_response
  title: GameService Server Login Bonus Claim Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains what the current login bonus item, the next login bonus item, and the current bonus day.
  
  Its one of the responses to [GameService Client 0x016e Login Bonus Status Request](/packets/gameservice/client/016e.ksy).

seq:
  - id: unknown_a
    size: 5
  - id: current_item_id
    type: u4
    doc: From pangya_xx.iff/Item.iff
  - id: current_item_quantity
    type: u4
  - id: future_item_id
    type: u4
    doc: From pangya_xx.iff/Item.iff
  - id: future_item_quantity
    type: u4
  - id: current_bonus_day
    type: u4
