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
    enum: packet_origin::origin
  - id: version
    type: u1
    enum: packet_version::version

seq:
  - id: packet
    type:
      switch-on: type
      cases:
        service::loginservice: loginservice_packet(origin, version)
        service::gameservice: gameservice_packet(origin, version)
        service::messageservice: messageservice_packet(origin, version)

enums:
  service:
    0: loginservice
    1: gameservice
    2: messageservice
