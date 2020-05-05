#pragma.examples gameservice/client 00cd
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_00cd_locker_page_request
  title: GameService Client Locker Page Request
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is used to request a page of the locker's inventory.
  
  The response is [GameService Server 0x016D Locker Page Response](/packets/gameservice/server/016d.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_REQUEST_LOCKER_PAGE`
  * `eantoniobr/UGPangya`: `PLAYER_CALL_LOCKERITEMLIST`

seq:
  - id: unknown_a
    type: u4
    doc: Possibly a max items per page?
  - id: page_value
    type: u2
