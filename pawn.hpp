#include "lib/raylib/src/raylib.h"
#include"piece.hpp"

#ifndef __PAWN_HPP__
#define __PAWN_HPP__

struct Pawn: Piece {
    Pawn(Color color, std::string name, Position position) {
        this->kind = PieceKind::Pawn;
        this->color = color;
        this->name = name;
        this->position = position;

        if (ColorIsEqual(color, WHITE)) {
            Image image = LoadImage("assets/pieces/pawn_white.png");
            this->sprite = LoadTextureFromImage(image);
        } else {
            Image image = LoadImage("assets/pieces/pawn_black.png");
            this->sprite = LoadTextureFromImage(image);
        }
    }

    void draw(Chess* game) {
        DrawTextureEx(
            this->sprite,
            {
                float((game->cellSize * (this->position.x + 1)) + game->boardOffsetX - game->cellSize)+3,
                float((game->cellSize * (this->position.y + 1)) + game->boardOffsetY - game->cellSize)-15,
            },
            0,
            2,
            WHITE
        );
    }

    void getPossibleMoves() {

    }
};

#endif
