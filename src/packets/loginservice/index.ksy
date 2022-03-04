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
    enum: packet_origin::origin
  - id: version
    type: u1
    enum: packet_version::version

seq:
  - id: login_packet
    type:
      switch-on: origin
      cases:
        packet_origin::origin::client: loginservice_client_packet(version)
        packet_origin::origin::server: loginservice_server_packet(version)
