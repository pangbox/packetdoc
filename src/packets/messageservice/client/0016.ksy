#pragma.examples messageservice/client 0016
#pragma.parseAs MessageserviceClientPacket
---
meta:
  id: messageservice_client_0016_goodbye
  title: MessageService Client Goodbye Packet
  encoding: ASCII
  endian: le

doc: |
  This packet is sent by the PangYa client in order to disconnect from the
  Messaging Server. There is no response, and no traffic follows.
  
  This packet has no payload.
