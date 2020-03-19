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
    - '004d'
    - '006b'
    - '0073'
    - '0084'
    - '0086'
    - '0095'
    - '009f'
    - '00e6'
    - '010e'
    - '0133'
    - '0157'
    - '016c'
    - '01bc'
    - '01d4'
    - '0211'
    - '0212'
    - '0214'
    - '0215'
    - '0216'
    - '021b'
    - '021d'
    - '021e'
    - '0220'
    - '022d'
    - '022e'
    - '0248'

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
        0x0049: gameservice_server_0049_join_room_response
        0x004d: gameservice_server_004d_sub_server_list
        0x006b: gameservice_server_006b_equipment_response
        0x0073: gameservice_server_0073_user_inventory
        0x0084: gameservice_server_0084_whisper_data
        0x0086: gameservice_server_0086_room_information_response
        0x0095: gameservice_server_0095_update_money
        0x009f: gameservice_server_009f_server_list
        0x00e6: gameservice_server_00e6_user_shop_inventory
        0x010c: gameservice_server_010e_unknown_friends_related_response
        0x0133: gameservice_server_0133_treasure_point_result
        0x0157: gameservice_server_0157_user_information_response
        0x016c: gameservice_server_016c_locker_combination_response
        0x01bc: gameservice_server_01bc_guild_list
        0x01d4: gameservice_server_01d4_new_session_key
        0x0211: gameservice_server_0211_mailbox_response
        0x0212: gameservice_server_0212_mail_read_response
        0x0214: gameservice_server_0214_mail_take_attachments_response
        0x0215: gameservice_server_0215_mail_delete_response
        0x0216: gameservice_server_0216_user_status_update
        0x021b: gameservice_server_021b_black_papel_result
        0x021d: gameservice_server_021d_unknown
        0x021e: gameservice_server_021e_unknown
        0x0220: gameservice_server_0220_achievement_list
        0x022d: gameservice_server_022d_unknown
        0x022e: gameservice_server_022e_achievement_unlocked
        0x0248: gameservice_server_0248_login_bonus_response
