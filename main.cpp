#include"chess.hpp"
#include"piece.hpp"
#include"rook.hpp"
#include"pawn.hpp"
#include"lib/raylib/src/raylib.h"
#include<vector>
#include<math.h>


bool positionEquals(Position* a, Position* b) {
    return a->x == b->x && a->y == b->y;
}

void control(Chess* game, std::vector<Piece*>* pieces) {
    if (game->turn == Turn::Player) {
        if (IsMouseButtonReleased(MOUSE_BUTTON_LEFT)) {
            Position newSelected;

            for (Piece* piece : *pieces) {
                Vector2 mousePosition = GetMousePosition();

                unsigned short pressedX = std::ceil((mousePosition.x-game->boardOffsetX)/game->cellSize)-1;
                unsigned short pressedY = std::ceil((mousePosition.y-game->boardOffsetY)/game->cellSize)-1;

                Position pressed = { pressedX, pressedY };

                if (positionEquals(&piece->position, &pressed)) {
                    game->selected = pressed;
                }        
            }
        }
    }        
}

void drawBoard(Chess* game) {
    bool white = true;

    for (int row = 0; row < 8; row++) {
        white = !white;
        for (int col = 0; col < 8; col++) {
            Color color;
            if (white) {
                color = WHITE;
            } else {
                color = GRAY;
            }

            DrawRectangle(
                game->boardOffsetX + col * game->cellSize,
                game->boardOffsetY + row * game->cellSize,
                game->cellSize,
                game->cellSize,
                color
            );
            white = !white;
        }
    }
}

void drawPieces(Chess* game, std::vector<Piece*>* pieces) {
    for (Piece* piece : *pieces) {
        piece->draw(game);
    }
}

void drawSelection(Chess* game) {
    if (!positionEquals(&game->selected, &NoPosition)) {
        DrawRectangleLinesEx(
            {
                float(game->boardOffsetX + game->cellSize * game->selected.x),
                float(game->boardOffsetY + game->cellSize * game->selected.y),
                float(game->cellSize),
                float(game->cellSize),
            },
            2,
            GREEN
        );
    }
}


int main(int argc, char **argv) {
    Chess game = Chess();

    InitWindow(game.windowWidth, game.windowHeight, game.title.c_str());
    SetTargetFPS(60);

    Pawn whitePawn1 = Pawn(WHITE, "white_pawn_1", {0, 6});
    Pawn whitePawn2 = Pawn(WHITE, "white_pawn_2", {1, 6});
    Pawn whitePawn3 = Pawn(WHITE, "white_pawn_2", {2, 6});
    Pawn whitePawn4 = Pawn(WHITE, "white_pawn_2", {3, 6});
    Pawn whitePawn5 = Pawn(WHITE, "white_pawn_2", {4, 6});
    Pawn whitePawn6 = Pawn(WHITE, "white_pawn_2", {5, 6});
    Pawn whitePawn7 = Pawn(WHITE, "white_pawn_2", {6, 6});
    Pawn whitePawn8 = Pawn(WHITE, "white_pawn_2", {7, 6});

    Pawn blackPawn1 = Pawn(BLACK, "white_pawn_1", {0, 1});
    Pawn blackPawn2 = Pawn(BLACK, "white_pawn_2", {1, 1});
    Pawn blackPawn3 = Pawn(BLACK, "white_pawn_2", {2, 1});
    Pawn blackPawn4 = Pawn(BLACK, "white_pawn_2", {3, 1});
    Pawn blackPawn5 = Pawn(BLACK, "white_pawn_2", {4, 1});
    Pawn blackPawn6 = Pawn(BLACK, "white_pawn_2", {5, 1});
    Pawn blackPawn7 = Pawn(BLACK, "white_pawn_2", {6, 1});
    Pawn blackPawn8 = Pawn(BLACK, "white_pawn_2", {7, 1});


    std::vector<Piece*> pieces = {
        &whitePawn1,
        &whitePawn2,
        &whitePawn3,
        &whitePawn4,
        &whitePawn5,
        &whitePawn6,
        &whitePawn7,
        &whitePawn8,
        &blackPawn1,
        &blackPawn2,
        &blackPawn3,
        &blackPawn4,
        &blackPawn5,
        &blackPawn6,
        &blackPawn7,
        &blackPawn8,
    };


    while (!WindowShouldClose()) {
        control(&game, &pieces);

        BeginDrawing();
            ClearBackground(DARKGRAY);

            drawBoard(&game);
            drawSelection(&game);
            drawPieces(&game, &pieces);

        EndDrawing();
    }

    CloseWindow();

    return 0;
    
}
