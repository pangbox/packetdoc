#pragma.examples gameservice/client 0195
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0195_unknown_cookies_related
  title: GameService Client 0195 Unknown (Cookies Related)
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is sent when clicking the 'Add/Buy Cookies' item in the menu.
  
  It has no payload.
  
  The response is [GameService Server 0x027D Unknown Response (Cookies Related)](/packets/gameservice/server/027d.ksy).
  
  **See Also:**
  * [GameService Client 0x003D Unknown (Cookies Related)](/packets/gameservice/client/003d.ksy)
  * [GameService Client 0x00A2 Unknown (Cookies Related)](/packets/gameservice/client/00a2.ksy)
