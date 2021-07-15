#pragma.template service
---
meta:
  id: loginservice_packet
  title: LoginService Packets
  encoding: ASCII
  endian: le
  imports:
    - '../common/origin'
    - '../common/version'
    - 'client/index'
    - 'server/index'

params:
  - id: origin
    type: u1
    enum: origin
  - id: version
    type: u1
    enum: version

seq:
  - id: login_packet
    type:
      switch-on: origin
      cases:
        0: loginservice_client_packet(version)
        1: loginservice_server_packet(version)
