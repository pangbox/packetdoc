#pragma.examples messageservice/client 0012
#pragma.parseAs MessageserviceClientPacket
---
meta:
  id: messageservice_client_0012_credential_declaration
  title: MessageService Client Credential Declaration
  encoding: ASCII
  endian: le

doc: |
  This packet is sent by the PangYa client to initiate the connection with
  the Messaging Server.
  
  **See Also**: [MessageService Server 0x002F Credential Declaration Response](/packets/messageservice/server/002f.ksy)

seq:
  - id: user_id
    type: u4
    doc: Local user's ID
  - id: user_nickname
    type: pstring
    doc: Local user's nickname
