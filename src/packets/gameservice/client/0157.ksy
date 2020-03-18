#pragma.examples gameservice/client 0157
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0157_unknown
  title: GameService Client 0157 Unknown
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This is a stub entry.
  
  It appears as part of a type $00 [Gameservice Client 0x002F User Information Request](/packets/gameservice/client/002f.ksy).
  
seq:
  - id: user_id
    type: u4
    doc: ID of target.
