#pragma.examples messageservice/client 0017
#pragma.parseAs MessageserviceClientPacket
---
meta:
  id: messageservice_client_0017_user_id_lookup
  title: MessageService Client User ID Lookup Packet
  encoding: ASCII
  endian: le

doc: |
  This packet is sent by the PangYa client to request user details that would
  permit the client to send messages or friend requests to said user.
  
  Response is Server 0x0030, subtype 0x0117.
  
  **See Also**: [MessageService Server 0x0030 Status Packet](/packets/messageservice/server/0030.ksy)

seq:
  - id: user_nickname
    type: pstring
    doc: Target user's nickname
