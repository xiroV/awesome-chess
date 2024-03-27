#include"piece.hpp"

#ifndef __PAWN_HPP__
#define __PAWN_HPP__

struct Pawn: Piece {
    Pawn(Color color, std::string name, Position position) {
        this->kind = PieceKind::Pawn;
        this->color = color;
        this->name = name;
        this->position = position;
    }

    void draw(Chess* game) {
        DrawCircle(
            (game->cellSize * (this->position.x + 1)) + game->boardOffsetX - game->cellSize/2,
            (game->cellSize * (this->position.y + 1)) + game->boardOffsetY - game->cellSize/2,
            20,
            this->color
        );
    }

    void getPossibleMoves() {

    }
};

#endif
