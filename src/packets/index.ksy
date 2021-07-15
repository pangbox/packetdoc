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
    - 'common/version'

doc: |
  This is the root definition of all PangYa packets.

params:
  - id: type
    type: u1
    enum: service
  - id: origin
    type: u1
    enum: origin
  - id: version
    type: u1
    enum: version

seq:
  - id: packet
    type:
      switch-on: type
      cases:
        0: loginservice_packet(origin, version)
        1: gameservice_packet(origin, version)
        2: messageservice_packet(origin, version)

enums:
  service:
    0: loginservice
    1: gameservice
    2: messageservice
