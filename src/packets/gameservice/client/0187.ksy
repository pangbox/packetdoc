#pragma.examples gameservice/client 0187
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0187_character_mastery_slot_unlock
  title: GameService Client Character Mastery Slot Unlock
  encoding: ASCII
  endian: le
  imports:
    - ../../common/id_bank
    - ../../common/pstring

doc: |
  This packet is to unlock the next mastery slot on the 2nd character mastery tab of a given character.
  
  Its responses are:
  * [GameService Server 0x026E Character Mastery Slot Unlock Response](/packets/gameservice/server/026e.ksy),
  * [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy),
  * [GameService Server 0x022E Achievement Unlocked](/packets/gameservice/server/022e.ksy), and
  * [GameService Server 0x0220 Achievement Update](/packets/gameservice/server/0220.ksy).
  
  **See Also:**
  * [GameService Server 0x0188 Character Mastery Upgrade](/packets/gameservice/client/0188.ksy),
  * [GameService Server 0x0189 Character Mastery Downgrade](/packets/gameservice/client/0189.ksy),
  * [GameService Server 0x018A Character Mastery Card Apply](/packets/gameservice/client/018a.ksy).
  
seq:
  - id: item_id_character
    type: u4
    doc: From pangya_xx.iff/Character.iff. Item ID of relevant character.
    enum: id_bank::item_id_character
  - id: roster_slot_character
    type: u4
    doc: User-specific roster slot for relevant character.
