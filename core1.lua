Khufosalert = { }

local function doBoss(call, unit, ...)
    local boss = Khufosalert.Bosses[unit]
    call = boss and boss[call]

    if call then
        call(unit, ...)
    end
end

-- handle all events main function
local function OnEvents(frame, event, ...)
    if event == "UNIT_SPELLCAST_SUCCEEDED" then
        local unit, _, spellId = ...
        doBoss("OnSpellcast", unit, spellId, GetSpellInfo(spellId))
    elseif event == "UNIT_SPELLCAST_FAILED" then
        local unit, _, spellId = ...
        doBoss("OnSpellcastFail", unit, spellId, GetSpellInfo(spellId))
    end
end

do
    -- spellcast handlers. key is unit name 
    Khufosalert.Bosses = { }

    local frame = CreateFrame("Frame", "KhufosalertFrame")

    frame:SetScript("OnEvent", OnEvents)
    frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    frame:RegisterEvent("UNIT_SPELLCAST_FAILED")
end