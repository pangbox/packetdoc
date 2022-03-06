#pragma.examples gameservice/server 0134
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0134_treasure_point_winnings
  title: GameService Server Treasure Point Winnings
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains only the local user's winnings from the Treasure Point mechanism,
  unlike the main result packet which may contain other users' winnings as well.
  
  Also unlike the result packet, it is always sent, even if the local user does not win
  any treasure point items, and even if no one else does either.
  
  From the result packet, the items have been sorted by item_id, instead of staying in the same order,
  although this may not be necessary.
  
  It is part of the response to:
  * [Event - Tournament / Match End](/events/match_end.md)
  
  **See Also:**
  * [GameService Server 0x0133 Treasure Point Result](/packets/gameservice/server/0133.ksy).

seq:
  - id: treasure_count
    type: u1
  - id: treasure_list
    type: treasure
    repeat: expr
    repeat-expr: treasure_count

types:
  treasure:
    seq:
      - id: user_id
        type: u4
      - id: item_id
        type: u4
      - id: inventory_slot
        type: u4
      - id: item_quantity
        type: u2
      - id: unknown_a
        size: 7
