local Etypes = require("battleSystem.enum.digimon_basic")[1]
local Eattributes = require("battleSystem.enum.digimon_basic")[2]
local Elevel = require("battleSystem.enum.digimon_basic")[3]
local Estate = require("battleSystem.enum.battler_state")
local SkillList = require("battleSystem.skill_list")

local anim8 = require("library.anim8")

local digimon = {
    lv = 1, exp = 1, expnext = 100,
    name = 'agumon',
    hp = 100, sp = 100,
    atk = 1, def = 1, int = 1, spd = 10,
    cam = 0,

    ally = false,
    turnCount = 0,

    attribute = Eattributes.NEUTRAL,
    typeD = Etypes.FREE,
    evo = Elevel.ROOKIE,
    state = Estate.LOADING,

    memoryU = 1,
    scan = 0,

    eSlots = 1,
    equips = {},

    skills = {
        SkillList.BITE
    },

    -- Animation and status presentation in battle
    sprite = '',
    idleAnim = '',
    battleCard = '',
    atkAnim = '',
    dmgAnim = '',

    position = 1,
    sizeStatusBlock = {w = 160, h = 64},

    loadSpriteIdle = function(self)
        self.sprite = love.graphics.newImage('sprite/' .. self.name .. '.png')
        Anim = anim8.newGrid(32, 32, self.sprite:getWidth(), self.sprite:getHeight())
        self.idleAnim = anim8.newAnimation(Anim('1-2', 1), 0.5)
    end,

    loadCardDigimon = function(self)
        self.battleCard = love.graphics.newImage('sprite/ui_battle/digimon_card_battle.png')
    end,

    drawStatus = function(self)
        local heightOffset = (16+self.sizeStatusBlock.h) * (self.position - 1)

        love.graphics.setColor( 1, 1, 1)
        love.graphics.draw(self.battleCard, 8, 8+heightOffset)

        love.graphics.setColor( .9, .7, 1)
        love.graphics.print(string.upper(self.name), 64, 4+heightOffset)
        love.graphics.print("H:" .. tostring(self.hp), 72, 24+heightOffset)
        love.graphics.print("S:" .. tostring(self.sp), 72, 40+heightOffset)
        love.graphics.setColor( 1, 1, 1)
        love.graphics.print(tostring(self.turnCount), 140, 44+heightOffset)

    end,

    drawIdle = function(self)
        local heightOffset = (16+self.sizeStatusBlock.h) * (self.position - 1)
        love.graphics.setColor(1, 1, 1)
        if(self.ally) then
            self.idleAnim:draw(self.sprite, 28, 24+heightOffset)
        else
            local x = 192+(60*self.position)
            self.idleAnim:draw(self.sprite, x, 60)
            love.graphics.print(tostring(self.turnCount), x, 24)
            love.graphics.print("H:" .. tostring(self.hp), x, 96)
            love.graphics.print("S:" .. tostring(self.sp), x, 96+24)
        end
    end,

    new = function(self)
        return setmetatable({}, self)
    end,

    copy = function(self)
        local copyT = {}
        for k, v in pairs(self) do copyT[k] = v end
        return setmetatable(copyT, getmetatable(self))
    end
}

digimon.__index = digimon

return digimon