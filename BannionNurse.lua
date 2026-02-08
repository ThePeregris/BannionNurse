-- [[ BANNION NURSE v10.3 - MODULE ]]
-- Smart Sustain: Potions, Stones, Bandages (<75% HP Threshold)

local NurseVersion = "|cff00ff00[Bannion Nurse v10.2 Loaded]|r"

local NurseItems = {
    Potions = { 
        "Major Healing Potion", "Superior Healing Potion", "Greater Healing Potion", 
        "Healing Potion", "Lesser Healing Potion", "Minor Healing Potion" 
    },
    Stones = { 
        "Major Healthstone", "Greater Healthstone", "Healthstone", 
        "Lesser Healthstone", "Minor Healthstone", "Whipper Root Tuber"
    },
    Bandages = { 
        "Heavy Runecloth Bandage", "Runecloth Bandage", "Heavy Mageweave Bandage", 
        "Mageweave Bandage", "Heavy Silk Bandage", "Silk Bandage", 
        "Heavy Wool Bandage", "Wool Bandage", "Linen Bandage" 
    }
}

-- =========================
-- Local Helper: Use Item by Name
-- =========================
local function Bannion_Nurse_UseItem(name)
    for bag = 0, 4 do
        for slot = 1, GetContainerNumSlots(bag) do
            local link = GetContainerItemLink(bag, slot)
            if link and string.find(link, name) then
                local start, duration, enabled = GetContainerItemCooldown(bag, slot)
                if start == 0 and enabled == 1 then
                    UseContainerItem(bag, slot)
                    return true
                end
            end
        end
    end
    return false
end

-- =========================
-- Local Helper: Spell Ready
-- =========================
local function Bannion_Nurse_SpellReady(spellName)
    if Bannion_Ready then return Bannion_Ready(spellName) end

    local id
    for i = 1, 200 do
        local n = GetSpellName(i, "spell")
        if not n then break end
        if n == spellName then id = i; break end
    end
    if not id then return false end

    local start = GetSpellCooldown(id, "spell")
    return start == 0
end

-- =========================
-- CORE NURSE LOGIC
-- =========================
function BannionNurse()
    local hp = UnitHealth("player")
    local max = UnitHealthMax("player")
    local pct = (hp / max) * 100
    local combat = UnitAffectingCombat("player")

    UIErrorsFrame:Clear()

    -- =========================
    -- COMBAT MODE
    -- =========================
    if combat then
        if pct > 75 then return end

        -- Stones first
        for _, item in pairs(NurseItems.Stones) do
            if Bannion_Nurse_UseItem(item) then return end
        end

        -- Potions second
        for _, item in pairs(NurseItems.Potions) do
            if Bannion_Nurse_UseItem(item) then return end
        end

        -- Undead racial
        local race = UnitRace("player")
        if race == "Undead" and pct < 40 then
            if Bannion_Nurse_SpellReady("Cannibalize") then
                CastSpellByName("Cannibalize")
            end
        end

    -- =========================
    -- REST MODE
    -- =========================
    else
        if pct > 90 then return end

        -- Bandage debuff check
        for i = 1, 16 do
            local debuff = UnitDebuff("player", i)
            if debuff and string.find(debuff, "Bandage") then
                DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[Nurse]|r Cannot Bandage: Debuff Active!")
                return
            end
        end

        -- Apply best bandage
        for _, item in pairs(NurseItems.Bandages) do
            if Bannion_Nurse_UseItem(item) then
                DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[Nurse]|r Applying " .. item .. "...")
                return
            end
        end
    end
end

-- =========================
-- [MOD:ALT] FIRST AID OVERRIDE
-- =========================
do
    local _BannionNurse = BannionNurse

    function BannionNurse()
        if IsAltKeyDown() then
            if UnitAffectingCombat("player") then return end

            -- Prevent bandage lockout
            for i = 1, 16 do
                local debuff = UnitDebuff("player", i)
                if debuff and string.find(debuff, "Bandage") then
                    DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[Nurse]|r First Aid blocked (Bandage debuff).")
                    return
                end
            end

            CastSpellByName("First Aid")
            return
        end

        _BannionNurse()
    end
end

-- =========================
-- INIT & SLASH
-- =========================
local loadFrame = CreateFrame("Frame")
loadFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
loadFrame:SetScript("OnEvent", function()
    DEFAULT_CHAT_FRAME:AddMessage(NurseVersion)
end)

SLASH_BNURSE1 = "/bnurse"
SlashCmdList["BNURSE"] = BannionNurse

