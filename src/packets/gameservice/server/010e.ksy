#pragma.examples gameservice/server 010e
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_010e_unknown_friends_related_response
  title: GameService Server 010E Unknown Response (Friends Related?)
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet appears to contain a list of other accounts that may have something
  to do with the friends list. Maybe.
  
  This packet is a response to [Gameservice Client 0x009C Unknown Request (Friends Related?)](/packets/gameservice/client/009c.ksy).

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
