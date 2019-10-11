require "lib/gooi"

Hud = { status = ""}

function Hud:init()
    h = {} 
    setmetatable(h, self)
    self.__index = self
    self.status = ""
    return h
end

function Hud:setStatus(newStatus)
    self.status = newStatus 
end

function Hud:draw()
    love.graphics.setFont(hud_status_font)
    love.graphics.printf(self.status, 20, winHeight-38, menuWidth, 'left')
end

