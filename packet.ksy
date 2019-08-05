---
meta:
  id: pangya_packet
  title: Pangya Packet
  endian: le
  imports:
    - 'loginserver/packet'
    - 'common/origin'

params:
  - id: type
    type: u1
    enum: servertype
  - id: origin
    type: u1
    enum: origin

seq:
  - id: packet
    type:
      switch-on: type
      cases:
        0: loginserver_packet(origin)

enums:
  servertype:
    0: loginserver
    1: gameserver
    2: messageserver
