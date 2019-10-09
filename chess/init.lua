
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
            cen_x = cen_x + 96
            x = x + 96
        end
        x = x-768
        cen_x = cen_x-768
        cen_y = cen_y + 96
        y = y + 96
    end

    positions["e8"].piece = {color="black", name="king", asset=bking, kind="king"}
    positions["d8"].piece = {color="black", name="queen", asset=bqueen, kind="queen"}
    positions["a8"].piece = {color="black", name="rook1", asset=brook, kind="rook"}
    positions["h8"].piece = {color="black", name="rook2", asset=brook, kind="rook"}
    positions["c8"].piece = {color="black", name="bishop1", asset=bbishop, kind="bishop"}
    positions["f8"].piece = {color="black", name="bishop2", asset=bbishop, kind="bishop"}
    positions["g8"].piece = {color="black", name="knight1", asset=bknight, kind="knight"}
    positions["b8"].piece = {color="black", name="knight2", asset=bknight, kind="knight"}
    positions["a7"].piece = {color="black", name="pawn1", asset=bpawn, kind="pawn"}
    positions["b7"].piece = {color="black", name="pawn2", asset=bpawn, kind="pawn"}
    positions["c7"].piece = {color="black", name="pawn3", asset=bpawn, kind="pawn"}
    positions["d7"].piece = {color="black", name="pawn4", asset=bpawn, kind="pawn"}
    positions["e7"].piece = {color="black", name="pawn5", asset=bpawn, kind="pawn"}
    positions["f7"].piece = {color="black", name="pawn6", asset=bpawn, kind="pawn"}
    positions["g7"].piece = {color="black", name="pawn7", asset=bpawn, kind="pawn"}
    positions["h7"].piece = {color="black", name="pawn8", asset=bpawn, kind="pawn"}
    positions["e1"].piece = {color="white", name="king", asset=wking, kind="king"}
    positions["d1"].piece = {color="white", name="queen", asset=wqueen, kind="queen"}
    positions["a1"].piece = {color="white", name="rook1", asset=wrook, kind="rook"}
    positions["h1"].piece = {color="white", name="rook2", asset=wrook, kind="rook"}
    positions["c1"].piece = {color="white", name="bishop1", asset=wbishop, kind="bishop"}
    positions["f1"].piece = {color="white", name="bishop2", asset=wbishop, kind="bishop"}
    positions["g1"].piece = {color="white", name="knight1", asset=wknight, kind="knight"}
    positions["b1"].piece = {color="white", name="knight2", asset=wknight, kind="knight"}
    positions["a2"].piece = {color="white", name="pawn1", asset=wpawn, kind="pawn"}
    positions["b2"].piece = {color="white", name="pawn2", asset=wpawn, kind="pawn"}
    positions["c2"].piece = {color="white", name="pawn3", asset=wpawn, kind="pawn"}
    positions["d2"].piece = {color="white", name="pawn4", asset=wpawn, kind="pawn"}
    positions["e2"].piece = {color="white", name="pawn5", asset=wpawn, kind="pawn"}
    positions["f2"].piece = {color="white", name="pawn6", asset=wpawn, kind="pawn"}
    positions["g2"].piece = {color="white", name="pawn7", asset=wpawn, kind="pawn"}
    positions["h2"].piece = {color="white", name="pawn8", asset=wpawn, kind="pawn"}
    

    initMenu() 

end

