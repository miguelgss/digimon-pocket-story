local typeChart = {
    --  VA | VI | DA
    { 1,   2,   0.5 },  -- Vaccine  1
    { 0.5, 1,   2 },    -- Virus    2
    { 2,   0.5, 1 },    -- Data     3
}

local attributeChart = {
    --  F | W | P | EA | EL | W | L | D
    { 1,   0.5, 2,   1,   1,   1,   1,   1 }, -- FIRE       1
    { 2,   1,   0.5, 1,   1,   1,   1,   1 }, -- WATER      2
    { 0.5, 2,   1,   1,   1,   1,   1,   1 }, -- PLANT      3
    { 1,   1,   1,   1,   2,   0.5, 1,   1 }, -- EARTH      4
    { 1,   1,   1,   0.5, 1,   2,   1,   1 }, -- ELETRIC    5
    { 1,   1,   1,   2,   0.5, 1,   1,   1 }, -- WIND       6
    { 1,   1,   1,   1,   1,   1,   0.5, 2 }, -- LIGHT      7
    { 1,   1,   1,   1,   1,   1,   2,   0.5 } -- DARK      8
}

local checkWeakness_Type = function(n, m)
    return ((n < 4 and m < 4) and {typeChart[n][m]} or {1})[1]
end

local checkWeakness_Attribute = function(n, m)
    return ((n < 9 and m < 9) and {attributeChart[n][m]} or {1})[1]
end

return {checkWeakness_Type ,checkWeakness_Attribute}
