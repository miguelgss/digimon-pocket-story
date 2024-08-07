local digimon = require 'battleSystem.digimon'
local turnCheck = require 'battleSystem.turnCheck'
local skillProcess = require 'battleSystem.skills_process'

local screen = {}
local battlers;
local activeDigimon = nil

function screen:Load(ScreenManager)

    newObj = digimon:new()
    newObj.name = "agumon"
    newObj.ally = true;
    newObj.spd = 20

    newO2 = digimon:new()
    newO2.name = "lalamon"
    newO2.position = 2
    newO2.ally = true;

    newO3 = digimon:new()
    newO3.name = "betamon"
    newO3.position = 3
    newO3.ally = true;

    newO4 = newObj:copy()
    newO5 = newO3:copy()
    newO6 = newO2:copy()
    newO4.position = 1
    newO5.position = 2
    newO6.position = 3

    newO4.ally = false
    newO5.ally = false
    newO6.ally = false

    love.graphics.setBackgroundColor(30/255, 10/255, 30/255)

    battlers = {newObj, newO2, newO3, newO4, newO5, newO6}

    for _, v in pairs(battlers) do
        v:loadSpriteIdle();
        v:loadCardDigimon();
    end

    Turnos = turnCheck:setBattlers(battlers)
end

function screen:Update(dt)
    function love.keypressed(key)
        if key == 'escape' then
            love.event.push("quit", exitstatus)
        end
    end

    for _, v in pairs(battlers) do
        v.idleAnim:update(dt)
    end

    if(activeDigimon == nil) then
        activeDigimon = Turnos:update(dt)
    elseif (activeDigimon ~= nil and not activeDigimon.ally) then
        skillProcess:process_attack(activeDigimon.skills[1], activeDigimon, battlers[3])
        activeDigimon = nil
        Turnos:reactiveTimer()
    end
end

function screen:Draw()
    love.graphics.setColor(.2,.2,.2)
    love.graphics.rectangle("fill", 192, 8, 280, 192+32);

    for _, v in pairs(battlers) do
        if(v.ally) then v:drawStatus() end;
        v:drawIdle();
    end

    if(activeDigimon ~= nil and activeDigimon.ally) then
        love.graphics.print(activeDigimon.skills[1].name, 280, 192+56)
    end
end

function screen:MousePressed(x, y, button)
    if(x > 105 and y > 110 and activeDigimon ~= nil and activeDigimon.ally) then
        skillProcess:process_attack(activeDigimon.skills[1], activeDigimon, battlers[4])
        activeDigimon = nil
        Turnos:reactiveTimer()
    end
end

function screen:MouseReleased(x, y, button)

end

function screen:KeyPressed(key)

end

function screen:KeyReleased(key)

end

return screen