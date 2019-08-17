#pragma.examples loginservice/client 000b
#pragma.parseAs LoginserviceClientPacket
---
meta:
  id: loginservice_client_000b_reconnect
  title: LoginService Client Reconnect
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet allows a client to reconnect to the login server using a
  previously issued session token. It is currently unclear how to cause a
  client to issue this message, but it succeeds on PangYa TH when issued
  directly.

  When the client sends this packet, the server will either send an error code
  via the [LoginService Server Login Packet](/packets/loginservice/server/0001.ksy)
  packet, or it will follow with the normal set of packets sent after login,
  including a new session token and server list.
  
  In `hsreina/pangya-server`, the packet ID is `TCLPID.PLAYER_RECONNECT`.

seq:
  - id: username
    type: pstring
    doc: |
      Username from original login.

  - id: user_id
    type: u4
    doc: |
      User ID from the original login.

  - id: session_token
    type: pstring
    doc: |
      A session token issued in LoginService Server message 0x0010.
