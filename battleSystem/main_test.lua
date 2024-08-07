---@diagnostic disable: different-requires
package.path = package.path .. ";../?.lua"
local skills = require "battleSystem.skills_process"
local digimon = require "digimon"
local turnCheck = require "turnCheck"

local t1 = digimon:new()
local t2 = digimon:new()

t1.ally = true;
t1.name = "betamon"

local battlers = {t1, t2}

local skills = skills:get_battlers(t1, t2)
local turnCheck = turnCheck:setBattlers(battlers)

t1.attribute = 3
t2.attribute = 1

print(t1.hp .. " | " .. t2.hp)

turnCheck:update()

print(t1.hp .. " | " .. t2.hp)
