#pragma.examples gameservice/server 00c4
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_00c4_user_lounge_action_announce
  title: GameService Server User Lounge Action Announce
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet announces a user performing an action to all users in the same lounge.
  
  It is the response to:
  * [GameService Client 0x000F Room Leave](/packets/gameservice/client/000f.ksy) (only when leaving lounges).
  * [GameService Client 0x0063 User Lounge Action](/packets/gameservice/client/0063.ksy) (all types).

seq:
  - id: connection_id
    type: u4
    doc: Connection ID of the relevant user.
  - id: action_type
    type: u1
    enum: action_type
  - id: action_payload
    type:
      switch-on: action_type
      cases:
        action_type::rotation_unknown: action_rotation_unknown
        action_type::position_absolute: action_position_absolute
        action_type::position_relative: action_position_relative
        action_type::emote: action_emote
        action_type::departure: action_departure

types:
  action_rotation_unknown:
    doc: Used in VS pre-game loadout screen.
    seq:
      - id: axis_z_rotation_unknown
        type: f4
        doc: Default is 195 (0x43430000). Values are all positive integers, but seem arbitrary.
  action_position_absolute:
    doc: Sent when initially joining a room.
    seq:
      - id: axis_x_position_absolute
        type: f4
        doc: East+/West- axis. Absolute position.
      - id: axis_z_position_absolute
        type: f4
        doc: North+/South- axis. Absolute position.
      - id: axis_y_position_absolute
        type: f4
        doc: Up+/Down- axis. Absolute position.
  action_position_relative:
    doc: Sent when making all other movements after joining.
    seq:
      - id: axis_x_position_relative
        type: f4
        doc: East+/West- axis. Relative to current position.
      - id: axis_z_position_relative
        type: f4
        doc: North+/South- axis. Relative to current position.
      - id: axis_y_position_relative
        type: f4
        doc: Up+/Down- axis. Relative to current position.
  action_emote:
    seq:
      - id: emote_string
        type: pstring
        doc: For instance, "chat_\xB4\xED\xBD\xBA" (EUC-KR encoding, "chat_[daen][seu]") is the "/dance" emote command.
  action_departure:
    seq:
      - id: unknown_a_departure
        size: 4
        doc: All 0x00.

enums:
  action_type:
    0x00: rotation_unknown
    0x04: position_absolute
    0x06: position_relative
    0x07: emote
    0x08: departure
