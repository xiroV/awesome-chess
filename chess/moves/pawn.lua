--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/.
--

function get_pos_moves_pawn(file, rank, color)
    posMoves = {}
    -- Black
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

            -- En passant
            if rank == 4 then
                if file > 1 then
                    if previousMove["from"] == files[file-1]..ranks[rank-2] then
                        if previousMove["to"] == files[file-1]..ranks[rank] then
                            posMoves[#posMoves+1] = files[file-1]..ranks[rank-1]
                        end
                    end
                end

                if file < 8 then
                    if previousMove["from"] == files[file+1]..ranks[rank-2] then
                        if previousMove["to"] == files[file+1]..ranks[rank] then
                            posMoves[#posMoves+1] = files[file+1]..ranks[rank-1]
                        end
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
    -- White
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

            -- En passant
            if rank == 5 then
                if file > 1 then
                    if previousMove["from"] == files[file-1]..ranks[rank+2] then
                        if previousMove["to"] == files[file-1]..ranks[rank] then
                            posMoves[#posMoves+1] = files[file-1]..ranks[rank+1]
                        end
                    end
                end

                if file < 8 then
                    if previousMove["from"] == files[file+1]..ranks[rank+2] then
                        if previousMove["to"] == files[file+1]..ranks[rank] then
                            posMoves[#posMoves+1] = files[file+1]..ranks[rank+1]
                        end
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
end
