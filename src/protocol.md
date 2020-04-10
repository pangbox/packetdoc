# PangYa Protocol
Pangya communicates over TCP connections. When connecting to a service, the
client establishes a TCP connection to the server on a specific port, and the
protocol opens with the server sending the client a single 'hello' packet. The
'hello' packet contains the encryption key index, which is just a value
ranging from [0, 16) that specifies which part of the encryption oracle to use
for XORing.

(*Aside*: Pangya's encryption scheme is not particularly strong, as it uses a
static key shared between the client and server, with a very simple XOR
routine; it may actually be better to refer to it as an obfuscation sceme.
Nonetheless, it will be referred to as 'encryption' throughout this document.)

Following the hello packet, the server and client communicate in streams of
frames. The structure of the frames vary slightly between the client and the
server, but both contain, in some form, the size of the payload, an additional
salt value used during encryption, and the encrypted payload.

The encrypted data in each frame is a Pangya packet. All Pangya packets begin
with a 16-bit integer number that identifies what type of packet it is. The
type of packet is ultimately identified by the combination of what service the
packet comes from, whether the packet is from the server or from the client,
and the 16-bit packet ID. That means that 16-bit packet IDs are not unique
across different servers, nor are they unique between the client and server
packets.

Each individual packet type has its own structure, which this documentation
site aims to illuminate in detail. Packets are typically made up of composite
structures that contain integers, strings, and unions/switches that allow
packets to have even more specific functions. This article in particular will
deal with the framing protocol and encryption scheme that is used by Pangya to
communicate - to understand the actual decrypted payloads, check out the
packet documentation instead.

## Saying Hello
Each service, that is, LoginService, GameService and MessageService, have
their own "hello" packet structure, for a packet which is sent from the server
to the client during initial connection. In common, all of them communicate
the encryption key index, as mentioned above, which is used to encrypt and
decrypt packets sent between the client and server.

**TODO**: Add hello packet structure for the various services.

## Framing Scheme
Each PangYa packet following the "hello" packet is encrypted, optionally
compressed using lzo1x compression, and embedded within a small frame
structure. The client and server frame structures differ slightly, but are
consistent across the different services.

**TODO**: Add packet frame header structure for the server and client side.

## Packet Flow
The TCP connection is treated as a bidirectional stream of messages. There is
no multiplexing; messages are sent serially, with frames adjacent to
each-other. Individual frames may be fragmented into multiple TCP packets, and
sometimes multiple small frames may be combined into a single TCP packet;
therefore, it is important that the TCP stream is segmented based on the
length field of the frame header.

The flow of PangYa packets themselves is defined by the service. Usually, the
client starts by sending an authentication packet of some kind, although the
mechanism differs reasonably between service.

**TODO**: Add some information about the general flow of packets for various
services.