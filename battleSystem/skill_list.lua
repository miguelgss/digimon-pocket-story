local Eattributes = require("battleSystem.enum.digimon_basic")[2]
local Eeffects = require("battleSystem.enum.digimon_effects")[1]
local Eskilltypes = require("battleSystem.enum.skill_type")

local skill_template = {
    name = "",
    attribute = Eattributes.NEUTRAL,
    type = Eskilltypes.PHYSYCAL,
    cost = 1,
    power = 0,

    statusEffect = nil,
    effectChance = nil,

    turnCountDecay = 50,

    new = function(self, name, attribute, type, cost, power, statusEffect, effectChance, turnCountDecay)
        local newInstance = {}
        newInstance.name = name;
        newInstance.attribute = attribute;
        newInstance.type = type;
        newInstance.cost = cost;
        newInstance.power = power;

        newInstance.turnCountDecay = ((turnCountDecay ~= nil) and { turnCountDecay } or { 50 })[1]

        newInstance.statusEffect = statusEffect;
        newInstance.effectChance = effectChance;
        setmetatable(newInstance, self)
        self.__index = self

        return newInstance
    end,
}


local skill_list = {
    -- NEUTRAL
    BITE = skill_template:new("Bite", Eattributes.NEUTRAL, Eskilltypes.PHYSYCAL, 2, 45, nil, nil, nil),

    -- FIRE
    PYRO_PUNCH = skill_template:new("Pyro Punch", Eattributes.FIRE, Eskilltypes.PHYSYCAL, 10, 45, nil, nil, nil),

    -- PLANT
    RUNE_FOREST_1 = skill_template:new("Rune Forest 1", Eattributes.PLANT, Eskilltypes.MAGICAL, 4, 20, Eeffects.POISON, .10, nil),

    -- WATER
    ELASTIC_BUBBLES = skill_template:new("Elastic Bubbles", Eattributes.WATER, Eskilltypes.MAGICAL, 2, 30, nil, nil, nil)
}

return skill_list;

