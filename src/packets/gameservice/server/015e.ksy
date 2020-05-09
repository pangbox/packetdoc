#pragma.examples gameservice/server 015e
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_015e_user_information_character
  title: GameService Server User Information Character
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring
    - ../../common/pangyachar

doc: |
  This packet details a user's character and equipment.

  This is one of the responses to [GameService Client 0x002F User Information Request](/packets/gameservice/client/002f.ksy).

seq:
  - id: user_id
    type: u4
  - id: character_data
    type: pangyachar
