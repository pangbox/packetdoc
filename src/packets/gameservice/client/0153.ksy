#pragma.examples gameservice/client 0153
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0153_quest_submit
  title: GameService Client Quest Submit
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet finishes a complete quest and requests the reward.
  
  Its responses are:
  * [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy) to award prizes and remove quest,
  * [GameService Server 0x0227 Quest Finish Response](/packets/gameservice/server/0227.ksy),
  * [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy) to increment quest completion counter?,
  * [GameService Server 0x022E Achievement Unlocked](/packets/gameservice/server/022e.ksy), and
  * [GameService Server 0x0220 Achievement Update](/packets/gameservice/server/0220.ksy).

seq:
  - id: quest_count
    type: u4
    doc: All examples are 1, but this follows pattern established elsewhere.
  - id: quest_status_slot
    type: u4
    repeat: expr
    repeat-expr: quest_count
