function get_pos_moves_knight(file, rank, color)
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
end
