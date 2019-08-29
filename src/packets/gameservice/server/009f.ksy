#pragma.examples gameservice/server 009f
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_009f_server_list
  title: GameService Server Server List
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is a fresh server listing and sub-server listing.
  
  This packet is sent as the response to
  GameService Client 0x0043 Server List Request. (TODO: Add link.)
  
  **See Also**:
  
  *   [LoginService Server 0x0002 Server List](/packets/loginservice/server/0002.ksy)
  
  *   [GameService Server 0x004D Sub-Server List](/packets/gameservice/server/004d.ksy)

seq:
  - id: server_count
    type: u1
  - id: servers
    type: server
    repeat: expr
    repeat-expr: server_count
  - id: sub_server_count
    type: u1
  - id: sub_servers
    type: sub_server
    repeat: expr
    repeat-expr: server_count

types:
  server:
    doc: Identical to LoginServer 0x0002.
    seq:
      - id: server_name
        type: strz
        size: 40
      - id: server_id
        type: u4
      - id: user_max
        type: u4
      - id: user_count
        type: u4
      - id: server_ip
        type: strz
        size: 18
      - id: server_port
        type: u2
      - id: unknown_c
        size: 2
      - id: server_flags
        size: 2
      - id: unknown_d
        size: 14
      - id: server_icon
        type: u2
        enum: server_icons
  sub_server:
    doc: Identical to GameServer 0x004D. 
    seq:
      - id: sub_server_name
        type: strz
        size: 21
      - id: unknown_a
        size: 47
      - id: sub_server_id
        type: u1
      - id: unknown_b
        size: 8

enums:
  server_icons:
    0x0001: icon_pippin
    0x0002: icon_titan_boo
    0x0003: icon_dolfini
    0x0006: icon_tiki
    0x0007: icon_cadie
    0x0009: icon_azer
