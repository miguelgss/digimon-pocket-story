
local Eharmful_status = {
    PANIC = 1, --The Digimon cannot be controlled and attacks allies and friends at random
    PARALYSIS = 2, --The Digimon has a chance to not be able to move at all on their turn
    SLEEP = 3, --The Digimon cannot move at all and skips their turn
    STUN = 4, --Forces the Digimon to go further back in the timeline order
    POISON = 5, --Loses HP after every action taken. The amount of HP lost increases over time
    DOT = 6, --Changes the Digimon into a sprite version of itself, rendering it unable to use any skills
    BUG = 7, --Reverses Type affinity
    INSTANT_DEATH = 8, --The Digimon dies instantly
    HELPESS = 9 --Disables the Digimon's Support Skill
}

local Ebuff_status = {
    ATK = 1,
    DEF = 2,
    INT = 3,
    SPD = 4,
    EVA = 5,
    ACU = 6,
    CRT = 7
}

local Ebenefical = {
    STATUS_BARRIER = 1, --Protects Digimon against all harmful status conditions and stat reductions
    SAFETY_GUARD = 2, --The Digimon will endure one killing blow and survives with 1 HP
    ACCELERATION_BOOST = 3, --The next attack will have its damage doubled
    CROSS_COUNTER = 4, --Counters with a normal attack after being hit with a physical attack or skill
    MIRROR_REFLECTION = 5, --Counters with a normal attack after being hit with a magical skill
}

return {Eharmful_status, Ebuff_status, Ebenefical}