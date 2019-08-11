#pragma.template service
---
meta:
  id: loginservice_packet
  title: LoginService Packets
  encoding: ASCII
  endian: le
  imports:
    - '../common/origin'
    - 'client/index'
    - 'server/index'

params:
  - id: origin
    type: u1
    enum: origin

seq:
  - id: login_packet
    type:
      switch-on: origin
      cases:
        0: loginservice_client_packet
        1: loginservice_server_packet
