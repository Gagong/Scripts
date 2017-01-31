if myHero.charName ~= "Vayne" then return end

_G.FixBugSplat = false
_G.VayneScriptName = "My HeRo - Vayne"
_G.VayneScriptVersion = {1.25, "1.25", "|1.25|"}
_G.VayneScriptAuthor = "HeRoBaNd"

-- BoL Tools Tracker --
assert(load(Base64Decode("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"), nil, "bt", _ENV))()
TrackerLoad("SthOtiPosir5RwpV")
-- BoL Tools Tracker --

function OnLoad() 
    MyHeRoVayne()
end

class("MyHeRoVayne")

function MyHeRoVayne:__init()

    self:AutoUpdater()
    self:LoadLib()
    self:Message("Loaded!", 3)
    self.Smite = false
    self.Heal = false
    self.Barrier = false
    if myHero:GetSpellData(SUMMONER_1).name:find("SummonerSmite") then 
        SummonerSmite = SUMMONER_1 
        self.Smite = true 
    elseif myHero:GetSpellData(SUMMONER_2).name:find("SummonerSmite") then 
        SummonerSmite = SUMMONER_2 
        self.Smite = true 
    end
    if myHero:GetSpellData(SUMMONER_1).name:find("SummonerHeal") then 
        SummonerHeal = SUMMONER_1 
        self.Heal = true
    elseif myHero:GetSpellData(SUMMONER_2).name:find("SummonerHeal") then 
        SummonerHeal = SUMMONER_2 
        self.Heal = true
    end
    if myHero:GetSpellData(SUMMONER_1).name:find("SummonerBarrier") then 
        SummonerBarrier = SUMMONER_1
        self.Barrier = true
    elseif myHero:GetSpellData(SUMMONER_2).name:find("SummonerBarrier") then 
        SummonerBarrier = SUMMONER_2 
        self.Barrier = true
    end
    ts = TargetSelector(TARGET_PRIORITY, 1000, DAMAGE_PHYSICAL)
    self:Tables()
    self:Global_Menu()
    self.Menu.Drawings.PermaShow = false
    self.Menu.Utility.skin.changeSkin = false
    self.Menu.Utility.LvLUp.Enable = false
    self.Menu.LaneClear.ClearKey = false
    self.Menu.JungleClear.JClearKey = false
    self.Menu.Combo.EAA = false
    self:Loader()
    if VIP_USER then
        self:SkinLoad()
    end
end

function MyHeRoVayne:AutoUpdater()
    local ToUpdate = {}
    ToUpdate.Version = _G.VayneScriptVersion[1]
    ToUpdate.UseHttps = true
    ToUpdate.Host = "raw.githubusercontent.com"
    ToUpdate.VersionPath = "/HeRoBaNd/Scripts/master/My%20HeRo%20-%20Vayne.version"
    ToUpdate.ScriptPath =  "/HeRoBaNd/Scripts/master/My%20HeRo%20-%20Vayne.lua"
    ToUpdate.SavePath = SCRIPT_PATH.."/My HeRo - Vayne.lua"
    ToUpdate.CallbackUpdate = function(NewVersion,OldVersion) print("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">My HeRo - </font> <font color=\"#F7CB72\">Vayne</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: "..NewVersion.."</font></b>") end
    ToUpdate.CallbackNoUpdate = function(OldVersion) print("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">My HeRo - </font> <font color=\"#F7CB72\">Vayne</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: No Updates Found!</font></b>") end
    ToUpdate.CallbackNewVersion = function(NewVersion) print("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">My HeRo - </font> <font color=\"#F7CB72\">Vayne</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: New Version Found ("..NewVersion.."). Please wait until it's Downloaded!</font></b>") end
    ToUpdate.CallbackError = function(NewVersion) print("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">My HeRo - </font> <font color=\"#F7CB72\">Vayne</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: Error while Downloading! Please try again!</font></b>") end
    ScriptUpdate(ToUpdate.Version, ToUpdate.UseHttps, ToUpdate.Host, ToUpdate.VersionPath, ToUpdate.ScriptPath, ToUpdate.SavePath, ToUpdate.CallbackUpdate, ToUpdate.CallbackNoUpdate, ToUpdate.CallbackNewVersion, ToUpdate.CallbackError)
end

function MyHeRoVayne:LoadLib()
    self.CPSPath = LIB_PATH.."CustomPermaShow.lua"
    if not FileExist(self.CPSPath) then
        self:Message("Custom Perma Show not found, wait Download...", 0)
        self.CPSHost = "raw.githubusercontent.com"
        self.CPSWebPath = "/Superx321/BoL/common/CustomPermaShow.lua".."?rand="..math.random(1,10000)
        DownloadFile("https://"..self.CPSHost..self.CPSWebPath, self.CPSPath, function ()  end)
        DelayAction(function() require("CustomPermaShow") end, 5)
        self:Message("Custom Perma Show Downloaded and Loaded!", 5)
    else
        require("CustomPermaShow")
        self:Message("Custom Perma Show Found!", 5)
    end

    self.VPPath = LIB_PATH.."VPrediction.lua"
    if not FileExist(self.VPPath) then
        self:Message("VPrediction not found, wait Download...", 0)
        self.VPHost = "raw.githubusercontent.com"
        self.VPWebPath = "/SidaBoL/Scripts/Common/VPrediction.lua".."?rand="..math.random(1,10000)
        DownloadFile("https://"..self.VPHost..self.VPWebPath, self.VPPath, function ()  end)
        DelayAction(function() require("VPrediction") end, 5)
        self.VP = VPrediction()
        self:Message("VPrediction Downloaded and Loaded!", 5)
    else
        require("VPrediction")
        self.VP = VPrediction()
        self:Message("VPrediction found!", 5)
    end
end

function MyHeRoVayne:Tables()
    self.isAGapcloserUnitTarget = {
        ['AkaliShadowDance']        = {true, Champ = 'Akali',       spellKey = 'R'},
        ['Headbutt']                = {true, Champ = 'Alistar',     spellKey = 'W'},
        ['DianaTeleport']           = {true, Champ = 'Diana',       spellKey = 'R'},
        ['IreliaGatotsu']           = {true, Champ = 'Irelia',      spellKey = 'Q'},
        ['JaxLeapStrike']           = {true, Champ = 'Jax',         spellKey = 'Q'},
        ['JayceToTheSkies']         = {true, Champ = 'Jayce',       spellKey = 'Q'},
        ['MaokaiUnstableGrowth']    = {true, Champ = 'Maokai',      spellKey = 'W'},
        ['MonkeyKingNimbus']        = {true, Champ = 'MonkeyKing',  spellKey = 'E'},
        ['Pantheon_LeapBash']       = {true, Champ = 'Pantheon',    spellKey = 'W'},
        ['PoppyHeroicCharge']       = {true, Champ = 'Poppy',       spellKey = 'E'},
        ['QuinnE']                  = {true, Champ = 'Quinn',       spellKey = 'E'},
        ['XenZhaoSweep']            = {true, Champ = 'XinZhao',     spellKey = 'E'},
        ['blindmonkqtwo']           = {true, Champ = 'LeeSin',      spellKey = 'Q'},
        ['FizzPiercingStrike']      = {true, Champ = 'Fizz',        spellKey = 'Q'},
        ['RengarLeap']              = {true, Champ = 'Rengar',      spellKey = 'AA'},
    }

    self.isAGapcloserUnitNoTarget = {
        ['AatroxQ']                 = {true, Champ = 'Aatrox',      range = 1000,   projSpeed = 1200, spellKey = 'Q'},
        ['GragasE']                 = {true, Champ = 'Gragas',      range = 600,    projSpeed = 2000, spellKey = 'E'},
        ['GravesMove']              = {true, Champ = 'Graves',      range = 425,    projSpeed = 2000, spellKey = 'E'},
        ['HecarimUlt']              = {true, Champ = 'Hecarim',     range = 1000,   projSpeed = 1200, spellKey = 'R'},
        ['JarvanIVDragonStrike']    = {true, Champ = 'JarvanIV',    range = 770,    projSpeed = 2000, spellKey = 'Q'},
        ['JarvanIVCataclysm']       = {true, Champ = 'JarvanIV',    range = 650,    projSpeed = 2000, spellKey = 'R'},
        ['KhazixE']                 = {true, Champ = 'Khazix',      range = 900,    projSpeed = 2000, spellKey = 'E'},
        ['khazixelong']             = {true, Champ = 'Khazix',      range = 900,    projSpeed = 2000, spellKey = 'E'},
        ['LeblancSlide']            = {true, Champ = 'Leblanc',     range = 600,    projSpeed = 2000, spellKey = 'W'},
        ['LeblancSlideM']           = {true, Champ = 'Leblanc',     range = 600,    projSpeed = 2000, spellKey = 'WMimic'},
        ['LeonaZenithBlade']        = {true, Champ = 'Leona',       range = 900,    projSpeed = 2000, spellKey = 'E'},
        ['UFSlash']                 = {true, Champ = 'Malphite',    range = 1000,   projSpeed = 1800, spellKey = 'R'},
        ['RenektonSliceAndDice']    = {true, Champ = 'Renekton',    range = 450,    projSpeed = 2000, spellKey = 'E'},
        ['SejuaniArcticAssault']    = {true, Champ = 'Sejuani',     range = 650,    projSpeed = 2000, spellKey = 'Q'},
        ['ShenShadowDash']          = {true, Champ = 'Shen',        range = 575,    projSpeed = 2000, spellKey = 'E'},
        ['RocketJump']              = {true, Champ = 'Tristana',    range = 900,    projSpeed = 2000, spellKey = 'W'},
        ['slashCast']               = {true, Champ = 'Tryndamere',  range = 650,    projSpeed = 1450, spellKey = 'E'},
    }

    self.isAChampToInterrupt = {
        ['KatarinaR']                   = {true, Champ = 'Katarina',    spellKey = 'R'},
        ['GalioIdolOfDurand']           = {true, Champ = 'Galio',       spellKey = 'R'},
        ['Crowstorm']                   = {true, Champ = 'FiddleSticks',spellKey = 'R'},
        ['Drain']                       = {true, Champ = 'FiddleSticks',spellKey = 'W'},
        ['AbsoluteZero']                = {true, Champ = 'Nunu',        spellKey = 'R'},
        ['ShenStandUnited']             = {true, Champ = 'Shen',        spellKey = 'R'},
        ['UrgotSwap2']                  = {true, Champ = 'Urgot',       spellKey = 'R'},
        ['AlZaharNetherGrasp']          = {true, Champ = 'Malzahar',    spellKey = 'R'},
        ['FallenOne']                   = {true, Champ = 'Karthus',     spellKey = 'R'},
        ['Pantheon_GrandSkyfall_Jump']  = {true, Champ = 'Pantheon',    spellKey = 'R'},
        ['VarusQ']                      = {true, Champ = 'Varus',       spellKey = 'Q'},
        ['CaitlynAceintheHole']         = {true, Champ = 'Caitlyn',     spellKey = 'R'},
        ['MissFortuneBulletTime']       = {true, Champ = 'MissFortune', spellKey = 'R'},
        ['InfiniteDuress']              = {true, Champ = 'Warwick',     spellKey = 'R'},
        ['LucianR']                     = {true, Champ = 'Lucian',      spellKey = 'R'},
        ['JhinR']                       = {true, Champ = 'Jhin',        spellKey = 'R'}
    }

    self.Sequences = {
        [0]             =   {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        [1]             =   {_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E}, 
        [2]             =   {_Q, _E, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W}, 
        [3]             =   {_W, _Q, _E, _W, _W, _R, _W, _Q, _W, _Q, _R, _Q, _Q, _E, _E, _R, _E, _E}, 
        [4]             =   {_W, _E, _Q, _W, _W, _R, _W, _E, _W, _E, _R, _E, _E, _Q, _Q, _R, _Q, _Q}, 
        [5]             =   {_E, _Q, _W, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W}, 
        [6]             =   {_E, _W, _Q, _E, _E, _R, _E, _W, _E, _W, _R, _W, _W, _Q, _Q, _R, _Q, _Q},
        ["Vayne"]       =   {_Q, _W, _E, _W, _W, _R, _W, _Q, _W, _Q, _R, _Q, _Q, _E, _E, _R, _E, _E}
    }

    self.SequencesName = {
        [0]             =   {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        [1]             =   {"Q", "W", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"}, 
        [2]             =   {"Q", "E", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"}, 
        [3]             =   {"W", "Q", "E", "W", "W", "R", "W", "Q", "W", "Q", "R", "Q", "Q", "E", "E", "R", "E", "E"}, 
        [4]             =   {"W", "E", "Q", "W", "W", "R", "W", "E", "W", "E", "R", "E", "E", "Q", "Q", "R", "Q", "Q"}, 
        [5]             =   {"E", "Q", "W", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "R", "W", "W"}, 
        [6]             =   {"E", "W", "Q", "E", "E", "R", "E", "W", "E", "W", "R", "W", "W", "Q", "Q", "R", "Q", "Q"},
        ["Vayne"]       =   {"Q", "W", "E", "W", "W", "R", "W", "Q", "W", "Q", "R", "Q", "Q", "E", "E", "R", "E", "E"}
    }

    self.SpellVarTable = {
        "Q-W-E",  
        "Q-E-W",  
        "W-Q-E",  
        "W-E-Q",  
        "E-Q-W",  
        "E-W-Q"
    }

    self.invul = {
        "sionpassivezombie"
    }

    self.Skills = {
        "Q", 
        "W", 
        "E", 
        "R"
    }

    self.ItemList = {
        BoTRK = {id = 3153, slot = nil},
        BWC   = {id = 3152, slot = nil},
        Youmu = {id = 3142, slot = nil},
    }

    self.PotList = {
        P_1 = {id = 2003, slot = nil},
        P_2 = {id = 2031, slot = nil},
        P_3 = {id = 2032, slot = nil},
        P_4 = {id = 2033, slot = nil},
        P_5 = {id = 2009, slot = nil},
        P_6 = {id = 2010, slot = nil}
    }

    self.QSSList = {
        QSS = {id = 3140, slot = nil},
        MCS = {id = 3139, slot = nil}
    }

    self.PotNameBuff = {
        "ItemCrystalFlask", 
        "RegenerationPotion", 
        "ItemMiniRegenPotion", 
        "ItemCrystalFlaskJungle", 
        "ItemDarkCrystalFlask",
    }

    self.xBase = {
        ["x"] = 406, 
        ["z"] = 424
    }

    self.zBase = {
        ["x"] = 14322, 
        ["z"] = 14394
    }

    self.SkinList = {
        "Vindicator", 
        "Aristocrat", 
        "Dragonslayer", 
        "Heartseeker", 
        "SKT T1", 
        "Arclight", 
        "Chroma Pack: Green", 
        "Chroma Pack: Red", 
        "Chroma Pack: Silver", 
        "Hextech", 
        "Classic"
    }
end

function MyHeRoVayne:Global_Menu()
    self.Menu = scriptConfig('My HeRo - Vayne', 'MHV')

    self.Menu:addSubMenu("[Vayne] - Combo", "Combo")
        self.Menu.Combo:addParam("ComboKey", "Combo Key:", SCRIPT_PARAM_ONKEYDOWN, false, 32)
        self.Menu.Combo:addParam("ComboQ", "Use Q in Combo:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.Combo:addParam("EAA", "Cast E after Next AA:", SCRIPT_PARAM_ONKEYTOGGLE, false, GetKey("E"))
        self.Menu.Combo:addParam("ComboR", "Use R in Combo:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.Combo:addParam("ComboRRange", "Enemies in Range for R:", SCRIPT_PARAM_SLICE, 2, 0, 5, 0)
        self.Menu.Combo:addParam("ComboRange", "Range for R:", SCRIPT_PARAM_SLICE, 1000, 500, 3000, 0)
        self.Menu.Combo:addSubMenu("Item usage:", "Items")
            self.Menu.Combo.Items:addParam("BOTRK", "Use BOTRK in Combo:", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Combo.Items:addParam("BWC", "Use Bilgewater Cutlass in Combo:", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Combo.Items:addParam("YGB", "Use Youmu in Combo:", SCRIPT_PARAM_ONOFF, true)

    self.Menu:addSubMenu('[Vayne] - AntiGapCloser Settings', 'AntiGapClosers')
    self.Menu:addSubMenu('[Vayne] - Auto Stun Target', 'ASTarget')
    self.Menu:addSubMenu('[Vayne] - Interrupt Settings', 'Interrupt')

    local FoundAGapCloser = false
    for index, data in pairs(self.isAGapcloserUnitTarget) do
        for index2, enemy in ipairs(GetEnemyHeroes()) do
            if data['Champ'] == enemy.charName then
                self.Menu.AntiGapClosers:addSubMenu(enemy.charName..' ('..data.spellKey..')', enemy.charName)
                self.Menu.AntiGapClosers[enemy.charName]:addParam('fap', 'Supported Spell Found: '..enemy.charName..' ('..data.spellKey..')', SCRIPT_PARAM_INFO, '')
                self.Menu.AntiGapClosers[enemy.charName]:addParam('FightMode', 'AntiGapCloser in Fight Mode:', SCRIPT_PARAM_ONOFF, true)
                self.Menu.AntiGapClosers[enemy.charName]:addParam('HarassMode', 'AntiGapCloser in Harass Mode:', SCRIPT_PARAM_ONOFF, true)
                self.Menu.AntiGapClosers[enemy.charName]:addParam('LaneClear', 'AntiGapCloser in LaneClear Mode:', SCRIPT_PARAM_ONOFF, false)
                self.Menu.AntiGapClosers[enemy.charName]:addParam('LastHit', 'AntiGapCloser in LastHit Mode:', SCRIPT_PARAM_ONOFF, false)
                self.Menu.AntiGapClosers[enemy.charName]:addParam('Always', 'AntiGapCloser Always Mode:', SCRIPT_PARAM_ONOFF, false)
                FoundAGapCloser = true
            end
        end
    end
    for index, data in pairs(self.isAGapcloserUnitNoTarget) do
        for index2, enemy in ipairs(GetEnemyHeroes()) do
            if data['Champ'] == enemy.charName then
                self.Menu.AntiGapClosers:addSubMenu(enemy.charName..' ('..data.spellKey..')', enemy.charName)
                self.Menu.AntiGapClosers[enemy.charName]:addParam('fap', 'Supported Spell Found: '..enemy.charName..' ('..data.spellKey..')', SCRIPT_PARAM_INFO, '')
                self.Menu.AntiGapClosers[enemy.charName]:addParam('FightMode', 'AntiGapCloser in Fight Mode:', SCRIPT_PARAM_ONOFF, true)
                self.Menu.AntiGapClosers[enemy.charName]:addParam('HarassMode', 'AntiGapCloser in Harass Mode:', SCRIPT_PARAM_ONOFF, true)
                self.Menu.AntiGapClosers[enemy.charName]:addParam('LaneClear', 'AntiGapCloser in LaneClear Mode:', SCRIPT_PARAM_ONOFF, false)
                self.Menu.AntiGapClosers[enemy.charName]:addParam('LastHit', 'AntiGapCloser in LastHit Mode:', SCRIPT_PARAM_ONOFF, false)
                self.Menu.AntiGapClosers[enemy.charName]:addParam('Always', 'AntiGapCloser Always:', SCRIPT_PARAM_ONOFF, false)
                FoundAGapCloser = true
            end
        end
    end
    if not FoundAGapCloser then self.Menu.AntiGapClosers:addParam('nil','No Enemy Gapclosers found!', SCRIPT_PARAM_INFO, '') end

    local FoundStunTarget = false
    for index, enemy in ipairs(GetEnemyHeroes()) do
        self.Menu.ASTarget:addSubMenu(enemy.charName, enemy.charName)
        self.Menu.ASTarget[enemy.charName]:addParam('fap', 'Auto Stun '..enemy.charName..' Settings:', SCRIPT_PARAM_INFO, '')
        self.Menu.ASTarget[enemy.charName]:addParam('FightMode', 'Auto Stun in Fight Mode:', SCRIPT_PARAM_ONOFF, true)
        self.Menu.ASTarget[enemy.charName]:addParam('HarassMode', 'Auto Stun in Harass Mode:', SCRIPT_PARAM_ONOFF, false)
        self.Menu.ASTarget[enemy.charName]:addParam('LaneClear', 'Auto Stun in LaneClear Mode:', SCRIPT_PARAM_ONOFF, false)
        self.Menu.ASTarget[enemy.charName]:addParam('LastHit', 'Auto Stun in LastHit Mode:', SCRIPT_PARAM_ONOFF, false)
        self.Menu.ASTarget[enemy.charName]:addParam('Always', 'Auto Stun Always:', SCRIPT_PARAM_ONOFF, false)
        FoundStunTarget = true
    end
    self.Menu.ASTarget:addParam("PushDistance", "Push Distance:", SCRIPT_PARAM_SLICE, 440, 440, 450, 0)
    if not FoundStunTarget then self.Menu.ASTarget:addParam('nil','No Enemies to Stun found!', SCRIPT_PARAM_INFO, '') end

    local Foundinterrupt = false
    for index, data in pairs(self.isAChampToInterrupt) do
        for index, enemy in ipairs(GetEnemyHeroes()) do
            if data['Champ'] == enemy.charName then
                self.Menu.Interrupt:addSubMenu(enemy.charName..' ('..data.spellKey..')', enemy.charName)
                self.Menu.Interrupt[enemy.charName]:addParam('fap', 'Interrupt Spell Found: '..enemy.charName..' ('..data.spellKey..')', SCRIPT_PARAM_INFO, '')
                self.Menu.Interrupt[enemy.charName]:addParam('FightMode', 'Auto Interrupt in Fight Mode:', SCRIPT_PARAM_ONOFF, true)
                self.Menu.Interrupt[enemy.charName]:addParam('HarassMode', 'Auto Interrupt in Harass Mode:', SCRIPT_PARAM_ONOFF, true)
                self.Menu.Interrupt[enemy.charName]:addParam('LaneClear', 'Auto Interrupt in LaneClear Mode:', SCRIPT_PARAM_ONOFF, true)
                self.Menu.Interrupt[enemy.charName]:addParam('LastHit', 'Auto Interrupt in LastHit Mode:', SCRIPT_PARAM_ONOFF, true)
                self.Menu.Interrupt[enemy.charName]:addParam('Always', 'Auto Interrupt Always:', SCRIPT_PARAM_ONOFF, true)
                Foundinterrupt = true
            end
        end
    end
    if not Foundinterrupt then self.Menu.Interrupt:addParam('nil','No Enemies to Interrupt found!', SCRIPT_PARAM_INFO, '') end

    self.Menu:addSubMenu("[Vayne] - Lane Clear", "LaneClear")
        self.Menu.LaneClear:addParam("ClearKey", "Lane Clear Key:", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
        self.Menu.LaneClear:addParam("ClearQ", "Use Q in Lane Clear:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.LaneClear:addParam("LaneClearMana", "Min mana % to use Q:", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)

    self.Menu:addSubMenu("[Vayne] - Jungle Clear", "JungleClear")
        self.Menu.JungleClear:addParam("JClearKey", "Jungle Clear Key:", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
        self.Menu.JungleClear:addParam("JClearQ", "Use Q in Jungle Clear:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.JungleClear:addParam("JungleClearMana", "Min mana % to use Q:", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)

    self.Menu:addSubMenu("[Vayne] - Last Hit", "LastHit")
        self.Menu.LastHit:addParam("LastHitKey", "Last Hit Key:", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("A"))
        self.Menu.LastHit:addParam("LastHitQ", "Use Q in Last Hit:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.LastHit:addParam("LastHitMana", "Min mana % to use Q:", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)

    self.Menu:addSubMenu("[Vayne] - Harass", "Harass")
        self.Menu.Harass:addParam("HarassKey", "Harass Key:", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
        self.Menu.Harass:addParam("BurstHarass", "Use Burst Harass (AA+Q+E):", SCRIPT_PARAM_ONOFF, true)
        self.Menu.Harass:addParam("HarassQ", "Use Q in Harass:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.Harass:addParam("HarassMana", "Min mana % to use Q:", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)

    self.Menu:addSubMenu("[Vayne] - Utility Settings", "Utility")
        if self.Smite then
            self:Message("Auto Smite by My Summoner Spells Script Loaded! You Can Download full Script (FREE) on forum!", 90)
        self.Menu.Utility:addSubMenu("Auto Smite", "Smite")
            self.Menu.Utility.Smite:addParam("Enable", "Enable Auto Smite:", SCRIPT_PARAM_ONKEYTOGGLE, true, string.byte("H"))
            self.Menu.Utility.Smite:addParam("DrawSmiteRange", "Draw Smite Range:" , SCRIPT_PARAM_ONOFF, true)
            self.Menu.Utility.Smite:addParam("DrawSmiteProcess", "Draw Smite Process:", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Utility.Smite:addParam("y", "", SCRIPT_PARAM_INFO, "")

        self.Menu.Utility.Smite:addParam("z", "Smite Monsters:", SCRIPT_PARAM_INFO, "")

        self.Menu.Utility.Smite:addParam("y", "", SCRIPT_PARAM_INFO, "")
            if GetGame().map.shortName == "twistedTreeline" then
                self.Menu.Utility.Smite:addParam("Wraith", "Use Smite on: Wraith", SCRIPT_PARAM_ONOFF, true)
                self.Menu.Utility.Smite:addParam("Golem", "Use Smite on: Golem", SCRIPT_PARAM_ONOFF, true)
                self.Menu.Utility.Smite:addParam("Wolf", "Use Smite on: Wolf", SCRIPT_PARAM_ONOFF, true)
                self.Menu.Utility.Smite:addParam("Spiderboss", "Use Smite on: SpiderBoss", SCRIPT_PARAM_ONOFF, true)
            else
                self.Menu.Utility.Smite:addParam("Dragon", "Use Smite on: Dragon", SCRIPT_PARAM_ONOFF, true)
                self.Menu.Utility.Smite:addParam("Baron", "Use Smite on: Baron", SCRIPT_PARAM_ONOFF, true)
                self.Menu.Utility.Smite:addParam("RiftHerald", "Use Smite on: Rift Herald", SCRIPT_PARAM_ONOFF, true)
                self.Menu.Utility.Smite:addParam("Razorbeak", "Use Smite on: Wraith", SCRIPT_PARAM_ONOFF, false)
                self.Menu.Utility.Smite:addParam("Murkwolf", "Use Smite on: Wolf", SCRIPT_PARAM_ONOFF, false)
                self.Menu.Utility.Smite:addParam("Krug", "Use Smite on: Krug", SCRIPT_PARAM_ONOFF, false)
                self.Menu.Utility.Smite:addParam("Crab", "Use Smite on: Crab", SCRIPT_PARAM_ONOFF, false)
                self.Menu.Utility.Smite:addParam("Gromp", "Use Smite on: Gromp", SCRIPT_PARAM_ONOFF, false)
                self.Menu.Utility.Smite:addParam("Red", "Use Smite on: Red Buff", SCRIPT_PARAM_ONOFF, true)
                self.Menu.Utility.Smite:addParam("Blue", "Use Smite on: Blue Buff", SCRIPT_PARAM_ONOFF, true)
            end 
        end

        if VIP_USER then
            self.Menu.Utility:addSubMenu("Skin Changer", "skin")

            self.Menu.Utility:addSubMenu("Auto Level - Up", "LvLUp")
                self.Menu.Utility.LvLUp:addParam("Enable", "Enable Auto Level - Up:", SCRIPT_PARAM_ONOFF, false)
                self.Menu.Utility.LvLUp:addParam("Humanizer", "Use Humanizer:", SCRIPT_PARAM_SLICE, 100, 0, 1000, 0)
                self.Menu.Utility.LvLUp:addParam("Mod", "Mode:", SCRIPT_PARAM_LIST, 1, {"Auto", "Manual"})
                self.Menu.Utility.LvLUp:addParam("Level13", "Level 1-3:", SCRIPT_PARAM_LIST, 1, self.SpellVarTable)
                self.Menu.Utility.LvLUp:addParam("Level418", "Level 4-18:", SCRIPT_PARAM_LIST, 1, self.SpellVarTable)
        end

        self.Menu.Utility:addSubMenu("Potions", "Potions")
            self.Menu.Utility.Potions:addParam("EnablePot", "Enable Auto Potions:", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Utility.Potions:addParam("EnableCPot", "Use Only in Combo Mode:", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Utility.Potions:addParam("EnableCKeyPot", "You Combo Mode Key:", SCRIPT_PARAM_ONKEYDOWN, false, 32)
            self.Menu.Utility.Potions:addParam("PotMinHealth", "Health to Use Auto Potions:", SCRIPT_PARAM_SLICE, 25, 0, 100, 0)

        if self.Heal then
            self:Message("Auto Heal by My Summoner Spells Script Loaded! You Can Download full Script (FREE) on forum!", 90)
            self.Menu.Utility:addSubMenu("Auto Heal", "Heal")
                self.Menu.Utility.Heal:addParam("Enable", "Enable Auto Heal:", SCRIPT_PARAM_ONOFF, true)
                self.Menu.Utility.Heal:addParam("MinHealth", "Health to Use Auto Heal:", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)
                self.Menu.Utility.Heal:addParam("ComboEnable", "Use only in Combo Mode:", SCRIPT_PARAM_ONOFF, true)
                self.Menu.Utility.Heal:addParam("Key", "You Combo Mode Key:", SCRIPT_PARAM_ONKEYDOWN, false, 32)
                self.Menu.Utility.Heal:addParam("AllyHeal", "Use on Ally:", SCRIPT_PARAM_ONOFF, true)
                self.Menu.Utility.Heal:addParam("AllyMinHealth", "Ally Health to Use Auto Heal:", SCRIPT_PARAM_SLICE, 10, 0, 100, 0)
                self.Menu.Utility.Heal:addParam("Draw", "Enable Heal Range Draw:", SCRIPT_PARAM_ONOFF, true)
        end

        if self.Barrier then
            self:Message("Auto Barrier by My Summoner Spells Script Loaded! You Can Download full Script (FREE) on forum!", 90)
            self.Menu.Utility:addSubMenu("Auto Barrier", "Barrier")
                self.Menu.Utility.Barrier:addParam("Enable", "Enable Auto Barrier:", SCRIPT_PARAM_ONOFF, true)
                self.Menu.Utility.Barrier:addParam("MinHealth", "Health to Use Auto Barrier:", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)
                self.Menu.Utility.Barrier:addParam("ComboEnable", "Use only in Combo Mode:", SCRIPT_PARAM_ONOFF, true)
                self.Menu.Utility.Barrier:addParam("Key", "You Combo Mode Key:", SCRIPT_PARAM_ONKEYDOWN, false, 32)
        end
                
        self.Menu.Utility:addSubMenu("RemoveCC Settings", "RemoveCC")
            self.Menu.Utility.RemoveCC:addParam("EnableQSS", "Enable QSS:", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Utility.RemoveCC:addParam("QSSHumanizer", "Use Humanizer:", SCRIPT_PARAM_SLICE, 100, 0, 1000, 0)

            self.Menu.Utility.RemoveCC:addParam("xxx", "", SCRIPT_PARAM_INFO, "")

            self.Menu.Utility.RemoveCC:addParam("Stun", "Remove Stun:", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Utility.RemoveCC:addParam("Taunt", "Remove Taunt:", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Utility.RemoveCC:addParam("Root", "Remove Root:", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Utility.RemoveCC:addParam("Fear", "Remove Fear:", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Utility.RemoveCC:addParam("Charm", "Remove Charm:", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Utility.RemoveCC:addParam("Suppression", "Remove Suppression:", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Utility.RemoveCC:addParam("KnockUp", "Remove Knock-Up:", SCRIPT_PARAM_ONOFF, true)
            
    self.Menu:addSubMenu("[Vayne] - Drawings", "Drawings")
        self.Menu.Drawings:addParam("DrawCircleAA", "Draw AA Range:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.Drawings:addParam("DrawCircleE", "Draw E Range:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.Drawings:addParam("PermaShow", "Enable Perma Show:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.Drawings:addParam("Quality", "Draw Quality", SCRIPT_PARAM_SLICE, 5, 1, 10, 0)

        self.Menu.Drawings:addParam("2222", "", SCRIPT_PARAM_INFO, "")
        self.Menu.Drawings:addParam("1111", "High quality - reduce the FPS", SCRIPT_PARAM_INFO, "")
    ------------------------------------------------------------------------------------------------------------------
    self.Menu:addParam("b", "", SCRIPT_PARAM_INFO, "")
    if VIP_USER then
        self.Menu:addParam("b1", "User: "..GetUser().." (VIP)", SCRIPT_PARAM_INFO, "")
    else
        self.Menu:addParam("b2", "User: "..GetUser().." (FREE)", SCRIPT_PARAM_INFO, "")
    end
    self.Menu:addParam("b3", "Script Version: ".._G.VayneScriptVersion[2], SCRIPT_PARAM_INFO, "")
    self.Menu:addParam("b4", "Script Author: ".._G.VayneScriptAuthor, SCRIPT_PARAM_INFO, "")
end

function MyHeRoVayne:Loader()
    self.W_Stacks = {}
    self.LastTarget = nil
    self.LastLevel = 0
    self.F = false
    self.ActivePot = false
    self.NoHealSpamMsg = 0
    self.NoBarrierSpamMsg = 0
    self.NoFixSpamMsg = 0
    AddTickCallback(function() self:OnTick() end)
    AddDrawCallback(function() self:OnDraw() end)
    AddUnloadCallback(function() self:OnUnload() end)
    AddProcessSpellCallback(function(unit, spell) self:OnProcessSpell(unit, spell) end)
    AddProcessAttackCallback(function(unit, spell) self:OnProcessAttack(unit, spell) end)
    AddApplyBuffCallback(function(unit, source, buff) self:OnApplyBuff(unit, source, buff) end)
    AddUpdateBuffCallback(function(unit, buff, stacks) self:OnUpdateBuff(unit, buff, stacks) end)
    AddRemoveBuffCallback(function(unit, buff) self:OnRemoveBuff(unit, buff) end)
end

function MyHeRoVayne:OnUnload()
    SetSkin(myHero, -1)
    self.Menu.Utility.skin.changeSkin = false
end

function MyHeRoVayne:OnTick()
    ts:update()
    self:CondemnStun()
    self:ComboREnemy()
    self:BaseCheck()
    self:CastItems()

    if not _G.FixBugSplat then
        self:LevelUpSpell()
    elseif self.Menu.Utility.LvLUp.Enable then
        if os.clock() - self.NoFixSpamMsg > 2 then
            self.NoFixSpamMsg = os.clock()
            self:Message("Try [_G.FixBugSplat = false] if you haven't BugSplat and(or) Bol Fully Updated!", 0)
            self.Menu.Utility.LvLUp.Enable = false
        end
    end

    if self.Menu.Drawings.PermaShow then
        self:PermaShow()
    end

    if self.Heal then
        self:AutoHealDetect()
    end

    if self.Barrier then
        self:AutoBarrierDetect()
    end

    if self.Smite then
        self:AutoSmite()
    end

    if (self.Menu.Utility.Potions.EnablePot and not self.Menu.Utility.Potions.EnableCPot) then
        self:AutoPotions()
    elseif self.Menu.Utility.Potions.EnablePot and self.Menu.Utility.Potions.EnableCPot and self.Menu.Utility.Potions.EnableCKeyPot then
        self:AutoPotions()
    end
end

function MyHeRoVayne:PermaShow()
    if self.Menu.Drawings.PermaShow then
        CustomPermaShow("                  My HeRo - Vayne", "", true, nil, nil, nil, 2)
        if self.Menu.Combo.ComboKey then
            CustomPermaShow("Current Mode:", "        Combo", true, RGB(153, 0, 153), nil, nil, 1)
        elseif self.Menu.Harass.HarassKey then
            CustomPermaShow("Current Mode:", "       Harass", true, RGB(153, 0, 153), nil, nil, 1)
        elseif (self.Menu.LaneClear.ClearKey or self.Menu.JungleClear.JClearKey) then
            CustomPermaShow("Current Mode:", "   Wave Clear", true, RGB(153, 0, 153), nil, nil, 1)
        elseif self.Menu.LastHit.LastHitKey then
            CustomPermaShow("Current Mode:", "       Last Hit", true, RGB(153, 0, 153), nil, nil, 1)
        else
            CustomPermaShow("Current Mode:", "         None", true, RGB(153, 0, 153), nil, nil, 1)
        end
    end
end

function MyHeRoVayne:AutoBarrierDetect()
    if (self.Menu.Utility.Barrier.Enable and not self.Menu.Utility.Barrier.ComboEnable) then
        self:AutoBarrier()
    elseif self.Menu.Utility.Barrier.Enable and self.Menu.Utility.Barrier.ComboEnable and self.Menu.Utility.Barrier.Key then
        self:AutoBarrier()
    end
end

function MyHeRoVayne:AutoBarrier()
    if SummonerBarrier == nil then return end
    if ((myHero.health*100)/myHero.maxHealth) <= self.Menu.Utility.Barrier.MinHealth and myHero:CanUseSpell(SummonerBarrier) == READY then
        CastSpell(SummonerBarrier)
        if os.clock() - self.NoBarrierSpamMsg > 2 then
            self.NoBarrierSpamMsg = os.clock()
            self:Message("Barrier Casted on: Yourself!", 0)
        end
    end
end

function MyHeRoVayne:AutoHealDetect()
    if (self.Menu.Utility.Heal.Enable and not self.Menu.Utility.Heal.ComboEnable) then
        self:AutoHeal()
    elseif (self.Menu.Utility.Heal.Enable and self.Menu.Utility.Heal.ComboEnable and self.Menu.Utility.Heal.Key) then
        self:AutoHeal()
    end
    if (self.Menu.Utility.Heal.Enable and self.Menu.Utility.Heal.AllyHeal) then
        self:AllyAutoHeal()
    end
end

function MyHeRoVayne:CheckFail(unit)
    for i, buff in pairs(self.invul) do
        if TargetHaveBuff(buff, unit) then
            return true
        end
    end
    return false
end

function MyHeRoVayne:AutoHeal()
    if SummonerHeal == nil then return end
    if ((myHero.health*100)/myHero.maxHealth) <= self.Menu.Utility.Heal.MinHealth and myHero:CanUseSpell(SummonerHeal) == READY then
        CastSpell(SummonerHeal)
        if os.clock() - self.NoHealSpamMsg > 2 then
            self.NoHealSpamMsg = os.clock()
            self:Message("Heal Casted on: Yourself!", 0)
        end
    end
end

function MyHeRoVayne:AllyAutoHeal()
    for k, ally in pairs(GetAllyHeroes()) do
        if not ally.dead and ally.visible and not self:CheckFail(ally) then
            if Heal ~= nil and GetDistance(myHero, ally) <= 840 and myHero:CanUseSpell(SummonerHeal) == READY then
                if ((ally.health*100)/ally.maxHealth) <= self.Menu.Utility.Heal.AllyMinHealth and not ally.dead then
                    CastSpell(SummonerHeal)
                    if os.clock() - self.NoHealSpamMsg > 2 then
                        self.NoHealSpamMsg = os.clock()
                        self:Message("Heal", "Heal Casted on: "..ally.charName.."!", 0)
                    end
                end
            end
        end
    end
end

function MyHeRoVayne:LevelUpSpell()
    if VIP_USER and self.Menu.Utility.LvLUp.Enable then
        if (self.LastLevel < myHero.level) then
            self:LevelUp()
        end
    end
end

function MyHeRoVayne:LevelUp()
    if self.Menu.Utility.LvLUp.Enable then
        if self.Menu.Utility.LvLUp.Mod == 1 then
            self.Sequence = self.Sequences[myHero.charName]
            self.SequenceName = self.SequencesName[myHero.charName]
        elseif myHero.level < 4 then
            self.Sequence = self.Sequences[self.Menu.Utility.LvLUp.Level13]
            self.SequenceName = self.SequencesName[self.Menu.Utility.LvLUp.Level13]
        else
            self.Sequence = self.Sequences[self.Menu.Utility.LvLUp.Level418]
            self.SequenceName = self.SequencesName[self.Menu.Utility.LvLUp.Level418]
        end
            
        DelayAction(function() LevelSpell(self.Sequence[myHero.level]) end, self.Menu.Utility.LvLUp.Humanizer/1000)
        
        if myHero.level < 18 then
            self:Message("This Level: "..self.SequenceName[myHero.level].." ===> Next Level: "..self.SequenceName[myHero.level + 1], 0)
        end     
        self.LastLevel = myHero.level
    end
end

function MyHeRoVayne:GetSmiteDamage()
    self.level = myHero.level
    return math.max(20 * self.level + 370, 30 * self.level + 330, 40 * self.level + 240, 50 * self.level + 100)
end

function MyHeRoVayne:AutoSmite()
    if SummonerSmite ~= nil then
        SmiteDmg = self:GetSmiteDamage()
        for _, jminions in pairs(minionManager(MINION_JUNGLE, 1000, myHero, MINION_SORT_HEALTH_ASC).objects) do
            if not jminions.dead and jminions.visible and ValidTarget(jminions, 560) then
                    local name = jminions.charName
                    local name = name:sub(name:find("_")+1, name:len())
                    local name = name:sub(1, (name:find("_") or name:len()+1)-1)
                    if self.Menu.Utility.Smite[name] then
                    if myHero:CanUseSpell(SummonerSmite) == READY and GetDistance(myHero, jminions) <= 560 and SmiteDmg >= jminions.health then
                        CastSpell(SummonerSmite, jminions)
                    end
                end
            end
        end
    end
end

function MyHeRoVayne:DrawSmiteable()
    if SummonerSmite ~= nil then
        if (not myHero.dead and myHero:CanUseSpell(SummonerSmite) == READY) then
            SmiteDmg = self:GetSmiteDamage()
            for _, jminion in pairs(minionManager(MINION_JUNGLE, 1000, myHero, MINION_SORT_HEALTH_ASC).objects) do
                if not jminion.dead and jminion.visible and ValidTarget(jminion, 560) then
                    local name = jminion.charName
                    local name = name:sub(name:find("_")+1, name:len())
                    local name = name:sub(1, (name:find("_") or name:len()+1)-1)
                    if self.Menu.Utility.Smite[name] then
                        posMinion = WorldToScreen(D3DXVECTOR3(jminion.x, jminion.y, jminion.z))
                        SmiteProcess = math.round(100 - 100 * (jminion.health - SmiteDmg)/jminion.maxHealth)
                        if GetDistance(myHero, jminion) <= 560 then
                            DrawText("Smite Process - "..SmiteProcess.."%", 20, posMinion.x - GetTextArea("Smite Process - "..SmiteProcess.."%", 20).x/2, posMinion.y, ARGB(255,255,0,0))
                            DrawCircle(jminion.x, jminion.y, jminion.z, 1.5 * SmiteProcess, ARGB(255, 255 * (1 - SmiteProcess/100), 255 * SmiteProcess/100, 255*(1 - SmiteProcess/100)))
                            DrawCircle(jminion.x, jminion.y, jminion.z, 150, ARGB(55, 55, 155, 55))
                        end
                    end
                end
            end
        end
    end
end

function MyHeRoVayne:SkinLoad()
    self.Menu.Utility.skin:addParam('changeSkin', 'Change Skin', SCRIPT_PARAM_ONOFF, false)
    self.Menu.Utility.skin:setCallback('changeSkin', function(nV)
        if (nV) then
            SetSkin(myHero, self.Menu.Utility.skin.skinID)
        else
            SetSkin(myHero, -1)
        end
    end)
        self.Menu.Utility.skin:addParam('skinID', 'Skin', SCRIPT_PARAM_LIST, 1, self.SkinList)
    self.Menu.Utility.skin:setCallback('skinID', function(nV)
        if (self.Menu.Utility.skin.changeSkin) then
            SetSkin(myHero, nV)
        end
    end)
    
    if (self.Menu.Utility.skin.changeSkin) then
        SetSkin(myHero, self.Menu.Utility.skin.skinID)
    end
end

function MyHeRoVayne:BaseCheck()
    if not GetGame().map.index == 15 then return end
    if myHero.team == 100 then
        local DistanceDown = math.sqrt((myHero.x - self.xBase.x) * (myHero.x - self.xBase.x) + (myHero.z - self.xBase.z) * (myHero.z - self.xBase.z))
        if DistanceDown < 900 then
            self.F = true
        else
            self.F = false
        end
    elseif myHero.team == 200 then
        local DistanceUp = math.sqrt((myHero.x - self.zBase.x) * (myHero.x - self.zBase.x) + (myHero.z - self.zBase.z) * (myHero.z - self.zBase.z))
        if DistanceUp < 900 then
            self.F = true
        else
            self.F = false
        end
    end
end

function MyHeRoVayne:AutoPotions()
    if self.Menu.Utility.Potions.EnablePot and myHero.health / myHero.maxHealth * 100 <= self.Menu.Utility.Potions.PotMinHealth then
        for _, item in pairs(self.PotList) do
            item.slot = GetInventorySlotItem(item.id)
            if item.slot ~= nil and (not self.F) and (not self.ActivePot) then
                CastSpell(item.slot)
            end
        end
    end
end

function MyHeRoVayne:CastItems()
    if self.Menu.Combo.ComboKey then
        self:BotRK()
        self:BilgeWater()
        self:Youmuus()
    end
end

function MyHeRoVayne:BotRK()
    if self.Menu.Combo.Items.BOTRK and GetInventorySlotItem(3153) ~= nil then
        local Target = ts.target
        if Target and ValidTarget(Target, 610) then
            if myHero:CanUseSpell(GetInventorySlotItem(3153)) == READY then
                CastSpell(GetInventorySlotItem(3153), Target)
            end
        end
    end
end

function MyHeRoVayne:BilgeWater()
    if self.Menu.Combo.Items.BWC and GetInventorySlotItem(3144) ~= nil then
        local Target = ts.target
        if Target and ValidTarget(Target, 610) then
            if myHero:CanUseSpell(GetInventorySlotItem(3144)) == READY then
                CastSpell(GetInventorySlotItem(3144), Target)
            end
        end

    end
end

function MyHeRoVayne:Youmuus()
    local Target = ts.target
    if self.Menu.Combo.Items.YGB and ValidTarget(Target, 1000) and GetInventorySlotItem(3142) ~= nil then
        if myHero:CanUseSpell(GetInventorySlotItem(3142)) == READY then
            CastSpell(GetInventorySlotItem(3142))
        end
    end
end

function MyHeRoVayne:CountEnemy(range, object)
    object = object or myHero
    range = range and range * range or myHero.range * myHero.range
    local enemyInRange = 0
    for i = 1, heroManager.iCount, 1 do
        local hero = heroManager:getHero(i)
        if ValidTarget(hero) and GetDistanceSqr(object, hero) <= range then
            enemyInRange = enemyInRange + 1
        end
    end
    return enemyInRange
end

function MyHeRoVayne:ComboREnemy()
    if self:CountEnemy(self.Menu.Combo.ComboRange, myHero) >= self.Menu.Combo.ComboRRange then
        if self.Menu.Combo.ComboKey then
            if myHero:CanUseSpell(_R) == READY then
                CastSpell(_R)
            end
        end
    end
end

function MyHeRoVayne:CheckModesActive(kMenu)
    if kMenu.FightMode and self.Menu.Combo.ComboKey then
        return true
    elseif kMenu.HarassMode and self.Menu.Harass.HarassKey then
        return true
    elseif kMenu.LaneClear and self.Menu.LaneClear.ClearKey then
        return true
    elseif kMenu.LastHit and self.Menu.LastHit.LastHitKey then
        return true
    elseif kMenu.Always then
        return true
    else
        return false
    end
end

function MyHeRoVayne:OnApplyBuff(unit, source, buff)
    for i=1, 5 do
        if (buff.name == self.PotNameBuff[i] and unit.isMe) then
            self.ActivePot = true
        end
    end
    if source and source.isMe then
        if buff.name == "SummonerExhaust" and self.Menu.Utility.RemoveCC.Exhaust then
            self:AutoQSS("Exhaust")
        end
        if buff.type == 5 and self.Menu.Utility.RemoveCC.Stun then
            self:AutoQSS("Stun")
        end
        if buff.type == 8 and self.Menu.Utility.RemoveCC.Taunt then
            self:AutoQSS("Taunt")
        end
        if buff.type == 10 and self.Menu.Utility.RemoveCC.Fear then
            self:AutoQSS("Fear")
        end
        if buff.type == 11 and self.Menu.Utility.RemoveCC.Root then
            self:AutoQSS("Root")
        end
        if buff.type == 21 and self.Menu.Utility.RemoveCC.Charm then
            self:AutoQSS("Charm")
        end
        if buff.type == 24 and self.Menu.Utility.RemoveCC.Suppression then
            self:AutoQSS("Suppression")
        end
        if buff.type == 29 and self.Menu.Utility.RemoveCC.KnockUp then
            self:AutoQSS("KnockUp")
        end
    end
end

function MyHeRoVayne:AutoQSS(BuffType)
    for _, item in pairs(self.QSSList) do
        item.slot = GetInventorySlotItem(item.id)
        if item.slot ~= nil and self.Menu.Utility.RemoveCC.EnableQSS then
            DelayAction(function() CastSpell(item.slot) end, self.Menu.Utility.RemoveCC.QSSHumanizer/1000)
        end
    end
end

function MyHeRoVayne:OnUpdateBuff(unit, buff, stacks)
    if not unit or not buff then return end
    if buff.name:lower():find("vaynesilvereddebuff") and unit.type == myHero.type and GetDistance(unit, myHero) < 1500 then
        self.W_Stacks[unit.networkID] = stacks
    end
end

function MyHeRoVayne:OnRemoveBuff(unit, buff)
    if not unit or not buff then return end
    if buff.name == "vaynesilvereddebuff" and unit.type == myHero.type and GetDistance(unit, myHero) < 1500  then
        self.W_Stacks[unit.networkID] = 0
    end
    for i=1, 5 do
        if (buff.name == self.PotNameBuff[i] and unit.isMe) then
            self.ActivePot = false
        end
    end
end

function MyHeRoVayne:OnProcessAttack(unit, spell)

    if unit.isMe and spell.name:lower():find("attack") then
        --print("Attack")
        SpellTarget = spell.target
        if self.Menu.Combo.EAA and self.Menu.Combo.ComboKey then
            if SpellTarget.type == myHero.type and myHero:CanUseSpell(_E) == READY then
                print("E")
                CastSpell(_E, SpellTarget)
                self.Menu.Combo.EAA = false
            end
        end
        if self.Menu.Combo.ComboKey and self.Menu.Combo.ComboQ then
            if SpellTarget.type == myHero.type and myHero:CanUseSpell(_Q) == READY then
                print("Attack")
                CastSpell(_Q, mousePos.x, mousePos.z)
            end
        end

        if self.Menu.Harass.HarassQ and (not self.Menu.Harass.BurstHarass or not myHero:CanUseSpell(_E) == READY) and self.Menu.Harass.HarassKey and myHero.mana >= (myHero.maxMana*(self.Menu.Harass.HarassMana*0.01)) then
            if (SpellTarget.type ~= myHero.type) or (SpellTarget.type == myHero.type) and myHero:CanUseSpell(_Q) == READY then
                CastSpell(_Q, mousePos.x, mousePos.z)
            end
        end

        if self.Menu.LaneClear.ClearQ and self.Menu.LaneClear.ClearKey and myHero.mana >= (myHero.maxMana*(self.Menu.LaneClear.LaneClearMana*0.01)) then
            if (SpellTarget.type ~= myHero.type) or (SpellTarget.type == myHero.type) and myHero:CanUseSpell(_Q) == READY then
                CastSpell(_Q, mousePos.x, mousePos.z)
            end
        end

        if self.Menu.JungleClear.JClearQ and self.Menu.JungleClear.JClearKey and myHero.mana >= (myHero.maxMana*(self.Menu.JungleClear.JungleClearMana*0.01)) then
            if (SpellTarget.type ~= myHero.type) or (SpellTarget.type == myHero.type) and myHero:CanUseSpell(_Q) == READY then
                CastSpell(_Q, mousePos.x, mousePos.z)
            end
        end

        if self.Menu.Harass.HarassKey and self.Menu.Harass.BurstHarass and myHero.mana >= (myHero.maxMana*(self.Menu.Harass.HarassMana*0.01)) then
            self.W_Stacks[SpellTarget.networkID] = 1
            if SpellTarget.type == myHero.type then
                CastSpell(_Q, mousePos.x, mousePos.z)
                self.W_Stacks[SpellTarget.networkID] = 2
            end
            if self.W_Stacks[SpellTarget.networkID] == 2 then
                CastSpell(_E, SpellTarget)
            end
        end
    end
end

function MyHeRoVayne:OnProcessSpell(unit, spell)
    if unit.team ~= myHero.team then
        if self.isAGapcloserUnitTarget[spell.name] then
            if spell.target and spell.target.networkID == myHero.networkID then
                if self:CheckModesActive(self.Menu.AntiGapClosers[unit.charName]) then 
                    CastSpell(_E, unit) 
                end
            end
        end

        if self.isAChampToInterrupt[spell.name] and GetDistance(unit, myHero) <= 770 then
            if self:CheckModesActive(self.Menu.Interrupt[unit.charName]) then 
                CastSpell(_E, unit) 
            end
        end

        if self.isAGapcloserUnitNoTarget[spell.name] and GetDistance(unit, myHero) <= 770 and (spell.target == nil or (spell.target and spell.target.isMe)) then
            if self:CheckModesActive(self.Menu.AntiGapClosers[unit.charName]) then
                CastSpell(_E, unit)
            end
        end
    end
end

function MyHeRoVayne:OnDraw()
    if self.Menu.Drawings.DrawCircleE and myHero:CanUseSpell(_E) == READY then
        _G.VayneDrawFPSCircle(myHero.x, myHero.z, 770, RGB(255, 0, 0), self.Menu.Drawings.Quality)
    end
    if self.Menu.Drawings.DrawCircleAA then
        _G.VayneDrawFPSCircle(myHero.x, myHero.z, 620, RGB(0, 255, 0), self.Menu.Drawings.Quality)
    end
    if self.Menu.Combo.EAA and myHero:CanUseSpell(_E) == READY then
        DrawText ("Cast E on next AA: On", 20, 1125, 885, ARGB(255, 255, 0, 0))
    end
    if SummonerSmite ~= nil then
        if self.Menu.Utility.Smite.DrawSmiteProcess then
            self:DrawSmiteable()
        end
        if self.Menu.Utility.Smite.DrawSmiteRange and myHero:CanUseSpell(SummonerSmite) then
            _G.VayneDrawFPSCircle(myHero.x, myHero.z, 560, ARGB(255, 100, 100, 80), self.Menu.Drawings.Quality)
        end
    end
    if SummonerHeal ~= nil then
        if self.Menu.Utility.Heal.Draw and myHero:CanUseSpell(SummonerHeal) == READY then
            _G.VayneDrawFPSCircle(myHero.x, myHero.z, 840, RGB(0, 153, 0), self.Menu.Drawings.Quality)
        end
    end
end

function MyHeRoVayne:CheckWallStun(Target)
    if GetDistance(Target, myHero) < 1000 then
        local Pos, Hitchance, PredictPos = self.VP:GetLineCastPosition(Target, 0.250, 0, 770, 2200, myHero, false)
        if Hitchance > 1 then
            local checks = 65
            local CheckD = math.ceil(self.Menu.ASTarget.PushDistance / checks)
            local FoundGrass = false
            for i = 1, checks, 1  do
                local CheckWallPos = Vector(PredictPos) + Vector(Vector(PredictPos) - Vector(myHero)):normalized()*(CheckD*i)
                if not FoundGrass and IsWallOfGrass(D3DXVECTOR3(CheckWallPos.x, CheckWallPos.y, CheckWallPos.z)) then
                    FoundGrass = CheckWallPos
                end
                local WallPoint = IsWall(D3DXVECTOR3(CheckWallPos.x, CheckWallPos.y, CheckWallPos.z))
                if WallPoint then
                    CastSpell(_E, Target)
                    break
                end
            end
        end
    end
end

function MyHeRoVayne:CondemnStun()
    if myHero:CanUseSpell(_E) == READY then
        local Target = ts.target
        if Target and Target.type == myHero.type and ValidTarget(Target, 770) and GetDistance(Target, myHero) < 1000 and self:CheckModesActive(self.Menu.ASTarget[Target.charName]) then
            self:CheckWallStun(Target)
        end
    end
end

function MyHeRoVayne:Message(msg, time)
     DelayAction(function() PrintChat("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">My HeRo - </font> <font color=\"#F7CB72\">Vayne</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: ".. msg .."</font></b>") end, time)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------_G.VayneDrawFPSCircle Start--------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

function _G.VayneDrawLineA(x1, y1, x2, y2, color)
    DrawLine(x1, y1, x2, y2, 1, color)
end

function _G.VayneDrawFPSCircle(x, z, radius, color, quality)
    for i = -radius * math.cos(math.pi/4), radius * math.cos(math.pi/4) - 1, radius * math.cos(math.pi/4)/quality do
        local v = WorldToScreen(D3DXVECTOR3((x + i), myHero.y, (z + math.sqrt(radius * radius - i * i))))
        local c = WorldToScreen(D3DXVECTOR3((x + i), myHero.y, (z - math.sqrt(radius * radius - i * i))))
        local k = WorldToScreen(D3DXVECTOR3((x + i + radius * math.cos(math.pi/4)/quality), myHero.y, (z + math.sqrt(radius * radius - (i + radius * math.cos(math.pi/4)/quality) * (i + radius * math.cos(math.pi/4)/quality)))))
        local n = WorldToScreen(D3DXVECTOR3((x + i + radius * math.cos(math.pi/4)/quality), myHero.y, (z - math.sqrt(radius * radius - (i + radius * math.cos(math.pi/4)/quality) * (i + radius * math.cos(math.pi/4)/quality)))))
        if (v.x > 0 and v.x < WINDOW_W) and (v.y > 0 and v.y < WINDOW_H) and (k.x > 0 and k.x < WINDOW_W) and (k.y > 0 and k.y < WINDOW_H) then
            _G.VayneDrawLineA(v.x, v.y, k.x, k.y, color)
        end
        if (c.x > 0 and c.x < WINDOW_W) and (c.y > 0 and c.y < WINDOW_H) and (n.x > 0 and n.x < WINDOW_W) and (n.y > 0 and n.y < WINDOW_H) then
            _G.VayneDrawLineA(c.x, c.y, n.x, n.y, color)
        end
    end

    for i = -radius * math.cos(math.pi/4), radius * math.cos(math.pi/4) - 1, radius * math.cos(math.pi/4)/quality do
        local v = WorldToScreen(D3DXVECTOR3((x + math.sqrt(radius * radius - i * i)), myHero.y, (z + i)))
        local c = WorldToScreen(D3DXVECTOR3((x - math.sqrt(radius * radius - i * i)), myHero.y, (z + i)))
        local k = WorldToScreen(D3DXVECTOR3((x + math.sqrt(radius * radius - (i + radius * math.cos(math.pi/4)/quality) * (i + radius * math.cos(math.pi/4)/quality))), myHero.y, (z + i + radius * math.cos(math.pi/4)/quality)))
        local n = WorldToScreen(D3DXVECTOR3((x - math.sqrt(radius * radius-(i + radius * math.cos(math.pi/4)/quality) * (i + radius * math.cos(math.pi/4)/quality))), myHero.y, (z + i + radius*  math.cos(math.pi/4)/quality)))
        if (v.x > 0 and v.x < WINDOW_W) and (v.y > 0 and v.y < WINDOW_H) and (k.x > 0 and k.x < WINDOW_W) and (k.y > 0 and k.y < WINDOW_H) then
            _G.VayneDrawLineA(v.x, v.y, k.x, k.y, color)
        end
        if (c.x > 0 and c.x < WINDOW_W) and (c.y > 0 and c.y < WINDOW_H) and (n.x > 0 and n.x < WINDOW_W) and (n.y > 0 and n.y < WINDOW_H) then
            _G.VayneDrawLineA(c.x, c.y, n.x, n.y, color)

        end
    end
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------_G.HextechDrawFPSCircle End--------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
class "ScriptUpdate"

function ScriptUpdate:__init(LocalVersion, UseHttps, Host, VersionPath, ScriptPath, SavePath, CallbackUpdate, CallbackNoUpdate, CallbackNewVersion, CallbackError)
    self.LocalVersion = LocalVersion
    self.Host = Host
    self.VersionPath = '/BoL/TCPUpdater/GetScript'..(UseHttps and '5' or '6')..'.php?script='..self:Base64Encode(self.Host..VersionPath)..'&rand='..math.random(99999999)
    self.ScriptPath = '/BoL/TCPUpdater/GetScript'..(UseHttps and '5' or '6')..'.php?script='..self:Base64Encode(self.Host..ScriptPath)..'&rand='..math.random(99999999)
    self.SavePath = SavePath
    self.CallbackUpdate = CallbackUpdate
    self.CallbackNoUpdate = CallbackNoUpdate
    self.CallbackNewVersion = CallbackNewVersion
    self.CallbackError = CallbackError
    --AddDrawCallback(function() self:OnDraw() end)
    self:CreateSocket(self.VersionPath)
    self.DownloadStatus = 'Connect to Server for VersionInfo'
    AddTickCallback(function() self:GetOnlineVersion() end)
end

function ScriptUpdate:print(str)
    print('<font color="#FFFFFF">'..os.clock()..': '..str)
end

function ScriptUpdate:OnDraw()
    if self.DownloadStatus ~= 'Downloading Script (100%)' and self.DownloadStatus ~= 'Downloading VersionInfo (100%)'then
        DrawText('Download Status: '..(self.DownloadStatus or 'Unknown'),50,10,50,ARGB(0xFF,0xFF,0xFF,0xFF))
    end
end

function ScriptUpdate:CreateSocket(url)
    if not self.LuaSocket then
        self.LuaSocket = require("socket")
    else
        self.Socket:close()
        self.Socket = nil
        self.Size = nil
        self.RecvStarted = false
    end
    self.LuaSocket = require("socket")
    self.Socket = self.LuaSocket.tcp()
    self.Socket:settimeout(0, 'b')
    self.Socket:settimeout(99999999, 't')
    self.Socket:connect('sx-bol.eu', 80)
    self.Url = url
    self.Started = false
    self.LastPrint = ""
    self.File = ""
end

function ScriptUpdate:Base64Encode(data)
    local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    return ((data:gsub('.', function(x)
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end

function ScriptUpdate:GetOnlineVersion()
    if self.GotScriptVersion then return end

    self.Receive, self.Status, self.Snipped = self.Socket:receive(1024)
    if self.Status == 'timeout' and not self.Started then
        self.Started = true
        self.Socket:send("GET "..self.Url.." HTTP/1.1\r\nHost: sx-bol.eu\r\n\r\n")
    end
    if (self.Receive or (#self.Snipped > 0)) and not self.RecvStarted then
        self.RecvStarted = true
        self.DownloadStatus = 'Downloading VersionInfo (0%)'
    end

    self.File = self.File .. (self.Receive or self.Snipped)
    if self.File:find('</s'..'ize>') then
        if not self.Size then
            self.Size = tonumber(self.File:sub(self.File:find('<si'..'ze>')+6,self.File:find('</si'..'ze>')-1))
        end
        if self.File:find('<scr'..'ipt>') then
            local _,ScriptFind = self.File:find('<scr'..'ipt>')
            local ScriptEnd = self.File:find('</scr'..'ipt>')
            if ScriptEnd then ScriptEnd = ScriptEnd - 1 end
            local DownloadedSize = self.File:sub(ScriptFind+1,ScriptEnd or -1):len()
            self.DownloadStatus = 'Downloading VersionInfo ('..math.round(100/self.Size*DownloadedSize,2)..'%)'
        end
    end
    if self.File:find('</scr'..'ipt>') then
        self.DownloadStatus = 'Downloading VersionInfo (100%)'
        local a,b = self.File:find('\r\n\r\n')
        self.File = self.File:sub(a,-1)
        self.NewFile = ''
        for line,content in ipairs(self.File:split('\n')) do
            if content:len() > 5 then
                self.NewFile = self.NewFile .. content
            end
        end
        local HeaderEnd, ContentStart = self.File:find('<scr'..'ipt>')
        local ContentEnd, _ = self.File:find('</sc'..'ript>')
        if not ContentStart or not ContentEnd then
            if self.CallbackError and type(self.CallbackError) == 'function' then
                self.CallbackError()
            end
        else
            self.OnlineVersion = (Base64Decode(self.File:sub(ContentStart + 1,ContentEnd-1)))
            self.OnlineVersion = tonumber(self.OnlineVersion)
            if self.OnlineVersion > self.LocalVersion then
                if self.CallbackNewVersion and type(self.CallbackNewVersion) == 'function' then
                    self.CallbackNewVersion(self.OnlineVersion,self.LocalVersion)
                end
                self:CreateSocket(self.ScriptPath)
                self.DownloadStatus = 'Connect to Server for ScriptDownload'
                AddTickCallback(function() self:DownloadUpdate() end)
            else
                if self.CallbackNoUpdate and type(self.CallbackNoUpdate) == 'function' then
                    self.CallbackNoUpdate(self.LocalVersion)
                end
            end
        end
        self.GotScriptVersion = true
    end
end

function ScriptUpdate:DownloadUpdate()
    if self.GotScriptUpdate then return end
    self.Receive, self.Status, self.Snipped = self.Socket:receive(1024)
    if self.Status == 'timeout' and not self.Started then
        self.Started = true
        self.Socket:send("GET "..self.Url.." HTTP/1.1\r\nHost: sx-bol.eu\r\n\r\n")
    end
    if (self.Receive or (#self.Snipped > 0)) and not self.RecvStarted then
        self.RecvStarted = true
        self.DownloadStatus = 'Downloading Script (0%)'
    end

    self.File = self.File .. (self.Receive or self.Snipped)
    if self.File:find('</si'..'ze>') then
        if not self.Size then
            self.Size = tonumber(self.File:sub(self.File:find('<si'..'ze>')+6,self.File:find('</si'..'ze>')-1))
        end
        if self.File:find('<scr'..'ipt>') then
            local _,ScriptFind = self.File:find('<scr'..'ipt>')
            local ScriptEnd = self.File:find('</scr'..'ipt>')
            if ScriptEnd then ScriptEnd = ScriptEnd - 1 end
            local DownloadedSize = self.File:sub(ScriptFind+1,ScriptEnd or -1):len()
            self.DownloadStatus = 'Downloading Script ('..math.round(100/self.Size*DownloadedSize,2)..'%)'
        end
    end
    if self.File:find('</scr'..'ipt>') then
        self.DownloadStatus = 'Downloading Script (100%)'
        local a,b = self.File:find('\r\n\r\n')
        self.File = self.File:sub(a,-1)
        self.NewFile = ''
        for line,content in ipairs(self.File:split('\n')) do
            if content:len() > 5 then
                self.NewFile = self.NewFile .. content
            end
        end
        local HeaderEnd, ContentStart = self.NewFile:find('<sc'..'ript>')
        local ContentEnd, _ = self.NewFile:find('</scr'..'ipt>')
        if not ContentStart or not ContentEnd then
            if self.CallbackError and type(self.CallbackError) == 'function' then
                self.CallbackError()
            end
        else
            local newf = self.NewFile:sub(ContentStart+1,ContentEnd-1)
            local newf = newf:gsub('\r','')
            if newf:len() ~= self.Size then
                if self.CallbackError and type(self.CallbackError) == 'function' then
                    self.CallbackError()
                end
                return
            end
            local newf = Base64Decode(newf)
            if type(load(newf)) ~= 'function' then
                if self.CallbackError and type(self.CallbackError) == 'function' then
                    self.CallbackError()
                end
            else
                local f = io.open(self.SavePath,"w+b")
                f:write(newf)
                f:close()
                if self.CallbackUpdate and type(self.CallbackUpdate) == 'function' then
                    self.CallbackUpdate(self.OnlineVersion,self.LocalVersion)
                end
            end
        end
        self.GotScriptUpdate = true
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
