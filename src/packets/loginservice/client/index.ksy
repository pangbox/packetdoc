#pragma.template metapacket
---
meta:
  id: loginservice_client_packet
  title: LoginService Client Packets
  encoding: ASCII
  endian: le
  imports:
    - '../../common/version'
    - '0001'
    - '0003'
    - '0004'
    - '0006'
    - '0007'
    - '0008'
    - '000b'

params:
  - id: version
    type: u1
    enum: version

seq:
  - id: packet_id
    type: u2
  - id: data
    type:
      switch-on: packet_id
      cases:
        0x0001: loginservice_client_0001_login
        0x0003: loginservice_client_0003_select_server
        0x0004: loginservice_client_0004_ghost
        0x0006: loginservice_client_0006_set_nickname
        0x0007: loginservice_client_0007_check_nickname
        0x0008: loginservice_client_0008_select_character
        0x000b: loginservice_client_000b_reconnect
