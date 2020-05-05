#pragma.examples gameservice/client 00d3
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_00d4_locker_change_pang
  title: GameService Client Locker Change Pang
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet either deposits or withdraws some amount of pang from the locker.
  
  The responses are:
  * [GameService Server 0x0171 Locker Change Pang Response](/packets/gameservice/server/0171.ksy),
  * [GameService Server 0x00C8 Pang Balance](/packets/gameservice/server/00c8.ksy), and
  * [GameService Server 0x0172 Locker Pang Balance](/packets/gameservice/server/0172.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_LOCKER_PANGS_TRANSACTION`
  * `eantoniobr/UGPangya`: `PLAYER_LOCKERPANG_CONTROL`

seq:
  - id: transaction_type
    type: u1
    enum: transaction_type
    doc: Sets whether to deposit or withdraw funds.
  - id: pang_amount
    type: u4
    doc: Amount to deposit or withdraw.
  - id: unknown_a
    size: 4
    doc: All 0x00.

enums:
  transaction_type:
    0x00: pang_withdrawal
    0x01: pang_deposit
