--[[OUTDATED]]--
local RangeSmite = 560
local KillSmiteDmg = function() return myHero.level * 8 + 20 end
local SCRIPT_NAME = "HeRo Jarvan"
local SCRIPT_AUTHOR = "HeRoBaNd"
local version = "2.3"
local SMITE, ATTACKSMITE = false, false
local SMITELIST = {"summonersmite", "s5_summonersmiteplayerganker", "s5_summonersmiteduel"}
local SMITEFOCUS = {"SRU_Blue1.1.1", "SRU_Blue7.1.1", "SRU_Murkwolf2.1.1", "SRU_Murkwolf8.1.1", "SRU_Gromp13.1.1", "SRU_Gromp14.1.1", "Sru_Crab16.1.1", 
"Sru_Crab15.1.1", "SRU_Red10.1.1", "SRU_Red4.1.1", "SRU_Krug11.1.2", "SRU_Krug5.1.2", "SRU_Razorbeak9.1.1", "SRU_Razorbeak3.1.1", "SRU_Dragon6.1.1", 
"SRU_Baron12.1.1", "TT_NWraith1.1.1", "TT_NGolem2.1.1", "TT_NWolf3.1.1", "TT_NWraith4.1.1", "TT_NGolem5.1.1", "TT_NWolf6.1.1", "TT_Spiderboss8.1.1"}


-- BoL Tools Tracker --
assert(load(Base64Decode("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"), nil, "bt", _ENV))()
TrackerLoad("bNcYC6SsMjdS12ov")
-- BoL Tools Tracker --

if myHero:GetSpellData(SUMMONER_1).name:find("SummonerSmite") then Smite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("SummonerSmite") then Smite = SUMMONER_2 end

if Smite ~= nil then 
	DelayAction(function() PrintChat("<font color='#FF0000'><b>[HeRo Info] </b></font>".."<font color='#00BFFF'><b>Smite found.</b></font>") end, 4.0) 
	DelayAction(function() PrintChat("<font color='#FF0000'><b>[HeRo Smite 2.2] </b></font>".."<font color='#00BFFF'><b>Loaded.</b></font>")  end, 4.0)
else
	DelayAction(function() PrintChat("<font color='#FF0000'><b>[HeRo Info] </b></font>".."<font color='#00BFFF'><b>Smite not found.</b></font>")  end, 4.0) 
	return 
end

function OnLoad()
--Credits SxTeam  
 local ToUpdate = {}
    ToUpdate.Version = 2.3
    ToUpdate.UseHttps = true
    ToUpdate.Host = "raw.githubusercontent.com"
    ToUpdate.VersionPath = "/HeRoBaNd/Scripts/master/HeRo%20Smite.version"
    ToUpdate.ScriptPath =  "/HeRoBaNd/Scripts/master/HeRo%20Smite.lua"
    ToUpdate.SavePath = SCRIPT_PATH.."/HeRo Smite_Test.lua"
    ToUpdate.CallbackUpdate = function(NewVersion,OldVersion) print("<font color='#FF0000'><b>[HeRo Info]: </b> </font><font color='#00BFFF'><b>Updated to "..NewVersion..". </b></font>") end
    ToUpdate.CallbackNoUpdate = function(OldVersion) print("<font color='#FF0000'><b>[HeRo Info]: </b></font> <font color='#00BFFF'><b>No Updates Found</b></font>") end
    ToUpdate.CallbackNewVersion = function(NewVersion) print("<font color='#FF0000'><b>[HeRo Info]: </b></font> <font color='#00BFFF'><b>New Version found ("..NewVersion.."). Please wait until its downloaded</b></font>") end
    ToUpdate.CallbackError = function(NewVersion) print("<font color='#FF0000'><b>[HeRo Info]: </b></font> <font color='#00BFFF'><b>Error while Downloading. Please try again.</b></font>") end
    ScriptUpdate(ToUpdate.Version,ToUpdate.UseHttps, ToUpdate.Host, ToUpdate.VersionPath, ToUpdate.ScriptPath, ToUpdate.SavePath, ToUpdate.CallbackUpdate,ToUpdate.CallbackNoUpdate, ToUpdate.CallbackNewVersion,ToUpdate.CallbackError)
--Credits SxTeam    
	jungleMinions = minionManager(MINION_JUNGLE, RangeSmite, myHero, MINION_SORT_MAXHEALTH_DEC)
	MenuInit()
	AddTickCallback(AutoSmite)
	AddDrawCallback(DrawSmiteable)	
end

function MenuInit()
	Menu = scriptConfig("HeRo Smite", "HeRo Smite")
	
	Menu:addParam('Info', '-----------------------------------------------------', SCRIPT_PARAM_INFO, "-------------")

	Menu:addParam("StealSmite", "Use Smite on KillSteal", SCRIPT_PARAM_ONKEYTOGGLE, true, string.byte("K"))
	Menu:addParam("SmiteActive", "Smite Active", SCRIPT_PARAM_ONKEYTOGGLE, true, string.byte("H"))
	Menu:addParam("UseSpells", "Use Spells", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("N"))
	

    Menu:addSubMenu("Draw", "Draw")
		Menu.Draw:addParam("drawSmite", "Draw Smite Range " , SCRIPT_PARAM_ONOFF, true)
		Menu.Draw:addParam("drawSmitetext", "Draw Smite Process", SCRIPT_PARAM_ONOFF, true)
		
	Menu:addSubMenu("Smite Monsters:", "smite")
		if GetGame().map.shortName == "twistedTreeline" then
			Menu.smite:addParam("Wraith", "Use Smite on: Wraith", SCRIPT_PARAM_ONOFF, true)
			Menu.smite:addParam("Golem", "Use Smite on: Golem", SCRIPT_PARAM_ONOFF, true)
			Menu.smite:addParam("Wolf", "Use Smite on: Wolf", SCRIPT_PARAM_ONOFF, true)
			Menu.smite:addParam("Spiderboss", "Use Smite on: SpiderBoss", SCRIPT_PARAM_ONOFF, true)
		else
			Menu.smite:addParam("Dragon", "Use Smite on: Dragon", SCRIPT_PARAM_ONOFF, true)
			Menu.smite:addParam("Baron", "Use Smite on: Baron", SCRIPT_PARAM_ONOFF, true)
			Menu.smite:addParam("Razorbeak", "Use Smite on: Wraith", SCRIPT_PARAM_ONOFF, false)
			Menu.smite:addParam("Murkwolf", "Use Smite on: Wolf", SCRIPT_PARAM_ONOFF, false)
			Menu.smite:addParam("Krug", "Use Smite on: Krug", SCRIPT_PARAM_ONOFF, false)
			Menu.smite:addParam("Gromp", "Use Smite on: Gromp", SCRIPT_PARAM_ONOFF, false)
			Menu.smite:addParam("Red", "Use Smite on: Red Buff", SCRIPT_PARAM_ONOFF, true)
			Menu.smite:addParam("Blue", "Use Smite on: Blue Buff", SCRIPT_PARAM_ONOFF, true)
		end
	Menu:addParam("info1", "", SCRIPT_PARAM_INFO, "")
  	Menu:addParam("info2", ""..SCRIPT_NAME.." [ver. "..version.."]", SCRIPT_PARAM_INFO, "")
  	Menu:addParam("info3", "Author - "..SCRIPT_AUTHOR.."", SCRIPT_PARAM_INFO, "")
		
	IDPerma = Menu:permaShow("SmiteActive")
	Menu.permaShowEdit(IDPerma, "lText", "[HeRo Smite Active]")
	Menu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)
	IDPerma = Menu:permaShow("UseSpells")
	Menu.permaShowEdit(IDPerma, "lText", "[HeRo Smite - Use Spells]")
	Menu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)
end

function GetSmiteDamage()
	local SmiteDamage
	if myHero.level <= 4 then
		SmiteDamage = 370 + (myHero.level*20)
	end
	if myHero.level > 4 and myHero.level <= 9 then
		SmiteDamage = 330 + (myHero.level*30)
	end
	if myHero.level > 9 and myHero.level <= 14 then
		SmiteDamage = 240 + (myHero.level*40)
	end
	if myHero.level > 14 then
		SmiteDamage = 100 + (myHero.level*50)
	end
	return SmiteDamage
end
	
function GetDamageSpell()
	local SpellDamage
	
	if myHero.charName == "Aatrox" then
		ELevel = myHero:GetSpellData(_E).level
	if ELevel == 1 then
		SpellDamage = 75 + (0.6*myHero.ap) + (0.6*myHero.totalDamage)
	elseif ELevel == 2 then
		SpellDamage = 110 + (0.6*myHero.ap) + (0.6*myHero.totalDamage)
	elseif ELevel == 3 then
		SpellDamage = 145 + (0.6*myHero.ap) + (0.6*myHero.totalDamage)
	elseif ELevel == 4 then
		SpellDamage = 180 + (0.6*myHero.ap) + (0.6*myHero.totalDamage)
	elseif ELevel == 5 then
		SpellDamage = 215 + (0.6*myHero.ap) + (0.6*myHero.totalDamage)
	end
	end

	
	if myHero.charName == "Akali" then
		ELevel = myHero:GetSpellData(_E).level
	if ELevel == 1 then
		SpellDamage = 30 + (0.4*myHero.ap) + (0.6*myHero.totalDamage)
	elseif ELevel == 2 then
		SpellDamage = 55 + (0.4*myHero.ap) + (0.6*myHero.totalDamage)
	elseif ELevel == 3 then
		SpellDamage = 80 + (0.4*myHero.ap) + (0.6*myHero.totalDamage)
	elseif ELevel == 4 then
		SpellDamage = 105 + (0.4*myHero.ap) + (0.6*myHero.totalDamage)
	elseif ELevel == 5 then
		SpellDamage = 130 + (0.4*myHero.ap) + (0.6*myHero.totalDamage)
	end
	end
	
	if myHero.charName == "Amumu" then
		ELevel = myHero:GetSpellData(_E).level
	if ELevel == 1 then
		SpellDamage = 75 + (0.5*myHero.ap)
	elseif ELevel == 2 then
		SpellDamage = 100 + (0.5*myHero.ap)
	elseif ELevel == 3 then
		SpellDamage = 125 + (0.5*myHero.ap)
	elseif ELevel == 4 then
		SpellDamage = 150 + (0.5*myHero.ap)
	elseif ELevel == 5 then
		SpellDamage = 175 + (0.5*myHero.ap)
	end
	end

	if myHero.charName == "Chogath" then
		RLevel = myHero:GetSpellData(_R).level
	if RLevel == 1 then
		SpellDamage = 1000 + (0.7*myHero.ap)
	elseif RLevel == 2 then
		SpellDamage = 1000 + (0.7*myHero.ap)
	elseif RLevel == 3 then
		SpellDamage = 1000 + (0.7*myHero.ap)
	end
	end
	
	if myHero.charName == "Diana" then
		RLevel = myHero:GetSpellData(_R).level
	if RLevel == 1 then
		SpellDamage = 100 + (0.6*myHero.ap)
	elseif RLevel == 2 then
		SpellDamage = 160 + (0.6*myHero.ap)
	elseif RLevel == 3 then
		SpellDamage = 220 + (0.6*myHero.ap)
	end
	end
	
	if myHero.charName == "Evlynn" then
		ELevel = myHero:GetSpellData(_E).level
	if ELevel == 1 then
		SpellDamage = 35 + (0.5*myHero.ap) + (0.5*myHero.totalDamage)
	elseif ELevel == 2 then
		SpellDamage = 55 + (0.5*myHero.ap) + (0.5*myHero.totalDamage)
	elseif ELevel == 3 then
		SpellDamage = 75 + (0.5*myHero.ap) + (0.5*myHero.totalDamage)
	elseif ELevel == 4 then
		SpellDamage = 95 + (0.5*myHero.ap) + (0.5*myHero.totalDamage)
	elseif ELevel == 5 then
		SpellDamage = 115 + (0.5*myHero.ap) + (0.5*myHero.totalDamage)
	end

		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = 40 + (0.35*myHero.ap) + (0.5*myHero.totalDamage)
	elseif QLevel == 2 then
		SpellDamage = 50 + (0.4*myHero.ap) + (0.55*myHero.totalDamage)
	elseif QLevel == 3 then
		SpellDamage = 60 + (0.45*myHero.ap) + (0.6*myHero.totalDamage)
	elseif QLevel == 4 then
		SpellDamage = 70 + (0.5*myHero.ap) + (0.65*myHero.totalDamage)
	elseif QLevel == 5 then
		SpellDamage = 80 + (0.55*myHero.ap) + (0.7*myHero.totalDamage)
	end
	end
	
	if myHero.charName == "Fiora" then
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = 65 + (0.55*myHero.totalDamage)
	elseif QLevel == 2 then
		SpellDamage = 75 + (0.7*myHero.totalDamage)
	elseif QLevel == 3 then
		SpellDamage = 85 + (0.85*myHero.totalDamage)
	elseif QLevel == 4 then
		SpellDamage = 95 + (1*myHero.totalDamage)
	elseif QLevel == 5 then
		SpellDamage = 105 + (1.15*myHero.totalDamage)
	end
	end
	
	if myHero.charName == "Fizz" then
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = 10 + (0.35*myHero.ap) + (myHero.totalDamage)
	elseif QLevel == 2 then
		SpellDamage = 25 + (0.35*myHero.ap) + (myHero.totalDamage)
	elseif QLevel == 3 then
		SpellDamage = 40 + (0.35*myHero.ap) + (myHero.totalDamage)
	elseif QLevel == 4 then
		SpellDamage = 55 + (0.35*myHero.ap) + (myHero.totalDamage)
	elseif QLevel == 5 then
		SpellDamage = 70 + (0.35*myHero.ap) + (myHero.totalDamage)
	end
	end
	
	if myHero.charName == "Gragas" then
		ELevel = myHero:GetSpellData(_E).level
	if ELevel == 1 then
		SpellDamage = 80 + (0.6*myHero.ap)
	elseif ELevel == 2 then
		SpellDamage = 130 + (0.6*myHero.ap)
	elseif ELevel == 3 then
		SpellDamage = 180 + (0.6*myHero.ap)
	elseif ELevel == 4 then
		SpellDamage = 230 + (0.6*myHero.ap)
	elseif ELevel == 5 then
		SpellDamage = 280 + (0.6*myHero.ap)
	end
	end
	
	if myHero.charName == "Hecarim" then
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = 40 + (0.4*myHero.totalDamage)
	elseif QLevel == 2 then
		SpellDamage = 63.3 + (0.4*myHero.totalDamage)
	elseif QLevel == 3 then
		SpellDamage = 86.7 + (0.4*myHero.totalDamage)
	elseif QLevel == 4 then
		SpellDamage = 110 + (0.4*myHero.totalDamage)
	elseif QLevel == 5 then
		SpellDamage = 133.3 + (0.4*myHero.totalDamage)
	end
	end
	
	if myHero.charName == "Nunu" then
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = 400
	elseif QLevel == 2 then
		SpellDamage = 550
	elseif QLevel == 3 then
		SpellDamage = 700
	elseif QLevel == 4 then
		SpellDamage = 850
	elseif QLevel == 5 then
		SpellDamage = 1000
	end
	end

	if myHero.charName == "Illaoi" then
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = (10*myHero.level) + (1.2*myHero.totalDamage)
	elseif QLevel == 2 then
		SpellDamage = (10*myHero.level) + (1.4*myHero.totalDamage)
	elseif QLevel == 3 then
		SpellDamage = (10*myHero.level) + (1.6*myHero.totalDamage)
	elseif QLevel == 4 then
		SpellDamage = (10*myHero.level) + (1.8*myHero.totalDamage)
	elseif QLevel == 5 then
		SpellDamage = (10*myHero.level) + (2*myHero.totalDamage)
	end
	end

	if myHero.charName == "Irelia" then
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = 20 + (1*myHero.totalDamage)
	elseif QLevel == 2 then
		SpellDamage = 50 + (1*myHero.totalDamage)
	elseif QLevel == 3 then
		SpellDamage = 80 + (1*myHero.totalDamage)
	elseif QLevel == 4 then
		SpellDamage = 110 + (1*myHero.totalDamage)
	elseif QLevel == 5 then
		SpellDamage = 140 + (1*myHero.totalDamage)
	end
	end

	if myHero.charName == "JarvanIV" then
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = 70 + (1.2*myHero.totalDamage)
	elseif QLevel == 2 then
		SpellDamage = 115 + (1.2*myHero.totalDamage)
	elseif QLevel == 3 then
		SpellDamage = 160 + (1.2*myHero.totalDamage)
	elseif QLevel == 4 then
		SpellDamage = 205 + (1.2*myHero.totalDamage)
	elseif QLevel == 5 then
		SpellDamage = 250 + (1.2*myHero.totalDamage)
	end
	end

	if myHero.charName == "Jax" then
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = 70 + (1*myHero.totalDamage) + (0.6*myHero.ap)
	elseif QLevel == 2 then
		SpellDamage = 110 + (1*myHero.totalDamage) + (0.6*myHero.ap)
	elseif QLevel == 3 then
		SpellDamage = 150 + (1*myHero.totalDamage) + (0.6*myHero.ap)
	elseif QLevel == 4 then
		SpellDamage = 190 + (1*myHero.totalDamage) + (0.6*myHero.ap)
	elseif QLevel == 5 then
		SpellDamage = 230 + (1*myHero.totalDamage) + (0.6*myHero.ap)
	end
	end

	if myHero.charName == "Karthus" then
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = 40 + (0.3*myHero.ap)
	elseif QLevel == 2 then
		SpellDamage = 60 + (0.3*myHero.ap)
	elseif QLevel == 3 then
		SpellDamage = 80 + (0.3*myHero.ap)
	elseif QLevel == 4 then
		SpellDamage = 100 + (0.3*myHero.ap)
	elseif QLevel == 5 then
		SpellDamage = 120 + (0.3*myHero.ap)
	end
	end

	if myHero.charName == "Kayle" then
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = 60 + (0.6*myHero.ap) + myHero.totalDamage
	elseif QLevel == 2 then
		SpellDamage = 110 + (0.6*myHero.ap) + myHero.totalDamage
	elseif QLevel == 3 then
		SpellDamage = 160 + (0.6*myHero.ap) + myHero.totalDamage
	elseif QLevel == 4 then
		SpellDamage = 210 + (0.6*myHero.ap) + myHero.totalDamage
	elseif QLevel == 5 then
		SpellDamage = 260 + (0.6*myHero.ap) + myHero.totalDamage
	end
	end

	if myHero.charName == "Kindred" then
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = 60 + (0.2*myHero.totalDamage)
	elseif QLevel == 2 then
		SpellDamage = 90 + (0.2*myHero.totalDamage)
	elseif QLevel == 3 then
		SpellDamage = 120 + (0.2*myHero.totalDamage)
	elseif QLevel == 4 then
		SpellDamage = 150 + (0.2*myHero.totalDamage)
	elseif QLevel == 5 then
		SpellDamage = 180 + (0.2*myHero.totalDamage)
	end
	end

	if myHero.charName == "LeeSin" then
		ELevel = myHero:GetSpellData(_E).level
	if ELevel == 1 then
		SpellDamage = 60 + (myHero.totalDamage)
	elseif ELevel == 2 then
		SpellDamage = 95 + (myHero.totalDamage)
	elseif ELevel == 3 then
		SpellDamage = 130 + (myHero.totalDamage)
	elseif ELevel == 4 then
		SpellDamage = 165 + (myHero.totalDamage)
	elseif ELevel == 5 then
		SpellDamage = 200 + (myHero.totalDamage)
	end
	end

	if myHero.charName == "Malphite" then
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = 70 + (0.6*myHero.ap)
	elseif QLevel == 2 then
		SpellDamage = 120 + (0.6*myHero.ap)
	elseif QLevel == 3 then
		SpellDamage = 170 + (0.6*myHero.ap)
	elseif QLevel == 4 then
		SpellDamage = 220 + (0.6*myHero.ap)
	elseif QLevel == 5 then
		SpellDamage = 270 + (0.6*myHero.ap)
	end
	end

	if myHero.charName == "Maokai" then
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = 70 + (0.3*myHero.ap)
	elseif QLevel == 2 then
		SpellDamage = 115 + (0.3*myHero.ap)
	elseif QLevel == 3 then
		SpellDamage = 160 + (0.3*myHero.ap)
	elseif QLevel == 4 then
		SpellDamage = 205 + (0.3*myHero.ap)
	elseif QLevel == 5 then
		SpellDamage = 250 + (0.3*myHero.ap)
	end
	end

	if myHero.charName == "MasterYi" then
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = 100 + (1*myHero.totalDamage)
	elseif QLevel == 2 then
		SpellDamage = 160 + (1*myHero.totalDamage)
	elseif QLevel == 3 then
		SpellDamage = 220 + (1*myHero.totalDamage)
	elseif QLevel == 4 then
		SpellDamage = 280 + (1*myHero.totalDamage)
	elseif QLevel == 5 then
		SpellDamage = 340 + (1*myHero.totalDamage)
	end
	end

	if myHero.charName == "Mordekaiser" then
		ELevel = myHero:GetSpellData(_E).level
	if ELevel == 1 then
		SpellDamage = 35 + (0.6*myHero.totalDamage) + (0.6*myHero.ap)
	elseif ELevel == 2 then
		SpellDamage = 65 + (0.6*myHero.totalDamage) + (0.6*myHero.ap)
	elseif ELevel == 3 then
		SpellDamage = 95 + (0.6*myHero.totalDamage) + (0.6*myHero.ap)
	elseif ELevel == 4 then
		SpellDamage = 125 + (0.6*myHero.totalDamage) + (0.6*myHero.ap)
	elseif ELevel == 5 then
		SpellDamage = 155 + (0.6*myHero.totalDamage) + (0.6*myHero.ap)
	end
	end

	if myHero.charName == "Nautilus" then
		ELevel = myHero:GetSpellData(_E).level
	if ELevel == 1 then
		SpellDamage = 60 + (0.3*myHero.ap)
	elseif ELevel == 2 then
		SpellDamage = 95 + (0.3*myHero.ap)
	elseif ELevel == 3 then
		SpellDamage = 130 + (0.3*myHero.ap)
	elseif ELevel == 4 then
		SpellDamage = 165 + (0.3*myHero.ap)
	elseif ELevel == 5 then
		SpellDamage = 200 + (0.3*myHero.ap)
	end
	end

	if myHero.charName == "Nocturne" then
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = 60 + (0.75*myHero.totalDamage)
	elseif QLevel == 2 then
		SpellDamage = 105 + (0.75*myHero.totalDamage)
	elseif QLevel == 3 then
		SpellDamage = 150 + (0.75*myHero.totalDamage)
	elseif QLevel == 4 then
		SpellDamage = 195 + (0.75*myHero.totalDamage)
	elseif QLevel == 5 then
		SpellDamage = 240 + (0.75*myHero.totalDamage)
	end
	end

	if myHero.charName == "Olaf" then
		ELevel = myHero:GetSpellData(_E).level
	if ELevel == 1 then
		SpellDamage = 70 + (0.4*myHero.totalDamage)
	elseif ELevel == 2 then
		SpellDamage = 115 + (0.4*myHero.totalDamage)
	elseif ELevel == 3 then
		SpellDamage = 160 + (0.4*myHero.totalDamage)
	elseif ELevel == 4 then
		SpellDamage = 205 + (0.4*myHero.totalDamage)
	elseif ELevel == 5 then
		SpellDamage = 250 + (0.4*myHero.totalDamage)
	end
	end

	if myHero.charName == "Pantheon" then
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = 65 + (1.4*myHero.totalDamage)
	elseif QLevel == 2 then
		SpellDamage = 105 + (1.4*myHero.totalDamage)
	elseif QLevel == 3 then
		SpellDamage = 145 + (1.4*myHero.totalDamage)
	elseif QLevel == 4 then
		SpellDamage = 185 + (1.4*myHero.totalDamage)
	elseif QLevel == 5 then
		SpellDamage = 225 + (1.4*myHero.totalDamage)
	end
	end

	if myHero.charName == "Poppy" then
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = 32 + (0.52*myHero.totalDamage)
	elseif QLevel == 2 then
		SpellDamage = 56 + (0.52*myHero.totalDamage)
	elseif QLevel == 3 then
		SpellDamage = 80 + (0.52*myHero.totalDamage)
	elseif QLevel == 4 then
		SpellDamage = 104 + (0.52*myHero.totalDamage)
	elseif QLevel == 5 then
		SpellDamage = 128 + (0.52*myHero.totalDamage)
	end
	end

	if myHero.charName == "Quinn" then
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = 20 + (0.8*myHero.totalDamage)
	elseif QLevel == 2 then
		SpellDamage = 45 + (0.9*myHero.totalDamage)
	elseif QLevel == 3 then
		SpellDamage = 70 + (1*myHero.totalDamage)
	elseif QLevel == 4 then
		SpellDamage = 95 + (1.1*myHero.totalDamage)
	elseif QLevel == 5 then
		SpellDamage = 120 + (1.2*myHero.totalDamage)
	end
	end

	if myHero.charName == "Sejuani" then
		ELevel = myHero:GetSpellData(_E).level
	if ELevel == 1 then
		SpellDamage = 60 + (0.5*myHero.ap)
	elseif ELevel == 2 then
		SpellDamage = 90 + (0.5*myHero.ap)
	elseif ELevel == 3 then
		SpellDamage = 120 + (0.5*myHero.ap)
	elseif ELevel == 4 then
		SpellDamage = 150 + (0.5*myHero.ap)
	elseif ELevel == 5 then
		SpellDamage = 180 + (0.5*myHero.ap)
	end
	end

	if myHero.charName == "Shaco" then
		ELevel = myHero:GetSpellData(_E).level
	if ELevel == 1 then
		SpellDamage = 50 + (1*myHero.ap) + (1*myHero.totalDamage)
	elseif ELevel == 2 then
		SpellDamage = 90 + (1*myHero.ap) + (1*myHero.totalDamage)
	elseif ELevel == 3 then
		SpellDamage = 130 + (1*myHero.ap) + (1*myHero.totalDamage)
	elseif ELevel == 4 then
		SpellDamage = 170 + (1*myHero.ap) + (1*myHero.totalDamage)
	elseif ELevel == 5 then
		SpellDamage = 210 + (1*myHero.ap) + (1*myHero.totalDamage)
	end
	end

	if myHero.charName == "Shyvana" then
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = (1*myHero.totalDamage) + (0.8*myHero.totalDamage)
	elseif QLevel == 2 then
		SpellDamage = (1*myHero.totalDamage) + (0.85*myHero.totalDamage)
	elseif QLevel == 3 then
		SpellDamage = (1*myHero.totalDamage) + (0.9*myHero.totalDamage)
	elseif QLevel == 4 then
		SpellDamage = (1*myHero.totalDamage) + (0.95*myHero.totalDamage)
	elseif QLevel == 5 then
		SpellDamage = (1*myHero.totalDamage) + (1*myHero.totalDamage)
	end
	end

		if myHero.charName == "TahmKench" then
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = 80 + (0.7*myHero.ap)
	elseif QLevel == 2 then
		SpellDamage = 125 + (0.7*myHero.ap)
	elseif QLevel == 3 then
		SpellDamage = 170 + (0.7*myHero.ap)
	elseif QLevel == 4 then
		SpellDamage = 215 + (0.7*myHero.ap)
	elseif QLevel == 5 then
		SpellDamage = 260 + (0.7*myHero.ap)
	end
	end

	if myHero.charName == "Trundle" then
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = (myHero.totalDamage) + 20
	elseif QLevel == 2 then
		SpellDamage = (myHero.totalDamage) + 40 + (0.05*myHero.totalDamage)
	elseif QLevel == 3 then
		SpellDamage = (myHero.totalDamage) + 60 + (0.1*myHero.totalDamage)
	elseif QLevel == 4 then
		SpellDamage = (myHero.totalDamage) + 80 + (0.15*myHero.totalDamage)
	elseif QLevel == 5 then
		SpellDamage = (myHero.totalDamage) + 100 + (0.2*myHero.totalDamage)
	end
	end

	if myHero.charName == "Vi" then
		ELevel = myHero:GetSpellData(_E).level
	if ELevel == 1 then
		SpellDamage = (myHero.totalDamage) + 5 + (0.7*myHero.ap) + (1.15*myHero.totalDamage)
	elseif ELevel == 2 then
		SpellDamage = (myHero.totalDamage) + 20 + (0.7*myHero.ap) + (1.15*myHero.totalDamage)
	elseif ELevel == 3 then
		SpellDamage = (myHero.totalDamage) + 35 + (0.7*myHero.ap) + (1.15*myHero.totalDamage)
	elseif ELevel == 4 then
		SpellDamage = (myHero.totalDamage) + 50 + (0.7*myHero.ap) + (1.15*myHero.totalDamage)
	elseif ELevel == 5 then
		SpellDamage = (myHero.totalDamage) + 65 + (0.7*myHero.ap) + (1.15*myHero.totalDamage)
	end
	end

	if myHero.charName == "Volibear" then
		WLevel = myHero:GetSpellData(_W).level
	if WLevel == 1 then
		SpellDamage = 80 * (1*(minion.maxhealh - minion.health))
	elseif WLevel == 2 then
		SpellDamage = 125 * (1*(minion.maxhealh - minion.health))
	elseif WLevel == 3 then
		SpellDamage = 170 * (1*(minion.maxhealh - minion.health))
	elseif WLevel == 4 then
		SpellDamage = 215 * (1*(minion.maxhealh - minion.health))
	elseif WLevel == 5 then
		SpellDamage = 260 * (1*(minion.maxhealh - minion.health))
	end
	end

	if myHero.charName == "Warwick" then
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = 75 + (1*myHero.ap)
	elseif QLevel == 2 then
		SpellDamage = 125 + (1*myHero.ap)
	elseif QLevel == 3 then
		SpellDamage = 175 + (1*myHero.ap)
	elseif QLevel == 4 then
		SpellDamage = 225 + (1*myHero.ap)
	elseif QLevel == 5 then
		SpellDamage = 275 + (1*myHero.ap)
	end
	end

	if myHero.charName == "MonkeyKing" then
		ELevel = myHero:GetSpellData(_E).level
	if ELevel == 1 then
		SpellDamage = 60 + (0.8*myHero.totalDamage)
	elseif ELevel == 2 then
		SpellDamage = 105 + (0.8*myHero.totalDamage)
	elseif ELevel == 3 then
		SpellDamage = 150 + (0.8*myHero.totalDamage)
	elseif ELevel == 4 then
		SpellDamage = 195 + (0.8*myHero.totalDamage)
	elseif ELevel == 5 then
		SpellDamage = 240 + (0.8*myHero.totalDamage)
	end
	end

	if myHero.charName == "XinZhao" then
		ELevel = myHero:GetSpellData(_E).level
	if ELevel == 1 then
		SpellDamage = 70 + (0.6*myHero.ap)
	elseif ELevel == 2 then
		SpellDamage = 110 + (0.6*myHero.ap)
	elseif ELevel == 3 then
		SpellDamage = 150 + (0.6*myHero.ap)
	elseif ELevel == 4 then
		SpellDamage = 190 + (0.6*myHero.ap)
	elseif ELevel == 5 then
		SpellDamage = 230 + (0.6*myHero.ap)
	end
	end

	if myHero.charName == "Zac" then
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		SpellDamage = 70 + (0.5*myHero.ap)
	elseif QLevel == 2 then
		SpellDamage = 110 + (0.5*myHero.ap)
	elseif QLevel == 3 then
		SpellDamage = 150 + (0.5*myHero.ap)
	elseif QLevel == 4 then
		SpellDamage = 190 + (0.5*myHero.ap)
	elseif QLevel == 5 then
		SpellDamage = 230 + (0.5*myHero.ap)
	end
	end

	return SpellDamage
end

function Spell()
	local Spell
	if myHero.charName == "Aatrox" then Spell = _E end
	if myHero.charName == "Akali" then Spell = _E end
	if myHero.charName == "Amumu" then Spell = _E end
	if myHero.charName == "Chogath" then Spell = _R end
	if myHero.charName == "Diana" then Spell = _R end
	if myHero.charName == "Evlynn" then Spell = _E end
	if myHero.charName == "Fiora" then Spell = _Q end
	if myHero.charName == "Fizz" then Spell = _Q end
	if myHero.charName == "Gragas" then Spell = _E end
	if myHero.charName == "Hecarim" then Spell = _Q end
	if myHero.charName == "Nunu" then Spell = _Q end
	if myHero.charName == "Illaoi" then Spell = _Q end
	if myHero.charName == "Irelia" then Spell = _Q end
	if myHero.charName == "JarvanIV" then Spell = _Q end
	if myHero.charName == "Jax" then Spell = _Q end
	if myHero.charName == "Karthus" then Spell = _Q end
	if myHero.charName == "Kayle" then Spell = _Q end
	if myHero.charName == "Kindred" then Spell = _Q end
	if myHero.charName == "LeeSin" then Spell = _E end
	if myHero.charName == "Malphite" then Spell = _Q end
	if myHero.charName == "Maokai" then Spell = _Q end
	if myHero.charName == "MasterYi" then Spell = _Q end
	if myHero.charName == "Mordekaiser" then Spell = _E end
	if myHero.charName == "Nautilus" then Spell = _E end
	if myHero.charName == "Nocturne" then Spell = _Q end
	if myHero.charName == "Olaf" then Spell = _E end
	if myHero.charName == "Pantheon" then Spell = _Q end
	if myHero.charName == "Poppy" then Spell = _Q end
	if myHero.charName == "Quinn" then Spell = _Q end
	if myHero.charName == "Sejuani" then Spell = _E end
	if myHero.charName == "Shaco" then Spell = _E end
	if myHero.charName == "Shyvana" then Spell = _Q end
	if myHero.charName == "TahmKench" then Spell = _Q end
	if myHero.charName == "Trundle" then Spell = _Q end
	if myHero.charName == "Vi" then Spell = _E end
	if myHero.charName == "Volibear" then Spell = _W end
	if myHero.charName == "Warwick" then Spell = _Q end
	if myHero.charName == "MonkeyKing" then Spell = _E end
	if myHero.charName == "XinZhao" then Spell = _E end
	if myHero.charName == "Zac" then Spell = _Q end
	return Spell
end

function OnTick()
	if myHero.dead then return end
	jungleMinions:update()
	CheckJungle()
	GetSmiteSlot()
	KillStealSmite()
	AutoSmite()
end

function OnDraw()
	if myHero.dead then return end
	if SpellReady(SMITESLOT) then 
	    if Menu.Draw.drawSmite then
	      	DrawCircle(myHero.x, myHero.y, myHero.z, 560, ARGB(255, 100, 100, 80))
	    end
	    if Menu.Draw.drawSmitetext then
	        DrawSmiteable()
	    end
	end
end

function AutoSmite()
   	local SmiteDmg = GetSmiteDamage()
   	for _, jminions in pairs(minionManager(MINION_JUNGLE, 1000, myHero, MINION_SORT_HEALTH_ASC).objects) do
   		if not jminions.dead and jminions.visible and ValidTarget(jminions, 560) then
      		local name = jminions.charName
      		name = name:sub(name:find("_")+1, name:len())
      		name = name:sub(1, (name:find("_") or name:len()+1)-1)
      		if Menu.smite[name] then
        		if SpellReady(SMITESLOT) and GetDlinaForSmiteDraw(myHero, jminions) <= 560 and SmiteDmg >= jminions.health then
          			CastSpell(SMITESLOT, jminions)
        		end
      		end
     	end
   	end
end

function DrawSmiteable()
	local SmiteDmg = GetSmiteDamage()
	for _, jminion in pairs(minionManager(MINION_JUNGLE, 1000, myHero, MINION_SORT_HEALTH_ASC).objects) do
    	if not jminion.dead and jminion.visible and ValidTarget(jminion, 560) then
      		local name = jminion.charName
      		name = name:sub(name:find("_")+1, name:len())
      		name = name:sub(1, (name:find("_") or name:len()+1)-1)
      		if Menu.smite[name] then
       			local posMinion = WorldToScreen(D3DXVECTOR3(jminion.x, jminion.y, jminion.z))
       			local SmiteProcess = math.round(100-100*(jminion.health-SmiteDmg)/jminion.maxHealth)
       			if SpellReady(SMITESLOT) and GetDlinaForSmiteDraw(myHero, jminion) <= 560 then
        			DrawText("Smite Process - "..SmiteProcess.."%", 20, posMinion.x - GetTextArea("Smite Process - "..SmiteProcess.."%", 20).x/2, posMinion.y, ARGB(255,255,0,0))
        			DrawCircle(jminion.x, jminion.y, jminion.z, 1.5*SmiteProcess, ARGB(255, 255*(1-SmiteProcess/100), 255*SmiteProcess/100, 255*(1-SmiteProcess/100)))
        			DrawCircle(jminion.x, jminion.y, jminion.z, 150, ARGB(55, 55, 155, 55))
        			DrawCircle(jminion.x, jminion.y, jminion.z, 75, ARGB(255, 128, 128, 128))
       			end
     		end
   		end
 	end
end

function GetDlinaForSmiteDraw(a, b)
  	local dx, dz = a.x - b.x, (a.z or a.y) - (b.z or b.y)
  	return math.sqrt(dx*dx + dz*dz)
end

function CheckJungle()
	if Menu.SmiteActive then
		for i, jungle in pairs(jungleMinions.objects) do
			if jungle ~= nil then
				if Menu.smite[jungle.charName:gsub("_", "")] then
					if myHero.charName == "Aatrox" or myHero.charName == "Akali" or myHero.charName == "Amumu" or myHero.charName == "Chogath" or myHero.charName == "Diana" or myHero.charName == "Evlynn" or myHero.charName == "Fiora" or myHero.charName == "Fizz" or myHero.charName == "Gragas" or myHero.charName == "Hecarim" or myHero.charName == "Nunu" or myHero.charName == "Illaoi" or myHero.charName == "Irelia" or myHero.charName == "JarvanIV" or myHero.charName == "Jax" or myHero.charName == "Karthus" or myHero.charName == "Kayle" or myHero.charName == "Kindred" or myHero.charName == "LeeSin" or myHero.charName == "Malphite" or myHero.charName == "Maokai" or myHero.charName == "MasterYi" or myHero.charName == "Mordekaiser" or myHero.charName == "Nautilus" or myHero.charName == "Nocturne" or myHero.charName == "Olaf" or myHero.charName == "Pantheon" or myHero.charName == "Poppy" or myHero.charName == "Quinn" or myHero.charName == "Sejuani" or myHero.charName == "Shaco" or myHero.charName == "Shyvana" or myHero.charName == "TahmKench" or myHero.charName == "Trundle" or myHero.charName == "Vi" or myHero.charName == "Volibear" or myHero.charName == "Warwick" or myHero.charName == "MonkeyKing" or myHero.charName == "XinZhao" or myHero.charName == "Zac" and Menu.UseSpells then
						SpellMonster(jungle)
					end
				end
			end
		end
	end
end

function SpellMonster(obj)
    local DistanceMonster = GetDistance(obj)
    	if myHero:CanUseSpell(Smite) == READY and myHero:CanUseSpell(Spell()) == READY then
    		if DistanceMonster <= RangeSmite and obj.health <= GetSmiteDamage() + GetDamageSpell() then
				CastSpell(Spell(), obj)
			end
	return
	end

	if myHero:CanUseSpell(Smite) == READY then
		if DistanceMonster <= RangeSmite and obj.health <= GetSmiteDamage() then
			CastSpell(Smite, obj)
   		end

	elseif myHero:CanUseSpell(Spell()) == READY then
		if DistanceMonster <= RangeSmite and obj.health <= GetDamageSpell() then
			CastSpell(Spell(), obj)
		end
	end
end

function GetDlina(a, b)
  	local Dlina = math.sqrt((b.x-a.x)*(b.x-a.x) + (b.z-a.z)*(b.z-a.z))
  	return Dlina
end

function SpellReady(spell)
  	return myHero:CanUseSpell(spell) == READY
end

function FindSlotByName(name)
  if name ~= nil then
    for i=0, 12 do
      if string.lower(myHero:GetSpellData(i).name) == string.lower(name) then
        return i
      end
    end
  end  
  return nil
end

function GetItem(name)
  local slot = FindSlotByName(name)
  return slot 
end

function GetSmiteSlot()
  for i=1, 3 do
    if FindSlotByName(SMITELIST[i]) ~= nil then
      SMITESLOT = FindSlotByName(SMITELIST[i])
      SMITE = true
      if i == 2 then
        ATTACKSMITE = true
      else
        ATTACKSMITE = false
      end
    end
  end
end

function GetAttackSmiteDamage(unit)
  if SMITE and ATTACKSMITE then
    SmiteDmg = 20 + 8*myHero.level
    return SmiteDmg
  end
end

function CastSmite(target)
  if SpellReady(SMITESLOT) then
    CastSpell(SMITESLOT, target)
  end
end

function KillStealSmite()
	for i,enemy in pairs(GetEnemyHeroes()) do
    	if not enemy.dead and enemy.visible then
      		if ValidTarget(enemy, 1000) then
				if GetDlina(myHero, enemy) <= 560 then
      				if SMITE and ATTACKSMITE and Menu.StealSmite then
        				local SmiteDmg = GetAttackSmiteDamage()
        				if SmiteDmg >= enemy.health and SpellReady(SMITESLOT) and not enemy.dead then
          					CastSmite(enemy)
        				end
      				end
    			end
			end
		end
	end
end

--Credits SxTeam
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
    AddDrawCallback(function() self:OnDraw() end)
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
