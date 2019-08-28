#pragma.examples messageservice/client 0023
#pragma.parseAs MessageserviceClientPacket
---
meta:
  id: messageservice_client_0023_server_declaration
  title: MessageService Client Server Declaration
  encoding: ASCII
  endian: le

doc: |
  This packet is sent by the PangYa client to announce to which game server the
  user is connected.
  
  **See Also**: [MessageService Server Game Server List Packet](/packets/loginservice/server/0002.ksy)
  
seq:
  - id: unknown_a
    size: 2
  - id: unknown_b
    size: 4
  - id: server_id
    type: u4
    doc: Connected Server ID
  - id: sub_server_id
    type: u1
    doc: Connected Sub-Server (0xFF is none; 0x00 is First, etc.)
  - id: sub_server_name
    type: strz
    size: 64
    doc: Connected Sub-Server Name ('NONE', 'Free#1', 'Rookie', etc.)
