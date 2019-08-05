# PacketDoc

This is a WIP project to document all of the known PangYa packets. Currently,
the effort is to create a single Kaitai Struct instance that can decode any
packet. Using this metadata, we can then generate validation tests and
documentation pages.

The root type is in [packet.ksy](./packet.ksy).