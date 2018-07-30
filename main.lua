require "lib/tove"

function table.len(T)
    if T == nil then
        return 0
    end
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

local colorTurn = "white"

function getEnemyColor(color)
    if color == "white" then
        return "black"
    else
        return "white"
    end
end

local pieceKinds = {"pawn", "rook", "bishop", "knight", "queen", "king"}
local ranks = {1, 2, 3, 4, 5, 6, 7, 8}
local files = {"a", "b", "c", "d", "e", "f", "g", "h"}

local board = love.filesystem.read("assets/board.svg")
local theBoard = tove.newGraphics(board, 800)


local whitePawn = love.filesystem.read("assets/pawn_white.svg")
local wpawn = tove.newGraphics(whitePawn, 70)

local whiteRook = love.filesystem.read("assets/rook_white.svg")
local wrook = tove.newGraphics(whiteRook, 80)

local whiteKnight = love.filesystem.read("assets/knight_white.svg")
local wknight = tove.newGraphics(whiteKnight, 90)

local whiteBishop = love.filesystem.read("assets/bishop_white.svg")
local wbishop = tove.newGraphics(whiteBishop, 100)

local whiteKing = love.filesystem.read("assets/king_white.svg")
local wking = tove.newGraphics(whiteKing, 100)

local whiteQueen = love.filesystem.read("assets/queen_white.svg")
local wqueen = tove.newGraphics(whiteQueen, 90)


local blackPawn = love.filesystem.read("assets/pawn_black.svg")
local bpawn = tove.newGraphics(blackPawn, 70)

local blackRook = love.filesystem.read("assets/rook_black.svg")
local brook = tove.newGraphics(blackRook, 80)

local blackKnight = love.filesystem.read("assets/knight_black.svg")
local bknight = tove.newGraphics(blackKnight, 90)

local blackBishop = love.filesystem.read("assets/bishop_black.svg")
local bbishop = tove.newGraphics(blackBishop, 100)

local blackKing = love.filesystem.read("assets/king_black.svg")
local bking = tove.newGraphics(blackKing, 100)

local blackQueen = love.filesystem.read("assets/queen_black.svg")
local bqueen = tove.newGraphics(blackQueen, 90)



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

function posOccupied(pos)
    if positions[pos].piece == nil then
        return false
    else
        return true
    end
end

function love.load()
    possibleMoves = {}    
end

function getAllPosMoves(piece, file, rank, color)
    if piece == "king" then
        posMoves = {}
        -- Vertical movement
        if rank < 8 then
            if posOccupied(files[file]..ranks[rank+1]) then
                if positions[files[file]..ranks[rank+1]].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = files[file]..ranks[rank+1]
                end
            else
                posMoves[#posMoves+1] = files[file]..ranks[rank+1]
            end
        end
        if rank > 1 then 
            if posOccupied(files[file]..ranks[rank-1]) then
                if positions[files[file]..ranks[rank-1]].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = files[file]..ranks[rank-1]
                end
            else
                posMoves[#posMoves+1] = files[file]..ranks[rank-1]
            end
        end

        -- Horizontal movement
        if file < 8 then
            if posOccupied(files[file+1]..ranks[rank]) then
                if positions[files[file+1]..ranks[rank]].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = files[file+1]..ranks[rank]
                end
            else
                posMoves[#posMoves+1] = files[file+1]..ranks[rank]
            end
        end
        if file > 1 then
            if posOccupied(files[file-1]..ranks[rank]) then
                if positions[files[file-1]..ranks[rank]].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = files[file-1]..ranks[rank]
                end
            else
                posMoves[#posMoves+1] = files[file-1]..ranks[rank]
            end
        end

        -- Diagonal movement
        if file < 8 and rank < 8 then
            if posOccupied(files[file+1]..ranks[rank+1]) then
                if positions[files[file+1]..ranks[rank+1]].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = files[file+1]..ranks[rank+1]
                end
            else
                posMoves[#posMoves+1] = files[file+1]..ranks[rank+1]
            end
        end
        if file > 1 and rank > 1 then
            if posOccupied(files[file-1]..ranks[rank-1]) then
                if positions[files[file-1]..ranks[rank-1]].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = files[file-1]..ranks[rank-1]
                end
            else
                posMoves[#posMoves+1] = files[file-1]..ranks[rank-1]
            end
        end
        if file > 1 and rank < 8 then
            if posOccupied(files[file-1]..ranks[rank+1]) then
                if positions[files[file-1]..ranks[rank+1]].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = files[file-1]..ranks[rank+1]
                end
            else
                posMoves[#posMoves+1] = files[file-1]..ranks[rank+1]
            end
        end
        if file < 8 and rank > 1 then
            if posOccupied(files[file+1]..ranks[rank-1]) then
                if positions[files[file+1]..ranks[rank-1]].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = files[file+1]..ranks[rank-1]
                end
            else
                posMoves[#posMoves+1] = files[file+1]..ranks[rank-1]
            end
        end

        return posMoves
    elseif piece == "queen" then
        posMoves = {}

        -- Horizontal/Vertical moves
        r = rank
        while r > 1 do
            posMove = files[file]..ranks[r-1]
            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                    break
                else
                    break
                end
            end
            posMoves[#posMoves+1] = posMove
            r = r - 1
        end
        r = rank
        while r < 8 do
            posMove = files[file]..ranks[r+1]
            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                    break
                else
                    break
                end
            end
            posMoves[#posMoves+1] = posMove

            r = r + 1
        end
        f = file
        while f > 1 do
            posMove = files[f-1]..ranks[rank]
            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                    break
                else
                    break
                end
            end
            posMoves[#posMoves+1] = posMove

            f = f - 1
        end
        f = file
        while f < 8 do
            posMove = files[f+1]..ranks[rank]
            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                    break
                else
                    break
                end
            end
            posMoves[#posMoves+1] = posMove

            f = f + 1
        end

        -- Diagonal moves
        r = rank
        f = file
        while r > 1 and f > 1 do
            posMove = files[f-1]..ranks[r-1]
            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                    break
                else
                    break
                end
            end
            posMoves[#posMoves+1] = posMove
            r = r - 1
            f = f - 1
        end
        r = rank
        f = file
        while r < 8 and f > 1 do
            posMove = files[f-1]..ranks[r+1]
            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                    break
                else
                    break
                end
            end
            posMoves[#posMoves+1] = posMove

            r = r + 1
            f = f - 1 
        end
        r = rank
        f = file
        while r > 1 and f < 8 do
            posMove = files[f+1]..ranks[r-1]
            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                    break
                else
                    break
                end
            end
            posMoves[#posMoves+1] = posMove

            r = r - 1
            f = f + 1
        end
        r = rank
        f = file
        while r < 8 and f < 8 do
            posMove = files[f+1]..ranks[r+1]
            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                    break
                else
                    break
                end
            end
            posMoves[#posMoves+1] = posMove

            r = r + 1
            f = f + 1
        end
        
        return posMoves

    elseif piece == "rook" then
        posMoves = {}
        r = rank
        while r > 1 do
            posMove = files[file]..ranks[r-1]
            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                    break
                else
                    break
                end
            end
            posMoves[#posMoves+1] = posMove
            r = r - 1
        end
        r = rank
        while r < 8 do
            posMove = files[file]..ranks[r+1]
            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                    break
                else
                    break
                end
            end
            posMoves[#posMoves+1] = posMove

            r = r + 1
        end
        f = file
        while f > 1 do
            posMove = files[f-1]..ranks[rank]
            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                    break
                else
                    break
                end
            end
            posMoves[#posMoves+1] = posMove

            f = f - 1
        end
        f = file
        while f < 8 do
            posMove = files[f+1]..ranks[rank]
            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                    break
                else
                    break
                end
            end
            posMoves[#posMoves+1] = posMove

            f = f + 1
        end

        return posMoves

    elseif piece == "knight" then
        -- Knight Logic
        posMoves = {}
        if rank > 1 and file > 2 then
            posMove = files[file-2]..ranks[rank-1]
            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                end
            else
                posMoves[#posMoves+1] = posMove
            end
        end
        if rank > 2 and file > 1 then
            posMove = files[file-1]..ranks[rank-2]
            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                end
            else
                posMoves[#posMoves+1] = posMove
            end
        end
        if rank > 1 and file < 7 then
            posMove = files[file+2]..ranks[rank-1]

            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                end
            else
                posMoves[#posMoves+1] = posMove
            end
        end
        if rank > 2 and file < 8 then
            posMove = files[file+1]..ranks[rank-2]

            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                end
            else
                posMoves[#posMoves+1] = posMove
            end
        end
        if rank < 8 and file > 2 then
            posMove = files[file-2]..ranks[rank+1]

            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                end
            else
                posMoves[#posMoves+1] = posMove
            end
        end
        if rank < 7 and file > 1 then
            posMove = files[file-1]..ranks[rank+2]

            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                end
            else
                posMoves[#posMoves+1] = posMove
            end
        end
        if rank < 8 and file < 7 then
            posMove = files[file+2]..ranks[rank+1]

            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                end
            else
                posMoves[#posMoves+1] = posMove
            end
        end
        if rank < 7 and file < 8 then
            posMove = files[file+1]..ranks[rank+2]

            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                end
            else
                posMoves[#posMoves+1] = posMove
            end
        end

        return posMoves
    elseif piece == "bishop" then
        -- Bishop logic
        posMoves = {}

        r = rank
        f = file
        while r > 1 and f > 1 do
            posMove = files[f-1]..ranks[r-1]
            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                    break
                else
                    break
                end
            end
            posMoves[#posMoves+1] = posMove
            r = r - 1
            f = f - 1
        end
        r = rank
        f = file
        while r < 8 and f > 1 do
            posMove = files[f-1]..ranks[r+1]
            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                    break
                else
                    break
                end
            end
            posMoves[#posMoves+1] = posMove

            r = r + 1
            f = f - 1 
        end
        r = rank
        f = file
        while r > 1 and f < 8 do
            posMove = files[f+1]..ranks[r-1]
            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                    break
                else
                    break
                end
            end
            posMoves[#posMoves+1] = posMove

            r = r - 1
            f = f + 1
        end
        r = rank
        f = file
        while r < 8 and f < 8 do
            posMove = files[f+1]..ranks[r+1]
            if posOccupied(posMove) then
                if positions[posMove].piece.color == getEnemyColor(color) then
                    posMoves[#posMoves+1] = posMove
                    break
                else
                    break
                end
            end
            posMoves[#posMoves+1] = posMove

            r = r + 1
            f = f + 1
        end

        return posMoves

    elseif piece == "pawn" then
        posMoves = {}
        if color == "black" then
            if rank > 1 then
                if not posOccupied(files[file]..ranks[rank-1]) then
                    posMoves[#posMoves+1] = files[file]..ranks[rank-1]

                    -- Start move (2)
                    if rank == 7 then
                        if not posOccupied(files[file]..ranks[rank-2]) then
                            posMoves[#posMoves+1] = files[file]..ranks[rank-2]
                        end
                    end
                end

                -- Check for capture possibility
                if file > 1 then
                    if posOccupied(files[file-1]..ranks[rank-1]) then
                        if positions[files[file-1]..ranks[rank-1]].piece.color == getEnemyColor(color) then
                            posMoves[#posMoves+1] = files[file-1]..ranks[rank-1]
                        end
                    end
                end

                if file < 8 then
                    if posOccupied(files[file+1]..ranks[rank-1]) then
                        if positions[files[file+1]..ranks[rank-1]].piece.color == getEnemyColor(color) then
                            posMoves[#posMoves+1] = files[file+1]..ranks[rank-1]
                        end
                    end 
                end
            end
        else
            if rank < 8 then
                if not posOccupied(files[file]..ranks[rank+1]) then
                    posMoves[#posMoves+1] = files[file]..ranks[rank+1]

                    -- Start move (2)
                    if rank == 2 then
                        if not posOccupied(files[file]..ranks[rank+2]) then
                            posMoves[#posMoves+1] = files[file]..ranks[rank+2]
                        end
                    end
                end

                -- Check for capture possibility
                if file > 1 then 
                    if posOccupied(files[file-1]..ranks[rank+1]) then
                        if positions[files[file-1]..ranks[rank+1]].piece.color == getEnemyColor(color) then
                            posMoves[#posMoves+1] = files[file-1]..ranks[rank+1]
                        end
                    end
                end 

                if file < 8 then 
                    if posOccupied(files[file+1]..ranks[rank+1]) then
                        if positions[files[file+1]..ranks[rank+1]].piece.color == getEnemyColor(color) then
                            posMoves[#posMoves+1] = files[file+1]..ranks[rank+1]
                        end
                    end 
                end
            end
        end
        return posMoves
    else
        return {}
    end
end

local selectedPos = nil
local selectedPiece = nil
local selectedFile = nil
local selectedRank = nil

function isCheck(color)
    for i=8,1,-1 do
        for j=1,8,1 do
            pos = files[i]..ranks[j]
            if posOccupied(pos) then
                if positions[pos].piece.color == getEnemyColor(color) then
                    posMoves = getAllPosMoves(positions[pos].piece.kind, i, j, getEnemyColor(color))

                    for p=1, table.len(posMoves), 1 do
                        if posOccupied(posMoves[p]) then
                            if positions[posMoves[p]].piece.color == colorTurn and positions[posMoves[p]].piece.kind == "king" then
                                return true
                            end
                        end
                    end
                end
            end
        end
    end
    return false
end

function isCheckmate(color)
    if isCheck(color) then
        -- Get all possible check moves
        for i=8,1,-1 do
            for j=1,8,1 do
                pos = files[i]..ranks[j]
                if posOccupied(pos) then
                    if positions[pos].piece.color == color then
                        posMoves = getPosCheckMoves(positions[pos].piece.kind, i, j, color)
                        if #posMoves > 0 then
                            return false
                        end
                    end
                end
            end
        end
        return true
    end
    return false
end


function movePiece(from_pos, to_pos, simulate)
    -- TODO implement tracking of removed pieces
    movingPiece = positions[from_pos].piece
    positions[from_pos].piece = nil
    positions[to_pos].piece = movingPiece


    if not simulate then
        print(colorTurn.." moving "..movingPiece.kind.." from "..from_pos.." to "..to_pos)


        -- reset selection
        selectedPos = nil
        selectedPiece = nil
        selectedFile = nil
        selectedRank = nil
        possibleMoves = {}

        colorTurn = getEnemyColor(colorTurn)    

        if isCheck(colorTurn) then
            if isCheckmate(colorTurn) then
                print(colorTurn.." is checkmate, thanks for playing!")
            else
                print(colorTurn.." is check")
            end
        end
    end
end

function getPosCheckMoves(piece, file, rank, color)
    allPosMoves = getAllPosMoves(piece, file, rank, color)
    checkedPosMoves = {}
    curPos = files[file]..ranks[rank]

    -- Simulate moves
    for p=1, #allPosMoves, 1 do
        oldPiece = positions[allPosMoves[p]].piece
        positions[allPosMoves[p]].piece = positions[curPos].piece
        positions[curPos].piece = oldPiece
        if not isCheck(color) then
            checkedPosMoves[#checkedPosMoves+1] = allPosMoves[p]
        end
        positions[curPos].piece = positions[allPosMoves[p]].piece
        positions[allPosMoves[p]].piece = oldPiece 
    end

    return checkedPosMoves
end

function moveMakesCheck(from_pos, to_pos, color)
    makesCheck = false
    oldPiece = positions[to_pos].piece
    positions[to_pos].piece = positions[from_pos].piece
    positions[from_pos].piece = nil
    if isCheck(color) then
        makesCheck = true
    end
    positions[from_pos].piece = positions[to_pos].piece
    positions[to_pos].piece = oldPiece 

    return makesCheck
end

function getPosMoves(piece, file, rank, color)
    returnMoves = {}
    if isCheck(colorTurn) then
        returnMoves = getPosCheckMoves(piece, file, rank, color)
    else
        allMoves = getAllPosMoves(piece, file, rank, color)

        if allMoves ~= nil then
            for m=1,#allMoves,1 do
                if not moveMakesCheck(files[file]..ranks[rank], allMoves[m], color) then
                    returnMoves[#returnMoves+1] = allMoves[m]
                end
            end
        end
    end

    return returnMoves
end



function love.mousepressed(x, y, button, istouch)
    if button == 1 then
        for i=8,1,-1 do
            for j=1,8,1 do
                pos=files[j]..ranks[i]
                if x >= positions[pos].x and x < positions[pos].x + 96
                    and y >= positions[pos].y and y < positions[pos].y + 96 then
                    if positions[pos].piece ~= nil and positions[pos].piece.color == colorTurn then
                        selectedPos = pos
                        selectedPiece = positions[pos].piece.kind
                        selectedFile = positions[pos].file
                        selectedRank = positions[pos].rank
                        possibleMoves = getPosMoves(selectedPiece, selectedFile, selectedRank, colorTurn)
                    elseif positions[pos].piece == nil or positions[pos].piece.color == getEnemyColor(colorTurn) then
                        for k=1,#possibleMoves,1 do
                            if pos == possibleMoves[k] then
                                movePiece(selectedPos, pos, false)
                                break
                            end
                        end
                    end
                end
            end
        end
    end
end

function love.draw()
    love.graphics.translate(400, 400)
    theBoard:draw()

    love.graphics.origin()

    -- Draw pieces
    for i=8,1,-1 do
        for j=1,8,1 do
            pos=files[j]..ranks[i]
            
            -- Mark possible moves
            if table.len(possibleMoves) > 0 then
                for k=1,table.len(possibleMoves),1 do
                    if possibleMoves[k] == pos then
                        love.graphics.setColor(0, 1, 0, 1)
                        love.graphics.setLineWidth(5)
                        love.graphics.rectangle("line", positions[pos].x, positions[pos].y, 91, 91)
                        love.graphics.reset()
                    end
                end 
            end

            -- Mark selected move
            if selectedPos == pos then
                love.graphics.setColor(0, 1, 0, 1)
                love.graphics.setLineWidth(5)
                love.graphics.rectangle("line", positions[pos].x, positions[pos].y, 91, 91)
                love.graphics.reset()
            end

            if positions[pos].piece ~= nil then
                love.graphics.translate(positions[pos].center_x, positions[pos].center_y)
                positions[pos].piece.asset:draw()
                love.graphics.origin()
            end
        end
    end

end

