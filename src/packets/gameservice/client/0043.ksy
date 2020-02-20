#pragma.examples gameservice/client 0043
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0043_server_list_update_request
  title: GameService Client Server List Update Request
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet requests an updated server and sub-server list. It has no payload.
  
  The response is [Gameservice Server 0x009F Server List](/packets/gameservice/server/009f.ksy).
