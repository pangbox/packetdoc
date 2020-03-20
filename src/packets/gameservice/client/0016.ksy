#pragma.examples gameservice/client 0016
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0016_user_change_club
  title: GameService Client User Change Club
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet relays how the user has changed their active club, so it can be relayed to all other players in the room.
  
  The response is [GameService Server 0059 User Change Club Announce](/packets/gameservice/server/0059.ksy).
  
seq:
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
