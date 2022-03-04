#pragma.template metapacket
---
meta:
  id: messageservice_server_packet
  title: MessageService Server Packets
  encoding: ASCII
  endian: le
  imports:
    - '../../common/version'
    - '002f'
    - '0030'

params:
  - id: version
    type: u1
    enum: packet_version::version

seq:
  - id: packet_id
    type: u2
  - id: data
    type:
      switch-on: packet_id
      cases:
        0x002f: messageservice_server_002f_credential_declaration_response
        0x0030: messageservice_server_0030_status_packet
