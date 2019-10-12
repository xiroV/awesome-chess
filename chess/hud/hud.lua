require "lib/gooi"

Hud = { status = "", captures = {} }

function Hud:init()
    h = {} 
    setmetatable(h, self)
    self.__index = self
    self.status = ""
    self.captures = {}
    return h
end

function Hud:setStatus(newStatus)
    self.status = newStatus 
end

function Hud:draw()
    love.graphics.setFont(hud_status_font)
    love.graphics.printf(self.status, 20, winHeight-38, menuWidth, 'left')

    for i=1,#self.captures,1 do
        love.graphics.translate(400+(i*13), winHeight-30)
        o = self.captures[i]
        o:draw()
        love.graphics.origin()
    end
end

function Hud:addCapture(piece)
    -- pi = piece.asset:clone()
    -- pi:rescale(30)
    pi = piece.asset
    table.insert(self.captures, pi)
end

