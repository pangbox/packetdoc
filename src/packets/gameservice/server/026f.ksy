#pragma.examples gameservice/server 026f
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_026f_character_mastery_upgrade_response
  title: GameService Server Character Mastery Upgrade Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges a character's mastery level being upgraded.
  
  It is a response to:
  * [GameService Client 0x0188 Character Mastery Upgrade](/packets/gameservice/client/0188.ksy).
  
seq:
  - id: unknown_gss026f
    size: 4
    doc: All 0x00?
  - id: mastery_type
    type: u4
    doc: Selects which stat has been upgraded.
    enum: masteries
  
enums:
  masteries:
    0x00000000: power
    0x00000001: control
    0x00000002: impact
    0x00000003: spin
    0x00000004: curve
