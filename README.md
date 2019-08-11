# PacketDoc

This is a WIP project to document all of the known PangYa packets. Currently,
the effort is to create a single Kaitai Struct instance that can decode any
packet. Using this metadata, we can then generate validation tests and
documentation pages.

The root type is in [src/index.ksy](./src/index.ksy).

## Code Quality Warning

The primary focus of this repository is bootstrapping good documentation for
PangYa packets. Therefore, ALL of the current effort has gone to making the
documentation as useful as possible. The code used to generate the
documentation is grossly inefficient and poorly written.

Please consider contributing to clean this mess up ;)
