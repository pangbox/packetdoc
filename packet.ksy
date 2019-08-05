---
meta:
  id: pangya_packet
  title: Pangya Packet
  endian: le
  imports:
    - 'loginserver/packet'

params:
  - id: servertype
    type: u1

seq:
  - id: login_packet
    type:
      switch-on: servertype
      cases:
        0: loginserver_packet

enums:
  servertype:
    0: loginserver
    1: gameserver
    2: messageserver
