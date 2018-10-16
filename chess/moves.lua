require"chess/utils"
require"chess/moves/king"
require"chess/moves/queen"
require"chess/moves/bishop"
require"chess/moves/rook"
require"chess/moves/knight"
require"chess/moves/pawn"

function markPosition(pos)
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.setLineWidth(5)
    love.graphics.rectangle("line", positions[pos].x, positions[pos].y, 91, 91)
    love.graphics.reset()
end

function movePiece(from_file, from_rank, to_file, to_rank)
    -- TODO implement tracking of removed pieces
    from_pos = files[from_file]..ranks[from_rank]
    to_pos = files[to_file]..ranks[to_rank]
    
    movingPiece = positions[from_pos].piece
    positions[from_pos].piece = nil
    positions[to_pos].piece = movingPiece

    -- Detect En passant
    if movingPiece.kind == "pawn" then
        if movingPiece.color == "white" then
            if from_rank == 5 then
                if to_rank == 6 then
                    if from_file < 8 then
                        if previousMove["from"] == files[from_file+1]..ranks[from_rank+2] then
                            if previousMove["to"] == files[from_file+1]..ranks[from_rank] then
                                if to_file == from_file+1 then
                                    positions[files[to_file]..ranks[to_rank-1]].piece = nil
                                end
                            end
                        end
                    end
                    if from_file > 1 then
                        if previousMove["from"] == files[from_file-1]..ranks[from_rank+2] then
                            if previousMove["to"] == files[from_file-1]..ranks[from_rank] then
                                if to_file == from_file-1 then
                                    positions[files[to_file]..ranks[to_rank-1]].piece = nil
                                end
                            end
                        end
                    end
                end
            end
        else
            if from_rank == 4 then
                if to_rank == 3 then
                    if from_file < 8 then
                        if previousMove["from"] == files[from_file+1]..ranks[from_rank-2] then
                            if previousMove["to"] == files[from_file+1]..ranks[from_rank] then
                                if to_file == from_file+1 then
                                    positions[files[to_file]..ranks[to_rank+1]].piece = nil
                                end
                            end
                        end
                    end
                    if from_file > 1 then
                        if previousMove["from"] == files[from_file-1]..ranks[from_rank-2] then
                            if previousMove["to"] == files[from_file-1]..ranks[from_rank] then
                                if to_file == from_file-1 then
                                    positions[files[to_file]..ranks[to_rank+1]].piece = nil
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    previousMove["from"] = from_pos
    previousMove["to"] = to_pos

    -- Detect castling
    if movingPiece.kind == "king" then
        if movingPiece.color == "white" then
            -- King castling
            if from_pos == "e1" and to_pos == "g1" then
                -- move rook
                positions["f1"].piece = positions["h1"].piece
                positions["h1"].piece = nil

            -- Queen castling
            elseif from_pos == "e1" and to_pos == "c1" then
                -- moving rook
                positions["d1"].piece = positions["a1"].piece
                positions["a1"].piece = nil
            end
        else
            -- King castling
            if from_pos == "e8" and to_pos == "g8" then
                -- move rook
                positions["f8"].piece = positions["h8"].piece
                positions["h8"].piece = nil

            -- Queen castling
            elseif from_pos == "e8" and to_pos == "c8" then
                -- moving rook
                positions["d8"].piece = positions["a8"].piece
                positions["a8"].piece = nil
            end
        end
    end

    -- Handle pawn promotion
    if movingPiece.kind == "pawn" then
        if movingPiece.color == "white" then
            if to_rank == 8 then
                positions[to_pos].piece.kind = "queen"
                positions[to_pos].piece.asset = wqueen
            end
        else
            if to_rank == 1 then
                positions[to_pos].piece.kind = "queen"
                positions[to_pos].piece.asset = bqueen
            end
        end
    end

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


function getAllPosMoves(piece, file, rank, color)
    if piece == "king" then
        return get_pos_moves_king(file, rank, color)
    elseif piece == "queen" then
        return get_pos_moves_queen(file, rank, color)
    elseif piece == "rook" then
        return get_pos_moves_rook(file, rank, color)
    elseif piece == "knight" then
        return get_pos_moves_knight(file, rank, color)
    elseif piece == "bishop" then
        return get_pos_moves_bishop(file, rank, color)
    elseif piece == "pawn" then
        return get_pos_moves_pawn(file, rank, color)     
    else
        return {}
    end
end

