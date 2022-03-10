#pragma.examples gameservice/server 0270
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0270_character_mastery_downgrade_response
  title: GameService Server Character Mastery Downgrade Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges a character's mastery level being downgraded.
  
  It is a response to:
  * [GameService Client 0x0189 Character Mastery Downgrade](/packets/gameservice/client/0189.ksy).
  
seq:
  - id: unknown_gss0270
    size: 4
    doc: All 0x00?
  - id: mastery_type
    type: u4
    doc: Selects which stat has been downgraded.
    enum: masteries

enums:
  masteries:
    0x00000000: power
    0x00000001: control
    0x00000002: impact
    0x00000003: spin
    0x00000004: curve
