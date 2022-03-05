#pragma.examples gameservice/server 0159
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0159_user_trophies_response
  title: GameService Server User Trophies Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains a count of the user's tournament trophies. This does not include Grand Prix trophies.

  This is one of the responses to [GameService Client 0x002F User Information Request](/packets/gameservice/client/002f.ksy).
  
  **See Also:**
  * [GameService Client 0x0257 User Grand Prix Trophies Response](/packets/gameservice/server/0257.ksy).

seq:
  - id: request_type
    type: u1
    doc: Matches request packet.
    enum: request_type
  - id: user_id
    type: u4
    doc: Matches request packet.
  - id: user_trophy_data
    type: user_trophy_data
    repeat: expr
    repeat-expr: 13
    doc: 13 classes, in order - 5x Unk, AmaLv1, ProLv1, ProLv2, ProLv3, ProLv4, 3x Unk.

types:
  user_trophy_data:
    seq:
      - id: user_trophy_gold
        type: u2
        doc: Number of gold trophies in a given tournament class.
      - id: user_trophy_silver
        type: u2
        doc: Number of silver trophies in a given tournament class.
      - id: user_trophy_bronze
        type: u2
        doc: Number of bronze trophies in a given tournament class.

enums:
  request_type:
    0x00: total
    0x05: season
