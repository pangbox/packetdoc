#pragma.examples gameservice/client 008b
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_008b_request_message_server_list
  title: GameService Client Request Message Server List
  encoding: ASCII
  endian: le

doc: |
  This packet is sent occasionally sent by the Pangya client to get the
  message server list.  This message is only sent if the client has failed
  to connect to the message server at login.
  
  Response is GameServer 0x00fc

  **See Also**: [Game Server 0x00fc Message Server List](/packets/gameservice/server/00fc.ksy)
  
  This Packet has no payload.
  