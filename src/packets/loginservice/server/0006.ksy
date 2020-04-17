#pragma.examples loginservice/server 0006
#pragma.parseAs LoginserviceServerPacket
---
meta:
  id: loginservice_server_0006_chat_macro_list
  title: LoginService Server Chat Macro List
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet defines the user's 9 in-game chat macros.
  It is sent after a successful login.
  
  This list is altered with [GameService Client 0x0069 Chat Macro Update](/packets/gameservice/client/0069.ksy).

seq:
  - id: chat_macro
    type: strz
    size: 64
    repeat: expr
    repeat-expr: 9
    doc: |
      Text string of the chat macro.
