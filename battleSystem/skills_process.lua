local checkWeakness_Type = require("battleSystem.advantageCheck")[1]
local checkWeakness_Attribute = require("battleSystem.advantageCheck")[2]
local Eskilltypes = require("battleSystem.enum.skill_type")
local Estate = require("battleSystem.enum.battler_state")

local skills_process = {

    attacking = {},
    skillUsed = {},
    defending = {},

    -- get_battlers = function (self, atk, def)
    --     self.attacking = atk
    --     self.defending = def
    --     return self
    -- end,

    clear_data = function (self)
        self.attacking = {}
        self.defending = {}
    end,

    process_attack = function (self, skill, attacker, defender)
        self.skillUsed = skill
        self.attacking = attacker
        self.defending = defender

        if(self.skillUsed.type == Eskilltypes.PHYSYCAL) then
            self:phys_atk(self.skillUsed.power, self.skillUsed.attribute)
        elseif (self.skillUsed.type == Eskilltypes.MAGICAL) then
            self:magic_atk(self.skillUsed.power, self.skillUsed.attribute)
        end

        attacker.turnCount = attacker.turnCount - self.skillUsed.turnCountDecay
        attacker.state = Estate.LOADING

        if(defender.hp <= 0) then
            defender.state = Estate.INACTIVE
        end
    end,

    phys_atk = function(self, tech, attackAttribute)
        local multiplier_Attribute = checkWeakness_Attribute(attackAttribute, self.defending.attribute)
        local damage = self.attacking.atk/self.defending.def * tech
        self:apply_damage(damage, multiplier_Attribute)
    end,

    magic_atk = function(self, tech, attackAttribute)
        local multiplier_Attribute = checkWeakness_Attribute(attackAttribute, self.defending.attribute)
        local damage = self.attacking.int/self.defending.int * tech
        self:apply_damage(damage, multiplier_Attribute)
    end,

    normal_atk = function (self)
        local damage = self.attacking.atk/self.defending.def * 50
        self:apply_damage(damage, 1)
    end,

    apply_damage = function (self, damage, attackAttributeMultiplier)
        local multiplier_Type = checkWeakness_Type(self.attacking.typeD, self.defending.typeD)
        local finalDamage = math.floor((damage * ((multiplier_Type * attackAttributeMultiplier))))
        self.defending.hp = self.defending.hp - finalDamage
        return self.defending.hp
    end
}

return skills_process