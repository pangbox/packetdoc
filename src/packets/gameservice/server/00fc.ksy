#pragma.examples gameservice/server 00fc
#pragma.parseAs GameserviceServerPacket

meta:
  id: gameservice_server_00fc_message_server_list
  title: GameService Server Message Server List
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is a response to client request messenger list.  It lists the messenger servers
  along with their IP addresses.
  
  It is a response to:
  * [GameService Client 0x008b](/packets/gameservice/client/008b.ksy)

seq:
  - id: count
    type: u1
    doc: |
      Number of servers in the response.
  - id: servers
    type: message_server
    repeat: expr
    repeat-expr: count

