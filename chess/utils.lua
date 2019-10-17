function table.len(T)
    if T == nil then
        return 0
    end
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

function getEnemyColor(color)
    if color == "white" then
        return "black"
    else
        return "white"
    end
end

function posOccupied(pos)
    if positions[pos].piece == nil then
        return false
    else
        return true
    end
end

function isCheck(color)
    for i=8,1,-1 do
        for j=1,8,1 do
            pos = files[j]..ranks[i]
            if posOccupied(pos) then
                if positions[pos].piece.color == getEnemyColor(color) then
                    posMoves = getAllPosMoves(positions[pos].piece.kind, j, i, getEnemyColor(color))

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

