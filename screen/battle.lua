local digimon = require 'battleSystem.digimon'

local battle = {}

function battle:Load(battleManager)
    Enemies = {
        digimon:new(),
        digimon:new(),
        digimon:new()
    }
    Allies = {
        digimon:new(),
        digimon:new(),
        digimon:new()
    }
end

function battle:Update(dt)

end

function battle:Draw()

end

function battle:MousePressed(x, y, button)
  
end

function battle:MouseReleased(x, y, button)
  
end

function battle:KeyPressed(key)

end

function battle:KeyReleased(key)

end

return battle