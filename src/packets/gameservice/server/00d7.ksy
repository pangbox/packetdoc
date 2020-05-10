#pragma.examples gameservice/server 00d7
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_00d7_authentication_keepalive_challenge
  title: GameService Server Authentication Keep-Alive Challenge
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet is believed to serve as both a keep-alive and as an authentication/security challenge for the client.
  
  The first challenge is sent within 2 minutes of the user logging in to the server, and then
  every 5 minutes exactly thereafter.
  
  The response is [Gameservice Client 0x0088 Authentication Keep-Alive Response](/packets/gameservice/client/0088.ksy).

seq:
  - id: unknown_token
    type: u4
    doc: Unchanging over the course of a single session. Identical in response. Might be some sort of key.
  - id: challenge_length
    type: u4
    doc: Seen lengths of 52 (0x34), 60 (0x3C), and 68 (0x44) bytes.
  - id: challenge_data
    size: challenge_length
    doc: |
      Concerning PangyaTH,
      The first 16 bytes barely change at all across all known examples.
      The next 2 sets of 8 bytes can often remain consistent for up to an hour before changing,
      and repetitions/reuse of the latter set of 8 bytes have been witnessed across a 3 hour timespan in 2019.
      The remaining length is completely different on each challenge.
