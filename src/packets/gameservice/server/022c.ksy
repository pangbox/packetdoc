#pragma.examples gameservice/server 022c
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_022c_unknown_achievement_related_response
  title: GameService Server Unknown Achievement-Related Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring
    
doc: |
  This packet's purpose is currently unknown.
  
  This is one of the responses to [GameService Client 0x0157 Achievement Status Update](/packets/gameservice/client/0157.ksy).

seq:
  - id: unknown_a
    size: 4
    doc: Always appears to be 0.
