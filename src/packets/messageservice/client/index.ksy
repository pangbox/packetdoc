#pragma.template metapacket
---
meta:
  id: messageservice_client_packet
  title: MessageService Client Packets
  encoding: ASCII
  endian: le
  imports:
    - '../../common/version'
    - '0012'
    - '0014'
    - '0016'
    - '0017'
    - '0018'
    - '001d'
    - '0023'

params:
  - id: version
    type: u1
    enum: version

seq:
  - id: packet_id
    type: u2
  - id: data
    type:
      switch-on: packet_id
      cases:
        0x0012: messageservice_client_0012_credential_declaration
        0x0014: messageservice_client_0014_hello
        0x0016: messageservice_client_0016_goodbye
        0x0017: messageservice_client_0017_user_id_lookup
        0x0018: messageservice_client_0018_unk_friend_request
        0x001d: messageservice_client_001d_status_declaration
        0x0023: messageservice_client_0023_server_declaration
