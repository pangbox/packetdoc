#pragma.examples gameservice/client 000f
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_000f_room_leave
  title: GameService Client Room Leave
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet signals the user leaving a room and returning to the multiplayer lobby.
  
  The response is:
  * [GameService Server 0x004C Room Leave Response](/packets/gameservice/server/004c.ksy);
  
  However, in lounges, this will *also* trigger, for all other users in the lounge, a response of:
  * [GameService Server 0x00C4 Player Lounge Action, subtype 0x08 Departure](/packets/gameservice/server/00c4.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_LEAVE_GAME`
  * `eantoniobr/UGPangya`: `PLAYER_LEAVE_GAME`

seq:
  - id: unknown_a
    type: u1
    doc: All examples are 0 (0x00) or 1 (0x01).
  - id: room_number
    type: s2
    doc: The new room number, which is always -1 (0xFFFF) for the lobby.
  - id: unknown_b
    type: u4
    doc: Usually, but not always, 0.
  - id: unknown_c
    size: 4
  - id: unknown_d
    type: u4
    doc: Usually, but not always, 0.
  - id: unknown_e
    size: 4
