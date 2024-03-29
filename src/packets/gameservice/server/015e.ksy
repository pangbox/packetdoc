#pragma.examples gameservice/server 015e
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_015e_user_character_response
  title: GameService Server User Character Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring
    - ../../common/user_character_data

doc: |
  This packet details a user's character and equipment.

  This is one of the responses to [GameService Client 0x002F User Information Request](/packets/gameservice/client/002f.ksy).

seq:
  - id: user_id
    type: u4
  - id: user_character
    type: user_character_data
