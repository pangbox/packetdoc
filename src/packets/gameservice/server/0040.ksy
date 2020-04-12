#pragma.examples gameservice/server 0040
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0040_message_data
  title: GameService Server Message Data
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet relays incoming global-chat messages. This does not include
  whispered messages, nor does it include private messaging that would happen
  on the Messaging Server.
  
  **See Also**:
  
  *   [GameService Server 0x0084 Whisper Data](/packets/gameservice/server/0084.ksy)
  
  *   [GameService Client 0x0003 Message Send](/packets/gameservice/client/0003.ksy)
  
  *   [GameService Client 0x002A Whisper Send](/packets/gameservice/client/002a.ksy)

seq:
  - id: subtype
    type: u1
    doc: |
      Type of message.
  - id: response
    type:
      switch-on: subtype
      cases:
        0x00: message_data_00_chat_message
        0x0b: message_data_0b_unknown
        0x0c: message_data_0c_countdown
        0x11: message_data_11_departure

types:
  message_data_00_chat_message:
    doc: |
      Relays incoming chat messages. These include messages the local user
      has sent via [GameService Client 0x0003 Message Send](/packets/gameservice/client/0003.ksy)
    seq:
      - id: user_nickname
        type: pstring
      - id: chat_message
        type: pstring
  message_data_0b_unknown:
    seq:
      - id: user_nickname
        type: pstring
      - id: unknown_a
        size: 6
  message_data_0c_countdown:
    seq:
      - id: unknown_b
        size: 4
        doc: Appears to always be 0 (0x00000000).
      - id: countdown_seconds
        type: u4
        doc: Countdown until game/event begins. Sent at 90, 60, 30, 20, 10 through 1 seconds.
  message_data_11_departure:
    seq:
      - id: user_nickname
        type: pstring
      - id: unknown_d
        size: 2
      - id: unknown_e
        type: s4
      - id: unknown_f
        type: u4
      - id: unknown_g
        size: 5
