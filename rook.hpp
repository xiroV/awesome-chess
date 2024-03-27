#include"piece.hpp"

#ifndef __ROOK_HPP__
#define __ROOK_HPP__

struct Rook : Piece {
    Rook(Color color, std::string name, Position position) {
        this->kind = PieceKind::Rook;
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
