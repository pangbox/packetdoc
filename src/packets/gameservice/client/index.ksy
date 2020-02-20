#pragma.template metapacket
---
meta:
  id: gameservice_client_packet
  title: GameService Client Packets
  encoding: ASCII
  endian: le
  imports:
    - '0002'
    - '0003'
    - '0004'
    - '0009'
    - '001F'
    - '0020'
    - '002A'
    - '002D'
    - '002F'
    - '0043'
    - '00CC'
    - '0108'
    - '0119'
    - '0143'
    - '0144'
    - '0157'

seq:
  - id: packet_id
    type: u2
  - id: data
    type:
      switch-on: packet_id
      cases:
        0x0002: gameservice_client_0002_hello
	0x0003: gameservice_client_0003_send_chat_message
	0x0004: gameservice_client_0004_sub_server_connect
	0x0009: gameservice_client_0009_send_room_password
	0x001F: gameservice_client_001f_unknown
	0x0020: gameservice_client_0020_equipment_update
	0x002A: gameservice_client_002a_send_whisper
	0x002D: gameservice_client_002d_room_information_request
	0x002F: gameservice_client_002f_user_information_request
	0x0043: gameservice_client_0043_server_list_update_request
	0x00CC: gameservice_client_00cc_send_locker_combination
	0x0108: gameservice_client_0108_guild_list_request
	0x0119: gameservice_client_0119_new_session_key_request
	0x0143: gameservice_client_0143_mailbox_request
	0x0144: gameservice_client_0144_mail_read_request
	0x0157: gameservice_client_0157_unknown
