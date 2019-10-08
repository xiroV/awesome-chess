require "lib/tove"
require "lib/gooi"
require "chess/init"
require "chess/moves"
require "chess/utils"
require "chess/hud/menu"

function love.mousepressed(x, y, button, istouch)
    if menuActive then
        gooi.pressed()
    else
        if aiType == nil or aiType == "random" or aiType == "forward" and colorTurn == "white" then
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
                                        movePiece(selectedFile, selectedRank, j, i)
                                        break
                                    end
                                end
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
                        markPosition(pos)
                    end
                end 
            end

            -- Mark selected move
            if selectedPos == pos then
                markPosition(pos)
            end

            -- Draw pieces
            if positions[pos].piece ~= nil then
                love.graphics.translate(positions[pos].center_x, positions[pos].center_y)
                positions[pos].piece.asset:draw()
                love.graphics.origin()
            end
        end
    end

    if menuActive then
        drawMenu()
    end
    
end

love.mousereleased = function(x, y, button)
    gooi.released()
end
