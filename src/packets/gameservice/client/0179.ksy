#pragma.examples gameservice/client 0179
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0179_event_room_join
  title: GameService Client Event Room Join
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is a request to join a particular event room.
  
  Its responses are:
  * [GameService Server 0x0049 Room Join Response](/packets/gameservice/server/0049.ksy), and
  * [GameService Server 0x0253 Event Room Join Response](/packets/gameservice/server/0253.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `ENTER_GRAND_PRIX_EVENT`
  * `eantoniobr/UGPangya`: `PLAYER_ENTER_GRANDPRIX`

seq:
  - id: event_number
    type: u4
    doc: From [GameService Server 0x0047 Room List](/packets/gameservice/server/0047.ksy).
