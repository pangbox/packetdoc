---
meta:
  id: loginserver_client_packet
  title: LoginServer Client Packet
  encoding: ASCII
  endian: le
  imports:
    - 'packet_0001'

seq:
  - id: packet_id
    type: u2
  - id: data
    type:
      switch-on: packet_id
      cases:
        0x0001: loginserver_client_0001_login
