#pragma.examples gameservice/client 0189
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_018a_character_mastery_card_apply
  title: GameService Client Character Mastery Card Apply
  encoding: ASCII
  endian: le
  imports:
    - ../../common/id_bank
    - ../../common/pstring

doc: |
  This packet is to apply a card to a given character in the character mastery screen.
  
  Its responses are:
  * [GameService Server 0x0271 Character Mastery Card Apply Response](/packets/gameservice/server/0271.ksy),
  * [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy),
  * [GameService Server 0x022E Achievement Unlocked](/packets/gameservice/server/022e.ksy), and
  * [GameService Server 0x0220 Achievement Update](/packets/gameservice/server/0220.ksy).
  
  **Aliases:**
  * `eantoniobr/UGPangya`: `PLAYER_PUT_CARD`
  
  **See Also:**
  * [GameService Server 0x0187 Character Mastery Slot Unlock](/packets/gameservice/client/0187.ksy),
  * [GameService Server 0x0188 Character Mastery Upgrade](/packets/gameservice/client/0188.ksy),
  * [GameService Server 0x0189 Character Mastery Downgrade](/packets/gameservice/client/0189.ksy).
  
seq:
  - id: item_id_character
    type: u4
    doc: From pangya_xx.iff/Character.iff. Item ID of relevant character.
    enum: id_bank::item_id_character
  - id: roster_slot_character
    type: u4
    doc: User-specific roster slot for relevant character.
  - id: item_id_card
    type: u4
    doc: From pangya_xx.iff/Card.iff. Item ID of relevant card.
  - id: cardholic_slot
    type: u4
    doc: Unconfirmed. Cardholic inventory slot for card.
  - id: card_mastery_card_slot
    type: u4
    doc: Card Mastery card slot being used. Witnessed 0x01 = Group 1, Slot 1; 0x05 and 0x06 = Group 2, Slots 1 and 2.
