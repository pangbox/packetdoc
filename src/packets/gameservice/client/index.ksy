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
    - '0008'
    - '0009'
    - '000a'
    - '000c'
    - '000d'
    - '000f'
    - '0010'
    - '0012'
    - '0013'
    - '0014'
    - '0015'
    - '0016'
    - '0017'
    - '001d'
    - '001f'
    - '0020'
    - '0022'
    - '002a'
    - '002d'
    - '002f'
    - '003c'
    - '003d'
    - '0043'
    - '0048'
    - '0063'
    - '0069'
    - '0070'
    - '0077'
    - '0078'
    - '007d'
    - '0081'
    - '0082'
    - '0098'
    - '009c'
    - '00a2'
    - '00b5'
    - '00b7'
    - '00ca'
    - '00cc'
    - '00cd'
    - '00ce'
    - '00cf'
    - '00d3'
    - '00d4'
    - '00d5'
    - '00eb'
    - '00ef'
    - '0108'
    - '0109'
    - '0119'
    - '012a'
    - '0143'
    - '0144'
    - '0145'
    - '0146'
    - '0147'
    - '014b'
    - '0151'
    - '0152'
    - '0153'
    - '0154'
    - '0155'
    - '0157'
    - '0158'
    - '016e'
    - '016f'
    - '0176'
    - '0177'
    - '0179'
    - '017a'
    - '017f'
    - '0184'
    - '0185'
    - '018d'
    - '0195'

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
        0x0008: gameservice_client_0008_room_create
        0x0009: gameservice_client_0009_room_join
        0x000a: gameservice_client_000a_room_settings_change
        0x000c: gameservice_client_000c_user_equipment_change
        0x000d: gameservice_client_000d_room_user_ready_state
        0x000f: gameservice_client_000f_room_leave
        0x0010: gameservice_client_0010_user_team_change
        0x0012: gameservice_client_0012_shot_commit
        0x0013: gameservice_client_0013_shot_rotate
        0x0014: gameservice_client_0014_shot_meter_input
        0x0015: gameservice_client_0015_shot_power
        0x0016: gameservice_client_0016_shot_club_change
        0x0017: gameservice_client_0017_shot_item_use
        0x001d: gameservice_client_001d_pangya_shop_purchase
        0x001f: gameservice_client_001f_unknown
        0x0020: gameservice_client_0020_equipment_update
        0x0022: gameservice_client_0022_shot_active_user_acknowledge
        0x002a: gameservice_client_002a_whisper_send
        0x002d: gameservice_client_002d_room_information_request
        0x002f: gameservice_client_002f_user_information_request
        0x003c: gameservice_client_003c_note_send
        0x003d: gameservice_client_003d_cookie_balance_request
        0x0043: gameservice_client_0043_server_list_request
        0x0048: gameservice_client_0048_unknown_loading_related_counter
        0x0063: gameservice_client_0063_user_lounge_action
        0x0069: gameservice_client_0069_chat_macro_update
        0x0070: gameservice_client_0070_scratchy_play
        0x0077: gameservice_client_0077_user_shop_inventory_request
        0x0078: gameservice_client_0078_user_shop_leave
        0x007d: gameservice_client_007d_user_shop_purchase
        0x0081: gameservice_client_0081_multiplayer_mode_join
        0x0082: gameservice_client_0082_multiplayer_mode_leave
        0x0098: gameservice_client_0098_rare_shop_open
        0x009c: gameservice_client_009c_unknown_opponent_related_request
        0x00a2: gameservice_client_00a2_unknown_cookies_related
        0x00b5: gameservice_client_00b5_inventory_open_a
        0x00b7: gameservice_client_00b7_inventory_open_b
        0x00ca: gameservice_client_00ca_cardholic_pack_open
        0x00cc: gameservice_client_00cc_locker_combination_attempt
        0x00cd: gameservice_client_00cd_locker_page_request
        0x00ce: gameservice_client_00ce_locker_item_deposit
        0x00cf: gameservice_client_00cf_locker_item_withdraw
        0x00d3: gameservice_client_00d3_locker_inventory_request
        0x00d4: gameservice_client_00d4_locker_pang_transact
        0x00d5: gameservice_client_00d5_locker_pang_balance_request
        0x00eb: gameservice_client_00eb_unknown_lounge_related_request
        0x00ef: gameservice_client_00ef_lootbox_open
        0x0108: gameservice_client_0108_guild_list_request
        0x0109: gameservice_client_0109_guild_search_request
        0x0119: gameservice_client_0119_new_session_key_request
        0x012a: gameservice_client_012a_scratchy_menu_open
        0x0143: gameservice_client_0143_mailbox_request
        0x0144: gameservice_client_0144_mail_read_request
        0x0145: gameservice_client_0145_mail_send
        0x0146: gameservice_client_0146_mail_attachments_take
        0x0147: gameservice_client_0147_mail_delete
        0x014b: gameservice_client_014b_black_papel_play
        0x0151: gameservice_client_0151_quest_status_request
        0x0152: gameservice_client_0152_quest_accept
        0x0153: gameservice_client_0153_quest_submit
        0x0154: gameservice_client_0154_quest_dismiss
        0x0155: gameservice_client_0155_tiki_shop_card_exchange
        0x0157: gameservice_client_0157_achievement_status_request
        0x0158: gameservice_client_0158_tiki_shop_item_convert
        0x016e: gameservice_client_016e_login_bonus_status_request
        0x016f: gameservice_client_016f_login_bonus_claim
        0x0176: gameservice_client_0176_event_mode_join
        0x0177: gameservice_client_0177_event_mode_leave
        0x0179: gameservice_client_0179_event_room_join
        0x017a: gameservice_client_017a_event_room_leave
        0x017f: gameservice_client_017f_memorial_coin_play
        0x0184: gameservice_client_0184_shot_assist_toggle
        0x0185: gameservice_client_0185_shot_assist_activate
        0x018d: gameservice_client_018d_tiki_shop_item_recycle
        0x0195: gameservice_client_0195_unknown_cookies_related
