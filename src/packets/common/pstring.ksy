---
meta:
  id: pstring
  title: PString
  encoding: ASCII
  endian: le

seq:
  - id: length
    type: u2
  - id: data
    type: str
    size: length