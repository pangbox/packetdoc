#pragma.examples gameservice/server 0131
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_treasure_hunter_info
  title: GameService Server Treasure Hunter Info
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet contains the treasure hunter bar value for all courses visible while selecting the course.
  
  This is a response to [Gameservice Client 0x0002 Hello / Login](/packets/gameservice/client/0002.ksy),
  but it also apparently sent automatically at the top of the hour.

seq:
  - id: unknown_a
    type: u1
  - id: entry_count
    type: u1
  - id: entries
    type: entry
    repeat: expr
    repeat-expr: entry_count

types:
  entry:
    seq:
      - id: course_id
        type: u1
        doc: The course_id
      - id: entry_value
        type: u4
        doc: The treasure hunter value, based on some empirical tests the minimum value to display anything is 720 and the maximum is 1000.
