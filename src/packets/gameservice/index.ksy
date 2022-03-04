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
    enum: packet_origin::origin
  - id: version
    type: u1
    enum: packet_version::version

seq:
  - id: game_packet
    type:
      switch-on: origin
      cases:
        packet_origin::origin::client: gameservice_client_packet(version)
        packet_origin::origin::server: gameservice_server_packet(version)
