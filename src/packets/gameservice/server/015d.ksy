#pragma.examples gameservice/server 015d
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_015d_user_information_guild
  title: GameService Server User Information Guild
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains information about the requested user's guild/club.

  This is one of the responses to [GameService Client 0x002F User Information Request](/packets/gameservice/client/002f.ksy).

seq:
  - id: user_id
    type: u4
  - id: unknown_a
    type: u4
  - id: guild_name
    type: strz
    size: 21
  - id: unknown_b
    type: u4
  - id: unknown_c
    type: u4
  - id: unknown_d
    type: u4
  - id: guild_emblem_id
    type: strz
    size: 12
  - id: unknown_e
    size: 206
    doc: All 0x00.
  - id: unknown_f
    type: s4
    doc: All 1 (0xFFFFFFFF).
  - id: unknown_g
    size: 22
  - id: unknown_h
    size: 16
    doc: All 0xC3,41,02,F8,28,3A,02,78,23,09,09,60,F1,01,0B,D0.
