#pragma.examples gameservice/server 0133
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0133_treasure_point_result
  title: GameService Server Treasure Point Result
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains the result of the Treasure Point mechanism that gives
  away items at the end of games.

  In matches, this will include all users' items mixed together (which allows the UI to show
  greyed-out items that have been awarded to other players). In tournaments, where every player
  has their own treasure point meter, only the local user's winnings are included.
  
  It is only sent when there is at least one item to award to someone.
  
  It is paired with [GameService Server 0x0134 Treasure Point Winnings](/packets/gameservice/server/0134.ksy).

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
      - id: item_quantity
        type: u2
      - id: unknown_a
        size: 1
