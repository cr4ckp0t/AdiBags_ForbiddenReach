-------------------------------------------------------------------------------
-- AdiBags - Forbidden Reach By Crackpot (US, Illidan)
-------------------------------------------------------------------------------

local addonName, addon = ...
local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")

local tonumber = _G.tonumber
local L = addon.L

local reachFilter = AdiBags:RegisterFilter("Forbidden Reach", 98, "ABEvent-1.0")
reachFilter.uiName = L["Forbidden Reach"]
reachFilter.uiDesc = L["Items from The Forbidden Reach, added in patch 10.0.7."]

function reachFilter:OnInitialize()
    self.reach = {
        -- From: https://www.wowhead.com/guide/forbidden-reach/overview
        -- If I missed any, open a ticket: https://github.com/cr4ckp0t/AdiBags_ForbiddenReach/issues

        -- Primalist Upgrade Gear
        [203612] = true, -- Primalist Cloth Helm
        [203614] = true, -- Primalist Leather Helm
        [203613] = true, -- Primalist Mail Helm
        [203611] = true, -- Primalist Plate Helm
        [203648] = true, -- Primalist Necklace
        [203627] = true, -- Primalist Cloth Spaulders
        [203629] = true, -- Primalist Leather Spaulders
        [203628] = true, -- Primalist Mail Spaulders
        [203626] = true, -- Primalist Plate Spaulders
        [203646] = true, -- Primalist Cloak
        [203616] = true, -- Primalist Cloth Chestpiece
        [203618] = true, -- Primalist Leather Chestpiece
        [203617] = true, -- Primalist Mail Chestpiece
        [203615] = true, -- Primalist Plate Chestpiece
        [203632] = true, -- Primalist Cloth Bracers
        [203630] = true, -- Primalist Leather Bracers
        [203631] = true, -- Primalist Mail Bracers
        [203633] = true, -- Primalist Plate Bracers
        [203642] = true, -- Primalist Cloth Gloves
        [203645] = true, -- Primalist Leather Gloves
        [203644] = true, -- Primalist Mail Gloves
        [203643] = true, -- Primalist Plate Gloves
        [203635] = true, -- Primalist Cloth Belt
        [203637] = true, -- Primalist Leather Belt
        [203636] = true, -- Primalist Mail Belt
        [203634] = true, -- Primalist Plate Belt
        [203622] = true, -- Primalist Cloth Leggings
        [203619] = true, -- Primalist Leather Leggings
        [203620] = true, -- Primalist Mail Leggings
        [203623] = true, -- Primalist Plate Leggings
        [203641] = true, -- Primalist Cloth Boots
        [203638] = true, -- Primalist Leather Boots
        [203639] = true, -- Primalist Mail Boots
        [203640] = true, -- Primalist Plate Boots
        [203647] = true, -- Primalist Ring
        [203649] = true, -- Primalist Trinket
        [203650] = true, -- Primalist Weapon

        -- Mossy Mammoth
        [204360] = true, -- Strange Petrified Orb
        [204369] = true, -- Scrap of Black Dragonscale
        [204363] = true, -- Particularly Ordinary Egg
        [204371] = true, -- Drop of Blue Dragon Magic
        [204364] = true, -- Magically Altered Egg
        [204375] = true, -- Everburning Ruby Coals
        [204366] = true, -- Egg of Unknown Contents
        [204372] = true, -- Speck of Bronze Dust
        [204367] = true, -- Sleeping Ancient Mammoth
        [204374] = true, -- Emerald Dragon Brooch
        [192790] = true, -- Mossy Mammoth

        -- Miscellaneous Items
        [204276] = true, -- Untapped Forbidden Knowledge
        [203217] = true, -- Dragonscale Surplus Crate
        [202871] = true, -- Draconic Artifact
        [200452] = true, -- Dragonscale Expedition Insignia
        [204383] = true, -- Sack of Oddities
        [202196] = true, -- Zskera Vault Key
        [191915] = true, -- Shaggy
        [204558] = true, -- Reliquary Scroll of Perception
        [203220] = true, -- Iskaara Surplus Bag
        [202854] = true, -- Wondrous Fish
        [200453] = true, -- Iskaara Tuskarr Insignia
        [193850] = true, -- Buckie
        [204481] = true, -- Morqut Hearth Totem
        [203222] = true, -- Maruuk Surplus Bundle
        [202872] = true, -- Token of Blessing
        [200454] = true, -- Maruuk Centaur Insignia
        [204382] = true, -- Noble Bruffalon
        [204559] = true, -- Essence of Divination
        [203224] = true, -- Valdrakken Surplus Chest
        [202870] = true, -- Mysterious Writings
        [200455] = true, -- Valdrakken Accord Insignia
        [194549] = true, -- Windborne Velocidrake
        [194705] = true, -- Highland Drake
        [204560] = true, -- Azure Scrying Crystal
        [204352] = true, -- Leftover Elemental Slime
        [192785] = true, -- Gooey Snailemental
        [193374] = true, -- Ashenwing
        [192772] = true, -- Ancient Salamanther
        [193364] = true, -- Scruffles
        [191930] = true, -- Wakyn
        [203398] = true, -- Dampening Powder
        [203407] = true, -- Draconic Suppression Powder
        [203399] = true, -- Damaged Trident
        [203408] = true, -- Ancient Ceremonial Trident
        [203400] = true, -- Lackluster Spices
        [203409] = true, -- Sparkling Spice Pouch
        [203401] = true, -- Dull Crystal
        [203410] = true, -- Glowing Crystal Bookmark
        [203402] = true, -- Broken Gnomish Voicebox
        [203411] = true, -- Gnomish Voicebox
        [203419] = true, -- Elusive Croaking Crab
        [203416] = true, -- Dormant Lifebloom Seeds
        [203403] = true, -- Hastily Scrawled Rune
        [203412] = true, -- Arcane Dispelling Rune
        [203404] = true, -- Crystal Fork
        [203413] = true, -- Crystal Tuning Fork
        [203405] = true, -- Pristine Pelt
        [203414] = true, -- Reinforced Pristine Leather
        [203418] = true, -- Amplified Quaking Stone
        [203417] = true, -- Razor-Sharp Animal Bone
        [203406] = true, -- Torn Morqut Kite
        [203415] = true, -- Traditional Morqut Kite
        [203772] = true, -- Experimental Dragon Pack
    }
end

function reachFilter:Update()
    self:SendMessage("AdiBags_FiltersChanged")
end

function reachFilter:OnEnable()
    AdiBags:UpdateFilters()
end

function reachFilter:OnDisable()
    AdiBags:UpdateFilters()
end

function reachFilter:Filter(slotData)
    if self.reach[tonumber(slotData.itemId)] then
        return L["Forbidden Reach"]
    end
end