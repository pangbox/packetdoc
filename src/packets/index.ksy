#pragma.template root
---
meta:
  id: pangya_packet
  title: PangYa Packet
  endian: le
  imports:
    - 'loginservice/index'
    - 'gameservice/index'
    - 'messageservice/index'
    - 'common/origin'

doc: |
  This is the root definition of all PangYa packets.

params:
  - id: type
    type: u1
    enum: service
  - id: origin
    type: u1
    enum: origin

seq:
  - id: packet
    type:
      switch-on: type
      cases:
        0: loginservice_packet(origin)
        1: gameservice_packet(origin)
        2: messageservice_packet(origin)

enums:
  service:
    0: loginservice
    1: gameservice
    2: messageservice
