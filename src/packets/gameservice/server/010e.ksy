#pragma.examples gameservice/server 010e
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_010e_unknown_opponent_related_response
  title: GameService Server 010E Unknown Response (VS Mode Opponent Related)
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains particulars about the current opponent(s) in VS mode.
  
  This packet is a response to [Gameservice Client 0x009C Unknown Request (VS Mode Opponent Related)](/packets/gameservice/client/009c.ksy).

seq:
  - id: unknown_a
    size: 4
    doc: Possibly padding.
  - id: user_nickname
    type: strz
    size: 22
  - id: user_nickname_b
    type: strz
    size: 22
    doc: Incomplete nickname in known captures.
  - id: user_id
    type: u4
  - id: unknown_b
    size: 208
    doc: Possibly padding.
