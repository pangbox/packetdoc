#pragma.template metapacket
---
meta:
  id: gameservice_server_packet
  title: GameService Server Packets
  encoding: ASCII
  endian: le
  imports:
    - '0040'
    - '0044'
    - '0046'
    - '0047'
    - '0049'
    - '004a'
    - '004c'
    - '004d'
    - '0055'
    - '0056'
    - '0058'
    - '0059'
    - '005a'
    - '0063'
    - '006b'
    - '0072'
    - '0073'
    - '0078'
    - '0084'
    - '0086'
    - '0095'
    - '009f'
    - '00a1'
    - '00e6'
    - '00e7'
    - '00ec'
    - '00ed'
    - '00f5'
    - '00f6'
    - '00fb'
    - '010b'
    - '010e'
    - '012b'
    - '012d'
    - '0133'
    - '0154'
    - '0157'
    - '0168'
    - '016c'
    - '016d'
    - '0170'
    - '0196'
    - '01bc'
    - '01d4'
    - '0211'
    - '0212'
    - '0213'
    - '0214'
    - '0215'
    - '0216'
    - '021b'
    - '021d'
    - '021e'
    - '0220'
    - '0225'
    - '022c'
    - '022d'
    - '022e'
    - '0248'
    - '0249'
    - '0250'
    - '0251'
    - '0253'
    - '0254'
    - '0264'
    - '026a'
    - '026b'

seq:
  - id: packet_id
    type: u2
  - id: data
    type:
      switch-on: packet_id
      cases:
        0x0040: gameservice_server_0040_message_data
        0x0044: gameservice_server_0044_unknown
        0x0046: gameservice_server_0046_user_census
        0x0047: gameservice_server_0047_room_list
        0x0049: gameservice_server_0049_room_join_response
        0x004a: gameservice_server_004a_room_status_update
        0x004c: gameservice_server_004c_room_leave_response
        0x004d: gameservice_server_004d_sub_server_list
        0x0055: gameservice_server_0055_shot_commit_announce
        0x0056: gameservice_server_0056_shot_rotate_announce
        0x0058: gameservice_server_0058_shot_power_announce
        0x0059: gameservice_server_0059_shot_club_change_announce
        0x005a: gameservice_server_005a_shot_item_use_announce
        0x0063: gameservice_server_0063_user_at_play_announce
        0x006b: gameservice_server_006b_equipment_response
        0x0072: gameservice_server_0072_user_equipment
        0x0073: gameservice_server_0073_user_inventory
        0x0078: gameservice_server_0078_room_user_ready_state_response
        0x0084: gameservice_server_0084_whisper_data
        0x0086: gameservice_server_0086_room_information_response
        0x0095: gameservice_server_0095_money_update
        0x009f: gameservice_server_009f_server_list
        0x00a1: gameservice_server_00a1_user_status_response
        0x00e6: gameservice_server_00e6_user_shop_inventory
        0x00e7: gameservice_server_00e7_user_shop_leave_response
        0x00ec: gameservice_server_00ec_user_shop_buy_item_response
        0x00ed: gameservice_server_00ed_user_shop_purchase_announce
        0x00f5: gameservice_server_00f5_multiplayer_mode_join_response
        0x00f6: gameservice_server_00f6_multiplayer_mode_leave_response
        0x00fb: gameservice_server_00fb_unknown_black_papel_related
        0x010b: gameservice_server_010b_rare_shop_open_response
        0x010c: gameservice_server_010e_unknown_opponent_related_response
        0x012b: gameservice_server_012b_inventory_open_a_response
        0x012d: gameservice_server_012d_my_room_layout
        0x0133: gameservice_server_0133_treasure_point_result
        0x0154: gameservice_server_0154_cardholic_pack_open_response
        0x0157: gameservice_server_0157_user_information_response
        0x0168: gameservice_server_0168_user_information
        0x016c: gameservice_server_016c_locker_combination_response
        0x016d: gameservice_server_016d_locker_deposit_item_response
        0x0170: gameservice_server_0170_locker_inventory_response
        0x0196: gameservice_server_0196_unknown_lounge_related_response
        0x01bc: gameservice_server_01bc_guild_list
        0x01d4: gameservice_server_01d4_new_session_key
        0x0211: gameservice_server_0211_mailbox_response
        0x0212: gameservice_server_0212_mail_read_response
        0x0213: gameservice_server_0213_mail_send_response
        0x0214: gameservice_server_0214_mail_take_attachments_response
        0x0215: gameservice_server_0215_mail_delete_response
        0x0216: gameservice_server_0216_user_status_update
        0x021b: gameservice_server_021b_black_papel_result
        0x021d: gameservice_server_021d_unknown
        0x021e: gameservice_server_021e_unknown
        0x0220: gameservice_server_0220_achievement_update
        0x0225: gameservice_server_0225_quest_status_response
        0x022c: gameservice_server_022c_unknown_achievement_related_response
        0x022d: gameservice_server_022d_achievement_status_response
        0x022e: gameservice_server_022e_achievement_unlocked
        0x0248: gameservice_server_0248_login_bonus_status_response
        0x0249: gameservice_server_0249_login_bonus_claim_response
        0x0250: gameservice_server_0250_event_mode_join_response
        0x0251: gameservice_server_0251_event_mode_leave_response
        0x0253: gameservice_server_0253_event_room_join_response
        0x0254: gameservice_server_0254_event_room_leave_response
        0x0264: gameservice_server_0264_memorial_coin_result
        0x026a: gameservice_server_026a_shot_assist_toggle_response
        0x026b: gameservice_server_026b_shot_assist_activate_response
