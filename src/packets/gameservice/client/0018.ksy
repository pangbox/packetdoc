#pragma.examples gameservice/client 0018
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0018_user_typing_indicator_status
  title: GameService Client User Typing Indicator Status
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  Sends a message to the server indicating that the client player is currently typing.

  For the server side response, see [GameService Server 0x005d User Typing Incidator Announce](/packets/gameservice/server/005d.ksy),
seq:
  - id: typing_indicator
    type: s2
    doc: 00 01 (1) indicates the player is typing, FF FF (-1) incidates the player is no longer typing.
