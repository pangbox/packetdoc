#pragma.examples gameservice/server 0059
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0059_user_change_club_announce
  title: GameService Server User Change Club Announce
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet relays a user's changed club value to all players.
  
  This is a response to [GameService Client 0016 User Change Club](/packets/gameservice/client/0016.ksy).

seq:
  - id: connection_id
    type: u4
    doc: The user's connection ID who has rotated their shot.
  - id: club
    type: u1
    enum: club
    doc: The user's new active club.

enums:
  club:
    0x00: club_1_wood
    0x01: club_2_wood
    0x02: club_3_wood
    0x03: club_2_iron
    0x04: club_3_iron
    0x05: club_4_iron
    0x06: club_5_iron
    0x07: club_6_iron
    0x08: club_7_iron
    0x09: club_8_iron
    0x0a: club_9_iron
    0x0b: club_putting_wedge
    0x0c: club_sand_wedge
    0x0d: club_putter
