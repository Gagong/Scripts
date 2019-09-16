if myHero.charName ~= "JarvanIV" then return end

_G.JScriptVersion = {2.0, "2.0", "|2.0|"}
_G.JScriptAuthor = "HeRoBaNd"

-- BoL Tools Tracker --
assert(load(Base64Decode("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"), nil, "bt", _ENV))()
TrackerLoad("fMqjdNreSdWuDCgq")
-- BoL Tools Tracker --

function OnLoad()
	MyHeRoJarvan()
	require("VPrediction")
end

class('MyHeRoJarvan')

function MyHeRoJarvan:Message(msg,time)
    DelayAction(function() PrintChat("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">HeRo</font> <font color=\"#F7CB72\">Jarvan</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: ".. msg .."</font></b>") end, time)
end

function MyHeRoJarvan:__init()

	self:AutoUpdater()
	self:LoadLib()
	self:Message("Loaded!", 3)
	self:Variables()
	self:Global_Menu()
	self.Menu.Utility.skin.changeSkin = false
	self.Menu.Utility.LvLUp.Enable = false
	self.Menu.Drawings.PermaShow = false
	self:Loader()

	if VIP_USER then
		self:SkinLoad()
	end

end

function MyHeRoJarvan:LoadLib()  
	self.CPSPath = LIB_PATH.."CustomPermaShow.lua"
	self.CPSHost = "raw.githubusercontent.com"
    self.CPSWebPath = "/Superx321/BoL/master/common/CustomPermaShow.lua".."?rand="..math.random(1,10000)  
    if not FileExist(self.CPSPath) then
        self:Message("Custom Perma Show not found, wait Download...", 0)
        DownloadFile("https://"..self.CPSHost..self.CPSWebPath, self.CPSPath, function ()  end)
        DelayAction(function() require("CustomPermaShow") end, 5)
        self:Message("Custom Perma Show Downloaded and Loaded!", 5)
    else
        require("CustomPermaShow")
        self:Message("Custom Perma Show Found!", 5)
    end
end

function MyHeRoJarvan:Variables()
	ts = TargetSelector(TARGET_PRIORITY, 1000, DAMAGE_PHYSICAL)
	self.F = false
	self.ActivePot = false
	self.UltActive = false
	self.LastLevel = 0
	Smite = nil
	Ignite = nil
	self.FHPred = false

	if myHero:GetSpellData(SUMMONER_1).name:find("SummonerSmite") then 
		Smite = SUMMONER_1
		self.SSmite = true
	elseif myHero:GetSpellData(SUMMONER_2).name:find("SummonerSmite") then 
		Smite = SUMMONER_2 
		self.SSmite = true
	end

	if myHero:GetSpellData(SUMMONER_1).name:find("SummonerDot") then 
		Ignite = SUMMONER_1 
		self.SIgnite = true
	elseif myHero:GetSpellData(SUMMONER_2).name:find("SummonerDot") then 
		Ignite = SUMMONER_2 
		self.SIgnite = true
	end

	self.Sequences = {
		[0]				=	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		[1]				=	{_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E}, 
		[2]				=	{_Q, _E, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W}, 
		[3]				=	{_W, _Q, _E, _W, _W, _R, _W, _Q, _W, _Q, _R, _Q, _Q, _E, _E, _R, _E, _E}, 
		[4]				=	{_W, _E, _Q, _W, _W, _R, _W, _E, _W, _E, _R, _E, _E, _Q, _Q, _R, _Q, _Q}, 
		[5]				=	{_E, _Q, _W, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W}, 
		[6]				=	{_E, _W, _Q, _E, _E, _R, _E, _W, _E, _W, _R, _W, _W, _Q, _Q, _R, _Q, _Q},
		["JarvanIV"]	=	{_E, _Q, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W}
	}

	self.SequencesName = {
		[0]				=	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		[1]				=	{"Q", "W", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"}, 
		[2]				=	{"Q", "E", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"}, 
		[3]				=	{"W", "Q", "E", "W", "W", "R", "W", "Q", "W", "Q", "R", "Q", "Q", "E", "E", "R", "E", "E"}, 
		[4]				=	{"W", "E", "Q", "W", "W", "R", "W", "E", "W", "E", "R", "E", "E", "Q", "Q", "R", "Q", "Q"}, 
		[5]				=	{"E", "Q", "W", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "R", "W", "W"}, 
		[6]				=	{"E", "W", "Q", "E", "E", "R", "E", "W", "E", "W", "R", "W", "W", "Q", "Q", "R", "Q", "Q"},
		["JarvanIV"]	=	{"E", "Q", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"}
	}

	self.SpellVarTable = {
		"Q-W-E",  
		"Q-E-W",  
		"W-Q-E",  
		"W-E-Q",  
		"E-Q-W",  
		"E-W-Q"
	}

	self.Skills = {
		"Q", 
		"W", 
		"E", 
		"R"
	}

	self.xBase = {
		["x"] = 406, 
		["z"] = 424
	}

	self.zBase = {
		["x"] = 14322, 
		["z"] = 14394
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

    self.PredList = {
	    "VPred", 
	    "DPred",
	    "FHPred", 
	    "SPred",
	    "HPred",
	    "KPred"
	}

    self.PotNameBuff = {
        "ItemCrystalFlask", 
        "RegenerationPotion", 
        "ItemMiniRegenPotion", 
        "ItemCrystalFlaskJungle", 
        "ItemDarkCrystalFlask",
    }

    self.InvulList = {
	    "undyingrage", 
	    "sionpassivezombie", 
	    "aatroxpassivedeath", 
	    "chronoshift", 
	    "judicatorintervention"
	}

    self.ItemList = {
		TMT = { id = 3077, range = 189,  Target = false, slot = nil }, -- Tiamat
		THD = { id = 3074, range = 189,  Target = false, slot = nil }, -- Ravenous Hydra
		THD = { id = 3748, range = 189,  Target = false, slot = nil }, -- Titanic Hydra
		BWC = { id = 3144, range = 610,  Target = true,  slot = nil }, -- Bilgewater Cutlass
		BRK = { id = 3153, range = 610,  Target = true,  slot = nil }, -- Blade of the ruined king
		SR  = { id = 3715, range = 560,  Target = true,  slot = nil }, -- Red Smite
		SB  = { id = 3706, range = 560,  Target = true,  slot = nil }, -- Blue Smite
		SBW = { id = 1400, range = 560,  Target = true,  slot = nil }, -- Blue Smite Warrior
		SR  = { id = 1412, range = 560,  Target = true,  slot = nil }, -- Red Smite Warrior
		SRD = { id = 1419, range = 560,  Target = true,  slot = nil }, -- Red Smite Bloodrazor
		SBD = { id = 1416, range = 560,  Target = true,  slot = nil }, -- Blue Smite Bloodrazor
		YGB = { id = 3142, range = 1000, Target = false, slot = nil }  -- Youmuu Ghostblade
	}

	self.SpellInfo = {
	  	AA = {Range = 270},
	  	Q = {Range = 770, Widrh = 70, Delay = 0.2, Speed = math.huge},
	  	W = {Range = 625, Widrh = 625, Delay = math.huge, Speed = math.huge},
	  	E = {Range = 830, Widrh = 75, Delay = 0.3, Speed = math.huge},
	  	R = {Range = 650, Widrh = 325, Delay = 0.2, Speed = math.huge}
	}

	self.SkinList = {
		"Commando", 
		"Dragonslayer", 
		"Darkforge", 
		"Victorious", 
		"Warring Kingdoms", 
		"Fnatic", 
		"Classic"
	}

	self.VP = nil
	self.DP = nil
	self.SP = nil
	self.HP = nil
	self.KP = nil
	self.flags = {}

	self.CmodeTable = {
		"E+Q", 
		"Q or E", 
		"Q Only", 
		"E Only"
	}

	self.HModeTable = {
		"E+Q", 
		"Q or E", 
		"Q Only", 
		"E Only"
	}
end

function MyHeRoJarvan:AutoUpdater()
	local ToUpdate = {}
    ToUpdate.Version = _G.JScriptVersion[1]
    ToUpdate.UseHttps = true
    ToUpdate.Host = "raw.githubusercontent.com"
    ToUpdate.VersionPath = "/HeRoBaNd/Scripts/master/My%20HeRo%20-%20Jarvan%20IV.version"
    ToUpdate.ScriptPath =  "/HeRoBaNd/Scripts/master/My%20HeRo%20-%20Jarvan%20IV.lua"
    ToUpdate.SavePath = SCRIPT_PATH.."/My HeRo - Jarvan IV.lua"
    ToUpdate.CallbackUpdate = function(NewVersion,OldVersion) self:Message("Updated to "..NewVersion..".",0) end
    ToUpdate.CallbackNoUpdate = function(OldVersion) self:Message("No Updates Found!") end
    ToUpdate.CallbackNewVersion = function(NewVersion) self:Message("New Version found ("..NewVersion.."). Please wait until its downloaded!") end
    ToUpdate.CallbackError = function(NewVersion) self:Message("Error while Downloading. Please try again.") end
    ScriptUpdate(ToUpdate.Version,ToUpdate.UseHttps, ToUpdate.Host, ToUpdate.VersionPath, ToUpdate.ScriptPath, ToUpdate.SavePath, ToUpdate.CallbackUpdate,ToUpdate.CallbackNoUpdate, ToUpdate.CallbackNewVersion,ToUpdate.CallbackError)
end

function MyHeRoJarvan:Global_Menu()	

	self.Menu = scriptConfig("My HeRo - Jarvan IV", "HJ")
	
	self.Menu:addSubMenu("[Jarvan] - Combo", "Combo")
		self.Menu.Combo:addParam("ComboMode", "Combo Mode:", SCRIPT_PARAM_ONKEYDOWN, false, 32)
		self.Menu.Combo:addParam("ChangeCombo", "Change Combo Mode Key:", SCRIPT_PARAM_ONKEYTOGGLE, false, 89)
		self.Menu.Combo:addParam("Cmode", "Combo Q and E Mode:", SCRIPT_PARAM_LIST, 1, self.CmodeTable)

		self.Menu.Combo:addParam("ComboQ", "Use Q in Combo:", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Combo:addParam("ComboW", "Use W in Combo:", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Combo:addParam("ComboE", "Use E in Combo:", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Combo:addParam("ComboR", "Use R in Combo:", SCRIPT_PARAM_ONOFF, false)
	
	self.Menu:addSubMenu("[Jarvan] - Harass", "Harass")
		self.Menu.Harass:addParam("HS", "Harass:", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
		self.Menu.Harass:addParam("ChangeHarass", "Change Harass Mode Key:", SCRIPT_PARAM_ONKEYTOGGLE, false, 84)
		self.Menu.Harass:addParam("Hmode", "Harass Q and E Mode:", SCRIPT_PARAM_LIST, 1, self.HModeTable)		
		self.Menu.Harass:addParam("HarassQ", "Use Q in Harass:", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Harass:addParam("HarassE", "Use E in Harass:", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Harass:addParam("HarassMana", "% Mana for Harass:", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)

	self.Menu:addSubMenu("[Jarvan] - Kill Steal", "KillSteal")
		self.Menu.KillSteal:addParam("Steal", "Enable KillSteal:", SCRIPT_PARAM_ONOFF, true)
		self.Menu.KillSteal:addParam("QSteal", "Use Q:", SCRIPT_PARAM_ONOFF, true)
		self.Menu.KillSteal:addParam("ESteal", "Use E:", SCRIPT_PARAM_ONOFF, true)
		self.Menu.KillSteal:addParam("RSteal", "Use R:", SCRIPT_PARAM_ONOFF, false)
		self.Menu.KillSteal:addParam("EQRSteal", "Use E+Q+R:", SCRIPT_PARAM_ONOFF, true)

		if self.SIgnite then
			self.Menu.KillSteal:addParam("I", "Use Ignite", SCRIPT_PARAM_ONOFF, true)
		end

		if self.SSmite then
			self.Menu.KillSteal:addParam("S", "Use Ignite", SCRIPT_PARAM_ONOFF, true)
		end

	
	self.Menu:addSubMenu("[Jarvan] - Lane Clear", "Clear")
		self.Menu.Clear:addParam("LaneClear", "Lane Clear:", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
		self.Menu.Clear:addParam("LaneClearQ", "Use Q in LaneClear:", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Clear:addParam("LaneClearE", "Use E in LaneClear:", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Clear:addParam("LaneClearW", "Use W in LaneClear:", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Clear:addParam("ClearMana", "% Mana for LaneClear:", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
	
	self.Menu:addSubMenu("[Jarvan] - Jungle Clear", "JClear")
		self.Menu.JClear:addParam("JungleClear", "Jungle Clear:", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
		self.Menu.JClear:addParam("JungleClearQ", "Use Q in Jungle Clear:", SCRIPT_PARAM_ONOFF, true)
		self.Menu.JClear:addParam("JungleClearE", "Use E in Jungle Clear:", SCRIPT_PARAM_ONOFF, true)
		self.Menu.JClear:addParam("JungleClearW", "Use W in Jungle Clear:", SCRIPT_PARAM_ONOFF, true)
		self.Menu.JClear:addParam("JClearMana", "% Mana for Jungle Clear:", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)

	self.Menu:addSubMenu("[Jarvan] - Last Hit", "LastHit")
		self.Menu.LastHit:addParam("LastHitKey", "Last Hit:", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("A"))
	
	self.Menu:addSubMenu("[Jarvan] - Escape", "Escape")
		self.Menu.Escape:addParam("EnableEscape", "Escape:", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("N"))
		self.Menu.Escape:addParam("WEscape", "Use W for slow Enemy", SCRIPT_PARAM_ONOFF, true)
	
	self.Menu:addSubMenu("[Jarvan] - Ult Blacklist", "BlockR")
		for i, enemy in pairs(GetEnemyHeroes()) do
			self.Menu.BlockR:addParam(enemy.charName, "Use ult on: "..enemy.charName, SCRIPT_PARAM_ONOFF, true)
		end

	self.Menu:addSubMenu("[Jarvan] - Utility", "Utility")

		self.Menu.Utility:addSubMenu("Item Settings", "Item")
			self.Menu.Utility.Item:addParam("UseItem", "Enable Item Usage:", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Utility.Item:addParam("Tiamat", "Use Tiamat:", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Utility.Item:addParam("Hydra", "Use Hydra:", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Utility.Item:addParam("Titanic", "Use Titanic Hydra:", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Utility.Item:addParam("Cutlass", "Use Bilgewater Cutlass:", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Utility.Item:addParam("BOTRK", "Use BOTRK:", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Utility.Item:addParam("Youmu", "Use Youmus Blade:", SCRIPT_PARAM_ONOFF, true)
			self.Menu.Utility.Item:addParam("Gunblade", "Use Hextech Gunblade:", SCRIPT_PARAM_ONOFF, true)

		self.Menu.Utility:addSubMenu("Remove CC", "RemoveCC")
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

        self.Menu.Utility:addSubMenu("Potions", "Potions")
            self.Menu.Utility.Potions:addParam("EnablePot", "Enable Auto Potions:", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Utility.Potions:addParam("EnableCPot", "Use Only in Combo Mode:", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Utility.Potions:addParam("EnableCKeyPot", "You Combo Mode Key:", SCRIPT_PARAM_ONKEYDOWN, false, 32)
            self.Menu.Utility.Potions:addParam("PotMinHealth", "Health to Use Auto Potions:", SCRIPT_PARAM_SLICE, 25, 0, 100, 0)

        if VIP_USER then
        	self.Menu.Utility:addSubMenu("Auto Level - Up", "LvLUp")
        		self.Menu.Utility.LvLUp:addParam("Enable", "Enable Auto Level - Up:", SCRIPT_PARAM_ONOFF, false)
        		self.Menu.Utility.LvLUp:addParam("Humanizer", "Use Humanizer:", SCRIPT_PARAM_SLICE, 100, 0, 1000, 0)
				self.Menu.Utility.LvLUp:addParam("Mod", "Mode:", SCRIPT_PARAM_LIST, 1, {"Auto", "Manual"})
    			self.Menu.Utility.LvLUp:addParam("Level13", "Level 1-3:", SCRIPT_PARAM_LIST, 1, self.SpellVarTable)
   				self.Menu.Utility.LvLUp:addParam("Level418", "Level 4-18:", SCRIPT_PARAM_LIST, 1, self.SpellVarTable)

   			self.Menu.Utility:addSubMenu("Skin Changer", "skin")
   		end
   		if self.SSmite then
   			self.Menu.Utility:addSubMenu("Auto Smite", "Smite")
	   			self.Menu.Utility.Smite:addParam("Enable", "Enable Auto Smite:", SCRIPT_PARAM_ONKEYTOGGLE, true, string.byte("H"))
	   			self.Menu.Utility.Smite:addParam("i", "", SCRIPT_PARAM_INFO, "")

		        if GetGame().map.shortName == "twistedTreeline" then
		            self.Menu.Utility.Smite:addParam("Wraith", "Use Smite on: Wraith", SCRIPT_PARAM_ONOFF, true)
		            self.Menu.Utility.Smite:addParam("Golem", "Use Smite on: Golem", SCRIPT_PARAM_ONOFF, true)
		            self.Menu.Utility.Smite:addParam("Wolf", "Use Smite on: Wolf", SCRIPT_PARAM_ONOFF, true)
		           	self.Menu.Utility.Smite:addParam("Spiderboss", "Use Smite on: SpiderBoss", SCRIPT_PARAM_ONOFF, true)
		        else
		            self.Menu.Utility.Smite:addParam("Dragon", "Use Smite on: Dragon", SCRIPT_PARAM_ONOFF, true)
		            self.Menu.Utility.Smite:addParam("Baron", "Use Smite on: Baron", SCRIPT_PARAM_ONOFF, true)
		            self.Menu.Utility.Smite:addParam("Razorbeak", "Use Smite on: Wraith", SCRIPT_PARAM_ONOFF, false)
		            self.Menu.Utility.Smite:addParam("Murkwolf", "Use Smite on: Wolf", SCRIPT_PARAM_ONOFF, false)
		            self.Menu.Utility.Smite:addParam("Krug", "Use Smite on: Krug", SCRIPT_PARAM_ONOFF, false)
		            self.Menu.Utility.Smite:addParam("Crab", "Use Smite on: Crab", SCRIPT_PARAM_ONOFF, false)
		            self.Menu.Utility.Smite:addParam("Gromp", "Use Smite on: Gromp", SCRIPT_PARAM_ONOFF, false)
		            self.Menu.Utility.Smite:addParam("Red", "Use Smite on: Red Buff", SCRIPT_PARAM_ONOFF, true)
		            self.Menu.Utility.Smite:addParam("Blue", "Use Smite on: Blue Buff", SCRIPT_PARAM_ONOFF, true)
		        end	
		end
	
	self.Menu:addSubMenu("[Jarvan] - Prediction", "Prediction")
  		self.Menu.Prediction:addParam("CurrentPred", "Prediction (require reload)", SCRIPT_PARAM_LIST, 1, self.PredList)
  		if self.Menu.Prediction.CurrentPred == 1 then
    		if FileExist(LIB_PATH .. "VPrediction.lua") then
      			require "VPrediction"
      			self.VP = VPrediction()
      			self.Menu.Prediction:addParam("QVPHC", "Q HitChance:", SCRIPT_PARAM_SLICE, 2, 1, 5, 0)
      			self.Menu.Prediction:addParam("EVPHC", "E HitChance:", SCRIPT_PARAM_SLICE, 2, 1, 5, 0)
      			self:Message("VPrediction Found!", 4)
    		end
  		elseif self.Menu.Prediction.CurrentPred == 2 then
    		if VIP_USER and FileExist(LIB_PATH.."DivinePred.lua") and FileExist(LIB_PATH.."DivinePred.luac") then
      			require "DivinePred"
      			self.DP = DivinePred()
      			self.Menu.Prediction:addParam("QHC", "Q HitChance %:", SCRIPT_PARAM_SLICE, 75, 50, 100, 0)
      			self.Menu.Prediction:addParam("EHC", "E HitChance %:", SCRIPT_PARAM_SLICE, 75, 50, 100, 0)
      			self:Message("Divine Prediction Found!", 4)
    		end
  		elseif self.Menu.Prediction.CurrentPred == 3 then
    		if FHPrediction.GetVersion() ~= nil then
      			if FHPrediction.GetVersion() >= 0.24 then
        			self.FHPred = true
        			self:Message("FHPrediction Found!", 4)
        			self.Menu.Prediction:addParam("infoFH", "FHPrediction found!", SCRIPT_PARAM_INFO, "")
      			end
    		else
      			self:Message("FHPrediction don't Loaded!", 4)
    		end
  		elseif self.Menu.Prediction.CurrentPred == 4 then
    		if FileExist(LIB_PATH.."SPrediction.lua") then
      			require "SPrediction"
      			self.SP = SPrediction()
      			self.Menu.Prediction:addParam("QSPHC", "Q HitChance:", SCRIPT_PARAM_SLICE, 1.5, 0, 3, 0)
      			self.Menu.Prediction:addParam("ESPHC", "E HitChance:", SCRIPT_PARAM_SLICE, 1.5, 0, 3, 0)
      			self:Message("SPrediction Found!", 4)
    		end
    	elseif self.Menu.Prediction.CurrentPred == 5 then
    		if FileExist(LIB_PATH.."HPrediction.lua") then
      			require "HPrediction"
      			self.HP = HPrediction()
      			self.Menu.Prediction:addParam("QHPHC", "Q HitChance:", SCRIPT_PARAM_SLICE, 1.05, 0, 3, 2)
      			self.Menu.Prediction:addParam("EHPHC", "E HitChance:", SCRIPT_PARAM_SLICE, 1.05, 0, 3, 2)
      			self:Message("HPrediction Found!", 4)
    		end
    	elseif self.Menu.Prediction.CurrentPred == 6 then
    		if FileExist(LIB_PATH.."KPrediction.lua") then
      			require "KPrediction"
      			self.KP = KPrediction()
      			self.Menu.Prediction:addParam("QKPHC", "Q HitChance:", SCRIPT_PARAM_SLICE, 1.75, 0, 3, 2)
      			self.Menu.Prediction:addParam("EKPHC", "E HitChance:", SCRIPT_PARAM_SLICE, 1.75, 0, 3, 2)
      			self:Message("KPrediction Found!", 4)
    		end
  		end	        

	self.Menu:addSubMenu("[Jarvan] - Draw Settings", "Drawings")
		self.Menu.Drawings:addParam("AllDraw", "Enable or Disable all Draws:", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Drawings:addParam("FPS", 'Use FPS Draw Circle:', SCRIPT_PARAM_ONOFF, false)
		self.Menu.Drawings:addParam("Quality", "Draw Quality", SCRIPT_PARAM_SLICE, 5, 1, 10, 0)
		self.Menu.Drawings:addParam("PermaShow", 'Enable PermaShow:', SCRIPT_PARAM_ONOFF, false)

		self.Menu.Drawings:addParam('Info1', '', SCRIPT_PARAM_INFO, "")
		self.Menu.Drawings:addParam("Infokek1", "[Spell Draw]", SCRIPT_PARAM_INFO, "")
		self.Menu.Drawings:addParam('Info1', '', SCRIPT_PARAM_INFO, "")

		self.Menu.Drawings:addParam("DrawAA", "Draw AA Range:", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Drawings:addParam("DrawQ", "Draw Q Range:", SCRIPT_PARAM_ONOFF, true)	
		self.Menu.Drawings:addParam("DrawW", "Draw W Range:", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Drawings:addParam("DrawE", "Draw E Range:", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Drawings:addParam("DrawR", "Draw R Range:", SCRIPT_PARAM_ONOFF, true)
		
		self.Menu.Drawings:addParam('Info1', '', SCRIPT_PARAM_INFO, "")
		self.Menu.Drawings:addParam("Infokek3", "[Smite Draw]", SCRIPT_PARAM_INFO, "")
		self.Menu.Drawings:addParam('Info1', '', SCRIPT_PARAM_INFO, "")

		self.Menu.Drawings:addParam("DrawSmite", "Draw Smite Range:", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Drawings:addParam("DrawSmiteable", "Draw Smite Process:", SCRIPT_PARAM_ONOFF, true)

		self.Menu.Drawings:addParam('Info1', '', SCRIPT_PARAM_INFO, "")
		self.Menu.Drawings:addParam("Infokek2", "[Other Draw]", SCRIPT_PARAM_INFO, "")
		self.Menu.Drawings:addParam('Info1', '', SCRIPT_PARAM_INFO, "")

		self.Menu.Drawings:addParam("DrawComboModex", "Draw Current Combo Mode:", SCRIPT_PARAM_ONOFF, true)
		self.Menu.Drawings:addParam("DrawHarassModex", "Draw Current Harass Mode:", SCRIPT_PARAM_ONOFF, true)

    ------------------------------------------------------------------------------------------------------------------
    self.Menu:addParam("b", "", SCRIPT_PARAM_INFO, "")
    if VIP_USER then
        self.Menu:addParam("b1", "User: "..GetUser().." (VIP)", SCRIPT_PARAM_INFO, "")
    else
        self.Menu:addParam("b2", "User: "..GetUser().." (FREE)", SCRIPT_PARAM_INFO, "")
    end
    self.Menu:addParam("b3", "Script Version: ".._G.JScriptVersion[2], SCRIPT_PARAM_INFO, "")
    self.Menu:addParam("b4", "Script Author: ".._G.JScriptAuthor, SCRIPT_PARAM_INFO, "")
end

function MyHeRoJarvan:Loader()
	enemyMinions = minionManager(MINION_ENEMY, 1000, myHero, MINION_SORT_HEALTH_ASC)
	jungleMinions = minionManager(MINION_JUNGLE, 1000, myHero, MINION_SORT_MAXHEALTH_DEC)
	AddTickCallback(function() self:OnTick() end)
    AddDrawCallback(function() self:OnDraw() end)
    AddUnloadCallback(function() self:OnUnload() end)
    AddProcessAttackCallback(function(unit, spell) self:OnProcessAttack(unit, spell) end)
    AddApplyBuffCallback(function(unit, source, buff) self:OnApplyBuff(unit, source, buff) end)
    AddRemoveBuffCallback(function(unit, buff) self:OnRemoveBuff(unit, buff) end)
    AddCreateObjCallback(function(object) self:OnCreateObj(object) end)
    AddDeleteObjCallback(function(object) self:OnDeleteObj(object) end)
end


function MyHeRoJarvan:OnTick()
	if myHero.dead then return end
	ts:update()
	if self.Menu.Combo.ComboMode then
	self:ComboModeEnable()
	end
	if self.Menu.JClear.JungleClear then
		self:JC()
	end
	if self.Menu.Clear.LaneClear then
		self:LC()
	end
	if self.Menu.Harass.HS then
		self:HarassEnable()
	end
	--if self.Menu.LastHit.LastHitKey then
		--self:LH()
	--end
	--if self.Menu.KillSteal.Steal then
		--self:Delete()
	--end
	self:ModeChanger()
	self:BaseCheck()
	self:EQEscape()
	self:LevelUpSpell()
	self:CheckUlt()
	self:AutoPot()
	self:AutoSmite()
	self:CastItems()
	self:PermaShow()
end

function MyHeRoJarvan:ComboModeEnable()
	if self.Menu.Combo.ComboMode then
		if ts.target ~= nil and GetDistance(ts.target) < 1500 and not ts.target.dead and ts.target.visible and ValidTarget(ts.target, 1500) then
			if self.Menu.Combo.Cmode == 1 and myHero:CanUseSpell(_E) == READY and myHero:CanUseSpell(_Q) == READY and self.Menu.Combo.ComboQ and self.Menu.Combo.ComboE then
				self:QtoE(myHero, ts.target, GetDistance(ts.target)+70, 770)
				if self:CountEnemy(self.SpellInfo.W.Range, myHero) >= 1 and myHero:CanUseSpell(_W) == READY and self.Menu.Combo.ComboW then
					CastSpell(_W)
				end
			elseif self.Menu.Combo.Cmode == 2 and self.Menu.Combo.ComboQ and self.Menu.Combo.ComboE then
				if myHero:CanUseSpell(_Q) == READY then
					self:CastQ(ts.target)
				end
				if myHero:CanUseSpell(_E) == READY then
					self:CastE(ts.target)
				end
				if self:CountEnemy(self.SpellInfo.W.Range, myHero) >= 1 and myHero:CanUseSpell(_W) == READY and self.Menu.Combo.ComboW then
					CastSpell(_W)
				end
			elseif self.Menu.Combo.Cmode == 3 and myHero:CanUseSpell(_Q) == READY and self.Menu.Combo.ComboQ then
				self:CastQ(ts.target)
				if self:CountEnemy(self.SpellInfo.W.Range, myHero) >= 1 and myHero:CanUseSpell(_W) == READY and self.Menu.Combo.ComboW then
					CastSpell(_W)
				end
			elseif self.Menu.Combo.Cmode == 4 and myHero:CanUseSpell(_E) == READY and self.Menu.Combo.ComboE then
				self:CastE(ts.target)
				if self:CountEnemy(self.SpellInfo.W.Range, myHero) >= 1 and myHero:CanUseSpell(_W) == READY and self.Menu.Combo.ComboW then
					CastSpell(_W)
				end
			end
			if ts.target.health <= ts.target.maxHealth/2 then
				self:CastR(ts.target)
			end
		end
	end
end

function MyHeRoJarvan:JC()
	jungleMinions:update()
	if self.Menu.JClear.JungleClear and myHero.mana >= (myHero.maxMana*(self.Menu.JClear.JClearMana*0.01)) then
		for i, jminions in pairs(jungleMinions.objects) do
			if jminions ~= nil and jminions.visible then
				if myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) and self.Menu.JClear.JungleClearQ and self.Menu.JClear.JungleClearE then
					self:QtoE(myHero, jminions, GetDistance(jminions)+70, 770)
				end
				if self.Menu.JClear.JungleClearQ and myHero:CanUseSpell(_Q) == READY then
					self:CastQ(jminions)
				end
				if self.Menu.JClear.JungleClearW then
					if GetDistance(jminions) < self.SpellInfo.W.Range and myHero:CanUseSpell(_W) == READY then
						CastSpell(_W)
					end
				end
				if self.Menu.JClear.JungleClearE and myHero:CanUseSpell(_E) == READY then
					self:CastE(jminions)
				end
			end
		end
	end
end

function MyHeRoJarvan:LC()
	enemyMinions:update()
	if self.Menu.Clear.LaneClear and myHero.mana >= (myHero.maxMana*(self.Menu.Clear.ClearMana*0.01)) then
		for i, minions in ipairs(enemyMinions.objects) do
			if minions ~= nil and minions.visible then
				if myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) and self.Menu.Clear.LaneClearQ and self.Menu.Clear.LaneClearE then
					self:QtoE(myHero, minions, GetDistance(minions)+70, 770)
				end
				if self.Menu.Clear.LaneClearQ and myHero:CanUseSpell(_Q) == READY then
					self:CastQ(minions)
				end
				if self.Menu.Clear.LaneClearW then
					if GetDistance(minions) < self.SpellInfo.W.Range and myHero:CanUseSpell(_W) == READY then
					CastSpell(_W)
				end
				if self.Menu.Clear.LaneClearE and myHero:CanUseSpell(_E) == READY then
					self:CastE(minions)
				end
			end
		end
	end
end

function MyHeRoJarvan:HarassEnable()
	if self.Menu.Harass.HS and myHero.mana >= (myHero.maxMana*(self.Menu.Harass.HarassMana*0.01)) then
		if ts.target ~= nil and GetDistance(ts.target) < 1500 and not ts.target.dead and ts.target.visible and ValidTarget(ts.target, 1500) then
			if self.Menu.Harass.Hmode == 1 and myHero:CanUseSpell(_E) == READY and myHero:CanUseSpell(_Q) == READY and self.Menu.Harass.HarassQ and self.Menu.Harass.HarassE then
				self:QtoE(myHero, ts.target, GetDistance(ts.target)+70, 770)
			elseif self.Menu.Harass.Hmode == 2 and self.Menu.Harass.HarassQ and self.Menu.Harass.HarassE then
				if myHero:CanUseSpell(_Q) == READY then
					self:CastQ(ts.target)
				end
				if myHero:CanUseSpell(_E) == READY then
					self:CastE(ts.target)
				end
			elseif self.Menu.Harass.Hmode == 3 and myHero:CanUseSpell(_Q) == READY and self.Menu.Harass.HarassQ then
				self:CastQ(ts.target)
			elseif self.Menu.Harass.Hmode == 4 and myHero:CanUseSpell(_E) == READY and self.Menu.Harass.HarassE then
				self:CastE(ts.target)
			end
		end
	end
end

function MyHeRoJarvan:Delete()
	if self.Menu.KillSteal.Steal then 
		for i, enemy in pairs(GetEnemyHeroes()) do
	    		if not enemy.dead and enemy.visible then
					if myHero:CanUseSpell(_Q) == READY then
						if ValidTarget(enemy, 770) and self.Menu.KillSteal.QSteal then
							if enemy.health < self:GetQDamage(enemy) then
								self:CastQ(enemy)
							end
						end
					end
					if myHero:CanUseSpell(_E) == READY then
						if ValidTarget(enemy, 830) and self.Menu.KillSteal.ESteal then
							if enemy.health < self:GetEDamage(enemy) then
								self:CastE(enemy)
							end
						end
					end
					if myHero:CanUseSpell(_R) == READY and self.UltActive == false then
						if ValidTarget(enemy, 650) and self.Menu.KillSteal.RSteal then
							if enemy.health < self:GetRDamage(enemy) then
								CastSpell(_R, enemy)
							end
						end
					if ValidTarget(enemy, 1350) and self.Menu.KillSteal.EQRSteal then
							if enemy.health < self:GetRDamage(enemy) and myHero:CanUseSpell(_E) == READY and myHero:CanUseSpell(_Q) == READY then
								self:QtoE(myHero, enemy, 760, 770)
								CastSpell(_R, enemy)
							end
						end
					if ValidTarget(enemy, 1350) and self.Menu.KillSteal.EQRSteal then
							if enemy.health < self:GetRDamage(enemy) + self:GetQDamage(enemy) + self:GetEDamage(enemy) and myHero:CanUseSpell(_E) == READY and myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_R) == READY then
								self:QtoE(myHero, enemy, enemy+70, 770)
								CastSpell(_R, enemy)
							end
						end	
					end
					if self.SIgnite and myHero:CanUseSpell(Ignite) == READY and self.Menu.KillSteal.I then
						self.IgniteDmg = (50 + 20 * myHero.level)
						if enemy.health < sefl.IgniteDmg then
							CastSpell(SummonerIgnite)
						end
					end
					if self.SSmite then
						if myHero:GetSpellData(SUMMONER_1).name:find("S5_SummonerSmitePlayerGanker") then 
							KSSmite = SUMMONER_1
							print("KSSmite find")
						elseif myHero:GetSpellData(SUMMONER_2).name:find("S5_SummonerSmitePlayerGanker") then 
							KSSmite = SUMMONER_2 	
							print("KSSmite find")
						end
						if KSSmite ~= nil and myHero:CanUseSpell(KSSmite) == READY and self.Menu.KillSteal.S then
							self.KsSmiteDmg = (20 + 8 * myHero.level)
							if enemy.health < self.KsSmiteDmg then
								CastSpell(KSSmite)
							end
						end
					end
				end
			end
		end
	end
end
function MyHeRoJarvan:CastItems()
    if self.Menu.Combo.ComboMode then
        self:BotRK()
        self:BilgeWater()
        self:Youmuus()
        self:Tiamat()
        self:Hydra()
        self:Titanic()
    end
end

function MyHeRoJarvan:Tiamat()
    if self.Menu.Utility.Item.Tiamat and GetInventorySlotItem(3077) ~= nil then
        local Target = ts.target
        if Target and ValidTarget(Target, 200) then
            if myHero:CanUseSpell(GetInventorySlotItem(3077)) == READY then
                CastSpell(GetInventorySlotItem(3077))
            end
        end
    end
end

function MyHeRoJarvan:Hydra()
    if self.Menu.Utility.Item.Hydra and GetInventorySlotItem(3074) ~= nil then
        local Target = ts.target
        if Target and ValidTarget(Target, 200) then
            if myHero:CanUseSpell(GetInventorySlotItem(3074)) == READY then
                CastSpell(GetInventorySlotItem(3074))
            end
        end
    end
end

function MyHeRoJarvan:Titanic()
    if self.Menu.Utility.Item.Titanic and GetInventorySlotItem(3748) ~= nil then
        local Target = ts.target
        if Target and ValidTarget(Target, 200) then
            if myHero:CanUseSpell(GetInventorySlotItem(3848)) == READY then
                CastSpell(GetInventorySlotItem(3748))
            end
        end
    end
end

function MyHeRoJarvan:BotRK()
    if self.Menu.Utility.Item.BOTRK and GetInventorySlotItem(3153) ~= nil then
        local Target = ts.target
        if Target and ValidTarget(Target, 610) then
            if myHero:CanUseSpell(GetInventorySlotItem(3153)) == READY then
                CastSpell(GetInventorySlotItem(3153), Target)
            end
        end
    end
end

function MyHeRoJarvan:BilgeWater()
    if self.Menu.Utility.Item.BWC and GetInventorySlotItem(3144) ~= nil then
        local Target = ts.target
        if Target and ValidTarget(Target, 610) then
            if myHero:CanUseSpell(GetInventorySlotItem(3144)) == READY then
                CastSpell(GetInventorySlotItem(3144), Target)
            end
        end

    end
end

function MyHeRoJarvan:Youmuus()
    local Target = ts.target
    if self.Menu.Utility.Item.YGB and ValidTarget(Target, 1000) and GetInventorySlotItem(3142) ~= nil then
        if myHero:CanUseSpell(GetInventorySlotItem(3142)) == READY then
            CastSpell(GetInventorySlotItem(3142))
        end
    end
end

function MyHeRoJarvan:OnProcessAttack(unit, spell)
    if unit.isMe and spell.name:lower():find("attack") then
        SpellTarget = spell.target
        if self.Menu.Utility.Item then
            if SpellTarget.type == myHero.type then
                self:Tiamat()
        		self:Hydra()
        		self:Titanic()
            end
        end
    end
end

function MyHeRoJarvan:PermaShow()
	if self.Menu.Drawings.PermaShow then
	    CustomPermaShow("                 My HeRo - Jarvan", "", true, nil, nil, nil, 2)
	    if self.Menu.Combo.ComboMode then
	        CustomPermaShow("Current Mode:", "        Combo", true, RGB(153, 0, 153), nil, nil, 1)
	    elseif self.Menu.Harass.HS then
	        CustomPermaShow("Current Mode:", "       Harass", true, RGB(153, 0, 153), nil, nil, 1)
	    elseif (self.Menu.Clear.LaneClear or self.Menu.JClear.JungleClear) then
	        CustomPermaShow("Current Mode:", "   Wave Clear", true, RGB(153, 0, 153), nil, nil, 1)
	    --elseif self.Menu.LastHit.LastHitKey then
	        --CustomPermaShow("Current Mode:", "       Last Hit", true, RGB(153, 0, 153), nil, nil, 1)
	    else
	        CustomPermaShow("Current Mode:", "         None", true, RGB(153, 0, 153), nil, nil, 1)
	    end
	end
end

function MyHeRoJarvan:OnUnload()
    SetSkin(myHero, -1)
end

function MyHeRoJarvan:ModeChanger()
	if self.Menu.Combo.ChangeCombo then
		self.Menu.Combo.ChangeCombo = false
		self.Menu.Combo.Cmode =self. Menu.Combo.Cmode >= 5 and 1 or (self.Menu.Combo.Cmode + 1)
		self:Message("New Combo Mode: "..self:PrintComboMode(msgg))
	end

	if self.Menu.Harass.ChangeHarass then
		self.Menu.Harass.ChangeHarass = false
		self.Menu.Harass.Hmode = self.Menu.Harass.Hmode >= 4 and 1 or (self.Menu.Harass.Hmode + 1)
		self:Message("New Harass Mode: "..self:PrintHarassMode(msgg))
	end
end

function MyHeRoJarvan:PrintComboMode(msgg)
	if self.Menu.Combo.Cmode == 2 then msgg = 'E + Q'
		elseif self.Menu.Combo.Cmode == 3 then msgg = 'Q or E'
		elseif self.Menu.Combo.Cmode == 4 then msgg = 'Q Only'
		elseif self.Menu.Combo.Cmode == 5 then msgg = 'E Only'
		elseif self.Menu.Combo.Cmode == 1 then msgg = 'Smart'	
	end
	return msgg
end

function MyHeRoJarvan:PrintHarassMode(msgg)
	if self.Menu.Harass.Hmode == 1 then msgg = 'E + Q'
		elseif self.Menu.Harass.Hmode == 2 then msgg = 'Q or E'
		elseif self.Menu.Harass.Hmode == 3 then msgg = 'Q Only'
		elseif self.Menu.Harass.Hmode == 4 then msgg = 'E Only'
	end
	return msgg
end

function MyHeRoJarvan:DrawComboMode()
	if self.Menu.Combo.Cmode == 1 then
		self.txt = 'Smart'
		DrawText ("Combo Mode: "..self.txt, 20, 1125, 885, 0xFFFFF5EE)
	elseif self.Menu.Combo.Cmode == 2 then
		self.txt = 'E + Q'
		DrawText ("Combo Mode: "..self.txt, 20, 1125, 885, 0xFFFFF5EE)
	elseif self.Menu.Combo.Cmode == 3 then
		self.txt = 'Q or E'
		DrawText ("Combo Mode: "..self.txt, 20, 1125, 885, 0xFFFFF5EE)
	elseif self.Menu.Combo.Cmode == 4 then 
		self.txt = 'Q Only'
		DrawText ("Combo Mode: "..self.txt, 20, 1125, 885, 0xFFFFF5EE)
	elseif self.Menu.Combo.Cmode == 5 then 
		self.txt = 'E Only'
		DrawText ("Combo Mode: "..self.txt, 20, 1125, 885, 0xFFFFF5EE)
	end
end

function MyHeRoJarvan:DrawHarassMode()
	if self.Menu.Harass.Hmode == 1 then
		self.tst = 'E + Q'
		DrawText ("Harass Mode: "..self.tst, 20, 1125, 905, 0xFFFFF5EE)
	elseif self.Menu.Harass.Hmode == 2 then 
		self.tst = 'Q or E'
		DrawText ("Harass Mode: "..self.tst, 20, 1125, 905, 0xFFFFF5EE)
	elseif self.Menu.Harass.Hmode == 3 then 
		self.tst = 'Q Only'
		DrawText ("Harass Mode: "..self.tst, 20, 1125, 905, 0xFFFFF5EE)
	elseif self.Menu.Harass.Hmode == 4 then 
		self.tst = 'E Only'
		DrawText ("Harass Mode: "..self.tst, 20, 1125, 905, 0xFFFFF5EE)
	end
end

function MyHeRoJarvan:CountEnemy(range, object)
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

function MyHeRoJarvan:OnCreateObj(object)
	if not object and not object ~= nil then return end
	if object.name:lower():find("jarvancataclysm_sound.troy") then
		self.UltActive = true
	end
	if object.name == "JarvanDemacianStandard_buf_green.troy" then 
		self.numflags = #self.flags+1
		for x = 1, self.numflags do
			if self.flags[x] == nil then
				self.flags[x] = object
				break
			end
    	end
	end
end

function MyHeRoJarvan:OnDeleteObj(object)
	if not object and not object ~= nil then return end
	if object.name == "JarvanWallCrumble.troy" then
		self.UltActive = false
	end
	if object.name == "JarvanDemacianStandard_buf_green.troy" then
		for x, flag in pairs(self.flags) do
			if object.networkID == flag.networkID then
				self.flags[x] = nil
			end
    	end
	end
end

function MyHeRoJarvan:AutoKnockUp(target)
	if target ~= nil and GetDistance(target) < 1000 then
		self.PredTarget = VP:GetCircularCastPosition(target, 0.1, 400, 1000, math.huge, myHero, false)
		for _, flag in pairs(self.flags) do
			self.KnockUpPoint = VectorPointProjectionOnLine(myHero, flag, target)
			if GetDistance(self.PredTarget, self.KnockUpPoint) < 150 and GetDistance(flag) < 770 and myHero:CanUseSpell(_Q) == READY then
				CastSpell(_Q, flag.x, flag.z)
			end
		end
	end
end

function MyHeRoJarvan:QtoE(FromPos, TooPos, PlaceRange, CheckRange)
    self.FirstPos = Vector(FromPos.x, FromPos.z)
    self.SecondPos = Vector(TooPos.x, TooPos.z)
    self.NextRange = Vector(self.FirstPos + (self.SecondPos-self.FirstPos):normalized() * PlaceRange)
    self.NextSpot = Vector(self.NextRange.x, myHero.y, self.NextRange.y)
    if GetDistance(self.NextSpot) < CheckRange and myHero:CanUseSpell(_E) == READY then
        CastSpell(_E, self.NextSpot.x, self.NextSpot.z)
        self.CastX = self.NextSpot.x
        self.CastZ = self.NextSpot.z
        DelayAction(function() CastSpell(_Q, self.CastX, self.CastZ) end, 0.01)
    	return "casted"
    else
      	return nil
    end
end


function MyHeRoJarvan:CastR(t)
	if self.Menu.Combo.ComboR and not self.UltActive and self:BlockRCheck(t)then
		CastSpell(_R, t)
	end
end

function MyHeRoJarvan:GetSmiteDamage()
    self.level = myHero.level
    return math.max(20 * self.level + 370, 30 * self.level + 330, 40 * self.level + 240, 50 * self.level + 100)
end

function MyHeRoJarvan:AutoSmite()
	if Smite ~= nil then
	    SmiteDmg = self:GetSmiteDamage()
	    for _, jminions in pairs(minionManager(MINION_JUNGLE, 1000, myHero, MINION_SORT_HEALTH_ASC).objects) do
	        if not jminions.dead and jminions.visible and ValidTarget(jminions, 560) then
	                local name = jminions.charName
	                local name = name:sub(name:find("_")+1, name:len())
	                local name = name:sub(1, (name:find("_") or name:len()+1)-1)
	                if self.Menu.Utility.Smite[name] then
	                if myHero:CanUseSpell(Smite) == READY and GetDistance(myHero, jminions) <= 560 and SmiteDmg >= jminions.health then
	                    CastSpell(Smite, jminions)
	                end
	            end
	        end
	    end
	end
end

function MyHeRoJarvan:DrawSmiteable()
	if Smite ~= nil then
	    if (not myHero.dead and myHero:CanUseSpell(Smite) == READY) then
	        SmiteDmg = self:GetSmiteDamage()
	        for _, jminion in pairs(minionManager(MINION_JUNGLE, 1000, myHero, MINION_SORT_HEALTH_ASC).objects) do
	            if not jminion.dead and jminion.visible and ValidTarget(jminion, 560) then
	                local name = jminion.charName
	                local name = name:sub(name:find("_")+1, name:len())
	                local name = name:sub(1, (name:find("_") or name:len()+1)-1)
	                if self.Menu.Utility.Smite[name] then
	                    self.posMinion = WorldToScreen(D3DXVECTOR3(jminion.x, jminion.y, jminion.z))
	                    SmiteProcess = math.round(100 - 100 * (jminion.health - SmiteDmg)/jminion.maxHealth)
	                    if GetDistance(myHero, jminion) <= 560 then
	                        DrawText("Smite Process - "..SmiteProcess.."%", 20, self.posMinion.x - GetTextArea("Smite Process - "..SmiteProcess.."%", 20).x/2, self.posMinion.y, ARGB(255,255,0,0))
	                        DrawCircle(jminion.x, jminion.y, jminion.z, 1.5 * SmiteProcess, ARGB(255, 255 * (1 - SmiteProcess/100), 255 * SmiteProcess/100, 255*(1 - SmiteProcess/100)))
	                        DrawCircle(jminion.x, jminion.y, jminion.z, 150, ARGB(55, 55, 155, 55))
	                    end
	                end
	            end
	        end
	    end
	end
end

function MyHeRoJarvan:BaseCheck()
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

function MyHeRoJarvan:AutoPotions()
    if self.Menu.Utility.Potions.EnablePot and myHero.health / myHero.maxHealth * 100 <= self.Menu.Utility.Potions.PotMinHealth then
        for _, item in pairs(self.PotList) do
            item.slot = GetInventorySlotItem(item.id)
            if item.slot ~= nil and (not self.F) and (not self.ActivePot) then
                CastSpell(item.slot)
            end
        end
    end
end

function MyHeRoJarvan:SkinLoad()
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

function MyHeRoJarvan:LevelUp()
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

function MyHeRoJarvan:OnApplyBuff(unit, source, buff)
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

function MyHeRoJarvan:AutoQSS(BuffType)
    for _, item in pairs(self.QSSList) do
        item.slot = GetInventorySlotItem(item.id)
        if item.slot ~= nil and self.Menu.Utility.RemoveCC.EnableQSS then
            DelayAction(function() CastSpell(item.slot) end, self.Menu.Utility.RemoveCC.QSSHumanizer/1000)
        end
    end
end

function MyHeRoJarvan:OnRemoveBuff(unit, buff)
    if not unit or not buff then return end
    for i=1, 5 do
        if (buff.name == self.PotNameBuff[i] and unit.isMe) then
            self.ActivePot = false
        end
    end
end

function MyHeRoJarvan:BlockRCheck(target)
	if ts.target ~= nil and self.Menu.BlockR[target.charName] then
		return true
	else
		return false
	end
end

function MyHeRoJarvan:EQEscape()
	if self.Menu.Escape.EnableEscape then
  		myHero:MoveTo(mousePos.x, mousePos.z)
		if myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) == READY then
			MousePos = Vector(mousePos.x, mousePos.y, mousePos.z)
			self:QtoE(myHero, MousePos, GetDistance(MousePos, myHero), 770)
			CastSpell(_E, MousePos.x, MousePos.z)
			DelayAction(function() CastSpell(_Q, MousePos.x, MousePos.z) end, 0.3)
		end
		if self:CountEnemy(self.SpellInfo.W.Range, myHero) >= 1 and myHero:CanUseSpell(_W) == READY and self.Menu.Escape.WEscape then
			CastSpell(_W)
		end
	end
end

function MyHeRoJarvan:LevelUpSpell()
	if VIP_USER and self.Menu.Utility.LvLUp.Enable then
		if (self.LastLevel < myHero.level) then
			self:LevelUp()
		end
	end
end

function MyHeRoJarvan:CheckUlt()
	if self.UltActive then
		if self:CountEnemy(650, myHero) == 0 then
			CastSpell(_R)
		end
	end
end

function MyHeRoJarvan:CastQ(unit)
  	if unit == nil and myHero:CanUseSpell(_Q) then return end
  	if self.VP ~= nil then
    	local CastPosition, HitChance = self.VP:GetLineCastPosition(unit, self.SpellInfo.Q.Delay, self.SpellInfo.Q.Widrh, self.SpellInfo.Q.Range, self.SpellInfo.Q.Speed, myHero, false)
    	if HitChance >=self.Menu.Prediction.QVPHC then
      		CastSpell(_Q, CastPosition.x, CastPosition.z)
    	end
  	end
  	if self.DP ~= nil then
    	local state,hitPos,perc = self.DP:predict(nil, unit, myHero, SkillShot.TYPE.LINE, self.SpellInfo.Q.Delay, self.SpellInfo.Q.Range, self.SpellInfo.Q.Widrh, self.SpellInfo.Q.Delay * 1000, 0, {Minions = false, Champions = false})
    	if perc >=self.Menu.Prediction.QHC then
      		CastSpell(_Q, hitPos.x, hitPos.z)
    	end
  	end
  	if self.FHPred and Menu.Prediction.CurrentPred == 3 then
    	local CastPosition, hc, info = FHPrediction.GetPrediction("Q", unit)
    	if hc > 0 and CastPosition ~= nil then
      		CastSpell(_Q, CastPosition.x, CastPosition.z)
    	end
  	end
  	if self.SP ~= nil then
    	local CastPosition, Chance, PredPos = self.SP:Predict(unit, self.SpellInfo.Q.Range, self.SpellInfo.Q.Speed, self.SpellInfo.Q.Delay, self.SpellInfo.Q.Widrh, false, myHero)
    	if Chance >= self.Menu.Prediction.QSPHC then
      		CastSpell(_Q, CastPosition.x, CastPosition.z)
    	end
  	end
  	if self.HP ~= nil then
        local Position, HitChance = self.HP:GetPredict(HPSkillshot({type = "DelayLine", delay = self.SpellInfo.Q.Delay, range = self.SpellInfo.Q.Range, speed = self.SpellInfo.Q.Speed, collisionH = false, collisionM = false, width = self.SpellInfo.Q.Widrh}), unit, myHero)
        if HitChance > self.Menu.Prediction.QHPHC then
            CastSpell(_Q, Position.x, Position.z)
        end
    end
    if self.KP ~= nil then
    	self.KPinfoQ = {range = self.SpellInfo.Q.Range, speed = self.SpellInfo.Q.Speed, delay = self.SpellInfo.Q.Delay, radius = self.SpellInfo.Q.Widrh, type = "DelayLine", width = self.SpellInfo.Q.Widrh, collision = false}
        local CastPosition, hc = self.KP:GetPrediction(self.KPinfoQ, unit, myHero)
        if hc >= self.Menu.Prediction.QKPHC then
            CastSpell(_Q, CastPosition.x, CastPosition.z)
        end
    end
end

function MyHeRoJarvan:CastE(unit)
  	if unit == nil and myHero:CanUseSpell(_E) then return end
  	if self.VP ~= nil then
    	local CastPosition, HitChance = self.VP:GetLineCastPosition(unit, self.SpellInfo.E.Delay, self.SpellInfo.E.Widrh, self.SpellInfo.E.Range, self.SpellInfo.E.Speed, myHero, false)
    	if HitChance >= self.Menu.Prediction.EVPHC then
      		CastSpell(_E, CastPosition.x, CastPosition.z)
    	end
  	end
  	if self.DP ~= nil then
    	local state,hitPos,perc = self.DP:predict(nil, unit, myHero, SkillShot.TYPE.CIRCLE,self. SpellInfo.E.Speed, self.SpellInfo.E.Range, self.SpellInfo.E.Widrh, self.SpellInfo.E.Delay * 1000, 0, {Minions = false, Champions = false})
    	if perc >= Menu.Prediction.EHC then
      		CastSpell(_E, hitPos.x, hitPos.z)
    	end
  	end
  	if self.FHPred and Menu.Prediction.CurrentPred == 3 then
    	local CastPosition, hc, info = FHPrediction.GetPrediction("E", unit)
    	if hc > 0 and CastPosition ~= nil then
      		CastSpell(_E, CastPosition.x, CastPosition.z)
    	end
  	end
  	if self.SP ~= nil then
    	local CastPosition, Chance, PredPos = self.SP:Predict(unit, self.SpellInfo.E.Range, self.SpellInfo.E.Speed, self.SpellInfo.E.Delay, self.SpellInfo.E.Widrh, false, myHero)
    	if Chance >= Menu.Prediction.ESPHC then
      		CastSpell(_E, CastPosition.x, CastPosition.z)
    	end
  	end
  	if self.HP ~= nil then
        local Position, HitChance = self.HP:GetPredict(HPSkillshot({type = "DelayCircle", delay = self.SpellInfo.E.Delay, range = self.SpellInfo.E.Range, speed = self.SpellInfo.E.Speed, collisionH = false, collisionM = false, width = self.SpellInfo.E.Widrh}), unit, myHero)
        if HitChance > self.Menu.Prediction.EHPHC then
            CastSpell(_E, Position.x, Position.z)
        end
    end
    if self.KP ~= nil then
    	self.KPinfoE = {range = self.SpellInfo.E.Range, speed = self.SpellInfo.E.Speed, delay = self.SpellInfo.E.Delay, radius = self.SpellInfo.E.Widrh, type = "DelayCircle", width = self.SpellInfo.E.Widrh, collision = false}
        local CastPosition, hc = self.KP:GetPrediction(self.KPinfoE, unit, myHero)
        if hc >= self.Menu.Prediction.EKPHC then
            CastSpell(_E, CastPosition.x, CastPosition.z)
        end
    end
end

function MyHeRoJarvan:OnDraw()
	if myHero.dead then return end
	if self.Menu.Drawings.AllDraw then	
	    if self.Menu.Drawings.FPS then
	    	if self.Menu.Drawings.DrawQ and myHero:CanUseSpell(_Q) == READY then
				_G.JarvanDrawFPSCircle(myHero.x, myHero.z, self.SpellInfo.Q.Range, ARGB(255, 0, 0, 80), self.Menu.Drawings.Quality)
			end	

			if self.Menu.Drawings.DrawW and myHero:CanUseSpell(_W) == READY then
				_G.JarvanDrawFPSCircle(myHero.x, myHero.z, self.SpellInfo.W.Range, ARGB(255, 0, 0, 80), self.Menu.Drawings.Quality)
			end

			if self.Menu.Drawings.DrawE and myHero:CanUseSpell(_E) == READY then
				_G.JarvanDrawFPSCircle(myHero.x, myHero.z, self.SpellInfo.E.Range, ARGB(255, 0, 0, 80), self.Menu.Drawings.Quality)
			end

			if self.Menu.Drawings.DrawAA then
				_G.JarvanDrawFPSCircle(myHero.x, myHero.z, self.SpellInfo.AA.Range, ARGB(255, 0, 0, 80), self.Menu.Drawings.Quality)
			end
			
			if self.Menu.Drawings.DrawR and myHero:CanUseSpell(_R) == READY then
				_G.JarvanDrawFPSCircle(myHero.x, myHero.z, self.SpellInfo.R.Range, ARGB(255, 0, 0, 80), self.Menu.Drawings.Quality)
			end
		else
			if self.Menu.Drawings.DrawQ and myHero:CanUseSpell(_Q) == READY then
				DrawCircle(myHero.x, myHero.y, myHero.z, self.SpellInfo.Q.Range, ARGB(255, 0, 0, 80))
			end	

			if self.Menu.Drawings.DrawW and myHero:CanUseSpell(_W) == READY then
				DrawCircle(myHero.x, myHero.y, myHero.z, self.SpellInfo.W.Range, ARGB(255, 0, 0, 80))
			end

			if self.Menu.Drawings.DrawE and myHero:CanUseSpell(_E) == READY then
				DrawCircle(myHero.x, myHero.y, myHero.z, self.SpellInfo.E.Range, ARGB(255, 0, 0, 80))
			end

			if self.Menu.Drawings.DrawAA then
				DrawCircle(myHero.x, myHero.y, myHero.z, self.SpellInfo.AA.Range, ARGB(255, 0, 0, 80))
			end
			
			if self.Menu.Drawings.DrawR and myHero:CanUseSpell(_R) == READY then
				DrawCircle(myHero.x, myHero.y, myHero.z, self.SpellInfo.R.Range, ARGB(255, 0, 0, 80))
			end
		end

	    if self.Menu.Drawings.DrawComboModex then
	        self:DrawComboMode()
		end

		if self.Menu.Drawings.DrawHarassModex then
	        self:DrawHarassMode()
		end
		if Smite ~= nil then
			if self.Menu.Drawings.DrawSmiteable then
			    self:DrawSmiteable()
			end

			if self.Menu.Drawings.DrawSmite and myHero:CanUseSpell(Smite) then
			    DrawCircle(myHero.x, myHero.y, myHero.z, 560, ARGB(255, 100, 100, 80))
			end
		end
	end
end

function MyHeRoJarvan:AutoPot()
	if (self.Menu.Utility.Potions.EnablePot and not self.Menu.Utility.Potions.EnableCPot) then
        self:AutoPotions()
    elseif self.Menu.Utility.Potions.EnablePot and self.Menu.Utility.Potions.EnableCPot and self.Menu.Utility.Potions.EnableCKeyPot then
        self:AutoPotions()
    end
end

function MyHeRoJarvan:GetDlina(a, b)
  	self.Dlina = math.sqrt((b.x-a.x)*(b.x-a.x) + (b.z-a.z)*(b.z-a.z))
  	return self.Dlina
end

function MyHeRoJarvan:CheckFail(unit)
  	for i, buff in pairs(self.InvulList) do
    	if TargetHaveBuff(buff, unit) then
      		return true
    	end
  	end
    return false
end

function MyHeRoJarvan:GetQDamage(unit)
  	Qlvl = myHero:GetSpellData(_Q).level
  	if Qlvl < 1 then return 0 end
  	QDmg = {70, 115, 160, 205, 250}
  	QDmgMod = 1.2
  	DmgRaw = QDmg[Qlvl] + myHero.totalDamage * QDmgMod
  	Dmg = myHero:CalcDamage(unit, DmgRaw)
  	return Dmg
end

function MyHeRoJarvan:GetEDamage(unit)
  	Elvl = myHero:GetSpellData(_E).level
  	if Elvl < 1 then return 0 end
  	EDmg = {60, 105, 150, 195, 240}
  	EDmgMod = 0.8
  	DmgRaw = EDmg[Elvl] + (myHero.ap * EDmgMod)
  	Dmg = myHero:CalcDamage(unit, DmgRaw)
  	return Dmg
end

function MyHeRoJarvan:GetRDamage(unit)
  	Rlvl = myHero:GetSpellData(_R).level
  	if Rlvl < 1 then return 0 end
  	RDmg = {200, 325, 450}
  	RDmgMod = 1.5
  	DmgRaw = RDmg[Rlvl] + (myHero.totalDamage * RDmgMod)
  	Dmg = myHero:CalcDamage(unit, DmgRaw)
  	return Dmg
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------_G.JarvanDrawFPSCircle Start--------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

function _G.JarvanDrawLineA(x1, y1, x2, y2, color)
    DrawLine(x1, y1, x2, y2, 1, color)
end

function _G.JarvanDrawFPSCircle(x, z, radius, color, quality)
    for i = -radius * math.cos(math.pi/4), radius * math.cos(math.pi/4) - 1, radius * math.cos(math.pi/4)/quality do
        local v = WorldToScreen(D3DXVECTOR3((x + i), myHero.y, (z + math.sqrt(radius * radius - i * i))))
        local c = WorldToScreen(D3DXVECTOR3((x + i), myHero.y, (z - math.sqrt(radius * radius - i * i))))
        local k = WorldToScreen(D3DXVECTOR3((x + i + radius * math.cos(math.pi/4)/quality), myHero.y, (z + math.sqrt(radius * radius - (i + radius * math.cos(math.pi/4)/quality) * (i + radius * math.cos(math.pi/4)/quality)))))
        local n = WorldToScreen(D3DXVECTOR3((x + i + radius * math.cos(math.pi/4)/quality), myHero.y, (z - math.sqrt(radius * radius - (i + radius * math.cos(math.pi/4)/quality) * (i + radius * math.cos(math.pi/4)/quality)))))
        if (v.x > 0 and v.x < WINDOW_W) and (v.y > 0 and v.y < WINDOW_H) and (k.x > 0 and k.x < WINDOW_W) and (k.y > 0 and k.y < WINDOW_H) then
            _G.JarvanDrawLineA(v.x, v.y, k.x, k.y, color)
        end
        if (c.x > 0 and c.x < WINDOW_W) and (c.y > 0 and c.y < WINDOW_H) and (n.x > 0 and n.x < WINDOW_W) and (n.y > 0 and n.y < WINDOW_H) then
            _G.JarvanDrawLineA(c.x, c.y, n.x, n.y, color)
        end
    end

    for i = -radius * math.cos(math.pi/4), radius * math.cos(math.pi/4) - 1, radius * math.cos(math.pi/4)/quality do
        local v = WorldToScreen(D3DXVECTOR3((x + math.sqrt(radius * radius - i * i)), myHero.y, (z + i)))
        local c = WorldToScreen(D3DXVECTOR3((x - math.sqrt(radius * radius - i * i)), myHero.y, (z + i)))
        local k = WorldToScreen(D3DXVECTOR3((x + math.sqrt(radius * radius - (i + radius * math.cos(math.pi/4)/quality) * (i + radius * math.cos(math.pi/4)/quality))), myHero.y, (z + i + radius * math.cos(math.pi/4)/quality)))
        local n = WorldToScreen(D3DXVECTOR3((x - math.sqrt(radius * radius-(i + radius * math.cos(math.pi/4)/quality) * (i + radius * math.cos(math.pi/4)/quality))), myHero.y, (z + i + radius*  math.cos(math.pi/4)/quality)))
        if (v.x > 0 and v.x < WINDOW_W) and (v.y > 0 and v.y < WINDOW_H) and (k.x > 0 and k.x < WINDOW_W) and (k.y > 0 and k.y < WINDOW_H) then
            _G.JarvanDrawLineA(v.x, v.y, k.x, k.y, color)
        end
        if (c.x > 0 and c.x < WINDOW_W) and (c.y > 0 and c.y < WINDOW_H) and (n.x > 0 and n.x < WINDOW_W) and (n.y > 0 and n.y < WINDOW_H) then
            _G.JarvanDrawLineA(c.x, c.y, n.x, n.y, color)

        end
    end
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------_G.JarvanDrawFPSCircle End--------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

class "ScriptUpdate"
function ScriptUpdate:__init(LocalVersion,UseHttps, Host, VersionPath, ScriptPath, SavePath, CallbackUpdate, CallbackNoUpdate, CallbackNewVersion,CallbackError)
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
--Credits SxTeam
