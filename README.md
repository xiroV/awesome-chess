# AwesomeChess

Basic chess game developed using the [Love2D](https://love2d.org) game framework, using [TOVE](https://github.com/poke1024/tove2d) for displaying vector graphics. Still a few special moves missing, but mostly playable.

# Features/TODO
 - [x] 2-player gameplay
 - [x] AI gameplay
 - [x] *En passant*
 - [x] Castling
 - [x] Pawn promotion
 - [x] Display valid piece moves
 - [x] Check for check
 - [x] Check for checkmate
 - [ ] HUD/UI
   - [x] Game Menu
   - [ ] In-game HUD (turn, latest moves, time, etc)
 - [x] Start screen
 - [ ] Clean-up code

## Player vs Player
2 Player game where 2 players can compete against each other. 

## Player vs AI
1 Player game where the player compete against a randomized AI. The AI will obey the rules of chess, but make random choices by first choosing a available piece to move and then choose a position to move it to. I hope to have time to implement a slightly more competent AI in the future.

If you think that something beyond this list is missing please don't hesitate to contact me. There might be special cases I don't know about :)

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
