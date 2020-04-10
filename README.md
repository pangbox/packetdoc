# PacketDoc [![Netlify Status](https://api.netlify.com/api/v1/badges/f7e36de0-d78f-413c-af2f-61b6ab51700b/deploy-status)](https://app.netlify.com/sites/suspicious-kirch-7ba6e6/deploys) [![Gitpod Ready-to-Code](https://img.shields.io/badge/Gitpod-Ready--to--Code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/pangbox/packetdoc)

**[Click here to view the browsable documentation!](https://packets.pangdox.com/)**

This is a WIP project to document all of the known PangYa packets. Currently,
the effort is to create a single Kaitai Struct instance that can decode any
packet. Using this metadata, we can then generate validation tests and
documentation pages.

The root type is in [src/packets/index.ksy](./src/packets/index.ksy).

## Code Quality Warning

The primary focus of this repository is bootstrapping good documentation for
PangYa packets. Therefore, ALL of the current effort has gone to making the
documentation as useful as possible. The code used to generate the
documentation is grossly inefficient and poorly written.

Please consider contributing to clean this mess up ;)
