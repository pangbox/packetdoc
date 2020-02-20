#pragma.examples gameservice/client 0119
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0119_new_session_key_request
  title: GameService Client New Session Key Request / Switch Server Request
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet requests a new session key to allow switching to a different server.
  
  The response is [Gameservice Server 0x01D4 New Session Key](/packets/gameservice/server/01d4.ksy).
  
seq:
  - id: server_id
    type: u4
    doc: ID of the new server for which the requested session key is valid.
