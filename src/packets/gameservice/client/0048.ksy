#pragma.examples gameservice/client 0048
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0048_unknown_loading_related_counter
  title: GameService Client 0048 Unknown Counter (Loading Related)
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is sent 9 times during the initial loading of a VS Stroke game (and potentially other modes, but not Lounge).
  Each packet increments unknown_a from 0x02 through 0x0A.
  
  There is no known response.
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_LOADING_INFO`
  * `eantoniobr/UGPangya`: `PLAYER_LOADING_INFO`

seq:
  - id: unknown_a
    type: u1
    doc: Increments from 0x02 through 0x0A.
