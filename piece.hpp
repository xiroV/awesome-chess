#include<string>
#include"lib/raylib/src/raylib.h"
#include"chess.hpp"

#ifndef __PIECE_HPP__
#define __PIECE_HPP__

enum class PieceKind {
    King,
    Queen,
    Rook,
    Bishop,
    Knight,
    Pawn
};

struct Piece {
    std::string name;
    PieceKind kind;
    Color color;
    Position position;
    Texture2D sprite;
    
    virtual void getPossibleMoves() = 0;
    virtual void draw(Chess* game) = 0;
    virtual ~Piece() = default;
};

#endif
