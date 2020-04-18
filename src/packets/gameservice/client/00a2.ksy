#pragma.examples gameservice/client 00a2
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_00a2_unknown_cookies_related
  title: GameService Client 00A2 Unknown (Cookies Related)
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is sent when clicking the 'Add/Buy Cookies' item in the menu.
  
  It has no payload.
  
  It has no response.
  
  **See Also:**
  * [GameService Client 0x003D Cookie Balance Request](/packets/gameservice/client/003d.ksy)
  * [GameService Client 0x0195 Unknown (Cookies Related)](/packets/gameservice/client/0195.ksy)
