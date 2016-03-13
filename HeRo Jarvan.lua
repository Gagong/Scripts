 --[[
 ---HeRo Jarvan Developed by HeRoBaNd---
    __  __     ____               __                           
   / / / /__  / __ \____         / /___ _______   ______ _____ 
  / /_/ / _ \/ /_/ / __ \   __  / / __ `/ ___/ | / / __ `/ __ \
 / __  /  __/ _, _/ /_/ /  / /_/ / /_/ / /   | |/ / /_/ / / / /
/_/ /_/\___/_/ |_|\____/   \____/\__,_/_/    |___/\__,_/_/ /_/ 
                                                               
---Changelog---
---1.0 - Closed Beta---
---1.1 - Open Beta---
]]--

if myHero.charName ~= "JarvanIV" then return end
local version = "1.3"
local SCRIPT_NAME = "HeRo Jarvan"
local SCRIPT_AUTHOR = "HeRoBaNd"
local FONTAN = false
local lowBase = {["x"] = 406, ["z"] = 424}
local upBase = {["x"] = 14322, ["z"] = 14394}
local VP, DP, KP = nil
local ts
local Menu
local Qready, Wready, Eready, Rready = false, false, false, false
local REGENTIME = false
local SMITE, ATTACKSMITE = false
local SMITELIST = {"summonersmite", "s5_summonersmiteplayerganker", "s5_summonersmiteduel"}
local POT = {"ItemCrystalFlask", "REGENTIMEerationPotion", "ItemMiniREGENTIMEPotion", "ItemCrystalFlaskJungle", "ItemDarkCrystalFlask"}
local ATTACKITEMS = {"ItemTiamatCleave", "ItemTitanicHydraCleave", "BilgewaterCutlass", "YoumusBlade", "HextechGunblade", "ItemSwordOfFeastAndFamine"}
local ANTICCITEMS = {"QuicksilverSash", "ItemDervishBlade"}
local TIAMAT, TITANIC, CUTLASS, YOUMU, GUNBLADE, BOTRK, QSS, DERVISH = false
local TIAMATSLOT, TITANICSLOT, CUTLASSSLOT, YOUMUSLOT, GUNBLADESLOT, BOTRKSLOT, QSSSLOT, DERVISHSLOT, SMITESLOT
local UNDERCC = false
local DANGERSPELL = {"MordekaiserChildrenOfTheGrave", "SkarnerImpale", "LuxLightBindingMis", "Wither", "SonaCrescendo", "DarkBindingMissile", "CurseoftheSadMummy",
"EnchantedCrystalArrow", "BlindingDart", "LuluWTwo", "AhriSeduce", "CassiopeiaPetrifyingGaze", "Terrify", "HowlingGale", "JaxCounterStrike", "KennenShurikenStorm",
"LeblancSoulShackle", "LeonaSolarFlare", "LissandraR", "AlZaharNetherGrasp", "MonkeyKingDecoy", "NamiQ", "OrianaDetonateCommand", "Pantheon_LeapBash", "PuncturingTaunt",
"SejuaniGlacialPrisonStart", "SwainShadowGrasp", "Imbue", "ThreshQ", "UrgotSwap2", "VarusR", "VeigarEventHorizon", "ViR", "InfiniteDuress", "ZyraGraspingRoots",
"paranoiamisschance", "puncturingtauntarmordebuff", "surpression", "zedulttargetmark", "enchantedcrystalarrow", "nasusw"}
local VARS = {
  AA = {RANGE = 250},
  Q = {RANGE = 700, WIDTH = 70, DELAY = 0.1, SPEED = math.huge},
  W = {RANGE = 525, WIDTH = 525, DELAY = 0.1, SPEED = nil},
  E = {RANGE = 830, WIDTH = 75, DELAY = 0.1, SPEED = math.huge},
  R = {RANGE = 650, WIDTH = 325, DELAY = 0.1, SPEED = nil}
}
local ultActive = false

JQ = {range = VARS.Q.RANGE, speed = VARS.Q.SPEED, delay = VARS.Q.DELAY, radius = VARS.Q.WIDTH, type = "DelayLine", width = VARS.Q.WIDTH}
JW = {range = VARS.W.RANGE, speed = VARS.W.SPEED, delay = VARS.W.DELAY, radius = VARS.W.WIDTH, type = "DelayCircle", width = VARS.W.WIDTH}
JE = {range = VARS.E.RANGE, speed = VARS.E.SPEED, delay = VARS.E.DELAY, radius = VARS.E.WIDTH, type = "PromptCircle", width = VARS.E.WIDTH}
JR = {range = VARS.R.RANGE, speed = VARS.R.SPEED, delay = VARS.R.DELAY, radius = VARS.R.WIDTH, type = "DelayCircle2", width = VARS.W.WIDTH}


--[[OnLoad]]--

function OnLoad()
--Credits SxTeam
 local ToUpdate = {}
    ToUpdate.Version = 1.3
    ToUpdate.UseHttps = true
    ToUpdate.Host = "raw.githubusercontent.com"
    ToUpdate.VersionPath = "/HeRoBaNd/Scripts/master/HeRo%20Jarvan.version"
    ToUpdate.ScriptPath =  "/HeRoBaNd/Scripts/master/HeRo%20Jarvan.lua"
    ToUpdate.SavePath = LIB_PATH.."/HeRo Jarvan_Test.lua"
    ToUpdate.CallbackUpdate = function(NewVersion,OldVersion) print("<font color='#FF0000'><b>[HeRo Jarvan]: </b> </font><font color='#00BFFF'><b>Updated to "..NewVersion..". </b></font>") end
    ToUpdate.CallbackNoUpdate = function(OldVersion) print("<font color='#FF0000'><b>[HeRo Jarvan]: </b></font> <font color='#00BFFF'><b>No Updates Found</b></font>") end
    ToUpdate.CallbackNewVersion = function(NewVersion) print("<font color='#FF0000'><b>[HeRo Jarvan]: </b></font> <font color='#00BFFF'><b>New Version found ("..NewVersion.."). Please wait until its downloaded</b></font>") end
    ToUpdate.CallbackError = function(NewVersion) print("<font color='#FF0000'><b>[HeRo Jarvan]: </b></font> <font color='#00BFFF'><b>Error while Downloading. Please try again.</b></font>") end
    ScriptUpdate(ToUpdate.Version,ToUpdate.UseHttps, ToUpdate.Host, ToUpdate.VersionPath, ToUpdate.ScriptPath, ToUpdate.SavePath, ToUpdate.CallbackUpdate,ToUpdate.CallbackNoUpdate, ToUpdate.CallbackNewVersion,ToUpdate.CallbackError)
--Credits SxTeam	
	ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 900, DAMAGE_PHYSICAL)
	DelayAction(function() PrintChat("<font color='#FF0000'><b>[HeRo Jarvan] </b></font><font color='#00BFFF'><b>Loaded.</b></font>") end, 4.0)
	ultActive = false
	AddApplyBuffCallback(Buff_Add)
  AddRemoveBuffCallback(Buff_Rem)

--[[Menu]]--

	Menu = scriptConfig("Hero Jarvan", "Hero Jarvan")
	
--[[Target Selector]]--
	
	Menu:addSubMenu("[HeRo Jarvan - Target Selector]", "targetSelector")
		Menu.targetSelector:addTS(ts)
		ts.name = "Focus"
	
--[[Combo]]--
	
	Menu:addSubMenu("[HeRo Jarvan - Combo]", "Combo")
		Menu.Combo:addParam("ComboMode", "Combo mode", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Menu.Combo:addParam("Burst", "All In/Burst Combo (Toggle)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("S"))
		Menu.Combo:addParam("ComboEQ", "Use Q+E in Combo", SCRIPT_PARAM_ONOFF, true)
		Menu.Combo:addParam("ComboSaveEQ", "Always save E+Q for Combo mode", SCRIPT_PARAM_ONOFF, false)
		Menu.Combo:addParam("ComboQ", "Use Q in Combo(WithOut KnockUp)", SCRIPT_PARAM_ONOFF, false)
		Menu.Combo:addParam("ComboW", "Use W in Combo", SCRIPT_PARAM_ONOFF, true)
		Menu.Combo:addParam("ComboE", "Use E in Combo(WithOut KnockUp)", SCRIPT_PARAM_ONOFF, false)
		Menu.Combo:addParam("ComboR", "Use R in Combo", SCRIPT_PARAM_ONOFF, true)
	
--[[Harass]]--
	
	Menu:addSubMenu("[HeRo Jarvan - Harass]", "Harass")
		Menu.Harass:addParam("HS", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
		Menu.Harass:addParam("HarassEQ", "Use E+Q Combo in Harass", SCRIPT_PARAM_ONOFF, true)
		Menu.Harass:addParam("HarassQ", "Use Q in Harass", SCRIPT_PARAM_ONOFF, true)
		Menu.Harass:addParam("HarassE", "Use E in Harass", SCRIPT_PARAM_ONOFF, true)
		Menu.Harass:addParam("HarassMana", "% Mana for Harass", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)

--[[KillSteal]]--
	igniteslot = FindSlotByName("SummonerDot")
	Menu:addSubMenu("[HeRo Jarvan - KillSteal]", "KillSteal")
		Menu.KillSteal:addParam("Steal", "Endble or Disable KillSteal", SCRIPT_PARAM_ONOFF, true)
		Menu.KillSteal:addParam("QSteal", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Menu.KillSteal:addParam("ESteal", "Use E", SCRIPT_PARAM_ONOFF, true)
		Menu.KillSteal:addParam("RSteal", "Use R", SCRIPT_PARAM_ONOFF, false)
		if igniteslot ~= nil then
			Menu.KillSteal:addParam("UseIgnite", "Use Ignite", SCRIPT_PARAM_ONOFF, true)
		end
	
--[[LaneClear]]--
	
	Menu:addSubMenu("[HeRo Jarvan - LaneClear]", "Clear")
		Menu.Clear:addParam("LaneClear", "LaneClear with spells", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
		Menu.Clear:addParam("LaneClearQ", "Use Q in LaneClear", SCRIPT_PARAM_ONOFF, true)
		Menu.Clear:addParam("LaneClearE", "Use E in LaneClear", SCRIPT_PARAM_ONOFF, true)
		Menu.Clear:addParam("LaneClearW", "Use W in LaneClear", SCRIPT_PARAM_ONOFF, true)
		Menu.Clear:addParam("ClearMana", "% Mana for LaneClear", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
	
--[[JungleClear]]--
	
	Menu:addSubMenu("[HeRo Jarvan - JungleClear]", "JClear")
		Menu.JClear:addParam("JungleClear", "Jungleclear with spells", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
		Menu.JClear:addParam("JungleClearQ", "Use Q in JungleClear", SCRIPT_PARAM_ONOFF, true)
		Menu.JClear:addParam("JungleClearE", "Use E in JungleClear", SCRIPT_PARAM_ONOFF, true)
		Menu.JClear:addParam("JungleClearW", "Use W in JungleClear", SCRIPT_PARAM_ONOFF, true)
		Menu.JClear:addParam("JClearMana", "% Mana for JungleClear", SCRIPT_PARAM_SLICE, 75, 0, 100, 0)
		
--[[Escape]]--
	
	Menu:addSubMenu("[HeRo Jarvan - Escape]", "Escape")
		Menu.Escape:addParam("EnableEscape", "Escape", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("S"))
		Menu.Escape:addParam("WEscape", "Use W for slow Enemy", SCRIPT_PARAM_ONOFF, true)
	
--[[Blacklist]]--
	
	Menu:addSubMenu("[HeRo Jarvan - Ult Blacklist]", "ultb")
		for i, enemy in pairs(GetEnemyHeroes()) do
			Menu.ultb:addParam(enemy.charName, "Use ult on: "..enemy.charName, SCRIPT_PARAM_ONOFF, true)
		end

--[[ItemUsage]]--

	Menu:addSubMenu("[HeRo Jarvan - Item Usage]", "Item")
		Menu.Item:addParam("UseItem", "Enable Item Usage", SCRIPT_PARAM_ONOFF, true)
		Menu.Item:addSubMenu("[Offensive Items]", "AttackItem")
		Menu.Item.AttackItem:addParam("UseTiamat", "Use Tiamat/Hydra", SCRIPT_PARAM_ONOFF, true)
		Menu.Item.AttackItem:addParam("UseTitanic", "Use Titanic Hydra", SCRIPT_PARAM_ONOFF, true)
		Menu.Item.AttackItem:addParam("UseCutlass", "Use Bilgewater Cutlass", SCRIPT_PARAM_ONOFF, true)
		Menu.Item.AttackItem:addParam("UseBOTRK", "Use BOTRK", SCRIPT_PARAM_ONOFF, true)
		Menu.Item.AttackItem:addParam("UseYoumu", "Use Youmus Blade", SCRIPT_PARAM_ONOFF, true)
		Menu.Item.AttackItem:addParam("UseGunblade", "Use Hextech Gunblade", SCRIPT_PARAM_ONOFF, true)

--[[Anti CC]]--

	Menu.Item:addSubMenu("[HeRo Jarvan - Anti CC]", "DefItem")
		Menu.Item.DefItem:addParam("EnableACC", "Enable AntiCC", SCRIPT_PARAM_ONOFF, true)
		Menu.Item.DefItem:addParam("UseQSS", "Use Quicksilver Sash", SCRIPT_PARAM_ONOFF, true)
		Menu.Item.DefItem:addParam("UseDervish", "Use Dervish Blade", SCRIPT_PARAM_ONOFF, true)

--[[Auto]]--

	Menu:addSubMenu("[HeRo Jarvan - Auto]", "Auto")
		Menu.Auto:addParam("autoPOT", "Auto Potions Usage", SCRIPT_PARAM_ONOFF, true)
 		Menu.Auto:addParam("autoPOTHealth", "% Health for Auto Potions", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
		
--[[Others]]--

	Menu:addSubMenu("[HeRo Jarvan - Others]", "Others")
		Menu.Others:addParam("ChangeShow", "Change PermaShow Color(Green)", SCRIPT_PARAM_ONOFF, true)
		Menu.Others:addParam("info", "Reload this(2xF9)", SCRIPT_PARAM_INFO, "")
		
--[[Skin Changer]]--

	if VIP_USER then 
		Menu:addSubMenu("[HeRo Jarvan - SkinChanger]", "skin")
	end

--[[Smite]]--

	Menu:addSubMenu("[HeRo Jarvan - Smite Usage]", "Smite")
  		Menu.Smite:addParam("UseSmite", "Enable Smite Usage", SCRIPT_PARAM_ONKEYTOGGLE, true, string.byte("N"))
		Menu.Smite:addParam("UseSmiteCombo", "Use Smite in Combo", SCRIPT_PARAM_ONKEYTOGGLE, true, string.byte("M"))
		Menu.Smite:addParam("StealSmite", "Use Smite on KillSteal", SCRIPT_PARAM_ONKEYTOGGLE, true, string.byte("K"))
		Menu.Smite:addParam("SRUBaron", "Smite Baron", SCRIPT_PARAM_ONOFF, true)
		Menu.Smite:addParam("SRUDragon", "Smite Dragon", SCRIPT_PARAM_ONOFF, true)
		Menu.Smite:addParam("SRURed", "Smite Red Buff", SCRIPT_PARAM_ONOFF, true)
		Menu.Smite:addParam("SRUBlue", "Smite Blue Buff", SCRIPT_PARAM_ONOFF, true)
		Menu.Smite:addParam("SRURazorbeak", "Smite Wraith", SCRIPT_PARAM_ONOFF, false)
		Menu.Smite:addParam("SRUMurkwolf", "Smite Wolf", SCRIPT_PARAM_ONOFF, false)
		Menu.Smite:addParam("SRUKrug", "Smite Golem", SCRIPT_PARAM_ONOFF, false)
		Menu.Smite:addParam("SRUGromp", "Smite Gromp", SCRIPT_PARAM_ONOFF, false)
	
--[[Drawings]]--
	
	Menu:addSubMenu("[HeRo Jarvan - Drawings]", "Drawings")
		Menu.Drawings:addParam("AllDraw", "Enable or Disable all Draws", SCRIPT_PARAM_ONOFF, true)
		Menu.Drawings:addParam("DrawAA", "Draw AA Range", SCRIPT_PARAM_ONOFF, true)
		Menu.Drawings:addParam("DrawQ", "Draw Q Range", SCRIPT_PARAM_ONOFF, true)	
		Menu.Drawings:addParam("DrawW", "Draw W Range", SCRIPT_PARAM_ONOFF, true)
		Menu.Drawings:addParam("DrawE", "Draw E Range", SCRIPT_PARAM_ONOFF, true)
		Menu.Drawings:addParam("DrawR", "Draw R Range", SCRIPT_PARAM_ONOFF, true)

--[[Predictions]]--

	Menu:addSubMenu("[HeRo Jarvan - Prediction]", "Prediction")
  		Menu.Prediction:addParam("activePred", "Prediction (require reload)", SCRIPT_PARAM_LIST, 1, {"VPred", "DPred(Soon)", "FHPred(Soon)", "KPred(Soon)"})
  		if Menu.Prediction.activePred == 1 then
    		if FileExist(LIB_PATH .. "VPrediction.lua") then
      			require "VPrediction"
      			VP = VPrediction()
      			Menu.Prediction:addParam("QVPHC", "Q HitChance", SCRIPT_PARAM_SLICE, 2, 1, 5, 0)
      			Menu.Prediction:addParam("EVPHC", "E HitChance", SCRIPT_PARAM_SLICE, 2, 1, 5, 0)
      			DelayAction(function() PrintChat("<font color='#FF0000'><b>[HeRo Jarvan]: </b></font><font color='#F0F8FF'><b>VPrediction Found!</b></font>") end, 4.1)
    		end
  		--[[elseif Menu.Prediction.activePred == 2 then
    		if VIP_USER and FileExist(LIB_PATH.."DivinePred.lua") and FileExist(LIB_PATH.."DivinePred.luac") then
      			require "DivinePred"
      			DP = DivinePred()
      			Menu.Prediction:addParam("QHC", "Q HitChance %", SCRIPT_PARAM_SLICE, 75, 50, 100, 0)
      			Menu.Prediction:addParam("EHC", "E HitChance %", SCRIPT_PARAM_SLICE, 75, 50, 100, 0)
      			PrintChat("<font color='#FF0000'><b>[HeRo Jarvan]: </b></font><font color='#F0F8FF'><b>Divine Prediction Found!</b></font>")
    		end
  		elseif Menu.Prediction.activePred == 3 then
    		if FHPrediction.GetVersion() ~= nil then
      			if FHPrediction.GetVersion() >= 0.24 then
        			FHPred = true
        			PrintChat("<font color='#FF0000'><b>[HeRo Jarvan]: </b></font><font color='#F0F8FF'><b>FHPrediction Found!</b></font>")
        			Menu.Prediction:addParam("infoFH", "FHPrediction found!", SCRIPT_PARAM_INFO, "")
      			end
    		else
      			PrintChat("<font color='#FF0000'><b>[HeRo Jarvan]: </b></font><font color='#F0F8FF'><b>FHPrediction don't Loaded!</b></font>")
    		end
  		elseif Menu.Prediction.activePred == 4 then
    		if FileExist(LIB_PATH.."KPrediction.lua") then
      			require "KPrediction"
      			KP = KPrediction()
      			Menu.Prediction:addParam("QKPHC", "Q HitChance", SCRIPT_PARAM_SLICE, 1.5, 1, 2, 1)
      			Menu.Prediction:addParam("EKPHC", "E HitChance", SCRIPT_PARAM_SLICE, 1.5, 1, 2, 1)
      			PrintChat("<font color='#FF0000'><b>[HeRo Jarvan]: </b></font><font color='#F0F8FF'><b>KPrediction Found!</b></font>")
    	end  ]]--
	Menu:addParam("info1", "", SCRIPT_PARAM_INFO, "")
  Menu:addParam("info2", ""..SCRIPT_NAME.." [ver. "..version.."]", SCRIPT_PARAM_INFO, "")
  Menu:addParam("info3", "Author - "..SCRIPT_AUTHOR.."", SCRIPT_PARAM_INFO, "")

  end

--[[PermaShow]]--

	if Menu.Others.ChangeShow then
	IDPerma = Menu.Combo:permaShow("ComboMode")
	Menu.permaShowEdit(IDPerma, "lText", "[Combo Mode]")
	Menu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)

  IDPerma = Menu.Combo:permaShow("Burst")
  Menu.permaShowEdit(IDPerma, "lText", "[Burst Mode]")
  Menu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)

	IDPerma = Menu.Harass:permaShow("HS")
	Menu.permaShowEdit(IDPerma, "lText", "[Harass]")
	Menu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)
	
	IDPerma = Menu.Clear:permaShow("LaneClear")
	Menu.permaShowEdit(IDPerma, "lText", "[Lane Clear]")
	Menu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)
	
	IDPerma = Menu.JClear:permaShow("JungleClear")
	Menu.permaShowEdit(IDPerma, "lText", "[Jungle Clear]")
	Menu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)

	IDPerma = Menu.Escape:permaShow("EnableEscape")
	Menu.permaShowEdit(IDPerma, "lText", "[Escape]")
	Menu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)

	IDPerma = Menu.Combo:permaShow("ComboSaveEQ")
	Menu.permaShowEdit(IDPerma, "lText", "[Always save E+Q for Combo mode]")
	Menu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)	
	
	IDPerma = Menu.Prediction:permaShow("activePred")
	Menu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)	
	
	else
	
	Menu.Combo:permaShow("ComboMode")
	
	Menu.Combo:permaShow("Burst")
	
	Menu.Harass:permaShow("HS")
	
	Menu.Clear:permaShow("LaneClear")
	
	Menu.JClear:permaShow("JungleClear")
	
	Menu.Escape:permaShow("EnableEscape")
	
	Menu.Combo:permaShow("ComboSaveEQ")
	
	Menu.Prediction:permaShow("activePred")
	end
	if VIP_USER then SkinLoad() end
end

--[[OnTick]]--

function OnTick()
	ts:update()
	enemyMinions = minionManager(MINION_ENEMY, 1000, myHero, MINION_SORT_MAXHEALTH_ASC)
	jungleMinions = minionManager(MINION_JUNGLE, 1100, myHero, MINION_SORT_MAXHEALTH_DEC)
	if myHero.dead then return end
	spell_check()
	GetSmiteSlot()

  if SMITE then
    if Menu.Smite.UseSmite then
      AutoSmite()
    end
	end
	
	if Menu.Combo.ComboMode then
		JarvanCombo()
		CastItemsF()
		if Menu.Combo.ComboR then
			DelayAction(function() UseR() end, 0.55)
		end
		UseW()
	end
	
	if Menu.KillSteal.Steal then
		KSteal()
	end

	if Menu.Harass.HS then
		if ((myHero.mana*100)/myHero.maxMana) <= Menu.Harass.HarassMana then return end
		Harass()
		CastItemsF()
	end

	if Menu.Clear.LaneClear then
		if ((myHero.mana*100)/myHero.maxMana) <= Menu.Clear.ClearMana then return end
		enemyMinions:update()
		LCLR()
		CastItemsC()
	end

	if Menu.JClear.JungleClear then
		if ((myHero.mana*100)/myHero.maxMana) <= Menu.JClear.JClearMana then return end
		jungleMinions:update()
		JCLR()
		CastItemsCJ()
	end
	
	if UltActive then
		if CountEnemyHeroInRange(650) == 0 then
			CastSpell(_R)
		end
	end
	
	if Menu.Escape.EnableEscape then
		EQEscape()
	end

  if Menu.Auto.AutoPOT then
    CheckFountain()
  end
  if (Menu.Auto.AutoPOT and not REGEN) and not FONTAN then
    AutoPotion()
  end

  	if Menu.Item.UseItem then
    	FindItems()
  	end

  	if UNDERCC and Menu.Item.UseItem and Menu.Item.DefItem.EnableACC then
    	if Menu.Item.DefItem.UseQSS and QSS then
      		CastQSS()
    	end
   		if Menu.Item.DefItem.UseDervish and DERVISH then
     		CastDervish()
    	end
  	end
end

function CastItemsC()
	for _, minions in pairs(enemyMinions.objects) do
		if minions ~= nil and minions.visible then
			if TITANIC and Menu.Item.AttackItem.UseTitanic then CastTITANIC() end
    		if TIAMAT and Menu.Item.AttackItem.UseTiamat and GetDistance(minions) <= 400 then CastTiamat() end
		end
	end
end

function CastItemsCJ()
	for _, jminions in pairs(jungleMinions.objects) do
		if jminions ~= nil and jminions.visible then
			if TITANIC and Menu.Item.AttackItem.UseTitanic then CastTITANIC() end
    		if TIAMAT and Menu.Item.AttackItem.UseTiamat and GetDistance(jminions) <= 400 then CastTiamat() end
		end
	end
end


function CastItemsF()
	if ts.target ~= nil and ts.target.visible then
		if TITANIC and Menu.Item.AttackItem.UseTitanic then CastTITANIC() end
    	if TIAMAT and Menu.Item.AttackItem.UseTiamat and GetDistance(ts.target) <= 400 then CastTiamat() end
    	if YOUMU and Menu.Item.AttackItem.UseYoumu then CastYoumu() end
    	if BOTRK and Menu.Item.AttackItem.UseBOTRK and GetDistance(ts.target) <= 550 then CastBOTRK(ts.target) end
	end
end

--[[Combo]]--

function JarvanCombo()
	if Qready and Eready and Menu.Combo.ComboEQ then
		if ValidTarget(ts.target, 900) then
			CastE(ts.target)
			DelayAction(function() CastQ(ts.target) end, 0.3)
		end
	elseif Qready and not Eready and not Menu.Combo.ComboSaveEQ then
		if ValidTarget(ts.target, 800) then
			CastQ(ts.target)
		end
	elseif not Qready and Eready and not Menu.Combo.ComboSaveEQ then
		if ValidTarget(ts.target, 900) then
			CastE(ts.target)
		end
	elseif Qready and not Eready and Menu.Combo.ComboQ then
		if ValidTarget(ts.target, 800) then
			CastQ(ts.target)
		end
	elseif not Qready and Eready and Menu.Combo.ComboE then
		if ValidTarget(ts.target, 900) then
			CastE(ts.target)
		end
	end
	if SMITE and ATTACKSMITE and Menu.Smite.UseSmiteCombo and GetDlina(myHero, ts.target) <= 560 then
    CastSmite(ts.target)
  end
end

function UseW()
	if Wready and Menu.Combo.ComboW then
		if ValidTarget(ts.target, 525) or CountEnemyHeroInRange(525) >= 1 then
			CastSpell(_W)
		end
	end
end
	
function UseR()
	if Rready and Menu.Combo.ComboR and blCheck(ts.target) then
		if ValidTarget(ts.target, 700) then
			CastR(ts.target)
		end
	end
end

--[[KillSteal]]--

function KSteal()
	if Menu.KillSteal.QSteal then
		QSteal()
	end

	if Menu.KillSteal.ESteal then
		ESteal()
	end

	if Menu.KillSteal.RSteal then
		RSteal()
	end
	
	for i,enemy in pairs(GetEnemyHeroes()) do
    if not enemy.dead and enemy.visible then
      if ValidTarget(enemy, 1000) then
				if igniteslot ~= nil and Menu.KillSteal.UseIgnite and GetDlina(myHero, enemy) <= 600 then
					local igniteDmg = 50 + 20*myHero.level
					if igniteDmg >= enemy.health and SpellReady(igniteslot) and not enemy.dead then
						CastSpell(igniteslot, enemy)
					end
				end
			end
		end
		if GetDlina(myHero, enemy) <= 560 then
      if SMITE and ATTACKSMITE and Menu.Killsteal.UseSmiteKS then
        local SmiteDmg = GetAttackSmiteDamage()
        if SmiteDmg >= enemy.health and SpellReady(SMITESLOT) and not enemy.dead then
          CastSmite(enemy)
        end
      end
    end
	end
end

--[[KillStealQ]]--

function QSteal()
 	for i,enemy in pairs(GetEnemyHeroes()) do
  		if not enemy.dead and enemy.visible then
			if not Qready then return end
			if ValidTarget(enemy, 770) then
				if enemy.health < getDmg("Q", enemy, myHero) then
					CastQ(enemy)
				end
			end
		end
	end
end

--[[KillStealE]]--

function ESteal()
  	for i,enemy in pairs(GetEnemyHeroes()) do
  		if not enemy.dead and enemy.visible then
			if not Eready then return end
			if ValidTarget(enemy, 830) then
				if enemy.health < getDmg("E", enemy, myHero) then
					CastE(enemy)
				end
			end
		end
	end
end

--[[KillStealR]]--

function RSteal() 
	for i,enemy in pairs(GetEnemyHeroes()) do
    	if not enemy.dead and enemy.visible then
		if not Rready then return end
			if ValidTarget(enemy, 650) then
				if enemy.health < getDmg("R", enemy, myHero) then
					CastSpell(_R, enemy)
				end
			end
		end
	end
end

--[[Harass]]--

function Harass()
	if Menu.Harass.HarassEQ then
		HarassEorQ()
	end
end

function HarassEorQ()
	if Qready and Eready and Menu.Harass.HarassEQ then
		if ValidTarget(ts.target, 900) then
			CastE(ts.target)
			DelayAction(function() CastQ(ts.target) end, 0.3)
		end
	elseif Qready and not Eready and Menu.Harass.HarassQ and Menu.Harass.HarassEQ then
		if ValidTarget(ts.target, 800) then
			CastQ(ts.target)
		end
	elseif not Qready and Eready and Menu.Harass.HarassE and Menu.Harass.HarassEQ then
		if ValidTarget(ts.target, 900) then
			CastE(ts.target)
		end
	end
end

--[[LaneClear]]--

function LCLR()
	LCLRQ()
end

--[[LaneClear]]--

function LCLRQ()
	for _, minions in pairs(enemyMinions.objects) do
		if Qready and Menu.Clear.LaneClearQ then
			if ValidTarget(minions, 770) then
				CastQ(minions)
			end
		end
		if Eready and Menu.Clear.LaneClearE then
				CastE(minions)
    		end
			if Wready and Menu.Clear.LaneClearW then
				if GetDistance(minions) <= 525 then
					CastSpell(_W)
    			end
  			end
		end
end

--[[JungleClear]]--

function JCLR()
	if Menu.JClear.JungleClearQ then
		JCLRQ()
	end
end

function JCLRQ()
	for _, jminion in pairs(jungleMinions.objects) do
    	if ValidTarget(jminion, VARS.Q.RANGE) then
			if Qready and Menu.JClear.JungleClearQ then
				CastQ(jminion)
			end
		if Eready and Menu.JClear.JungleClearE then
			CastE(jminion)
    	end
		if Wready and Menu.JClear.JungleClearW then
			if GetDistance(jminion) <= 525 then
				CastSpell(_W)
    		end
  		end
	end
end
end

--[[OnDraw]]--

function OnDraw()
	if myHero.dead then return end
	if Menu.Drawings.AllDraw then
	
		if Menu.Drawings.DrawQ and Qready then
			DrawCircle(myHero.x, myHero.y, myHero.z, 700, ARGB(255, 0, 0, 80))
		end	

		if Menu.Drawings.DrawW and Wready then
			DrawCircle(myHero.x, myHero.y, myHero.z, 525, ARGB(255, 0, 0, 80))
		end

		if Menu.Drawings.DrawE and Eready then
			DrawCircle(myHero.x, myHero.y, myHero.z, 830, ARGB(255, 0, 0, 80))
		end

		if Menu.Drawings.DrawAA then
			DrawCircle(myHero.x, myHero.y, myHero.z, 250, ARGB(255, 0, 0, 80))
		end
	
		if Menu.Drawings.DrawR and Rready then
			DrawCircle(myHero.x, myHero.y, myHero.z, 650, ARGB(255, 0, 0, 80))
		end
	end
end

--[[SpellCheck]]--

function spell_check()
	Qready = (myHero:CanUseSpell(_Q) == READY)
	Wready = (myHero:CanUseSpell(_W) == READY)
	Eready = (myHero:CanUseSpell(_E) == READY)
	Rready = (myHero:CanUseSpell(_R) == READY)
end

--[[BlockList]]--

function blCheck(target)
	if ts.target ~= nil and Menu.ultb[target.charName] then
		return true
	else
		return false
	end
end

--[[OnCreateObj]]--

function OnCreateObj(obj)
	if obj == nil then return end
		if obj.name:lower():find("jarvancataclysm_sound") then
			ultActive = true
			DelayAction(function() ultActive = false end, 3.5)
		end
	end

--[[OnDeleteObj]]--	

function OnDeleteteObj(obj)
	if obj == nil then return end
		if obj.name:lower():find("jarvancataclysm_sound") then
			ultActive = false
		end
	end

--[[EQEscape]]--

function EQEscape()
  	myHero:MoveTo(mousePos.x, mousePos.z)
		if Eready and Qready then
			MousePos = Vector(mousePos.x, mousePos.y, mousePos.z)
			CastSpell(_E, mousePos.x, mousePos.z)
			DelayAction(function() CastSpell(_Q, mousePos.x, mousePos.z) end, 0.35)
			myHero:MoveTo(mousePos.x, mousePos.z)
	end
end

--[[CastQ]]--

function CastQ(unit)
  	if unit == nil and Qready then return end
  	if VP ~= nil then
    	local CastPosition, HitChance = VP:GetLineCastPosition(unit, 0.5, VARS.Q.WIDTH, VARS.Q.RANGE, VARS.Q.SPEED, myHero, false)
    	if HitChance >= Menu.Prediction.QVPHC then
      	CastSpell(_Q, CastPosition.x, CastPosition.z)
    end
  end
end

--[[CastE]]--

function CastE(unit)
  	if unit == nil and Eready then return end
  	if VP ~= nil then
    	local CastPosition, HitChance = VP:GetLineCastPosition(unit, 0.5, VARS.E.WIDTH, 830, VARS.E.SPEED, myHero, false)
    	if HitChance >= Menu.Prediction.EVPHC then
      	CastSpell(_E, CastPosition.x, CastPosition.z)
    end
  end
end

--[[CastW]]--

function CastW(unit)
	if unit == nil and Wready then return end
 	if ValidTarget(ts.target, 525) or GetDlina(myHero, ts.target) <= 525 then
    CastSpell(_W)
  end
end

--[[CastR]]--

function CastR(unit)
  if unit == nil then return end
    if ValidTarget(unit, 650) then
      CastSpell(_R, unit)
    end
end

--[[GetDlina]]--

function GetDlina(a, b)
  local Dlina = math.sqrt((b.x-a.x)*(b.x-a.x) + (b.z-a.z)*(b.z-a.z))
  return Dlina
end

--[[SpellReady]]--

function SpellReady(spell)
  return myHero:CanUseSpell(spell) == READY
end

--[[FindItems]]--

function FindItems()
  if (Menu.Item.AttackItem.UseTiamat) then
    GetTiamat()
  end
  if (Menu.Item.AttackItem.UseTitanic) then
    GetTitanic()
  end
  if (Menu.Item.AttackItem.UseBOTRK) then
    GetBOTRK()
  end
  if (Menu.Item.AttackItem.UseCutlass) then
    GetCutlass()
  end
  if (Menu.Item.AttackItem.UseYoumu) then
    GetYoumu()
  end
  if (Menu.Item.AttackItem.UseGunblade) then
    GetGunblade()
  end
  if (Menu.Item.DefItem.UseQSS) then
    GetQSS()
  end
  if (Menu.Item.DefItem.UseDervish) then
    GetDervish()
  end
end

--[[Get Items]]--

function GetTiamat()
  local slot = GetItem(ATTACKITEMS[1])
  if (slot ~= nil) then
    TIAMAT = true
    TIAMATSLOT = slot
  else
    TIAMAT = false
  end
end

function GetTitanic()
  local slot = GetItem(ATTACKITEMS[2])
  if (slot ~= nil) then
    TITANIC = true
    TITANICSLOT = slot
  else
    TITANIC = false
  end
end

function GetCutlass()
  local slot = GetItem(ATTACKITEMS[3])
  if (slot ~= nil) then
    CUTLASS = true
    CUTLASSSLOT = slot
  else
    CUTLASS = false
  end
end

function GetYoumu()
  local slot = GetItem(ATTACKITEMS[4])
  if (slot ~= nil) then
    YOUMU = true
    YOUMUSLOT = slot
  else
    YOUMU = false
  end
end

function GetGunblade()
  local slot = GetItem(ATTACKITEMS[5])
  if (slot ~= nil) then
    GUNBLADE = true
    GUNBLADESLOT = slot
  else
    GUNBLADE = false
  end
end

function GetBOTRK()
  local slot = GetItem(ATTACKITEMS[6])
  if (slot ~= nil) then
    BOTRK = true
    BOTRKSLOT = slot
  else
    BOTRK = false
  end
end

function GetQSS()
  local slot = GetItem(ANTICCITEMS[1])
  if (slot ~= nil) then
    QSS = true
    QSSSLOT = slot
  else
    QSS = false
  end
end

function GetDervish()
  local slot = GetItem(ANTICCITEMS[2])
  if (slot ~= nil) then
    DERVISH = true
    DERVISHSLOT = slot
  else
    DERVISH = false
  end
end

--[[Cast Items]]--

function CastTiamat()
  if TIAMAT then
    if (SpellReady(TIAMATSLOT)) then
      CastSpell(TIAMATSLOT)
    end
  end
end

function CastSmite(target)
  if SpellReady(SMITESLOT) then
    CastSpell(SMITESLOT, target)
  end
end

function CastYoumu()
  if YOUMU then
    if (SpellReady(YOUMUSLOT)) then
      CastSpell(YOUMUSLOT)
    end
  end
end

function CastBOTRK(target)
  if BOTRK then
    if (SpellReady(BOTRKSLOT)) then
      CastSpell(BOTRKSLOT, target)
    end
  end
end

function CastTITANIC()
  if TITANIC then
    if (SpellReady(TITANICSLOT)) then
      CastSpell(TITANICSLOT)
    end
  end
end

function CastCutlass(target)
  if CUTLASS then
    if (SpellReady(CUTLASSSLOT)) then
      CastSpell(CUTLASSSLOT, target)
    end
  end
end

function CastGunblade(target)
  if GUNBLADE then
    if (SpellReady(GUNBLADESLOT)) then
      CastSpell(GUNBLADESLOT, target)
    end
  end
end

function CastQSS()
  if QSS then
    if SpellReady(QSSSLOT) then
      CastSpell(QSSSLOT)
    end
  end
end

function CastDervish()
  if DERVISH then
    if SpellReady(DERVISHSLOT) then
      CastSpell(DERVISHSLOT)
    end
  end
end

--[[Get Buff(Add)]]--

function Buff_Add(unit, target, buff)
  for j = 1, #DANGERSPELL do
    if target then
      if target.isMe and buff.name == DANGERSPELL[j] then
        UNDERCC = true
      end
    end
  end
  for i=1, 5 do
    if (buff.name == POT[i] and unit.isMe) then
      REGENTIME = true
    end
  end
end

--[[Get Buff(Rem)]]--

function Buff_Rem(unit, buff)
  for j = 1, #DANGERSPELL do
    if unit.isMe and buff.name == DANGERSPELL[j] then
      UNDERCC = false
    end
  end
  for i=1, 5 do
    if (buff.name == POT[i] and unit.isMe) then
      REGENTIME = false
    end
  end
end

--[[Auto Potion]]--

function AutoPotion()
  for i=1, 5 do
    local pot = GetItem(POT[i])
    if (pot ~= nil) then
      if (((myHero.health*100)/myHero.maxHealth) <= Menu.Auto.autoPOTHealth and not REGENTIME) then
        CastSpell(pot)
      end
    end
  end
end

--[[Find Slot]]--

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

--[[Get Item]]--

function GetItem(name)
  local slot = FindSlotByName(name)
  return slot 
end

function CheckFountain()
  if not GetGame().map.index == 15 then return end
  if myHero.team == 100 then
    local rastoyanieDown = math.sqrt((myHero.x-lowBase.x)*(myHero.x-lowBase.x) + (myHero.z-lowBase.z)*(myHero.z-lowBase.z))
    if rastoyanieDown < 900 then
      FONTAN = true
    else
      FONTAN = false
    end
  elseif myHero.team == 200 then
    local rastoyanieUp = math.sqrt((myHero.x-upBase.x)*(myHero.x-upBase.x) + (myHero.z-upBase.z)*(myHero.z-upBase.z))
    if rastoyanieUp < 900 then
      FONTAN = true
    else
      FONTAN = false
    end
  end
end

function GetSmiteSlot()
  for i=1, 3 do
    if FindSlotByName(SMITELIST[i]) ~= nil then
      SMITESLOT = FindSlotByName(SMITELIST[i])
      SMITE = true
      if i == 2 or i == 3 then
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

function GetSmiteDamage(unit)
  if SMITE then
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
end

function AutoSmite()
  local SmiteDmg = GetSmiteDamage()
  for _, jminions in pairs(jungleMinions.objects) do
    if not jminions.dead and jminions.visible and ValidTarget(jminions, 560) then
      if Menu.Smite[jminions.charName:gsub("_", "")] then
        if SpellReady(SMITESLOT) and GetDlina(myHero, jminions) <= 560 and SmiteDmg >= jminions.health then
          CastSpell(SMITESLOT, jminions)
        end
      end
    end
  end
end

-- Credits PvPSuite
function SkinLoad()
    Menu.skin:addParam('changeSkin', 'Change Skin', SCRIPT_PARAM_ONOFF, false);
    Menu.skin:setCallback('changeSkin', function(nV)
        if (nV) then
            SetSkin(myHero, Menu.skin.skinID)
        else
            SetSkin(myHero, -1)
        end
    end)
    Menu.skin:addParam('skinID', 'Skin', SCRIPT_PARAM_LIST, 1, {"Commando", "Dragonslayer", "Darkforge", "Victorious", "Warring Kingdoms", "Fnatic", "Classic"})
    Menu.skin:setCallback('skinID', function(nV)
        if (Menu.skin.changeSkin) then
            SetSkin(myHero, nV)
        end
    end)
    
    if (Menu.skin.changeSkin) then
        SetSkin(myHero, Menu.skin.skinID)
    end
end
-- Credits PvPSuite
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
--[[End]]--
