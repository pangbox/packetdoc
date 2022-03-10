#pragma.examples gameservice/server 0271
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0271_character_mastery_card_apply_response
  title: GameService Server Character Mastery Card Apply Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges a card being used in the character mastery screen.
  
  It is a response to:
  * [GameService Client 0x018A Character Mastery Card Apply](/packets/gameservice/client/018a.ksy).
  
seq:
  - id: unknown_gss0271
    size: 4
    doc: All 0x00?
  - id: item_id_card
    type: u4
    doc: From pangya_xx.iff/Card.iff. Item ID of the applied card.
