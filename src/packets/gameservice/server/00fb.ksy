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
  This packet is always and only issued after a [Gameservice Client 0x014B Black Papel Play](/packets/gameservice/client/014b.ksy).
  It is currently unknown what use it has.

seq:
  - id: unknown_a
    type: s4
    doc: Appears to always be -1 (0xFFFFFFFF).
  - id: unknown_b
    type: s4
    doc: Appears to always be -3 (0xFFFFFFFD).
