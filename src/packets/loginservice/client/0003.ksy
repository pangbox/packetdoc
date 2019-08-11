#pragma.examples loginservice/client 0003
#pragma.parseAs LoginserviceClientPacket
---
meta:
  id: loginservice_client_0003_select_server
  title: LoginService Client 0x0003 Select Server
  encoding: ASCII
  endian: le

doc: |
  This packet is sent when the user clicks on a server on the left-hand side
  of the PangYa serverlist.

  In hsreina/pangya-server, the packet ID is TCLPID.PLAYER_SELECT_SERVER.

seq:
  - id: server_id
    type: u2
    doc: |
      ID of server to connect to.

  - id: unused
    type: u2
    doc: |
      This field appears to always be zero.
