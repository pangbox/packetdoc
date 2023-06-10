#pragma.examples gameservice/server 004e
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_004e_sub_server_connect_response
  title: GameService Server Sub-Server Connect Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges a connection to a sub-server.
  
  It is a response to:
  * [GameService Client 0x0004 Sub-Server Connect](/packets/gameservice/client/0004.ksy), and
  * [GameService Client 0x0083 Sub-Server Connect (Multiplayer Mode)](/packets/gameservice/client/0083.ksy).
  
seq:
  - id: unknown_gss004e
    type: u1
    doc: Only 0x01 witnessed.
