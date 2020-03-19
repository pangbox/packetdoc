#pragma.examples gameservice/server 01d4
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_01d4_new_session_key
  title: GameService Server New Session Key
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains a new session key on the new server during a
  server switch.
  
  This packet is a response to [GameService Client 0x0119 Switch Server](/packets/gameservice/client/0119.ksy).

seq:
  - id: unknown_a
    size: 4
  - id: session_key
    type: pstring
    doc: Session Key for the destination server.
