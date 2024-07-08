local ScreenManager = require 'screen.screenManager'

local defaultGameResolution = {x=480,y=360}

function love.load()
    local font = love.graphics.newFont("font/k_mini.ttf", 16, "normal", love.graphics.getDPIScale())
	love.graphics.setFont(font)
    ScreenManager:SwitchStates("e")  
end

function love.draw()
    local dimX, dimY = love.graphics.getDimensions()
    love.graphics.push()
        love.graphics.scale(dimX/defaultGameResolution.x, dimY/defaultGameResolution.y)
        ScreenManager:Draw()
    love.graphics.pop()
end

function love.update(dt)
    ScreenManager:Update(dt)
end

function love.keypressed(key)
    ScreenManager:KeyPressed(key)
end

function love.keyreleased(key)
    ScreenManager:KeyReleased(key)
end

function love.mousepressed(x, y, button)
    ScreenManager:MousePressed(x, y, button)
end

function love.mousereleased(x, y, button)
    ScreenManager:MouseReleased(x, y, button)
end

function love.mousemoved(x, y, dx, dy, istouch)
    ScreenManager:MouseMoved(x, y, dx, dy, istouch)
end