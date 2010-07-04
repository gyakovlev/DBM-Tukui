--Some credits go to ALZA and Tukz

local _, class = UnitClass("player")
local t = RAID_CLASS_COLORS[class]
local r, g, b = t.r, t.g, t.b

--Bae Skinning function
function DBT_Bar_Skin(self)
	TukuiDB:SetTemplate(self)
end

--Icon Skinning function
function DBT_Icon_Skin(self)
	TukuiDB:SetTemplate(self)
end

--[[ DBM settings ]]
local UploadDBM = function()
    if(DBM_SavedOptions) then table.wipe(DBM_SavedOptions) end

    DBM_SavedOptions = {
        ["ShowMinimapButton"] = false,
        ["ShowWarningsInChat"] = true,
        ["RaidWarningSound"] = "Sound\\interface\\RaidWarning.wav",
        ["SpecialWarningSound"] = "Sound\\Spells\\PVPFlagTaken.wav",
        ["AutoRespond"] = false,
        ["StatusEnabled"] = false,
        ["RaidWarningPosition"] = {["Y"] = -190, ["X"] = 0, ["Point"] = "TOP"},
        ["Enabled"] = true,
        ["RangeFrameX"] = 254,
        ["RangeFrameY"] = 206,
        ["RangeFramePoint"] = "CENTER",
        ["RangeFrameLocked"] = true,
        ["WarningIconLeft"] = true,
        ["WarningIconRight"] = true,
        ["WarningColors"] = {{["b"] = b, ["g"] = g, ["r"] = r,},
                             {["b"] = b, ["g"] = g, ["r"] = r,},
                             {["b"] = b, ["g"] = g, ["r"] = r,},
                             {["b"] = b, ["g"] = g, ["r"] = r,},},
        ["ShowFakedRaidWarnings"] = false,
        ["SpecialWarningPoint"] = "CENTER",
        ["SpecialWarningX"] = 0,
        ["SpecialWarningY"] = 75,
        ["HPFramePoint"] = "RIGHT",
        ["HealthFrameWidth"] = 175,
        ["HealthFrameLocked"] = true,
        ["HPFrameX"] = -222,
        ["HPFrameY"] = 166,
        ["HealthFrameGrowUp"] = false,
        ["SpamBlockRaidWarning"] = true,
        ["SpamBlockBossWhispers"] = false,
        ["HideBossEmoteFrame"] = false,
        ["FixCLEUOnCombatStart"] = true,
        ["BlockVersionUpdatePopup"] = false,
    }

    if(DBT_SavedOptions) then table.wipe(DBT_SavedOptions) end

    DBT_SavedOptions = {
        ["DBM"] = {
            ["StartColorR"] = r,
            ["StartColorG"] = g,
            ["StartColorB"] = b,
            ["EndColorR"] = r,
            ["EndColorG"] = g,
            ["EndColorB"] = b,
            ["FontSize"] = 12,
            ["Scale"] = 1,
            ["Width"] = 170,
            ["TimerX"] = -251,
            ["TimerY"] = -213,
            ["TimerPoint"] = "RIGHT",
            ["BarXOffset"] = 0,
            ["BarYOffset"] = 4,
            ["IconLeft"] = true,
            ["IconRight"] = false,
            ["ExpandUpwards"] = true,
            ["Texture"] = "Interface\\AddOns\\Tukui\\media\\textures\\normTex",
            ["HugeBarsEnabled"] = false,
            ["HugeBarXOffset"] = 0,
            ["HugeBarYOffset"] = 0,
            ["HugeWidth"] = 300,
            ["HugeTimerX"] = 0,
            ["HugeTimerY"] = 0,
            ["HugeTimerPoint"] = "CENTER",
            ["HugeScale"] = 1,
        },
    }

    DBM_SavedOptions["DBMSKIN_setiings"] = true
    DBM_SavedOptions["ShowMinimapButton"] = false
end

StaticPopupDialogs["APPLY_SKIN"] = {
	text = "We need to wipe your DBM Core/GUI settings to apply Tukui-DBM skin, reconfigure your DBM after install. Your boss settings and history will remain untouched.",
	button1 = ACCEPT,
	button2 = CANCEL,
    OnAccept = function() UploadDBM() ReloadUI() end,
    timeout = 0,
    whileDead = 1,
    hideOnEscape = true,
}


local pr = function(msg)
    print("|cffC495DDDBMskin|r:", tostring(msg))
end

SLASH_DBMSKIN1 = "/dbmskin"
SlashCmdList["DBMSKIN"] = function(msg)
    if(msg=="apply") then
	StaticPopup_Show("APPLY_SKIN")        
    elseif(msg=="test") then
	DBM:DemoMode()
       else
        pr("use |cffFF0000/dbmskin apply|r to upload DBM settings.")
	pr("use |cffFF0000/dbmskin test|r to launch DBM testmode.")
    end
end
--[[ Report that everything is ok ]]
local f = CreateFrame"Frame"
f:RegisterEvent"PLAYER_LOGIN"
f:SetScript("OnEvent", function()
    if(DBM_SavedOptions and DBM_SavedOptions["DBMSKIN_setiings"]) then
        pr("DBM skinned. Enjoy!")
    end
end)

