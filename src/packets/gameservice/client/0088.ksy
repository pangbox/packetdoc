#pragma.examples gameservice/client 0088
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0088_authentication_keepalive_response
  title: GameService Client Authentication Keep-Alive Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is believed to serve as both a keep-alive and as an authentication/security response to the server.
  
  It is the response to [Gameservice Server 0x00D7 Authentication Keep-Alive Challenge](/packets/gameservice/server/00d7.ksy).

seq:
  - id: unknown_token
    type: u2
    doc: Unchanging over the course of a single session. Identical in challenge. Might be some sort of key.
  - id: server_id
    type: u2
    doc: ID of the server currently connected to.
  - id: response_length
    type: u4
    doc: Seen lengths of multiples of 8, from 0x3C (60) to 0x5C (92) inclusive. There is no known correlation between challenge length and response length.
  - id: response_data
    size: response_length
    doc: Unlike in the challenge, there are no obvious similar bits.
