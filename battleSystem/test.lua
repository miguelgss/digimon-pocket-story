local skills = require "skills"
local digimon = require "digimon"

local t1 = digimon:new()
local t2 = digimon:new()

local skills = skills:get_battlers(t1, t2)

t1.attribute = 3
t2.attribute = 1
print(t1.hp .. " | " .. t2.hp)

skills:normal_atk()

print(t1.hp .. " | " .. t2.hp)
