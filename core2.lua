-- in the Boss_Player.lua file

local Boss = { }

Boss.OnSpellcast = function(unit, spellId, spellName)
    print("it worked: ", unit, spellName)
    PlaySound(100)
end

Boss.OnSpellcastFail = function(unit, spellId, spellName)
    print("it failed: ", unit, spellName)
    PlaySound(100)
end

do
    Khufosalert.Bosses["player"] = Boss
end