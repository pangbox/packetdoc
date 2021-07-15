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
    enum: origin
  - id: version
    type: u1
    enum: version

seq:
  - id: message_packet
    type:
      switch-on: origin
      cases:
        0: messageservice_client_packet(version)
        1: messageservice_server_packet(version)
