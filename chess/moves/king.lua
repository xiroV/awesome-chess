function get_pos_moves_king(file, rank, color) 
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

    -- Castling
    if color == "white" then
        -- White castling
        -- King castling
        if files[file]..ranks[rank] == "e1" then
            if not posOccupied(files[file+1]..ranks[rank]) and not posOccupied(files[file+2]..ranks[rank]) then
                if posOccupied(files[file+3]..ranks[rank]) then
                    if positions[files[file+3]..ranks[rank]].piece.kind == "rook" and positions[files[file+3]..ranks[rank]].piece.color == "white" then
                        posMoves[#posMoves+1] = files[file+2]..ranks[rank]
                    end
                end
            end
        end
        -- Queen castling
        if files[file]..ranks[rank] == "e1" then
            if not posOccupied(files[file-1]..ranks[rank]) and not posOccupied(files[file-2]..ranks[rank]) and not posOccupied(files[file-3]..ranks[rank]) then
                if posOccupied(files[file-4]..ranks[rank]) then
                    if positions[files[file-4]..ranks[rank]].piece.kind == "rook" and positions[files[file-4]..ranks[rank]].piece.color == "white" then
                        posMoves[#posMoves+1] = files[file-2]..ranks[rank]
                    end
                end
            end
        end
    else
        -- Black castling
        -- King castling
        if files[file]..ranks[rank] == "e8" then
            if not posOccupied(files[file+1]..ranks[rank]) and not posOccupied(files[file+2]..ranks[rank]) then
                if posOccupied(files[file+3]..ranks[rank]) then
                    if positions[files[file+3]..ranks[rank]].piece.kind == "rook" and positions[files[file+3]..ranks[rank]].piece.color == "black" then
                        posMoves[#posMoves+1] = files[file+2]..ranks[rank]
                    end
                end
            end
        end
        -- Queen castling
        if files[file]..ranks[rank] == "e8" then
            if not posOccupied(files[file-1]..ranks[rank]) and not posOccupied(files[file-2]..ranks[rank]) and not posOccupied(files[file-3]..ranks[rank]) then
                if posOccupied(files[file-4]..ranks[rank]) then
                    if positions[files[file-4]..ranks[rank]].piece.kind == "rook" and positions[files[file-4]..ranks[rank]].piece.color == "black" then
                        posMoves[#posMoves+1] = files[file-2]..ranks[rank]
                    end
                end
            end
        end
    end

    return posMoves
end
