#pragma.examples gameservice/server 01d3
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_01d3_lootbox_jackpot_announce
  title: GameService Server Lootbox Jackpot Announce
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet announces a user getting a jackpot/rare item from a lootbox,
  to all other users on the server with a pop-down announcement box at the top of the screen.
  
  This packet is different in that the main payload is XML instead of a binary format,
  in the element labelled below as `message_data`. Its format is as follows:
  `<PARAMS><BOX_TYPEID>(item_id_lootbox, in decimal, as a string)</BOX_TYPEID><NICKNAME>(user_nickname)</NICKNAME><TYPEID>(item_id_prize, in decimal, as a string)</TYPEID><QTY>(item_quantity, in decimal, as a string)</QTY></PARAMS>`

seq:
  - id: unknown_a
    type: u4
    doc: All examples are 1 (0x00000001). Might be a count.
  - id: unknown_b
    type: u4
    doc: All examples are 1 (0x00000001). Might be a count.
  - id: message_length
    type: u2
  - id: message_data
    size: message_length
    doc: XML data as per above.
