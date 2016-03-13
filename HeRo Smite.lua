---Auto Smite Developed by HeRoBaNd---
--[[
 _   _     ______        _____           _ _       
| | | |    | ___ \      /  ___|         (_) |      
| |_| | ___| |_/ /___   \ `--. _ __ ___  _| |_ ___ 
|  _  |/ _ \    // _ \   `--. \ '_ ` _ \| | __/ _ \
| | | |  __/ |\ \ (_) | /\__/ / | | | | | | ||  __/
\_| |_/\___\_| \_\___/  \____/|_| |_| |_|_|\__\___|
]]--
---Changelog---
---1.0 - Reliased For Bol---
---1.1 - Added AutoUpdater (Credit - Simple & HiranN & BF Team)---
---1.2 - 6.1 Updated---
---1.3 - Added SpellUsage for more Champions and 3x3 map support---
---1.4 - Fixed some colorbug---
---1.5 - Added KillSteal---
---1.6 - Fixed KillSteal error---
---1.7 - Fixed KillSteal Error---
---1.8 - Delete KillStealSmite(soon)---
---1.9 - Fixed KillSteal---
---2.0 - Reliased KillSteal---

local RangeSmite = 560
local KillSmiteDmg = function() return myHero.level * 8 + 20 end
local serveradress = "raw.githubusercontent.com"
local scriptadress = "/HeRoBaNd/Scripts/master"
local LocalVersion = "2.00003"
local autoupdate = true

if myHero:GetSpellData(SUMMONER_1).name:find("SummonerSmite") then Smite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("SummonerSmite") then Smite = SUMMONER_2 end

if Smite ~= nil then 
	DelayAction(function() PrintChat("<font color='#FF0000'><b>[HeRo Smite 2.0] </b></font>".."<font color='#00BFFF'><b>Smite found.</b></font>") end, 4.0) 
	DelayAction(function() PrintChat("<font color='#FF0000'><b>[HeRo Smite 2.0] </b></font>".."<font color='#00BFFF'><b>Loaded.</b></font>")  end, 4.0)
else
	DelayAction(function() PrintChat("<font color='#FF0000'><b>[HeRo Smite 2.0] </b></font>".."<font color='#00BFFF'><b>Smite not found.</b></font>")  end, 4.0) 
	return 
end

function OnLoad()
	FindUpdates()
	jungleMinions = minionManager(MINION_JUNGLE, RangeSmite, myHero, MINION_SORT_MAXHEALTH_DEC)
	HSMenuInit()
end

function HSMenuInit()
	HSMenu = scriptConfig("HeRo Smite", "HSSmite")
	
	HSMenu:addParam('Info', '-----------------------------------------------------', SCRIPT_PARAM_INFO, "-------------")
	
	HSMenu:addParam("SmiteActive", "Smite Active", SCRIPT_PARAM_ONKEYTOGGLE, true, string.byte("H"))
	HSMenu:addParam("UseSpells", "Use Spells", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("N"))
	

    HSMenu:addSubMenu("Draw", "Draw")
		HSMenu.Draw:addParam("drawSmite", "Draw Smite Range " , SCRIPT_PARAM_ONOFF, true)
		
	HSMenu:addSubMenu("Smite Monsters:", "smite")
		if GetGame().map.shortName == "twistedTreeline" then
			HSMenu.smite:addParam("TTNWraith", "Use Smite on: Wraith", SCRIPT_PARAM_ONOFF, true)
			HSMenu.smite:addParam("TTNGolem", "Use Smite on: Golem", SCRIPT_PARAM_ONOFF, true)
			HSMenu.smite:addParam("TTNWolf", "Use Smite on: Wolf", SCRIPT_PARAM_ONOFF, true)
			HSMenu.smite:addParam("TTSpiderboss", "Use Smite on: SpiderBoss", SCRIPT_PARAM_ONOFF, true)
		else
			HSMenu.smite:addParam("SRUDragon", "Use Smite on: Dragon", SCRIPT_PARAM_ONOFF, true)
			HSMenu.smite:addParam("SRUBaron", "Use Smite on: Baron", SCRIPT_PARAM_ONOFF, true)
			HSMenu.smite:addParam("SRURazorbeak", "Use Smite on: Wraith", SCRIPT_PARAM_ONOFF, false)
			HSMenu.smite:addParam("SRUMurkwolf", "Use Smite on: Wolf", SCRIPT_PARAM_ONOFF, false)
			HSMenu.smite:addParam("SRUKrug", "Use Smite on: Krug", SCRIPT_PARAM_ONOFF, false)
			HSMenu.smite:addParam("SRUGromp", "Use Smite on: Gromp", SCRIPT_PARAM_ONOFF, false)
			HSMenu.smite:addParam("SRURed", "Use Smite on: Red Buff", SCRIPT_PARAM_ONOFF, true)
			HSMenu.smite:addParam("SRUBlue", "Use Smite on: Blue Buff", SCRIPT_PARAM_ONOFF, true)
		end

	--[[HSMenu:addSubMenu("KillSteal", "Smite KillSteal")
		for i, enemy in pairs(GetEnemyHeroes()) do
			HSMenu.KillSteal:addParam("enemy.charName", ">SOON< Use KillSteal Smite on: "..enemy.charName, SCRIPT_PARAM_ONOFF, true)
		end]]--
		
	IDPerma = HSMenu:permaShow("SmiteActive")
	HSMenu.permaShowEdit(IDPerma, "lText", "[HeRo Smite Active]")
	HSMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)
	IDPerma = HSMenu:permaShow("UseSpells")
	HSMenu.permaShowEdit(IDPerma, "lText", "[HeRo Smite - Use Spells]")
	HSMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)
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

function GetKillStealSmiteDmg()
	local KillStealDmg
	KillStealDmg = myHero.level * 8 + 20
	return KillStealDmg
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

	---if HSMenu.KillSteal then
		---KillStealSmite()
	---end
end

function KillStealSmite()
	if myHero:GetSpellData(Smite).name:find("ganker") then
			for i = 1, heroManager.iCount do
				local enemy = heroManager:GetHero(i)
				if ValidTarget(enemy, 560) and enemy.health <= GetKillStealSmiteDmg() and HSMenu.KillSteal[enemy.charName] then
					CastSpell(Smite, enemy)
				end
			end
		end
	end

function CheckJungle()
	if HSMenu.SmiteActive then
	for i, jungle in pairs(jungleMinions.objects) do
	if jungle ~= nil then
		if HSMenu.smite[jungle.charName:gsub("_", "")] then
			if myHero.charName == "Aatrox" or myHero.charName == "Akali" or myHero.charName == "Amumu" or myHero.charName == "Chogath" or myHero.charName == "Diana" or myHero.charName == "Evlynn" or myHero.charName == "Fiora" or myHero.charName == "Fizz" or myHero.charName == "Gragas" or myHero.charName == "Hecarim" or myHero.charName == "Nunu" or myHero.charName == "Illaoi" or myHero.charName == "Irelia" or myHero.charName == "JarvanIV" or myHero.charName == "Jax" or myHero.charName == "Karthus" or myHero.charName == "Kayle" or myHero.charName == "Kindred" or myHero.charName == "LeeSin" or myHero.charName == "Malphite" or myHero.charName == "Maokai" or myHero.charName == "MasterYi" or myHero.charName == "Mordekaiser" or myHero.charName == "Nautilus" or myHero.charName == "Nocturne" or myHero.charName == "Olaf" or myHero.charName == "Pantheon" or myHero.charName == "Poppy" or myHero.charName == "Quinn" or myHero.charName == "Sejuani" or myHero.charName == "Shaco" or myHero.charName == "Shyvana" or myHero.charName == "TahmKench" or myHero.charName == "Trundle" or myHero.charName == "Vi" or myHero.charName == "Volibear" or myHero.charName == "Warwick" or myHero.charName == "MonkeyKing" or myHero.charName == "XinZhao" or myHero.charName == "Zac" and HSMenu.UseSpells then
				SpellMonster(jungle)
			else
				SmiteMonster(jungle)
					end
				end
			end
		end
	end
end

function SmiteMonster(obj)
    local DistanceMonster = GetDistance(obj)
    if myHero:CanUseSpell(Smite) == READY and DistanceMonster <= RangeSmite and obj.health <= GetSmiteDamage() then
    	CastSpell(Smite, obj)
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

function OnDraw()
	if myHero.dead then return end

	if HSMenu.Draw.drawSmite and myHero:CanUseSpell(Smite) == READY and HSMenu.SmiteActive then
		DrawCircle(myHero.x, myHero.y, myHero.z, 550, RGB(100, 44, 255))
	end
end

function FindUpdates()
	if not autoupdate then return end
		local ServerVersionDATA = GetWebResult(serveradress , scriptadress.."/HeRo Smite.version")
			if ServerVersionDATA then
				local ServerVersion = tonumber(ServerVersionDATA)
					if ServerVersion then
						if ServerVersion > tonumber(LocalVersion) then
							PrintChat("<font color='#FF0000'><b>[HeRo Smite] </b></font>".."<font color='#00BFFF'><b>Updating, don't press F9.</b></font>")
								Update()
									else
								PrintChat("<font color='#FF0000'><b>[HeRo Smite] </b></font>".."<font color='#00BFFF'><b>You have the latest version.</b></font>")
							end
						else
					PrintChat("<font color='#FF0000'><b>[HeRo Smite] </b></font>".."<font color='#00BFFF'><b>An error occured, while updating, please reload.</b></font>")
				end
			else
		PrintChat("<font color='#FF0000'><b>[HR Smite] </b></font>".."<font color='#00BFFF'><b>Could not connect to update Server.</b></font>")
	end
end

function Update()
	DownloadFile("http://"..serveradress..scriptadress.."/HeRo Smite.lua",SCRIPT_PATH.."HeRo Smite.lua", function ()
	PrintChat("<font color='#FF0000'><b>[HeRo Smite] </b></font>".."<font color='#00BFFF'><b>Updated, press 2xF9.</b></font>")
	end)
end
