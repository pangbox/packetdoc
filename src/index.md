# PangYa Packet Reference
Welcome to Packetdoc, an unofficial document and Kaitai Struct definition
describing the structure of the PangYa protocol and individual PangYa
packets.

PangYa is an MMORPG golf game released by Ntreev Soft in 2004.

The PangYa protocol is a simple TCP-based protocol for encrypting and
transmitting PangYa packets. To understand the full picture behind PangYa's
network communications, you should start by reading the
[protocol](./protocol.md) page, which describes the encryption and framing
of individual PangYa packets. The remainder of this document will focus on
documenting the structure of the decrypted packets themselves, such as the
payloads you would encrypt and decrypt using
[PangCrypt](https://github.com/pangbox/pangcrypt). Henceforth, the decrypted
payloads that this documentation mostly focuses on will be referred to as
"PangYa packets."

The PangYa server stack is divided into 3 different network services:

* [**LoginService**](/packets/loginservice/index.ksy): Provides basic
  authentication capabilities.
* [**GameService**](/packets/gameservice/index.ksy): Synchronizes game state
  across clients.
* [**MessageService**](/packets/messageservice/index.ksy): Provides messaging
  capabilities.

From here, the client and server have their own distinct types of packets for
each service.

## How To Use
**If you wish to implement a PangYa server or client**, take a look at
PangCrypt. It implements most of the bits you will need for the framing part
of the protocol. You will still need to manually read and calculate the length
so you can segment the TCP stream correctly.

Once you have an implementation of the framing protocol, you can then use this
reference in one of two ways:

* The KaitaiStruct definition that generates the packet pages can actually be
  used to generate code for decoding packets in multiple programming
  languages. (Ability to encode packets is not available in stable
  KaitaiStruct.)

* The documentation and KaitaiStruct definitions should provide enough
  information to construct and parse packets (usually.)

Understanding the packet flows will probably still require some analysis of
packet dumps.

**If you wish to dissect a packet,** you have multiple options.

* PangCrypt and its `unpangle` tool can be used to get the payload from TCP
  packets.

* The KaitaiStruct definition that generates the packet documentation can be
  used to decode packets. You could generate code and use it in the
  programming language of your choice.

* You could use a KaitaiStruct tool like KaitaiStruct Visualizer.

**WARNING**: KaitaiStruct WebIDE does not work well with Packetdoc definitions
for two reasons:

* WebIDE decodes packets based on the currently open file, and does not
  support passing parameters yet, so you must open the `index.ksy` file in the
  folder of the type of packet you're dealing with; while the individual
  packet struct is open, decoding will fail because the packet ID present in
  your payload will cause decoding to fail, as individual packet structs do
  not contain a packet ID entry.

* WebIDE does not support imports on files in the user filesystem.

**TODO**: Describe how to do these things. Ideally, provide the tools
directly.

**TODO**: Work to implement serialization in KaitaiStruct compiler so that the
KaitaiStructs can be used for encoding packets too.

## Terminology

### Client vs Server
The term 'client' and 'server' here refer to the PangYa game and
PangYa servers, respectively. Client packets are packets created by the
client and consumed by the server. Server packets are packets created by the
server and consumed by the server. When referring to encryption and
decryption, following PangCrypt's nomenclature instead of the older pang.dll
nomenclature, encryption and decryption are labeled according to which
packets they operate on, so Client Decrypt would decrypt packets created by
the client and Server Encrypt would encrypt packets created by the server.

### Packets vs Frames
When we say packets, we do not refer to the individual frames of the PangYa
protocol that make up the TCP streams, but rather we refer to the payloads
that they contain. Although this terminology may be confusing, it is
consistent with existing usages in the community. When referring to the
structure containing the packet, we call it the frame. PangYa packet can be
thought of as being the level of abstraction at which PangYa game logic is
encapsulated, whereas lower levels deal with framing, encryption and
compression.
