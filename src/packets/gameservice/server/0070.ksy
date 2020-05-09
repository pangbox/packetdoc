#pragma.examples gameservice/server 0070
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0070_user_character_roster
  title: GameService Server User Character Roster
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring
    - ../../common/pangyachar

doc: |
  This packet contains the character roster for the user.
  
  It is one of the responses to [GameService Client 0x0002 Hello / Login](/packets/gameservice/client/0002.ksy).

seq:
  - id: character_count_a
    type: u2
    doc: Unconfirmed. Max be count or max.
  - id: character_count_b
    type: u2
    doc: Unconfirmed. May be count or max.
  - id: characters
    type: pangyachar
    repeat: expr
    repeat-expr: character_count_b
