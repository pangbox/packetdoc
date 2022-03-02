#pragma.examples gameservice/server 0044
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0044_unknown
  title: GameService Server Unknown
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is sent 19 times after connecting to the server. In order (PangyaTH),
  * 1 instance of subtype 0xD3, value 00.
  * 17 instances of subtype 0xD2, values 01, 03, 1C, 1E, 20, 05, 08, 0B, 10, 12, 15, 0E, 14, 16, 18, 1A, 22.
  * 1 instance of subtype 0x00.
  
  This packet is sent during the response to [GameService Client 0x0002 Hello](/packets/gameservice/client/0002.ksy).
  
seq:
  - id: subtype
    type: u1
    doc: |
      Type of message.
  - id: response
    type:
      switch-on: subtype
      cases:
        0x00: unknown_0044_00_unknown
        0xd2: unknown_0044_d2_unknown
        0xd3: unknown_0044_d3_unknown

types:
  unknown_0044_00_unknown:
    seq:
      - id: game_version
        type: pstring
        doc: e.g., "829.01"
      - id: unknown_c
        type: s2
        doc: Always 0xFFFF (-1)?
      - id: username
        type: strz
        size: 22
        doc: Local user's username
      - id: user_nickname
        type: strz
        size: 43
        doc: Local user's nickname
      - id: guild_emblem_id
        type: strz
        size: 24
        doc: Local user's guild's emblem ID. If present, for instance "13579ace", PNG image is downloaded over HTTP from (PangyaTH) 203.107.140.35:50008/_Files/GuildEmblem/13579ace.png
      - id: connection_id
        type: u4
        doc: Connection ID, seen elsewhere in places like [GameService Server 0x0086 Room Information Response](/packets/gameservice/server/0086.ksy).
      - id: unknown_d
        size: 44
      - id: username_atnt
        type: strz
        size: 128
        doc: |
          Typically the local player's username, appended with "@NT".
          Possibly some sort of email or messaging integration?
          Occasionally this field is empty.
          "faceb###############@NT" also witnessed, suggesting a link to
          Login-via-Facebook functionality.
      - id: user_id
        type: u4
      - id: unknown_e
        size: 74
      - id: stat_xp_amount
        type: u2
        doc: The currently held amount of experience points.
      - id: unknown_f
        size: 3
      - id: stat_pang_amount
        type: u4
        doc: The currently held amount of pang.
      - id: unknown_g
        size: 351
      - id: server_ram_leaking
        size: 11789
        doc: Presumed to be just garbage data.
  unknown_0044_d2_unknown:
    seq:
      - id: unknown_b
        type: u4
  unknown_0044_d3_unknown:
    seq:
      - id: unknown_a
        type: u1