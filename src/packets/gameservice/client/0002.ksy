#pragma.examples gameservice/client 0002
#pragma.parseAs GameserviceClientPacket
---
meta:
  id: gameservice_client_0002_hello
  title: GameService Client Hello / Login
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet begins communication between the gameserver and the client, after
  interaction with the loginserver has completed and the client has been handed off.
  
  The responses are:
  * [Gameservice Server 0x0044 Unknown](/packets/gameservice/server/0044.ksy),
  * Gameservice Server 0x011F Undocumented,
  * [Gameservice Server 0x0044 Unknown](/packets/gameservice/server/0044.ksy),
  * [Gameservice Server 0x0070 User Character Roster](/packets/gameservice/server/0070.ksy),
  * [Gameservice Server 0x0071 User Caddie Roster](/packets/gameservice/server/0071.ksy),
  * [Gameservice Server 0x0073 User Inventory](/packets/gameservice/server/0073.ksy),
  * Gameservice Server 0x00E1 Undocumented,
  * [Gameservice Server 0x0072 User Equipment](/packets/gameservice/server/0072.ksy),
  * [Gameservice Server 0x004D Sub-Server List](/packets/gameservice/server/004d.ksy),
  * [Gameservice Server 0x0131 Unknown](/packets/gameservice/server/0131.ksy),
  * [Gameservice Server 0x021D Achievements Progress Report](/packets/gameservice/server/021d.ksy),
  * [Gameservice Server 0x021E Achievements Association Report](/packets/gameservice/server/021e.ksy),
  * Gameservice Server 0x00F1 Undocumented,
  * Gameservice Server 0x0135 Undocumented,
  * Gameservice Server 0x0136 Undocumented,
  * Gameservice Server 0x0181 Undocumented,
  * [Gameservice Server 0x0096 Cookie Balance](/packets/gameservice/server/0096.ksy),
  * Gameservice Server 0x0169 Undocumented,
  * Gameservice Server 0x00B4 Undocumented,
  * Gameservice Server 0x0158 Undocumented,
  * Gameservice Server 0x025D Undocumented, and
  * [Gameservice Server 0x0210 Mail Unread List](/packets/gameservice/server/0210.ksy).
  
  **Aliases:**
  * `hsreina/pangya-server`: `PLAYER_LOGIN`
  * `eantoniobr/UGPangya`: `PLAYER_LOGIN`

seq:
  - id: user_name
    type: pstring
    doc: |
      Local user's name
  - id: user_id
    type: u4
    doc: |
      Local user's ID
  - id: padding_a
    size: 4
    doc: Likely padding.
  - id: unknown_b
    size: 2
  - id: login_key
    type: pstring
    doc: |
      Provided by [Loginservice Server 0x0010 Login Key](/packets/loginservice/server/0010.ksy).
  - id: client_version
    type: pstring
    doc: |
      e.g. "829.01"
  - id: unknown_c
    size: 4
  - id: padding_d
    size: 4
    doc: Likely padding.
  - id: session_key
    type: pstring
    doc: |
      Provided by [Loginservice Server 0x0003 Session Key](/packets/loginservice/server/0003.ksy) or [Gameservice Server 0x01D4 New Session Key](/packets/loginservice/server/01d4.ksy).
