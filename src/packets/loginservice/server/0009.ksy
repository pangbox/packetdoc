#pragma.examples loginservice/server 0009
#pragma.parseAs LoginserviceServerPacket
---
meta:
  id: loginservice_server_0009_message_server_list
  title: LoginService Server Message Server List
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is sent shortly after a successful login, if the user already
  has an initialized player. It contains a listing of all of the message servers.

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
      - id: unknown3
        size: 14
        doc: More unknown bytes.
      - id: char_icon
        type: u2
        doc: |
          Specifies which character icon to display next to the server.
          This is presumably unused for Message Servers, since they aren't displayed in a menu.
