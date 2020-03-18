#pragma.template metapacket
---
meta:
  id: loginservice_server_packet
  title: LoginService Server Packets
  encoding: ASCII
  endian: le
  imports:
    - '0001'
    - '0002'
    - '0003'
    - '0006'
    - '0009'
    - '0010'

seq:
  - id: packet_id
    type: u2
  - id: data
    type:
      switch-on: packet_id
      cases:
        0x0001: loginservice_server_0001_login
        0x0002: loginservice_server_0002_game_server_list
        0x0003: loginservice_server_0003_session_key
        0x0006: loginservice_server_0006_chat_macro_list
        0x0009: loginservice_server_0009_message_server_list
        0x0010: loginservice_server_0010_login_key
