
function love.load()
    menu_font = love.graphics.newFont("assets/Quicksand-Medium.ttf", 24)
    title_font = love.graphics.newFont("assets/Quicksand-Medium.ttf", 50)

    winWidth = love.graphics.getWidth()
    winHeight = love.graphics.getHeight()
    menuWidth = 430
    menuHeight = 150

    aiType = nil

    menuActive = true

    possibleMoves = {}    

    selectedPos = nil
    selectedPiece = nil
    selectedFile = nil
    selectedRank = nil

    colorTurn = "white"

    pieceKinds = {"pawn", "rook", "bishop", "knight", "queen", "king"}
    ranks = {1, 2, 3, 4, 5, 6, 7, 8}
    files = {"a", "b", "c", "d", "e", "f", "g", "h"}


    board = love.filesystem.read("assets/board.svg")
    theBoard = tove.newGraphics(board, 800)

    whitePawn = love.filesystem.read("assets/pawn_white.svg")
    wpawn = tove.newGraphics(whitePawn, 70)

    whiteRook = love.filesystem.read("assets/rook_white.svg")
    wrook = tove.newGraphics(whiteRook, 80)

    whiteKnight = love.filesystem.read("assets/knight_white.svg")
    wknight = tove.newGraphics(whiteKnight, 90)

    whiteBishop = love.filesystem.read("assets/bishop_white.svg")
    wbishop = tove.newGraphics(whiteBishop, 100)

    whiteKing = love.filesystem.read("assets/king_white.svg")
    wking = tove.newGraphics(whiteKing, 100)

    whiteQueen = love.filesystem.read("assets/queen_white.svg")
    wqueen = tove.newGraphics(whiteQueen, 90)


    blackPawn = love.filesystem.read("assets/pawn_black.svg")
    bpawn = tove.newGraphics(blackPawn, 70)

    blackRook = love.filesystem.read("assets/rook_black.svg")
    brook = tove.newGraphics(blackRook, 80)

    blackKnight = love.filesystem.read("assets/knight_black.svg")
    bknight = tove.newGraphics(blackKnight, 90)

    blackBishop = love.filesystem.read("assets/bishop_black.svg")
    bbishop = tove.newGraphics(blackBishop, 100)

    blackKing = love.filesystem.read("assets/king_black.svg")
    bking = tove.newGraphics(blackKing, 100)

    blackQueen = love.filesystem.read("assets/queen_black.svg")
    bqueen = tove.newGraphics(blackQueen, 90)

    previousMove = {from="", to=""}

    cen_x = 65
    cen_y = 45
    x = 19
    y = 19

    positions = {}
    for i=8,1,-1 do
        for j=1,8,1 do
            pos = files[j]..ranks[i]
            positions[pos] = {center_x=cen_x, center_y=cen_y, x=x, y=y, file=j, rank=i}
            if pos == "e8" then positions[pos].piece = {color="black", name="king", asset=bking, kind="king"}
            elseif pos == "d8" then positions[pos].piece = {color="black", name="queen", asset=bqueen, kind="queen"}
            elseif pos == "a8" then positions[pos].piece = {color="black", name="rook1", asset=brook, kind="rook"}
            elseif pos == "h8" then positions[pos].piece = {color="black", name="rook2", asset=brook, kind="rook"}
            elseif pos == "c8" then positions[pos].piece = {color="black", name="bishop1", asset=bbishop, kind="bishop"}
            elseif pos == "f8" then positions[pos].piece = {color="black", name="bishop2", asset=bbishop, kind="bishop"}
            elseif pos == "g8" then positions[pos].piece = {color="black", name="knight1", asset=bknight, kind="knight"}
            elseif pos == "b8" then positions[pos].piece = {color="black", name="knight2", asset=bknight, kind="knight"}
            elseif pos == "a7" then positions[pos].piece = {color="black", name="pawn1", asset=bpawn, kind="pawn"}
            elseif pos == "b7" then positions[pos].piece = {color="black", name="pawn2", asset=bpawn, kind="pawn"}
            elseif pos == "c7" then positions[pos].piece = {color="black", name="pawn3", asset=bpawn, kind="pawn"}
            elseif pos == "d7" then positions[pos].piece = {color="black", name="pawn4", asset=bpawn, kind="pawn"}
            elseif pos == "e7" then positions[pos].piece = {color="black", name="pawn5", asset=bpawn, kind="pawn"}
            elseif pos == "f7" then positions[pos].piece = {color="black", name="pawn6", asset=bpawn, kind="pawn"}
            elseif pos == "g7" then positions[pos].piece = {color="black", name="pawn7", asset=bpawn, kind="pawn"}
            elseif pos == "h7" then positions[pos].piece = {color="black", name="pawn8", asset=bpawn, kind="pawn"}
            elseif pos == "e1" then positions[pos].piece = {color="white", name="king", asset=wking, kind="king"}
            elseif pos == "d1" then positions[pos].piece = {color="white", name="queen", asset=wqueen, kind="queen"}
            elseif pos == "a1" then positions[pos].piece = {color="white", name="rook1", asset=wrook, kind="rook"}
            elseif pos == "h1" then positions[pos].piece = {color="white", name="rook2", asset=wrook, kind="rook"}
            elseif pos == "c1" then positions[pos].piece = {color="white", name="bishop1", asset=wbishop, kind="bishop"}
            elseif pos == "f1" then positions[pos].piece = {color="white", name="bishop2", asset=wbishop, kind="bishop"}
            elseif pos == "g1" then positions[pos].piece = {color="white", name="knight1", asset=wknight, kind="knight"}
            elseif pos == "b1" then positions[pos].piece = {color="white", name="knight2", asset=wknight, kind="knight"}
            elseif pos == "a2" then positions[pos].piece = {color="white", name="pawn1", asset=wpawn, kind="pawn"}
            elseif pos == "b2" then positions[pos].piece = {color="white", name="pawn2", asset=wpawn, kind="pawn"}
            elseif pos == "c2" then positions[pos].piece = {color="white", name="pawn3", asset=wpawn, kind="pawn"}
            elseif pos == "d2" then positions[pos].piece = {color="white", name="pawn4", asset=wpawn, kind="pawn"}
            elseif pos == "e2" then positions[pos].piece = {color="white", name="pawn5", asset=wpawn, kind="pawn"}
            elseif pos == "f2" then positions[pos].piece = {color="white", name="pawn6", asset=wpawn, kind="pawn"}
            elseif pos == "g2" then positions[pos].piece = {color="white", name="pawn7", asset=wpawn, kind="pawn"}
            elseif pos == "h2" then positions[pos].piece = {color="white", name="pawn8", asset=wpawn, kind="pawn"}
            end

            cen_x = cen_x + 96
            x = x + 96
        end
        x = x-768
        cen_x = cen_x-768
        cen_y = cen_y + 96
        y = y + 96
    end


    initMenu() 

end

