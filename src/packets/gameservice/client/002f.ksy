#pragma.examples gameservice/client 002f
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_002f_user_information_request
  title: GameService Client User Information Request
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet requests information on another user, typically when the 'User Info' screen is opened.
  
  The responses are, if a (valid) user_id has been specified:
  
  * [GameService Server 0x0157 Unknown Response (User Related)](/packets/gameservice/server/0157.ksy) (if request_type 0x05),
  * [GameService Server 0x015E User Information Character](/packets/gameservice/server/015e.ksy) (if request_type 0x05),
  * [GameService Server 0x0156 User Information Consumables](/packets/gameservice/server/0156.ksy) (if request_type 0x05),
  * [GameService Server 0x0158 User Statistics Response](/packets/gameservice/server/0158.ksy),
  * [GameService Server 0x015D User Information Guild](/packets/gameservice/server/015d.ksy) (if request_type 0x05),
  * [GameService Server 0x015C User Course Records Response](/packets/gameservice/server/015c.ksy) (Natural Wind mode records),
  * [GameService Server 0x015C User Course Records Response](/packets/gameservice/server/015c.ksy) (Grand Prix mode records),
  * [GameService Server 0x015B Unknown Response (User Related)](/packets/gameservice/server/015b.ksy),
  * [GameService Server 0x015A Unknown Response (User Related)](/packets/gameservice/server/015a.ksy),
  * [GameService Server 0x0159 Unknown Response (User Related)](/packets/gameservice/server/0159.ksy),
  * [GameService Server 0x015C User Course Records Response](/packets/gameservice/server/015c.ksy) (Original mode records),
  * [GameService Server 0x0257 Unknown Response (User Related)](/packets/gameservice/server/0257.ksy), and
  * [GameService Server 0x0089 User Information Response](/packets/gameservice/server/0089.ksy).
  
  The response is, if user_id is 0x00000000 (or potentially if otherwise invalid):
  
  * [GameService Server 0x0089 User Info Response](/packets/gameservice/server/0089.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_REQUEST_INFO`
  * `eantoniobr/UGPangya`: `PLAYER_REQUEST_PLAYERINFO`

seq:
  - id: user_id
    type: u4
    doc: ID of target.
  - id: request_type
    type: u1
    enum: request_type

enums:
  request_type:
    0x00: total
    0x05: season
