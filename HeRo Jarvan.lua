 --[[
 ---HeRo Jarvan Developed by HeRoBaNd---
    __  __     ____               __                           
   / / / /__  / __ \____         / /___ _______   ______ _____ 
  / /_/ / _ \/ /_/ / __ \   __  / / __ `/ ___/ | / / __ `/ __ \
 / __  /  __/ _, _/ /_/ /  / /_/ / /_/ / /   | |/ / /_/ / / / /
/_/ /_/\___/_/ |_|\____/   \____/\__,_/_/    |___/\__,_/_/ /_/ 
                                                               
---Changelog---
---1.0 - Reliased For Bol---
]]--

if myHero.charName ~= "JarvanIV" then return end

local version = "1.0"
local serveradress = "raw.githubusercontent.com"
local scriptadress = "/HeRoBaNd/Scripts/master"
local SCRIPT_NAME = "HeRo Jarvan"
local SCRIPT_AUTHOR = "HeRoBaNd"
local VP, DP, KP = nil
local ts
local Menu
local Qready, Wready, Eready, Rready = false, false, false, false
local KSmiteDmg = function() return myHero.level * 8 + 20 end
local SMITE = false
local SMITELIST = {"SummonerSmite", "s5_SummonerSmitePlayerGanker", "s5_SummonerSmiteDuel"}
local REGENTIME = false
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
  Q = {RANGE = 700, WIDTH = 70, DELAY = 0.5, SPEED = math.huge},
  W = {RANGE = 525, WIDTH = 525, DELAY = 0, SPEED = nil},
  E = {RANGE = 830, WIDTH = 75, DELAY = 0.5, SPEED = math.huge},
  R = {RANGE = 650, WIDTH = 325, DELAY = 0, SPEED = nil}
}
local ultActive = false

JQ = {range = VARS.Q.RANGE, speed = VARS.Q.SPEED, delay = VARS.Q.DELAY, radius = VARS.Q.WIDTH, type = "DelayLine", width = VARS.Q.WIDTH}
JW = {range = VARS.W.RANGE, speed = VARS.W.SPEED, delay = VARS.W.DELAY, radius = VARS.W.WIDTH, type = "DelayCircle", width = VARS.W.WIDTH}
JE = {range = VARS.E.RANGE, speed = VARS.E.SPEED, delay = VARS.E.DELAY, radius = VARS.E.WIDTH, type = "PromptCircle", width = VARS.E.WIDTH}
JR = {range = VARS.R.RANGE, speed = VARS.R.SPEED, delay = VARS.R.DELAY, radius = VARS.R.WIDTH, type = "DelayCircle2", width = VARS.W.WIDTH}

--[[OnLoad]]--

function OnLoad()
	FindUpdates()
	ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 900, DAMAGE_PHYSICAL)
	DelayAction(function() PrintChat("<font color='#FF0000'><b>[HeRo Jarvan] </b></font><font color='#00BFFF'><b>Loaded.</b></font>") end, 4.0)
	ultActive = false
	AddApplyBuffCallback(Buff_Add)
 	AddRemoveBuffCallback(Buff_Rem)
    if _G.Reborn_Loaded ~= nil then
    SAC = true 
  elseif _G.MMA_IsLoaded then
    MMA = true
  elseif _G.NebelwolfisOrbWalkerInit then
    WOLFY = true
  elseif _Pewalk then
    PEW = true            
  end
   igniteslot = FindSlotByName("SummonerDot")

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
		Menu.Combo:addParam("ComboQ", "Use Q in Combo", SCRIPT_PARAM_ONOFF, true)
		Menu.Combo:addParam("ComboW", "Use W in Combo", SCRIPT_PARAM_ONOFF, true)
		Menu.Combo:addParam("ComboE", "Use E in Combo", SCRIPT_PARAM_ONOFF, true)
		Menu.Combo:addParam("ComboR", "Use R in Combo", SCRIPT_PARAM_ONOFF, true)
	
--[[Harass]]--
	
	Menu:addSubMenu("[HeRo Jarvan - Harass]", "Harass")
		Menu.Harass:addParam("HS", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
		Menu.Harass:addParam("HarassEQ", "Use E+Q Combo in Harass", SCRIPT_PARAM_ONOFF, true)
		Menu.Harass:addParam("HarassQ", "Use Q in Harass", SCRIPT_PARAM_ONOFF, true)
		Menu.Harass:addParam("HarassE", "Use E in Harass", SCRIPT_PARAM_ONOFF, true)
		Menu.Harass:addParam("HarassW", "Use W in Harass", SCRIPT_PARAM_ONOFF, true)
		Menu.Harass:addParam("HarassMana", "% Mana for Harass", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)

--[[KillSteal]]--
	
	Menu:addSubMenu("[HeRo Jarvan - KillSteal]", "KillSteal")
		Menu.KillSteal:addParam("Steal", "Endble or Disable KillSteal", SCRIPT_PARAM_ONOFF, true)
		Menu.KillSteal:addParam("EQSteal", "Use E+Q Combo for KillSteal", SCRIPT_PARAM_ONOFF, true)
		Menu.KillSteal:addParam("QSteal", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Menu.KillSteal:addParam("ESteal", "Use E", SCRIPT_PARAM_ONOFF, true)
		Menu.KillSteal:addParam("RSteal", "Use R", SCRIPT_PARAM_ONOFF, false)
		Menu.Killsteal:addParam("UseIgnite", "Ignite KillSteal", SCRIPT_PARAM_ONOFF, true)
	
	
--[[LaneClear]]--
	
	Menu:addSubMenu("[HeRo Jarvan - LaneClear]", "Clear")
		Menu.Clear:addParam("LaneClear", "LaneClear with spells", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
		Menu.Clear:addParam("LaneClearQE", "Use E+Q Combo in LineClear", SCRIPT_PARAM_ONOFF, false)
		Menu.Clear:addParam("LaneClearQ", "Use Q in LaneClear", SCRIPT_PARAM_ONOFF, true)
		Menu.Clear:addParam("LaneClearE", "Use E in LaneClear", SCRIPT_PARAM_ONOFF, true)
		Menu.Clear:addParam("LaneClearW", "Use W in LaneClear", SCRIPT_PARAM_ONOFF, true)
		Menu.Clear:addParam("ClearMana", "% Mana for LaneClear", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
	
--[[JungleClear]]--
	
	Menu:addSubMenu("[HeRo Jarvan - JungleClear]", "JClear")
		Menu.JClear:addParam("JungleClear", "Jungleclear with spells", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
		Menu.JClear:addParam("JungleClearEQ", "Use E+Q Combo in LineClear", SCRIPT_PARAM_ONOFF, true)
		Menu.JClear:addParam("JungleClearQ", "Use Q in JungleClear", SCRIPT_PARAM_ONOFF, true)
		Menu.JClear:addParam("JungleClearE", "Use E in JungleClear", SCRIPT_PARAM_ONOFF, true)
		Menu.JClear:addParam("JungleClearW", "Use W in JungleClear", SCRIPT_PARAM_ONOFF, true)
		Menu.JClear:addParam("JClearMana", "% Mana for JungleClear", SCRIPT_PARAM_SLICE, 75, 0, 100, 0)
		
--[[Escape]]--
	
	Menu:addSubMenu("[HeRo Jarvan - Escape]", "Escape")
		Menu.Escape:addParam("EnableEscape", "Escape", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("S"))
	
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
 		Menu.Auto:addParam("autoPOTHealth", "% Health for autoPOT", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
		
--[[Others]]--

	Menu:addSubMenu("[HeRo Jarvan - Others]", "Others")
		Menu.Others:addParam("ChangeShow", "Change PermaShow Color(Green)", SCRIPT_PARAM_ONOFF, true)
		Menu.Others:addParam("info", "Reload this(2xF9)", SCRIPT_PARAM_INFO, "")
	
	if SMITE then
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
	end
	
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
  		Menu.Prediction:addParam("activePred", "Prediction (require reload)", SCRIPT_PARAM_LIST, 1, {"VPred", "DPred", "FHPred", "KPred"})
  		if Menu.Prediction.activePred == 1 then
    		if FileExist(LIB_PATH .. "VPrediction.lua") then
      			require "VPrediction"
      			VP = VPrediction()
      			Menu.Prediction:addParam("QVPHC", "Q HitChance", SCRIPT_PARAM_SLICE, 2, 1, 5, 0)
      			Menu.Prediction:addParam("EVPHC", "E HitChance", SCRIPT_PARAM_SLICE, 2, 1, 5, 0)
      			PrintChat("<font color='#FF0000'><b>[HeRo Jarvan]: </b></font><font color='#F0F8FF'><b>VPrediction Found!</b></font>")
    		end
  		elseif Menu.Prediction.activePred == 2 then
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
    	end  
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
end

--[[OnTick]]--

function OnTick()
	ts:update()
	enemyMinions 	= minionManager(MINION_ENEMY, 1000, myHero, MINION_SORT_MAXHEALTH_ASC)
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
		if SMITE and Menu.Smite.UseSmiteCombo and GetDlina(myHero, ts.target) <= 560  then
            CastSmite(ts.target)
        end
	end
	
	if Menu.Combo.Burst then
    Zaburstim()
  end
	
	if Menu.KillSteal.Steal then
		KSteal()
		if SMITE and Menu.Smite.StealSmite and GetDlina(myHero, ts.target) <= 560 and ts.target.health <= KSmiteDmg then
            CastSmite(ts.target)
        end
	end

	if Menu.Harass.HS then
		if ((myHero.mana*100)/myHero.maxMana) <= Menu.Harass.HarassMana then return end
		Harass()
	end

	if Menu.Clear.LaneClear then
		if ((myHero.mana*100)/myHero.maxMana) <= Menu.Clear.ClearMana then return end
		enemyMinions:update()
		LCLR()
	end

	if Menu.JClear.JungleClear then
		if ((myHero.mana*100)/myHero.maxMana) <= Menu.JClear.JClearMana then return end
		jungleMinions:update()
		JCLR()
	end
	
	if UltActive then
		if CountEnemyHeroInRange(650) == 0 then
			CastSpell(_R)
		end
	end
	
	if Menu.Escape.EnableEscape then
		EQEscape()
    CastYoumu()
	end

	if Menu.Auto.autoPOT and not REGENTIME then
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

--[[Combo]]--

function JarvanCombo()
	if Menu.Combo.ComboEQ then
		ComboEQ()
	end

	if Menu.Combo.ComboQ then
		ComboQ()
	end
	
	if Menu.Combo.ComboE then
		ComboE()
	end
	
	if Menu.Combo.ComboW then
		ComboW()
	end
	
	if Menu.Combo.ComboR then
		ComboR()
	end
end

--[[Burst]]--

function Zaburstim()
  BurstCombo()
end

function BurstCombo()
	myHero:MoveTo(mousePos.x, mousePos.z)
  if not Eready and not Qready and not Wready and not Rready then return end
	myHero:MoveTo(mousePos.x, mousePos.z)
  if ValidTarget(ts.target, 770) then
    if TITANIC then CastTITANIC() end
    if TIAMAT then CastTiamat() end
    if YOUMU then CastYoumu() end
    if BOTRK then CastBOTRK() end
    CastE(ts.target)
    DelayAction(function() CastQ(ts.target) end, 0.2)
    if SAC then
        _G.AutoCarry.Orbwalker:ResetAttackTimer()
    end
    if WOLFY then
       	_G.NebelwolfisOrbWalker:ResetAA()
    end
    if PEW then
       	_Pewalk.AllowAttack(false)
        _Pewalk.AllowMove(false)
        myHero:Attack(spell.target)
        DelayAction(function()
        _Pewalk.AllowAttack(true)
        _Pewalk.AllowMove(true)
        end, 0.2)
    end
    if MMA then
        _G.MMA_ResetAutoAttack()
    end
    DelayAction(function() CastR(ts.target) end, 0.4)
    if GetDlina(myHero, ts.target) <= 525 then
      CastW()
    end
  end
end

--[[ComboEQ]]--

function ComboEQ()
	if not Eready and not Qready then return end
	  if TITANIC then CastTITANIC() end
    if TIAMAT then CastTiamat() end
    if YOUMU then CastYoumu() end
    if BOTRK then CastBOTRK() end
	if ValidTarget(ts.target, 770) then
		CastE(ts.target)
		DelayAction(function() CastQ(ts.target) end, 0.2)
	end
end

--[[ComboQ]]--

function ComboQ()
	if Menu.Combo.ComboSaveEQ or not Qready then return end
	  if TITANIC then CastTITANIC() end
    if TIAMAT then CastTiamat() end
    if YOUMU then CastYoumu() end
    if BOTRK then CastBOTRK() end
	if ValidTarget(ts.target, 770) then
		CastQ(ts.target)
		end
	end

--[[ComboE]]--

function ComboE()
	if Menu.Combo.ComboSaveEQ or not Eready then return end
	  if TITANIC then CastTITANIC() end
    if TIAMAT then CastTiamat() end
    if YOUMU then CastYoumu() end
    if BOTRK then CastBOTRK() end
	if ValidTarget(ts.target, 830) then
		CastE(ts.target)
		end
		end

--[[ComboW]]--

function ComboW()
if not Menu.Combo.ComboW or not Wready then return end
  if TITANIC then CastTITANIC() end
  if TIAMAT then CastTiamat() end
  if YOUMU then CastYoumu() end
  if BOTRK then CastBOTRK() end
  if ValidTarget(ts.target, 520) then
		CastSpell(_W)
	end
end

--[[ComboR]]--

function ComboR()
if Menu.Combo.ComboR and blCheck(ts.target) then
  if TITANIC then CastTITANIC() end
  if TIAMAT then CastTiamat() end
  if YOUMU then CastYoumu() end
  if BOTRK then CastBOTRK() end
	if ValidTarget(ts.target, 650) then
	CastSpell(_R, ts.target)
	end
	end
end

--[[KillSteal]]--

function KSteal()
	for i,enemy in pairs(GetEnemyHeroes()) do
    if not enemy.dead and enemy.visible then
    if ValidTarget(enemy, 1000) then
	local igniteDmg = 50 + 20*myHero.level

		if GetDlina(myHero, enemy) <= 600 then
          if igniteslot ~= nil and Menu.Killsteal.UseIgnite then
            if igniteDmg >= enemy.health and SpellReady(igniteslot) and not enemy.dead then
              CastSpell(igniteslot, enemy)
            end
          end	
    if Menu.KillSteal.EQSteal then
		EQSteal()
	end

	if Menu.KillSteal.QSteal then
		QSteal()
	end

	if Menu.KillSteal.ESteal then
		ESteal()
	end

	if Menu.KillSteal.RSteal then
		RSteal()
	end
end

--[[KillStealEQ]]--

function EQSteal()
  for i,enemy in pairs(GetEnemyHeroes()) do 
	if not enemy.dead and enemy.visible then
	if not Eready and not Qready then return end
	if ValidTarget(enemy, 770) then
		if enemy.health < getDmg("Q", enemy, myHero) + getDmg("E", enemy, myHero) then
		CastE(enemy)
		DelayAction(function() CastQ(enemy) end, 0.2)
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
		HarassEQ()
	end

	if Menu.Harass.HarassQ then
		HarassQ()
	end
	
	if Menu.Harass.HarassE then
		HarassE()
	end
	
	if Menu.Harass.HarassW then
		HarassW()
	end
end

--[[HarassEQ]]--

function HarassEQ()
	if not Eready and not Qready then return end
	if ValidTarget(ts.target, 770) then
		CastE(ts.target)
		DelayAction(function() CastQ(ts.target) end, 0.2)
		end
	end

--[[HarassQ]]--

function HarassQ()
	if Menu.Combo.ComboSaveEQ or not Qready then return end
	if ValidTarget(ts.target, 770) then
		CastQ(ts.target)
		end
end

--[[HarassE]]--

function HarassE()
	if Menu.Combo.ComboSaveEQ or not Eready then return end
	if ValidTarget(ts.target, 830) then
		CastE(ts.target)
		end
	end

--[[HarassW]]--

function HarassW()
if not Menu.Harass.HarassW or not Wready then return end
  if ValidTarget(ts.target, 520) then
		CastSpell(_W)
	end
end

--[[LaneClear]]--

function LCLR()
	if Menu.Clear.LaneClearQE then
		LCLREQ()
	end

	if Menu.Clear.LineClearQ then
		LCLRQ()
	end
	
	if Menu.Clear.LineClearE then
		LCLRE()
	end
	
	if Menu.Clear.LineClearW then
		LCLRW()
	end
end

--[[LaneClearEQ]]--

function LCLREQ()
	if not Eready and not Qready then return end
	for _, minions in pairs(enemyMinions.objects) do
		if ValidTarget(minions, 830) then
			  CastE(minions)
        DelayAction(function() CastQ(minions) end, 0.2)
		end
	end
end

--[[LaneClearQ]]--

function LCLRQ()
	if Menu.Combo.ComboSaveEQ or not Qready then return end
	for _, minions in pairs(enemyMinions.objects) do
		if ValidTarget(minions, 770) then
			CasrQ(minions)
		end
	end
end

--[[LaneClearE]]--

function LCLRE()
	if Menu.Combo.ComboSaveEQ or not Qready then return end
	for _, minions in pairs(enemyMinions.objects) do
		if ValidTarget(minions, 830) then
			CastE(minions)
		end
	end
end

--[[LaneClearW]]--

function LCLRW()
	if not Wready then return end
	for _, minions in pairs(enemyMinions.objects) do
		if ValidTarget(minions, 525) then
			if GetDlina(myHero, minions) <= 525 then
				CastSpell(_W)
			end
		end
	end
end

--[[JungleClear]]--

function JCLR()
	if Menu.JClear.JungleClearQE then
		JCLREQ()
	end

	if Menu.JClear.JungleClearQ then
		JCLRQ()
	end
	
	if Menu.JClear.JungleClearE then
		JCLRE()
	end
	
	if Menu.JClear.JungleClearW then
		JCLRW()
	end
end

--[[JungleClearEQ]]--

function JCLREQ()
	if not Eready and not Qready then return end
	for _, jminions in pairs(jungleMinions.objects) do
		if ValidTarget(jminions, 830) then
			   CastE(jminions)
    DelayAction(function() CastQ(jminions) end, 0.2)
		end
	end
end

--[[JungleClearQ]]--

function JCLRQ()
	if Menu.Combo.ComboSaveEQ or not Qready then return end
	for _, jminions in pairs(jungleMinions.objects) do
		if ValidTarget(jminions, 770) then
			CastSpell(_Q, jminions)
			CastQ(jminions)
		end
	end
end

--[[JungleClearE]]--

function JCLRE()
	if Menu.Combo.ComboSaveEQ or not Qready then return end
	for _, jminions in pairs(jungleMinions.objects) do
		if ValidTarget(jminions, 830) then
			CastE(jminions)
		end
	end
end

--[[JungleClearW]]--

function JCLRW()
	if not Wready then return end
	for _, jminions in pairs(jungleMinions.objects) do
		if ValidTarget(jminions, 525) then
			if GetDlina(myHero, jminions) <= 525 then
				CastSpell(_W)
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

--[[FindUpdates]]--

function FindUpdates()
	if not autoupdate then return end
		local ServerVersionDATA = GetWebResult(serveradress , scriptadress.."/HeRo Jarvan.version")
			if ServerVersionDATA then
				local ServerVersion = tonumber(ServerVersionDATA)
					if ServerVersion then
						if ServerVersion > tonumber(LocalVersion) then
							PrintChat("<font color='#FF0000'><b>[HeRo Jarvan] </b></font>".."<font color='#00BFFF'><b>Updating, don't press F9.</b></font>")
								Update()
									else
								PrintChat("<font color='#FF0000'><b>[HeRo Jarvan] </b></font>".."<font color='#00BFFF'><b>You have the latest version.</b></font>")
							end
						else
					PrintChat("<font color='#FF0000'><b>[HeRo Jarvan] </b></font>".."<font color='#00BFFF'><b>An error occured, while updating, please reload.</b></font>")
				end
			else
		PrintChat("<font color='#FF0000'><b>[HeRo Jarvan] </b></font>".."<font color='#00BFFF'><b>Could not connect to update Server.</b></font>")
	end
end

--[[Update]]--

function Update()
	DownloadFile("http://"..serveradress..scriptadress.."/HeRo Jarvan.lua",SCRIPT_PATH.."HeRo Jarvan.lua", function ()
	PrintChat("<font color='#FF0000'><b>[HeRo Jarvan] </b></font>".."<font color='#00BFFF'><b>Updated, press 2xF9.</b></font>")
	end)
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
    local CastPosition, HitChance = VP:GetLineCastPosition(unit, VARS.Q.DELAY, VARS.Q.WIDTH, VARS.Q.RANGE, VARS.Q.SPEED, myHero, false)
    if HitChance >= Menu.Prediction.QVPHC then
      CastSpell(_Q, CastPosition.x, CastPosition.z)
    end
  end
  if DP ~= nil then
    local state,hitPos,perc = DP:predict(nil,unit,myHero,SkillShot.TYPE.LINE,VARS.Q.SPEED,VARS.Q.RANGE,VARS.Q.WIDTH,VARS.Q.DELAY*1000,0,{Minions = false,Champions = false})
    if perc >= Menu.Prediction.QHC then
      CastSpell(_Q, hitPos.x, hitPos.z)
    end
  end
  if FHPred and Menu.Prediction.activePred == 3 then
    local CastPosition, hc, info = FHPrediction.GetPrediction(JQ, unit)
    if hc > 0 and CastPosition ~= nil then
      CastSpell(_Q, CastPosition.x, CastPosition.z)
    end
  end
  if KP ~= nil then
    local CastPosition, hc = KP:GetPrediction(JQ, unit, myHero)
    if hc >= Menu.Prediction.QKPHC then
      CastSpell(_Q, CastPosition.x, CastPosition.z)
    end
  end
end

--[[CastE]]--

function CastE(unit)
  if unit == nil and Eready then return end
  if VP ~= nil then
    local CastPosition, HitChance = VP:GetLineCastPosition(unit, 0, VARS.E.WIDTH, 870, VARS.E.SPEED, myHero, true)
    if HitChance >= Menu.Prediction.EVPHC then
      CastSpell(_E, CastPosition.x, CastPosition.z)
    end
  end
  if DP ~= nil then
    local state,hitPos,perc = DP:predict(nil,unit,myHero,SkillShot.TYPE.CIRCLE,VARS.E.SPEED,VARS.E.RANGE,0,0,{Minions = false,Champions = false})
    if perc >= Menu.Prediction.EHC then
      CastSpell(_E, hitPos.x, hitPos.z)
    end
  end
  if FHPred and Menu.Prediction.activePred == 3 then
    local CastPosition, hc, info = FHPrediction.GetPrediction(JE, unit)
    if hc > 0 and CastPosition ~= nil then
      CastSpell(_E, CastPosition.x, CastPosition.z)
    end
  end
  if KP ~= nil then
    local CastPosition, hc = KP:GetPrediction(JE, unit, myHero)
    if hc >= Menu.Prediction.EKPHC then
      CastSpell(_E, CastPosition.x, CastPosition.z)
    end
  end
end

--[[CastW]]--

function CastW()
  if Wready and ValidTarget(ts.target, 525) and GetDlina(myHero, ts.target) <= 525 then
    CastSpell(_W)
  end
end

--[[CastR]]--

function CastR(unit)
  if unit == nil then return end
    if ValidTarget(ts.target, 650) and blCheck(ts.target) then
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

--[[GetSmiteSlot]]--

function GetSmiteSlot()
  for i=1, 3 do
    if FindSlotByName(SMITELIST[i]) ~= nil then
      SMITESLOT = FindSlotByName(SMITELIST[i])
      SMITE = true
    end
  end
end

--[[AutoSmite]]--

function AutoSmite()
  local SmiteDmg = GetSmiteDamage()
  for _, minion in pairs(minionManager(MINION_JUNGLE, 500, myHero, MINION_SORT_MAXHEALTH_DEC).objects) do
    if not minion.dead and minion.visible and ValidTarget(minion, 560) then
      if Menu.Smite[minion.charName:gsub("_", "")] then
        if SpellReady(SMITESLOT) and GetDlina(myHero, minion) <= 560 and SmiteDmg >= minion.health then
          CastSpell(SMITESLOT, minion)
        end
      end
    end
  end
end

--[[GetSmiteDamage]]--

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

--[[End]]--
