#pragma.examples loginservice/client 0008
#pragma.parseAs LoginserviceClientPacket
---
meta:
  id: loginservice_client_0008_select_character
  title: LoginService Client Select Character
  encoding: ASCII
  endian: le

doc: |
  This packet is sent by the PangYa client during first login to select a
  character.
  
  In `hsreina/pangya-server`, the packet ID is `TCLPID.PLAYER_SELECT_CHARCTER`.

seq:
  - id: character_id
    type: u4
    doc: |
      ID of selected character.
  - id: hair_color
    type: u2
    doc: |
      ID of selected hair color for character.
