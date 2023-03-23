-------------------------------------------------------------------------------
-- AdiBags - Forbidden Reach By Crackpot (US, Illidan)
-------------------------------------------------------------------------------

local addonName, addon = ...
local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")

local tonumber = _G.tonumber
local L = addon.L

local stonesFilter = AdiBags:RegisterFilter("Primordial Stones", 98, "ABEvent-1.0")
stonesFilter.uiName = L["Primordial Stones"]
stonesFilter.uiDesc = L["Primordial stones, and associated items, added in patch 10.0.7."]

function stonesFilter:OnInitialize()
    self.stones = {
        -- From: https://www.wowhead.com/guide/forbidden-reach/primordial-stones
        -- If I missed any, open a ticket: https://github.com/cr4ckp0t/AdiBags_ForbiddenReach/issues

        [203460] = true, -- Onyx Annulet
        [204215] = true, -- Dormant Primordial Fragment
        [204012] = true, -- Cold Frost Stone
        [204010] = true, -- Deluging Water Stone
        [204027] = true, -- Desirous Blood Stone
        [204001] = true, -- Echoing Thunder Stone
        [204005] = true, -- Entropic Fel Stone
        [204013] = true, -- Exuding Steam Stone
        [204002] = true, -- Flame Licked Stone
        [204011] = true, -- Freezing Ice Stone
        [204009] = true, -- Gleaming Iron Stone
        [204019] = true, -- Harmonic Music Stone
        [204018] = true, -- Humming Arcane Stone
        [204006] = true, -- Indomitable Earth Stone
        [204021] = true, -- Necromantic Death Stone
        [204025] = true, -- Obscure Pastel Stone
        [204022] = true, -- Pestilent Plague Stone
        [204029] = true, -- Prophetic Twilight Stone
        [204003] = true, -- Raging Magma Stone
        [204004] = true, -- Searing Smokey Stone
        [204007] = true, -- Shining Obsidian Stone
        [204014] = true, -- Sparkling Mana Stone
        [204000] = true, -- Storm Infused Stone
        [204015] = true, -- Swirling Mojo Stone
        [204020] = true, -- Wild Spirit Stone
        [204030] = true, -- Wind Sculpted Stone
        [204217] = true, -- Unstable Elementium
        [193368] = true, -- Silken Gemdust
        [204578] = true, -- Condensed Arcane Magic
        [204575] = true, -- Condensed Earth Magic
        [204573] = true, -- Condensed Fire Magic
        [204574] = true, -- Condensed Frost Magic
        [204577] = true, -- Condensed Nature Magic
        [204579] = true, -- Condensed Necromantic Magic
        [204576] = true, -- Condensed Shadow Magic
    }
end

function stonesFilter:Update()
    self:SendMessage("AdiBags_FiltersChanged")
end

function stonesFilter:OnEnable()
    AdiBags:UpdateFilters()
end

function stonesFilter:OnDisable()
    AdiBags:UpdateFilters()
end

function stonesFilter:Filter(slotData)
    if self.stones[tonumber(slotData.itemId)] then
        return L["Primordial Stones"]
    end
end