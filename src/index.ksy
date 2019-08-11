#pragma.template root
---
meta:
  id: pangya_packet
  title: Pangya Packet Reference
  endian: le
  imports:
    - 'packets/loginservice/index'
    - 'packets/gameservice/index'
    - 'packets/messageservice/index'
    - 'packets/common/origin'

doc: |
  Welcome to Packetdoc, a documentation of Pangya packets. Pangya is divided
  into 3 different services:

    * LoginService: Provides basic authentication capabilities.
    * GameService: Synchronizes game state across clients.
    * MessageService: Provides messaging capabilities.
  
  Packets themselves are divided into client and server packets for these
  respective services.

params:
  - id: type
    type: u1
    enum: service
  - id: origin
    type: u1
    enum: origin

seq:
  - id: packet
    type:
      switch-on: type
      cases:
        0: loginservice_packet(origin)
        1: gameservice_packet(origin)
        2: messageservice_packet(origin)

enums:
  service:
    0: loginservice
    1: gameservice
    2: messageservice
