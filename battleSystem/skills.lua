local checkWeakness_Type = require("advantageCheck")[1]
local checkWeakness_Attribute = require("advantageCheck")[2]

local skills = {

    attacking = {},
    defending = {},

    -- TODO: registrar niveis de tech possíveis e criar calculos ignoradores de defesa de acordo com o guia 
    -- do gamefaqs
    
    phys_atk = function(self, tech)
        local damage = self.attacking.atk/self.defending.def * tech
        self:apply_damage(damage)
    end,

    magic_atk = function(self, tech)
        local damage = self.attacking.int/self.defending.int * tech
        self:apply_damage(damage)
    end,

    normal_atk = function (self)
        local damage = self.attacking.atk/self.defending.def * 50
        self:apply_damage(damage)
    end,

    apply_damage = function (self, damage)
        local multiplier_Attribute = checkWeakness_Attribute(self.attacking.attribute, self.defending.attribute)
        local multiplier_Type = checkWeakness_Type(self.attacking.typeD, self.defending.typeD)
        local finalDamage = math.floor((damage * ((multiplier_Attribute * multiplier_Type)/1.2)))
        self.defending.hp = self.defending.hp - finalDamage
        return self.defending.hp
    end,

    get_battlers = function (self, atk, def)
        self.attacking = atk
        self.defending = def
        return self
    end,

    clear_data = function (self)
        self.attacking = {}
        self.defending = {}
    end
}

return skills