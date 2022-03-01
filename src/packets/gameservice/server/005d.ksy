#pragma.examples gameservice/server 005d
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_005d_user_typing_indicator_announce
  title: GameService Server User Typing Indicator Announce
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet announces to players if a player is currently typing.
    
  It is announced after a client sends [GameService Client 0x0018 User Typing Incidator Status](/packets/gameservice/client/0018.ksy),
seq:
  - id: connection_id
    type: u4
    doc: Appears to be based on the player's number from the current server session
  - id: typing_indicator
    type: s2
    doc: 00 01 (1) means typing, FF FF (-1) means not typing.
