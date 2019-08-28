#pragma.examples messageservice/server 002f
#pragma.parseAs MessageserviceServerPacket
---
meta:
  id: messageservice_server_002f_credential_declaration_response
  title: MessageService Server Credential Declaration Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is sent by the PangYa messaging server as a response to a
  [MessageServer Client 0x0012 Credentials Declaration](/packets/messageservice/client/0012.ksy),
  acknowledging that the user has connected. This should be followed with
  [MessageServer Client 0x0023 Server Declaration](/packets/messageservice/client/0023.ksy) and
  [MessageServer Client 0x0014 Hello](/packets/messageservice/client/0014.ksy)
  to complete the setup.
  
seq:
  - id: unknown
    type: u1
    doc: |
      Possibly padding, possibly a status byte.
  - id: user_id
    type: u4
    doc: |
      The local user's ID, as supplied in Client 0x0012
