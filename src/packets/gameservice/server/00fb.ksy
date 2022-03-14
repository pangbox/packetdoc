#pragma.examples gameservice/server 00fb
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_00fb_unknown_black_papel_related
  title: GameService Server 00FB Unknown (Black Papel Related)
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is sent after a Black Papel game play, in both normal and big modes.
  It is currently unknown what use it has.
  
  It is a response to:
  * [GameService Client 0x014B Black Papel Play](/packets/gameservice/client/014b.ksy),
  * [GameService Client 0x0186 Big Black Papel Play](/packets/gameservice/client/0186.ksy).

seq:
  - id: unknown_gss00fb_a
    type: s4
    doc: Appears to always be -1 (0xFFFFFFFF).
  - id: unknown_gss00fb_b
    type: s4
    doc: Appears to always be -3 (0xFFFFFFFD).
