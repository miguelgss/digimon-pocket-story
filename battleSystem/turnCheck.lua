local Estate = require "battleSystem.enum.battler_state"

local function table_contains_active(tbl)
    for _, v in pairs(tbl) do
        if v.state == Estate.ACTIVE then
            return true
        end
    end
    return false
end

local turnCheck = {
    battlersCheck = {},
    activeChecking = true,
    maxTurnCountValue = 50,
    updateDelta = 0,

    update = function(self, dt)
        self.updateDelta = self.updateDelta + dt
        while (not table_contains_active(self.battlersCheck) and self.updateDelta > .1) do
            for i, v in ipairs(self.battlersCheck) do
                if (v.state == Estate.LOADING) then
                    self.battlersCheck[i].turnCount = v.turnCount + math.ceil((v.spd / 10))
                    if (v.turnCount >= self.maxTurnCountValue) then
                        self.battlersCheck[i].state = Estate.ACTIVE
                        self.activeCheking = false
                        return v;
                    end
                end
            end
            self.updateDelta = 0
        end

        return nil;
    end,

    reactiveTimer = function(self)
        self.activeChecking = true
    end,

    setBattlers = function(self, battlers)
        self.battlersCheck = battlers
        return self
    end
}

return turnCheck
