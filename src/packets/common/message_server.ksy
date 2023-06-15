---
meta:
  id: message_server
  title: Message Server
  encoding: ASCII
  endian: le
  imports:
    - pstring

doc: |
  This structure lists various message server data in certain packets.
  Used in packets such as [LoginService Server 0x0009 Message Server List](/packets/loginservice/server/0009.ksy)
  and [GameService Server 0x00fc Message Server List](/packets/gameservice/server/00fc.ksy)

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


