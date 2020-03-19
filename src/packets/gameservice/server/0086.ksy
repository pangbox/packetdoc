#pragma.examples gameservice/server 0086
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_0086_room_information_response
  title: GameService Server Room Information Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains the details of a selected game room, especially the list
  of users within it.
  
  This packet is sent as the response to [GameService Client 0x002D Room Information Request](/packets/gameservice/client/002d.ksy).
  
  **See Also**:
  [GameService Server 0x0046 User Census](/packets/gameservice/server/0046.ksy)

seq:
  - id: user_count
    type: u4
  - id: unknown_a
    size: 12
  - id: user_list
    type: user
    repeat: expr
    repeat-expr: user_count

types:
  user:
    seq:
      - id: connection_id
        type: u4
      - id: user_rank
        type: u1
      - id: unknown_a
        size: 5
      - id: user_title_badge
        type: u4
        doc: IDs from pangya_xx.iff/Skin.iff. 0 = no custom title / standard rank visible.
      - id: unknown_c
        size: 4
        doc: Matches 4 bytes after user_title_badge in [GameService Server 0x0046 User Census](/packets/gameservice/server/0046.ksy).
        