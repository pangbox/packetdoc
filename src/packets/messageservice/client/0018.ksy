#pragma.examples messageservice/client 0018
#pragma.parseAs MessageserviceClientPacket
---
meta:
  id: messageservice_client_0018_unk_friend_request
  title: MessageService Client Unknown (Friend Request?)
  encoding: ASCII
  endian: le

doc: |
  This packet is sent by the PangYa client presumably to initiate a friend
  request with another player.
  
  Response is Server 0x0030, subtype 0x0104.
  
  **See Also**: [MessageService Server 0x0030 Status Packet](/packets/messageservice/server/0030.ksy)

seq:
  - id: user_id
    type: u4
    doc: Target user's ID
  - id: user_nickname
    type: pstring
    doc: Target user's nickname
