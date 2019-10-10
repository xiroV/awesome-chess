function table.empty (self)
    for _, _ in pairs(self) do
        return false
    end
    return true
end

function random_make_move()
    if os.getenv("HOME") == nil then
        os.execute("ping -n 2 localhost > NUL")
    else
        os.execute("sleep " .. tonumber(1))
    end
    local aiMoves = {}
    local aiPiecePosFrom = {}
    local aiPiecePosTo = {}

    for i=8, 1, -1 do
        for j=1, 8, 1 do
            pieceAtPos = positions[files[i]..ranks[j]].piece
            if pieceAtPos ~= nil then
                if pieceAtPos.color == "black" then
                    -- get possible moves for each black piece
                    if not table.empty(getPosMoves(pieceAtPos.kind, i, j, "black")) then

                        aiMoves[#aiMoves+1] = getPosMoves(pieceAtPos.kind, i, j, "black")
                        aiPiecePosFrom[#aiPiecePosFrom+1] = {f = i, r = j}
                    end
                end
            end
        end
    end

    math.randomseed(os.time())
    chosenPiece = math.random(1, #aiMoves)
    chosenPos = math.random(1, #aiMoves[chosenPiece])

    local toFile
    local toRank

    -- find chosen file and rank
    for i=1, 8, 1 do
        for j=1, 8, 1 do
            if files[i]..ranks[j] == aiMoves[chosenPiece][chosenPos] then
                toFile = i
                toRank = j
            end
        end
    end

    print(toFile)
    print(toRank)

    movePiece(aiPiecePosFrom[chosenPiece].f,
        aiPiecePosFrom[chosenPiece].r,
        toFile,
        toRank
    )
end
