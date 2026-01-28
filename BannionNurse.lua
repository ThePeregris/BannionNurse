-- [[ NURSE MODULE: SELF-SUSTAIN v10.2 ]]
-- Smart usage of Potions, Healthstones, and Bandages.
-- Update: Potion Threshold set to < 80% HP.

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

local function Bannion_UseItem(name)
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

function BannionNurse()
    local hp = UnitHealth("player")
    local max = UnitHealthMax("player")
    local pct = (hp / max) * 100
    local combat = UnitAffectingCombat("player")
    
    UIErrorsFrame:Clear()

    -- 1. COMBAT MODE (Potions & Stones)
    if combat then
        -- Safety Check: Don't waste potions if HP is high (> 80%)
        if pct > 80 then return end
        
        -- Priority A: Healthstone (Free / Shared CD)
        for _, item in pairs(NurseItems.Stones) do
            if Bannion_UseItem(item) then return end
        end

        -- Priority B: Potions (Gold Cost)
        for _, item in pairs(NurseItems.Potions) do
            if Bannion_UseItem(item) then return end
        end
        
        -- Priority C: Desperate Racial (Undead Cannibalize)
        local race = UnitRace("player")
        if race == "Undead" and pct < 30 then
            if not Bannion_Ready("Cannibalize") then return end
            _Cast("Cannibalize")
        end
        
    -- 2. REST MODE (Bandages)
    else
        -- Don't bandage if nearly full (> 90%)
        if pct > 90 then return end
        
        -- Check for "Recently Bandaged" Debuff to avoid error spam
        for i=1,16 do 
            local t = UnitDebuff("player", i)
            if t and string.find(t, "Bandage") then 
                DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[Bannion]|r Cannot Bandage: Debuff Active!")
                return 
            end 
        end
        
        -- Use Best Bandage
        for _, item in pairs(NurseItems.Bandages) do
            if Bannion_UseItem(item) then 
                DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[Bannion]|r Applying " .. item .. "...")
                return 
            end
        end
    end
end

SLASH_BNURSE1 = "/BNurse"; SlashCmdList["BNURSE"] = BannionNurse
