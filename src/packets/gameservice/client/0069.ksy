#pragma.examples gameservice/client 0069
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0069_chat_macro_update
  title: GameService Client Chat Macro Update
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet updates the user's chat macros. This is so the server can
  restore the user's custom chat macros on login with [LoginService Server 0x0006 Chat Macro List](/packets/loginservice/server/0006.ksy).
  
  Even if the user does not change the chat macros, this packet is sent anytime
  the user accepts any changes to the client settings menu.
  
  There is no response.
  
  **Aliases:**
  * `eantoniobr/UGPangya`: `PLAYER_SAVE_MACRO`

seq:
  - id: chat_macro
    type: strz
    size: 64
    repeat: expr
    repeat-expr: 9
    doc: Text string of the chat macro.
