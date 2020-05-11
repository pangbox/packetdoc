#pragma.examples gameservice/client 001c
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_001c_room_resync
  title: GameService Client Room Resync
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet requests a fresh copy of the game state.
  
  It is sent after every shot, after receiving the response to GameService Client 0x001B Undocumented.
  
  The responses are:
  * [GameService Server 0x00CC Shot Resync Collectables](/packets/gameservice/server/00cc.ksy) (one for each player, with an item_count of 0),
  * [GameService Server 0x0199 Room Resync User Finish](/packets/gameservice/server/0199.ksy) (only if player has holed-out on the last hole),
  * [GameService Server 0x005B Room Resync Unknown](/packets/gameservice/server/005b.ksy) (always except if game is over),
  * [GameService Server 0x0132 Treasure Point Status](/packets/gameservice/server/0132.ksy) (only if last player has holed-out on current hole),
  * [GameService Server 0x0065 Room Resync Unknown](/packets/gameservice/server/0065.ksy) (only if last player has holed-out on current hole, but game not over),
  * [GameService Server 0x0040 Message Data, type 0x11 Completion](/packets/gameservice/server/0040.ksy) (one for each player, only if game is over),
  * [GameService Server 0x0133 Treasure Point Result](/packets/gameservice/server/0133.ksy) (only if game is over),
  * [GameService Server 0x00FA Room Bonus Collectables Result](/packets/gameservice/server/00fa.ksy) (only if game is over), and
  * [GameService Server 0x0066 Room Match Results](/packets/gameservice/server/0066.ksy) (only if game is over).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_SHOT_SYNC`
  * `eantoniobr/UGPangya`: `PLAYER_SHOT_SYNC`

seq:
  - id: unknown_a
    type: u1
  - id: entry_count
    type: u1
  - id: entries
    type: entry
    repeat: expr
    repeat-expr: entry_count

types:
  entry:
    seq:
      - id: unknown_a_entry
        type: u1
        doc: All examples 0 (0x00).
      - id: unknown_b_entry
        size: 4
        doc: Non-zero.
