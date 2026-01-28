-- [[ BANNION NURSE v10.2 - MODULE ]]
-- Smart Sustain: Potions, Stones, Bandages (<80% HP Threshold)

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

-- Local Helper: Use Item by Name
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

-- Local Helper: Check Spell Ready (Safe version for Nurse)
local function Bannion_Nurse_SpellReady(spellName)
    -- Tries to use global Bannion_Ready if available, else falls back to simple check
    if Bannion_Ready then return Bannion_Ready(spellName) end
    
    -- Local fallback if Core is missing
    local id = nil
    for i = 1, 200 do
        local n = GetSpellName(i, "spell")
        if not n then break end
        if n == spellName then id = i; break end
    end
    if not id then return false end
    local start, duration = GetSpellCooldown(id, "spell")
    return start == 0
end

function BannionNurse()
    local hp = UnitHealth("player")
    local max = UnitHealthMax("player")
    local pct = (hp / max) * 100
    local combat = UnitAffectingCombat("player")
    
    UIErrorsFrame:Clear()

    -- 1. COMBAT MODE (Potions & Stones)
    if combat then
        -- Threshold v10.2: < 80% HP
        if pct > 80 then return end
        
        -- Priority A: Stones (Free/Shared)
        for _, item in pairs(NurseItems.Stones) do
            if Bannion_Nurse_UseItem(item) then return end
        end

        -- Priority B: Potions (Costly)
        for _, item in pairs(NurseItems.Potions) do
            if Bannion_Nurse_UseItem(item) then return end
        end
        
        -- Priority C: Racial
        local race = UnitRace("player")
        if race == "Undead" and pct < 40 then
            if Bannion_Nurse_SpellReady("Cannibalize") then
                CastSpellByName("Cannibalize")
            end
        end
        
    -- 2. REST MODE (Bandages)
    else
        -- Don't waste if nearly full
        if pct > 90 then return end
        
        -- Check Debuff
        for i=1,16 do 
            local t = UnitDebuff("player", i)
            if t and string.find(t, "Bandage") then 
                DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[Nurse]|r Cannot Bandage: Debuff Active!")
                return 
            end 
        end
        
        -- Apply Bandage
        for _, item in pairs(NurseItems.Bandages) do
            if Bannion_Nurse_UseItem(item) then 
                DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[Nurse]|r Applying " .. item .. "...")
                return 
            end
        end
    end
end

-- Init Message
local loadFrame = CreateFrame("Frame")
loadFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
loadFrame:SetScript("OnEvent", function() DEFAULT_CHAT_FRAME:AddMessage(NurseVersion) end)

SLASH_BNURSE1 = "/BNurse"; SlashCmdList["BNURSE"] = BannionNurse
