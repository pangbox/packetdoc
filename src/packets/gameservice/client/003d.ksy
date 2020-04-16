#pragma.examples gameservice/client 003d
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_003d_unknown_cookies_related
  title: GameService Client 003D Unknown (Cookies Related)
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is sent when clicking the 'Add/Buy Cookies' item in the menu.
  
  It has no payload.
  
  The response is [GameService Server 0x0096 Unknown Cookies Related Response](/packets/gameservice/server/0096.ksy).

  **See Also:**
  * [GameService Client 0x00A2 Unknown (Cookies Related)](/packets/gameservice/client/00a2.ksy)
  * [GameService Client 0x0195 Unknown (Cookies Related)](/packets/gameservice/client/0195.ksy)
