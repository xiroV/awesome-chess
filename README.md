# AwesomeChess

Basic chess game developed using the [Love2D](https://love2d.org) game framework, using [TOVE](https://github.com/poke1024/tove2d) for displaying vector graphics. Still in early development (expect bugs), but mostly playable.

# Features
 - [x] Player vs. Player
 - [x] Player vs. AI
 - [x] *En passant*
 - [x] Castling
 - [x] Pawn promotion
 - [ ] HUD/UI
   - [x] Game Menu
   - [x] In-game HUD
   - [ ] Pause menu

If you think that something beyond this list is missing please don't hesitate to make an Issue. There might be special cases/rules I don't know about :) General feature requests are also welcome.

## Player vs. Player (local)
2 Player game where 2 players can compete against each other on the same computer.

## Player vs AI
1 Player game where the player compete against a AI. A number of different AI's are currently implemented. These are:

### AI Random 
Makes random choices by first choosing a available piece to move and then choose a position to move it to.

### AI Forward
Selects a random piece an moves it as far forward (closer to the opponents side) as possible.


# How to Play
You may clone the repository by cloning it from a terminal:

```
git clone https://github.com/xiroV/awesome-chess
```

Then change to the game directory

```
cd awesome-chess
```

To run the game

```
love .
```


# Acknowledgements
 - [Love2D](https://love2d.org/) was used as the game framework.
 - The font used in the game menu and for the title is the awesome font [Quicksand](https://github.com/andrew-paglinawan/QuicksandFamily) by [Andrew Paglinawan](https://github.com/andrew-paglinawan).
 - [Tove2D](https://github.com/poke1024/tove2d) was used for displaying vector graphics
 - [GOOi](https://github.com/tavuntu/gooi) was used for the menu

# License
All code, with the exception of the code in the [lib][1] folder, and [assets/fonts][2] folder, is licensed under the [MPLv2 License][3].

[1]: https://github.com/xiroV/awesome-chess/tree/master/lib
[2]: https://github.com/xiroV/awesome-chess/tree/master/assets/fonts
[3]: https://github.com/xiroV/awesome-chess/blob/master/LICENSE
