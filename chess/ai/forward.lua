--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/.
--

function table.empty (self)
    for _, _ in pairs(self) do
        return false
    end
    return true
end

function forward_make_move()
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

    local chosenPiece = 0
    local chosenPos = 0

    -- get move closest to enemy lines for each piece
    local fwdMoves = {}
    local min, tmp = 0, 0
    local tmpMove = 0
    for i=1, #aiMoves, 1 do
        min = 10
        tmpMove = 1
        for j=1, #aiMoves[i], 1 do
            tmp = tonumber(string.sub(aiMoves[i][j], 2))
            if tmp < min then 
                min = tmp
                tmpMove = j
            end
        end
        fwdMoves[i] = tmpMove
    end

    -- chose a random piece and move that as far forward as possible
    math.randomseed(os.time())
    chosenPiece = math.random(1, #fwdMoves)
    chosenPos = fwdMoves[chosenPiece]

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
