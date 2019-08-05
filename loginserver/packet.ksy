---
meta:
  id: loginserver_packet
  title: LoginServer Packet
  encoding: ASCII
  endian: le
  imports:
    - '/common/origin'
    - 'client/packet'

params:
  - id: origin
    type: u1
    enum: origin

seq:
  - id: login_packet
    type:
      switch-on: origin
      cases:
        0: loginserver_client_packet
