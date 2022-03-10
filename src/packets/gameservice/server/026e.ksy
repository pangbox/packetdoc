#pragma.examples gameservice/server 026e
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_026e_character_mastery_slot_unlock_response
  title: GameService Server Character Mastery Slot Unlock Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges a slot being unlocked in the 2nd character's mastery tab.
  
  It is a response to:
  * [GameService Client 0x0187 Character Mastery Slot Unlock](/packets/gameservice/client/0187.ksy).
  
seq:
  - id: unknown_gss026e
    size: 4
    doc: All 0x00?
