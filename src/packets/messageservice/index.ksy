#pragma.template service
---
meta:
  id: messageservice_packet
  title: MessageService Packets
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
  - id: message_packet
    type:
      switch-on: origin
      cases:
        packet_origin::origin::client: messageservice_client_packet(version)
        packet_origin::origin::server: messageservice_server_packet(version)
