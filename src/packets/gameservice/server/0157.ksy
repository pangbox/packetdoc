#pragma.examples gameservice/server 0157
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0157_user_information_response
  title: GameService Server User Information Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains details about a requested user.
  
  This packet is a response to [GameService Client 0x002F User Information Request](/packets/gameservice/client/002f.ksy).

seq:
  - id: unknown_a
    type: u1
    doc: Possibly subtype? Only $05 witnessed.
  - id: user_id
    type: u4
  - id: room_id
    type: u2
    doc: Unconfirmed. If correct, $FFFF when not in room.
  - id: username
    type: strz
    size: 24
  - id: user_nickname
    type: strz
    size: 22
  - id: guild_name
    type: strz
    size: 21
  - id: guild_emblem_id
    type: strz
    size: 24
  - id: unknown_b
    size: 48
  - id: username_atnt
    type: strz
    size: 128
  - id: user_id_2
    type: u4
    doc: Duplicate of above.
  - id: unknown_c
    size: 4
