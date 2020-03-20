#pragma.examples gameservice/server 0078
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0078_user_ready_state_response
  title: GameService Server User Ready State Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This relays each user's ready state.
  
  This packet is a response to [Gameservice Client 0x000D User Ready State](/packets/gameservice/client/000d.ksy).

seq:
  - id: connection_id
    type: u4
    doc: As per [Gameservice Server 0x0046 User Census](/packets/gameservice/server/0046.ksy).
  - id: user_readiness
    type: u1
    enum: user_readiness
    doc: As per [Gameservice Client 0x000D User Ready State](/packets/gameservice/client/000d.ksy).

enums:
  user_readiness:
    0x00: ready
    0x01: not_ready_unconfirmed
