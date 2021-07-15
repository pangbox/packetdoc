#pragma.examples loginservice/server 0002
#pragma.parseAs LoginserviceServerPacket
---
meta:
  id: loginservice_server_0002_game_server_list
  title: LoginService Server Game Server List Packet
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is sent shortly after a successful login, if the user already
  has an initialized player. It contains a listing of all of the game servers.

seq:
  - id: count
    type: u1
    doc: |
      Number of servers in the response.
  - id: servers
    type: server
    repeat: expr
    repeat-expr: count

types:
  server:
    seq:
      - id: name
        type: strz
        size: 40
        doc: Display name of server.
      - id: id
        type: u4
        doc: ID of server, used in the Select Server packet.
      - id: max_users
        type: u4
        doc: Maximum number of simultaneous users allowed.
      - id: num_users
        type: u4
        doc: Number of users currently online.
      - id: ip_address
        type: strz
        size: 18
        doc: IPv4 address of server.
      - id: port
        type: u2
        doc: TCP port of server.
      - id: unknown2
        size: 2
        doc: Unknown field.
      - id: flags
        size: 2
        doc: |
          This field contains server flags. The meaning of each bit differs
          per region.
          In the case of US 852, the following flags apply:
          0x10: Hides the server from the listing
          0x80: Indicates that the server should have sort priority in the listing
          0x20000: Indicates that this is a Grand Prix server
      - id: unknown3
        size: 14
        doc: More unknown bytes.
      - id: char_icon
        type: u2
        doc: Specifies which character icon to display next to the server.
