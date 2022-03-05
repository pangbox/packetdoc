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
    - ../../common/user_equipment_data
    - ../../common/user_statistic_data
    - ../../common/user_statistic_data_ext

doc: |
  This packet is sent 19 times after connecting to the server. In order (PangyaTH),
  * 1 instance of subtype 0xD3, value 00.
  * 17 instances of subtype 0xD2, values 01, 03, 1C, 1E, 20, 05, 08, 0B, 10, 12, 15, 0E, 14, 16, 18, 1A, 22.
  * 1 instance of subtype 0x00.
  
  In the case of subtype 03:
  * 1 instance of subtype 0xD3, value 00.
  * 1 instance of subtype 0xD2, value 01.
  * 1 instance of subtype 0x03.
  
  This seems to indicate that subtype is an error or status, and status 0xD2 contains the various status/errors that passed successfully?
  
  
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
        0x03: unknown_0044_03_unknown
        0xd2: unknown_0044_d2_unknown
        0xd3: unknown_0044_d3_unknown

types:
  unknown_0044_00_unknown:
    seq:
      - id: game_version
        type: pstring
        doc: e.g., "829.01"
      - id: unknown_gss0044_00_a
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
      - id: unknown_gss0044_00_b
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
      - id: user_statistics
        type: user_statistic_data
        doc: More details can be found in type definition file.
      - id: user_statistics_ext
        type: user_statistic_data_ext
        doc: More details can be found in type definition file.
      - id: user_equipment
        type: user_equipment_data
        doc: More details can be found in type definition file.
      - id: server_ram_leaking
        size: 11790
        doc: Presumed to be just garbage data.
  unknown_0044_03_unknown:
    doc: This occurs when failing to connect to a game server. This subtype is of length 0.
  unknown_0044_d2_unknown:
    seq:
      - id: unknown_gss0044_d2
        type: u4
  unknown_0044_d3_unknown:
    seq:
      - id: unknown_gss0044_d3
        type: u1
