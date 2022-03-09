#pragma.examples gameservice/server 00c7
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_00c7_time_booster_announce
  title: GameService Server Time Booster Announce
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet announces the use of a time booster / fast forward.
  
  It is a response to:
  * [GameService Client 0x0065 Time Booster Activate](/packets/gameservice/client/0065.ksy).
  
seq:
  - id: item_id
    type: u4
    doc: From pangya_xx.iff/Item.iff. Item ID of the Time Booster used.
  - id: connection_id
    type: u4
    doc: Connection ID of the user that used the Time Booster.
