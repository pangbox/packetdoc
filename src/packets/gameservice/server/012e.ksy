#pragma.examples gameservice/server 012e
#pragma.parseAs GameserviceServerPacket
---
meta:
  id: gameservice_server_012e_custom_asset_response
  title: GameService Server Custom Asset Response
  encoding: ASCII
  endian: le
  imports:
    - ../../common/pstring

doc: |
  This packet provides information regarding a custom asset (i.e. user designed clothing).
  
  It is a response to:
  * [GameService Client 0x00B9 Custom Asset Request](/packets/gameservice/client/00b9.ksy)
  
  The response is an HTTP request to a public bucket for uploads. The resultant download (despite the extension) is a ZIP archive containing 3 RAW bitmaps of the custom textures.
  > In PangyaTH, it is `http://203.107.140.35:50008/_Files/SelfDesign/(path)`, with the path being a concatenation of:
  > * Uppercase first character of `item_asset_id`,
  > * The string `/`,
  > * Lower-case internal asset name of the blank design (Reference pangya_xx.iff/Part.iff with the `item_id`),
  > * The string `f01_`,
  > * Lower-case value of `item_asset_id`
  > * The string `.jpg`.
  >
  > To give an example, there is a red T-shirt with the Bat-Man logo on it for Nuri provided below with an `item_id == 0x08006033` and `item_asset_id == "77ECC3E7"`.
  >
  > The item with `item_id == 0x08006033`, called "Blank Top 1 Dupe (N)", has an internal asset name of `M_TS_u01`.
  >
  > Because the first character of `item_asset_id` is 7, the resultant URL should be `http://203.107.140.35:50008/_Files/SelfDesign/7/m_ts_u01f01_77ecc3e7.jpg`.
  
seq:
  - id: unknown_gss012e_a
    type: u1
    doc: Always 0x01?
  - id: item_id
    type: u4
    doc: From pangya_xx.iff/Part.iff.
  - id: unknown_gss012e_b
    type: u2
    doc: Always 0x0008? Possibly pstring length.
  - id: item_asset_id
    type: strz
    size: 9
  - id: inventory_slot
    type: u4
    doc: Unconfirmed.
  - id: item_id_b
    type: u4
    doc: Duplicate. From pangya_xx.iff/Part.iff
  - id: unknown_gss012e_c
    size: 15
    doc: All 0x00?
  - id: unknown_gss012e_d
    type: u4
  - id: unknown_gss012e_e
    size: 13
    doc: All 0x00?
  - id: unknown_gss012e_f
    type: u1
  - id: item_display_name
    type: strz
    size: 41
  - id: item_asset_id_b
    type: strz
    size: 9
    doc: Duplicate.
  - id: unknown_gss012e_g
    type: u1
    doc: Always 0x01?
  - id: unknown_gss012e_h
    type: u2
  - id: user_nickname
    type: strz
    size: 22
    doc: Asset creator's display name
  - id: unknown_gss012e_i
    size: 72
    doc: All 0x00?
  - id: unknown_gss012e_j
    type: s4
    doc: Either 0 or -1.
  - id: unknown_gss012e_k
    size: 4
    doc: All 0x00?
