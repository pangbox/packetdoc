---
meta:
  id: pstring
  title: PString
  encoding: ASCII
  endian: le

doc: |
  Pascal-style length prefix string, with a 2-byte prefix.

seq:
  - id: length
    type: u2
    doc: Length of the string, in bytes.

  - id: data
    type: str
    size: length
    doc: Content of the string, with no null terminator.