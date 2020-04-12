#pragma.examples gameservice/server 006b
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_026b_shot_assist_activate_response
  title: GameService Server Shot Assist Activate Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet acknowledges shot assist activating on a shot.
  
  This is the response to [GameService Client 0x0185 Shot Assist Activate](/packets/gameservice/client/0185.ksy).

seq:
  - id: unknown_a
    type: u4
    doc: All examples are 0 (0x00000000).
  - id: item_id
    type: u4
    doc: From pangya_xx.iff/Item.iff. The 'Play Assist' item ID (0x1BE00016).
  - id: user_id
    type: u4
    doc: The local user's ID.
