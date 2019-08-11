#pragma.template service
---
meta:
  id: gameservice_packet
  title: GameService Packets
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
  - id: game_packet
    type:
      switch-on: origin
      cases:
        0: gameservice_client_packet
        1: gameservice_server_packet
