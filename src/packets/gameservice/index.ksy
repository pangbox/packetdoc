#pragma.template service
---
meta:
  id: gameservice_packet
  title: GameService Packets
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
  - id: game_packet
    type:
      switch-on: origin
      cases:
        0: gameservice_client_packet(version)
        1: gameservice_server_packet(version)
