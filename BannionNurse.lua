-- [[ BANNION NURSE v1.0 ]]
-- Standalone First Aid & Potion Manager for Turtle WoW

local BNursePrefix = "|cff888888[|r|cff00ccffB|r|cff888888]annion Nurse|r"

local function BannionNurseLogic()
    -- 1. EM COMBATE: Tenta usar Healing Potion
    if UnitAffectingCombat("player") then 
        -- Tenta usar a potion. Se não tiver ou estiver em CD, o erro é silenciado pelo jogo ou aparece na tela.
        CastSpellByName("Healing Potion")
        return 
    end

    -- 2. FORA DE COMBATE: Procura a melhor ligadura
    local bPrio = {
        ["Heavy Runecloth Bandage"]=100, ["Runecloth Bandage"]=95,
        ["Heavy Mageweave Bandage"]=90, ["Mageweave Bandage"]=85,
        ["Heavy Silk Bandage"]=80, ["Silk Bandage"]=75,
        ["Heavy Wool Bandage"]=70, ["Wool Bandage"]=65,
        ["Heavy Linen Bandage"]=60, ["Linen Bandage"]=55
    }

    local bestBag, bestSlot, maxP = nil, nil, 0

    -- Scan às malas (0-4)
    for bag = 0, 4 do 
        for slot = 1, GetContainerNumSlots(bag) do
            local link = GetContainerItemLink(bag, slot)
            if link then 
                -- Extrai o nome do item do link
                local _,_,name = string.find(link, "%[(.+)%]")
                
                -- Se for uma ligadura conhecida e melhor que a anterior encontrada
                if name and bPrio[name] and bPrio[name] > maxP then
                    maxP = bPrio[name]
                    bestBag, bestSlot = bag, slot 
                end
            end
        end 
    end

    -- Se encontrou ligadura, aplica-a
    if bestBag then 
        local target = UnitName("target")
        local player = UnitName("player")
        
        -- Garante que o alvo é o jogador (auto-heal)
        if target ~= player then
            TargetUnit("player")
        end
        
        UseContainerItem(bestBag, bestSlot)
        
        -- Se tínhamos outro alvo antes, volta para ele
        if target ~= player and target then
            TargetLastTarget()
        end
    else
        DEFAULT_CHAT_FRAME:AddMessage(BNursePrefix .. " |cffff0000Erro:|r Nenhuma ligadura encontrada!")
    end
end

-- [REGISTO DOS COMANDOS]
SLASH_BANNIONNURSE1 = "/BNurse"
SLASH_BANNIONNURSE2 = "/BHeal" -- Assume o comando antigo do Core
SlashCmdList["BANNIONNURSE"] = BannionNurseLogic

DEFAULT_CHAT_FRAME:AddMessage(BNursePrefix .. " Loaded. Use /BNurse or /BHeal.")