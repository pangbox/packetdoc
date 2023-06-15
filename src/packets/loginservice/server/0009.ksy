#pragma.examples loginservice/server 0009
#pragma.parseAs LoginserviceServerPacket
---
meta:
  id: loginservice_server_0009_message_server_list
  title: LoginService Server Message Server List
  encoding: ASCII
  endian: le
  imports:
    - ../../common/message_server

doc: |
  This packet is sent shortly after a successful login, if the user already
  has an initialized player. It contains a listing of all of the message servers.

seq:
  - id: count
    type: u1
    doc: |
      Number of servers in the response.
  - id: servers
    type: message_server
    repeat: expr
    repeat-expr: count
