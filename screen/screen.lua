local digimon = require 'entities.digimon'

local screen = {}

function screen:Load(ScreenManager)

    newObj = digimon:new()
    newObj.name = "agumon"

    newO2 = digimon:new()
    newO2.name = "lalamon"

    love.graphics.setBackgroundColor(5/255, 80/255, 20/255)

    newObj:loadSpriteIdle()
    newO2:loadSpriteIdle()

end

function screen:Update(dt)
    function love.keypressed(key)
        if key == 'escape' then
            love.event.push("quit", exitstatus)
        end
    end

    newObj.idleAnim:update(dt)
    newO2.idleAnim:update(dt)
end

function screen:Draw()
    newObj:drawIdle(10, 10)
    newO2.idleAnim:draw(newO2.sprite, 90, 10)

    love.graphics.print('n:' .. string.upper(newObj.name), 10, 50)
    love.graphics.print('n:' .. string.upper(newO2.name), 10, 80)

end

function screen:MousePressed(x, y, button)
  
end

function screen:MouseReleased(x, y, button)
  
end

function screen:KeyPressed(key)

end

function screen:KeyReleased(key)

end

return screen