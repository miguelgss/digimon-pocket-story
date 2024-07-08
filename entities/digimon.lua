local Etypes = require("enums.enums")[1]
local Eattributes = require("enums.enums")[2]
local Elevel = require("enums.enums")[3]

local anim8 = require("library.anim8")
local love = require("love")

local digimon = {
    lv = 1, exp = 1, expnext = 100,
    name = 'agumon',
    hp = 100, sp = 100,
    atk = 1, def = 1, int = 1, spd = 1,
    cam = 0,

    attribute = Eattributes.NEUTRAL,
    typeD = Etypes.FREE,
    evo = Elevel.ROOKIE,

    memoryU = 1,
    scan = 0,

    eSlots = 1,
    equips = {},

    skills = {},

    -- Animation
    sprite = '',
    idleAnim = '',
    atkAnim = '',
    dmgAnim = '',

    loadSpriteIdle = function(self)
        self.sprite = love.graphics.newImage('sprite/' .. self.name .. '.png')
        Anim = anim8.newGrid(32, 32, self.sprite:getWidth(), self.sprite:getHeight())
        self.idleAnim = anim8.newAnimation(Anim('1-2', 1), 0.5)
    end,

    drawIdle = function(self, x, y)
        self.idleAnim:draw(self.sprite, x, y)
    end,

    new = function(self)
        return setmetatable({}, self)
    end
}

digimon.__index = digimon

return digimon