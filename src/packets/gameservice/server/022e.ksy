#pragma.examples gameservice/server 022e
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_022e_achievement_unlocked
  title: GameService Server Achievement Unlocked
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring
    
doc: |
  This packet is sent when the user earns an achievement. It is usually paired
  with
  [GameService Server 0x0220 Achievement List](/packets/gameservice/server/0220.ksy).

seq:
  - id: achievement_count
    type: u4
  - id: achievements
    type: achievement
    repeat: expr
    repeat-expr: achievement_count

types:
  achievement:
    seq:
      - id: achievement_group_id
        type: u4
        doc: From pangya_xx.iff/Achievement.iff
      - id: achievement_id
        type: u4
