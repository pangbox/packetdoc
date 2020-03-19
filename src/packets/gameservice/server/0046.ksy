#pragma.examples gameservice/server 0046
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0046_user_census
  title: GameService Server User Census
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet lists all users currently connected to a given sub-server, and
  gives enough details to allow the clientside userlist to be generated.
  
  This packet is sent periodically by the server without prompting.

seq:
  - id: user_list_modifcation_type
    type: u1
    doc: Unconfirmed. 0x01 = Add User, 0x03 = Remove User, 0x04 = Initial List, 0x05 = Continued List.
  - id: user_count
    type: u1
    doc: Appears to cap out at 0x24 (36); type 0x05 used to add additional people beyond this limit.
  - id: user_list
    type: user
    repeat: expr
    repeat-expr: user_count

types:
  user:
    seq:
      - id: user_id
        type: u4
      - id: connection_id
        type: u4
      - id: room_number
        type: u2
        doc: User is in this game room. $FFFF = not in a room.
      - id: user_nickname
        type: strz
        size: 22
      - id: user_rank
        type: u1
        doc: Range from $00 = 'Rookie F' through $46 = 'Infinity Legend I'
      - id: unknown_b
        size: 4
      - id: user_title_badge
        type: u4
        doc: IDs from pangya_xx.iff/Skin.iff. 0 = no custom title / standard rank visible.
      - id: unknown_c
        size: 4
      - id: unknown_d
        size: 5
      - id: guild_emblem_id
        type: strz
        size: 19
        doc: |
          If missing, "guildmark". If present, for instance "13579ace", PNG
          image is downloaded over HTTP from
          
          (PangyaTH) 203.107.140.35:50008/_Files/GuildEmblem/13579ace.png
      - id: username_atnt
        type: strz
        size: 128
        doc: See notes in [GameService Server 0x0044 Unknown](/packets/gameservice/server/0044.ksy).
