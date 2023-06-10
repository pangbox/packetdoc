# Tournament / Match End

This event is triggered when all players in tournament/match have holed out or forfeit, and the tournament/match ends.

All matches and tournaments trigger the following packets:
* [GameService Client 0x0006 Match Statistics Submit](/packets/gameservice/client/0006.ksy),
  * (unless this event has been triggered by [GameService Client 0x00aa Match Statistics Submit (Tiki Report)](/packets/gameservice/client/00aa.ksy))
* [GameService Server 0x0133 Treasure Point Result](/packets/gameservice/server/0133.ksy),
  * (unless there are no items to give)
* [GameService Server 0x0134 Treasure Point Winnings](/packets/gameservice/server/0134.ksy),
* [GameService Server 0x0216 User Status Update](/packets/gameservice/server/0216.ksy),
* [GameService Server 0x022E Achievement Unlocked](/packets/gameservice/server/022e.ksy),
* [GameService Server 0x0220 Achievement Update](/packets/gameservice/server/0220.ksy),
* GameService Server 0x0244 Undocumented, and
* [GameService Server 0x00C8 Pang Balance](/packets/gameservice/server/00c8.ksy).

A match, but not a tournament, also triggers:
* [GameService Server 0x00FA Room Bonus Collectables Result](/packets/gameservice/server/00fa.ksy).

A tournament, but not a match, also triggers:
* [GameService Server 0x00CE Tournament Item Winnings](/packets/gameservice/server/00ce.ksy).

A match or tournament ending also triggers rejoining the waiting area for the room, thus:
* [GameService Server 0x004A Room Settings Announce](/packets/gameservice/server/004a.ksy).
