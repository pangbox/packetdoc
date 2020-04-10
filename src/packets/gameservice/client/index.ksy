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
    - '000d'
    - '0013'
    - '0016'
    - '0017'
    - '001f'
    - '0020'
    - '002a'
    - '002d'
    - '002f'
    - '003c'
    - '0043'
    - '0048'
    - '0077'
    - '009c'
    - '00ca'
    - '00cc'
    - '00eb'
    - '0108'
    - '0119'
    - '0143'
    - '0144'
    - '0146'
    - '0147'
    - '014b'
    - '0157'
    - '016e'
    - '0179'

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
        0x0009: gameservice_client_0009_join_room
        0x000d: gameservice_client_000d_user_ready_state
        0x0013: gameservice_client_0013_user_rotate_shot
        0x0016: gameservice_client_0016_user_change_club
        0x0017: gameservice_client_0017_user_use_consumable_item
        0x001f: gameservice_client_001f_unknown
        0x0020: gameservice_client_0020_equipment_update
        0x002a: gameservice_client_002a_send_whisper
        0x002d: gameservice_client_002d_room_information_request
        0x002f: gameservice_client_002f_user_information_request
        0x003c: gameservice_client_003c_send_note
        0x0043: gameservice_client_0043_server_list_update_request
        0x0048: gameservice_client_0048_unknown_loading_related_counter
        0x0077: gameservice_client_0077_user_shop_inventory_request
        0x009c: gameservice_client_009c_unknown_opponent_related_request
        0x00ca: gameservice_client_00ca_cardholic_pack_open
        0x00cc: gameservice_client_00cc_send_locker_combination
        0x00eb: gameservice_client_00eb_unknown_lounge_related_request
        0x0108: gameservice_client_0108_guild_list_request
        0x0119: gameservice_client_0119_new_session_key_request
        0x0143: gameservice_client_0143_mailbox_request
        0x0144: gameservice_client_0144_mail_read_request
        0x0146: gameservice_client_0146_mail_take_attachments
        0x0147: gameservice_client_0147_mail_delete
        0x014b: gameservice_client_014b_black_papel_play
        0x0157: gameservice_client_0157_unknown
        0x016e: gameservice_client_016e_login_bonus_request
        0x0179: gameservice_client_0179_join_event_room
