#ifndef __CHESS_HPP__
#define __CHESS_HPP__
#include<string>

enum class Turn {
    Player,
    AI
};

struct Position {
    unsigned short x;
    unsigned short y;
};

Position NoPosition = {
    10,
    10
};

struct Chess {
    std::string title = "Awesome Chess";
    int windowHeight = 600;
    int windowWidth = 800;
    int cellSize = 70;
    int boardOffsetX = 20;
    int boardOffsetY = 20;
    Turn turn = Turn::Player;
    Position selected = NoPosition;
};

#endif
