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
    - '0007'
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
    - '0081'
    - '0082'
    - '0098'
    - '009c'
    - '00b5'
    - '00b7'
    - '00ca'
    - '00cc'
    - '00cd'
    - '00d3'
    - '00eb'
    - '0108'
    - '0119'
    - '0143'
    - '0144'
    - '0145'
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
        0x0003: gameservice_client_0003_message_send
        0x0004: gameservice_client_0004_sub_server_connect
        0x0007: gameservice_client_0007_user_status_request
        0x0009: gameservice_client_0009_room_join
        0x000d: gameservice_client_000d_user_ready_state
        0x0013: gameservice_client_0013_user_rotate_shot
        0x0016: gameservice_client_0016_user_change_club
        0x0017: gameservice_client_0017_user_use_consumable_item
        0x001f: gameservice_client_001f_unknown
        0x0020: gameservice_client_0020_equipment_update
        0x002a: gameservice_client_002a_whisper_send
        0x002d: gameservice_client_002d_room_information_request
        0x002f: gameservice_client_002f_user_information_request
        0x003c: gameservice_client_003c_note_send
        0x0043: gameservice_client_0043_server_list_update_request
        0x0048: gameservice_client_0048_unknown_loading_related_counter
        0x0077: gameservice_client_0077_user_shop_inventory_request
        0x0081: gameservice_client_0081_multiplayer_mode_join
        0x0082: gameservice_client_0082_multiplayer_mode_leave
        0x0098: gameservice_client_0098_rare_shop_open
        0x009c: gameservice_client_009c_unknown_opponent_related_request
        0x00b5: gameservice_client_00b5_inventory_open_a
        0x00b7: gameservice_client_00b7_inventory_open_b
        0x00ca: gameservice_client_00ca_cardholic_pack_open
        0x00cc: gameservice_client_00cc_locker_combination_attempt
        0x00cd: gameservice_client_00cd_locker_deposit_item
        0x00d3: gameservice_client_00d3_locker_inventory_request
        0x00eb: gameservice_client_00eb_unknown_lounge_related_request
        0x0108: gameservice_client_0108_guild_list_request
        0x0119: gameservice_client_0119_new_session_key_request
        0x0143: gameservice_client_0143_mailbox_request
        0x0144: gameservice_client_0144_mail_read_request
        0x0145: gameservice_client_0145_mail_send
        0x0146: gameservice_client_0146_mail_take_attachments
        0x0147: gameservice_client_0147_mail_delete
        0x014b: gameservice_client_014b_black_papel_play
        0x0157: gameservice_client_0157_unknown
        0x016e: gameservice_client_016e_login_bonus_request
        0x0179: gameservice_client_0179_event_room_join
