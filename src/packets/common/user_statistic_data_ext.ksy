---
meta:
  id: user_statistic_data_ext
  title: User Statistic Data Extension
  encoding: ASCII
  endian: le
  imports:
    - id_bank

doc: |
  Additional data that comes after some instances of `user_statistic_data`.
  
  **See Also**:
  * [Common Data Structures](/packets/common/index.md)

seq:
  - id: unknown_user_statistic_data_ak
    size: 56
    doc: All 0x00?
  - id: unknown_user_statistic_data_ar
    type: u4
  - id: unknown_user_statistic_data_as
    size: 18
