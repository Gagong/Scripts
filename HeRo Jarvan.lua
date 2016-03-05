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
local HMenu
local Qready, Wready, Eready, Rready = false, false, false, false
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
  W = {RANGE = 525, WIDTH = 525, DELAY = 0.5, SPEED = nil},
  E = {RANGE = 830, WIDTH = 75, DELAY = 0.5, SPEED = math.huge},
  R = {RANGE = 650, WIDTH = 325, DELAY = 0.5, SPEED = nil}
}

JQ = {range = VARS.Q.RANGE, speed = VARS.Q.SPEED, delay = VARS.Q.DELAY, radius = VARS.Q.WIDTH, type = "DelayLine", width = VARS.Q.WIDTH}
JW = {range = VARS.W.RANGE, speed = VARS.W.SPEED, delay = VARS.W.DELAY, radius = VARS.W.WIDTH, type = "DelayLine", width = VARS.W.WIDTH}
JE = {range = VARS.E.RANGE, speed = VARS.E.SPEED, delay = VARS.E.DELAY, radius = VARS.E.WIDTH, type = "DelayLine", width = VARS.E.WIDTH, collision = true}
JR = {range = VARS.R.RANGE, speed = VARS.R.SPEED, delay = VARS.R.DELAY, radius = VARS.R.WIDTH, type = "DelayLine", width = VARS.W.WIDTH}

--[[OnLoad]]--

function OnLoad()
	FindUpdates()
	ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 900, DAMAGE_PHYSICAL)
	DelayAction(function() PrintChat("<font color='#FF0000'><b>[HeRo Jarvan] </b></font><font color='#00BFFF'><b>Loaded.</b></font>") end, 4.0)
	ultActive = false
	Variables()
	AddApplyBuffCallback(Buff_Add)
  AddRemoveBuffCallback(Buff_Rem)

--[[Menu]]--

	HMenu = scriptConfig("Hero Jarvan", "Hero Jarvan")
	
--[[Combo]]--
	
	HMenu:addSubMenu("[HeRo Jarvan - Combo]", "Combo")
		HMenu.Combo:addParam("ComboMode", "Combo mode", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    HMenu.Combo:addParam("Burst", "All In/Burst Combo (Toggle)", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("S"))
		HMenu.Combo:addParam("ComboEQ", "Use Q+E in Combo", SCRIPT_PARAM_ONOFF, true)
		HMenu.Combo:addParam("ComboSaveEQ", "Always save E+Q for Combo mode", SCRIPT_PARAM_ONOFF, false)
		HMenu.Combo:addParam("ComboQ", "Use Q in Combo", SCRIPT_PARAM_ONOFF, true)
		HMenu.Combo:addParam("ComboW", "Use W in Combo", SCRIPT_PARAM_ONOFF, true)
		HMenu.Combo:addParam("ComboE", "Use E in Combo", SCRIPT_PARAM_ONOFF, true)
		HMenu.Combo:addParam("ComboR", "Use R in Combo", SCRIPT_PARAM_ONOFF, true)
	
--[[KillSteal]]--
	
	HMenu:addSubMenu("[HeRo Jarvan - KillSteal]", "KillSteal")
		HMenu.KillSteal:addParam("Steal", "Endble or Disable KillSteal", SCRIPT_PARAM_ONOFF, true)
		HMenu.KillSteal:addParam("EQSteal", "Use E+Q Combo for KillSteal", SCRIPT_PARAM_ONOFF, true)
		HMenu.KillSteal:addParam("QSteal", "Use Q", SCRIPT_PARAM_ONOFF, true)
		HMenu.KillSteal:addParam("ESteal", "Use E", SCRIPT_PARAM_ONOFF, true)
		HMenu.KillSteal:addParam("RSteal", "Use R", SCRIPT_PARAM_ONOFF, false)
	
--[[Harass]]--
	
	HMenu:addSubMenu("[HeRo Jarvan - Harass]", "Harass")
		HMenu.Harass:addParam("HS", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
		HMenu.Harass:addParam("HarassEQ", "Use E+Q Combo in Harass", SCRIPT_PARAM_ONOFF, true)
		HMenu.Harass:addParam("HarassQ", "Use Q in Harass", SCRIPT_PARAM_ONOFF, true)
		HMenu.Harass:addParam("HarassE", "Use E in Harass", SCRIPT_PARAM_ONOFF, true)
		HMenu.Harass:addParam("HarassW", "Use W in Harass", SCRIPT_PARAM_ONOFF, true)
		HMenu.Harass:addParam("HarassMana", "% Mana for Harass", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
	
--[[LaneClear]]--
	
	HMenu:addSubMenu("[HeRo Jarvan - LaneClear]", "Clear")
		HMenu.Clear:addParam("LaneClear", "LaneClear with spells", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
		HMenu.Clear:addParam("LaneClearQE", "Use E+Q Combo in LineClear", SCRIPT_PARAM_ONOFF, false)
		HMenu.Clear:addParam("LaneClearQ", "Use Q in LaneClear", SCRIPT_PARAM_ONOFF, true)
		HMenu.Clear:addParam("LaneClearE", "Use E in LaneClear", SCRIPT_PARAM_ONOFF, true)
		HMenu.Clear:addParam("LaneClearW", "Use W in LaneClear", SCRIPT_PARAM_ONOFF, true)
		HMenu.Clear:addParam("ClearMana", "% Mana for LaneClear", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
	
--[[JungleClear]]--
	
	HMenu:addSubMenu("[HeRo Jarvan - JungleClear]", "JClear")
		HMenu.JClear:addParam("JungleClear", "Jungleclear with spells", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
		HMenu.JClear:addParam("JungleClearEQ", "Use E+Q Combo in LineClear", SCRIPT_PARAM_ONOFF, true)
		HMenu.JClear:addParam("JungleClearQ", "Use Q in JungleClear", SCRIPT_PARAM_ONOFF, true)
		HMenu.JClear:addParam("JungleClearE", "Use E in JungleClear", SCRIPT_PARAM_ONOFF, true)
		HMenu.JClear:addParam("JungleClearW", "Use W in JungleClear", SCRIPT_PARAM_ONOFF, true)
		HMenu.JClear:addParam("JClearMana", "% Mana for JungleClear", SCRIPT_PARAM_SLICE, 75, 0, 100, 0)

--[[ItemUsage]]--

	HMenu:addSubMenu("[HeRo Jarvan - Item Usage]", "Item")
		HMenu.Item:addParam("UseItem", "Enable Item Usage", SCRIPT_PARAM_ONOFF, true)
		HMenu.Item:addSubMenu("[Offensive Items]", "AttackItem")
		HMenu.Item.AttackItem:addParam("UseTiamat", "Use Tiamat/Hydra", SCRIPT_PARAM_ONOFF, true)
		HMenu.Item.AttackItem:addParam("UseTitanic", "Use Titanic Hydra", SCRIPT_PARAM_ONOFF, true)
		HMenu.Item.AttackItem:addParam("UseCutlass", "Use Bilgewater Cutlass", SCRIPT_PARAM_ONOFF, true)
		HMenu.Item.AttackItem:addParam("UseBOTRK", "Use BOTRK", SCRIPT_PARAM_ONOFF, true)
		HMenu.Item.AttackItem:addParam("UseYoumu", "Use Youmus Blade", SCRIPT_PARAM_ONOFF, true)
		HMenu.Item.AttackItem:addParam("UseGunblade", "Use Hextech Gunblade", SCRIPT_PARAM_ONOFF, true)

--[[Anti CC]]--

	HMenu.Item:addSubMenu("[HeRo Jarvan - Anti CC]", "DefItem")
		HMenu.Item.DefItem:addParam("EnableACC", "Enable AntiCC", SCRIPT_PARAM_ONOFF, true)
		HMenu.Item.DefItem:addParam("UseQSS", "Use Quicksilver Sash", SCRIPT_PARAM_ONOFF, true)
		HMenu.Item.DefItem:addParam("UseDervish", "Use Dervish Blade", SCRIPT_PARAM_ONOFF, true)

--[[Auto]]--

	HMenu:addSubMenu("[HeRo Jarvan - Auto]", "Auto")
		HMenu.Auto:addParam("autoPOT", "Auto Potions Usage", SCRIPT_PARAM_ONOFF, true)
 		HMenu.Auto:addParam("autoPOTHealth", "% Health for autoPOT", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
	
--[[Escape]]--
	
	HMenu:addSubMenu("[HeRo Jarvan - Escape]", "Escape")
		HMenu.Escape:addParam("EnableEscape", "Escape", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("S"))
	
--[[Blacklist]]--
	
	HMenu:addSubMenu("[HeRo Jarvan - Ult Blacklist]", "ultb")
		for i, enemy in pairs(GetEnemyHeroes()) do
			HMenu.ultb:addParam(enemy.charName, "Use ult on: "..enemy.charName, SCRIPT_PARAM_ONOFF, true)
		end
	
--[[Drawings]]--
	
	HMenu:addSubMenu("[HeRo Jarvan - Drawings]", "Drawings")
		HMenu.Drawings:addParam("AllDraw", "Enable or Disable all Draws", SCRIPT_PARAM_ONOFF, true)
		HMenu.Drawings:addParam("DrawAA", "Draw AA Range", SCRIPT_PARAM_ONOFF, true)
		HMenu.Drawings:addParam("DrawQ", "Draw Q Range", SCRIPT_PARAM_ONOFF, true)	
		HMenu.Drawings:addParam("DrawW", "Draw W Range", SCRIPT_PARAM_ONOFF, true)
		HMenu.Drawings:addParam("DrawE", "Draw E Range", SCRIPT_PARAM_ONOFF, true)
		HMenu.Drawings:addParam("DrawR", "Draw R Range", SCRIPT_PARAM_ONOFF, true)
	
--[[Target Selector]]--
	
	HMenu:addSubMenu("[HeRo Jarvan - Target Selector]", "targetSelector")
		HMenu.targetSelector:addTS(ts)
		ts.name = "Focus"

--[[Predictions]]--

	HMenu:addSubMenu("[Prediction]", "Prediction")
  		HMenu.Prediction:addParam("activePred", "Prediction (require reload)", SCRIPT_PARAM_LIST, 1, {"VPred", "DPred", "FHPred", "KPred"})
  		if HMenu.Prediction.activePred == 1 then
    		if FileExist(LIB_PATH .. "VPrediction.lua") then
      			require "VPrediction"
      			VP = VPrediction()
      			HMenu.Prediction:addParam("QVPHC", "Q HitChance", SCRIPT_PARAM_SLICE, 2, 1, 5, 0)
      			HMenu.Prediction:addParam("EVPHC", "E HitChance", SCRIPT_PARAM_SLICE, 2, 1, 5, 0)
      			PrintChat("<font color='#F0F8FF'><b>VPrediction Found!</b></font>")
    		end
  		elseif HMenu.Prediction.activePred == 2 then
    		if VIP_USER and FileExist(LIB_PATH.."DivinePred.lua") and FileExist(LIB_PATH.."DivinePred.luac") then
      			require "DivinePred"
      			DP = DivinePred()
      			HMenu.Prediction:addParam("QHC", "Q HitChance %", SCRIPT_PARAM_SLICE, 75, 50, 100, 0)
      			HMenu.Prediction:addParam("EHC", "E HitChance %", SCRIPT_PARAM_SLICE, 75, 50, 100, 0)
      			PrintChat("<font color='#F0F8FF'><b>Divine Prediction Found!</b></font>")
    		end
  		elseif HMenu.Prediction.activePred == 3 then
    		if FHPrediction.GetVersion() ~= nil then
      			if FHPrediction.GetVersion() >= 0.24 then
        			FHPred = true
        			PrintChat("<font color='#F0F8FF'><b>FHPrediction Found!</b></font>")
        			HMenu.Prediction:addParam("infoFH", "FHPrediction found!", SCRIPT_PARAM_INFO, "")
      			end
    		else
      			PrintChat("<font color='#F0F8FF'><b>FHPrediction don't Loaded!</b></font>")
    		end
  		elseif HMenu.Prediction.activePred == 4 then
    		if FileExist(LIB_PATH.."KPrediction.lua") then
      			require "KPrediction"
      			KP = KPrediction()
      			HMenu.Prediction:addParam("QKPHC", "Q HitChance", SCRIPT_PARAM_SLICE, 1.5, 1, 2, 1)
      			HMenu.Prediction:addParam("EKPHC", "E HitChance", SCRIPT_PARAM_SLICE, 1.5, 1, 2, 1)
      			PrintChat("<font color='#F0F8FF'><b>KPrediction Found!</b></font>")
    	end  
  end

--[[PermaShow]]--
	
	IDPerma = HMenu.Combo:permaShow("ComboMode")
	HMenu.permaShowEdit(IDPerma, "lText", "[Combo Mode]")
	HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)

  IDPerma = HMenu.Combo:permaShow("Burst")
  HMenu.permaShowEdit(IDPerma, "lText", "[Burst Mode]")
  HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)

	IDPerma = HMenu.Harass:permaShow("HS")
	HMenu.permaShowEdit(IDPerma, "lText", "[Harass]")
	HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)
	
	IDPerma = HMenu.Clear:permaShow("LaneClear")
	HMenu.permaShowEdit(IDPerma, "lText", "[Lane Clear]")
	HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)
	
	IDPerma = HMenu.JClear:permaShow("JungleClear")
	HMenu.permaShowEdit(IDPerma, "lText", "[Jungle Clear]")
	HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)

	IDPerma = HMenu.Escape:permaShow("EnableEscape")
	HMenu.permaShowEdit(IDPerma, "lText", "[Escape]")
	HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)

	IDPerma = HMenu.Combo:permaShow("ComboSaveEQ")
	HMenu.permaShowEdit(IDPerma, "lText", "[Always save E+Q for Combo mode]")
	HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)	
	
	IDPerma = HMenu.Prediction:permaShow("activePred")
	HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)	
end

--[[OnTick]]--

function OnTick()
	ts:update()
	enemyMinions 	= minionManager(MINION_ENEMY, 1000, myHero, MINION_SORT_MAXHEALTH_ASC)
	jungleMinions = minionManager(MINION_JUNGLE, 1100, myHero, MINION_SORT_MAXHEALTH_DEC)
	if myHero.dead then return end
	spell_check()
	
	if HMenu.Combo.ComboMode then
		JarvanCombo()
	end

	if HMenu.KillSteal.Steal then
		KSteal()
	end

	if HMenu.Harass.HS then
		if ((myHero.mana*100)/myHero.maxMana) <= HMenu.Harass.HarassMana then return end
		Harass()
	end

	if HMenu.Clear.LaneClear then
		if ((myHero.mana*100)/myHero.maxMana) <= HMenu.Clear.ClearMana then return end
		enemyMinions:update()
		LCLR()
	end

	if HMenu.JClear.JungleClear then
		if ((myHero.mana*100)/myHero.maxMana) <= HMenu.JClear.JClearMana then return end
		jungleMinions:update()
		JCLR()
	end
	
	if UltActive then
		if CountEnemyHeroInRange(650) == 0 then
			CastSpell(_R)
		end
	end
	
	if HMenu.Escape.EnableEscape then
		EQEscape()
    CastYoumu()
	end

	if HMenu.Auto.autoPOT and not REGENTIME then
   		AutoPotion()
  	end 

  	if HMenu.Item.UseItem then
    	FindItems()
  	end

  	if UNDERCC and HMenu.Item.UseItem and HMenu.Item.DefItem.EnableACC then
    	if HMenu.Item.DefItem.UseQSS and QSS then
      		CastQSS()
    	end
    
    if HMenu.Item.DefItem.UseDervish and DERVISH then
      CastDervish()
    end
  	end
end

--[[Combo]]--

function JarvanCombo()
  if HMenu.Combo.Burst then
    BurstCombo()
  end

	if HMenu.Combo.ComboEQ then
		ComboEQ()
	end

	if HMenu.Combo.ComboQ then
		ComboQ()
	end
	
	if HMenu.Combo.ComboE then
		ComboE()
	end
	
	if HMenu.Combo.ComboW then
		ComboW()
	end
	
	if HMenu.Combo.ComboR then
		ComboR()
	end
end

--[[ComboEQ]]--

function BurstCombo()
  if not Eready and not Qready and not Wready and not Rready then return end
  if ValidTarget(ts.target, 830) then
    CastTITANIC()
    CastTiamat()
    CastYoumu()
    CastBOTRK()
    CastE(ts.target)
    DelayAction(function() CastQ(ts.target) end, 0.2)
    DelayAction(function() CastR(ts.target) end, 0.4)
    if GetDlina(myHero, ts.target) <= 525 then
      CastW()
    end
  end
end


function ComboEQ()
	if not Eready and not Qready then return end
	if ValidTarget(ts.target, 830) then
		CastE(ts.target)
		DelayAction(function() CastQ(ts.target) end, 0.2)
	end
end

--[[ComboQ]]--

function ComboQ()
	if HMenu.Combo.ComboSaveEQ or not Qready then return end
	if ValidTarget(ts.target, 770) then
		CastQ(ts.target)
		end
	end

--[[ComboE]]--

function ComboE()
	if HMenu.Combo.ComboSaveEQ or not Eready then return end
	if ValidTarget(ts.target, 830) then
		CastE(ts.target)
		end
		end

--[[ComboW]]--

function ComboW()
if not HMenu.Combo.ComboW or not Wready then return end
  if ValidTarget(ts.target, 520) then
		CastSpell(_W)
	end
end

--[[ComboR]]--

function ComboR()
if HMenu.Combo.ComboR and blCheck(ts.target) then
	if ValidTarget(ts.target, 650) then
	CastSpell(_R, ts.target)
	end
	end
end

--[[KillSteal]]--

function KSteal()
	if HMenu.KillSteal.EQSteal then
		EQSteal()
	end

	if HMenu.KillSteal.QSteal then
		QSteal()
	end

	if HMenu.KillSteal.ESteal then
		ESteal()
	end

	if HMenu.KillSteal.RSteal then
		RSteal()
	end
end

--[[KillStealEQ]]--

function EQSteal()
	if not Eready and not Qready then return end
	if ValidTarget(ts.target, 830) then
		if ts.target.health < getDmg("Q", ts.target, myHero) + getDmg("E", ts.target, myHero) then
		CastE(ts.target)
		DelayAction(function() CastQ(ts.target) end, 0.2)
		end
	end
end

--[[KillStealQ]]--

function QSteal()
	if not Qready then return end
	if ValidTarget(ts.target, 770) then
		if ts.target.health < getDmg("Q", ts.target, myHero) then
		CastQ(ts.target)
		end
	end
end

--[[KillStealE]]--

function ESteal()
	if not Eready then return end
	if ValidTarget(ts.target, 830) then
		if ts.target.health < getDmg("E", ts.target, myHero) then
		CastE(ts.target)
		end
	end
end

--[[KillStealR]]--

function RSteal()
		if not Rready then return end
		if ValidTarget(ts.target, 650) then
			if ts.target.health < getDmg("R", ts.target, myHero) then
			CastSpell(_R, ts.target)
		end
	end
end

--[[Harass]]--

function Harass()
	if HMenu.Harass.HarassEQ then
		HarassEQ()
	end

	if HMenu.Harass.HarassQ then
		HarassQ()
	end
	
	if HMenu.Harass.HarassE then
		HarassE()
	end
	
	if HMenu.Harass.HarassW then
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
	if HMenu.Combo.ComboSaveEQ or not Qready then return end
	if ValidTarget(ts.target, 770) then
		CastQ(ts.target)
		end
end

--[[HarassE]]--

function HarassE()
	if HMenu.Combo.ComboSaveEQ or not Eready then return end
	if ValidTarget(ts.target, 830) then
		CastE(ts.target)
		end
	end

--[[HarassW]]--

function HarassW()
if not HMenu.Harass.HarassW or not Wready then return end
  if ValidTarget(ts.target, 520) then
		CastSpell(_W)
	end
end

--[[LaneClear]]--

function LCLR()
	if HMenu.Clear.LaneClearQE then
		LCLREQ()
	end

	if HMenu.Clear.LineClearQ then
		LCLRQ()
	end
	
	if HMenu.Clear.LineClearE then
		LCLRE()
	end
	
	if HMenu.Clear.LineClearW then
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
	if HMenu.Combo.ComboSaveEQ or not Qready then return end
	for _, minions in pairs(enemyMinions.objects) do
		if ValidTarget(minions, 770) then
			CasrQ(minions)
		end
	end
end

--[[LaneClearE]]--

function LCLRE()
	if HMenu.Combo.ComboSaveEQ or not Qready then return end
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
	if HMenu.JClear.JungleClearQE then
		JCLREQ()
	end

	if HMenu.JClear.JungleClearQ then
		JCLRQ()
	end
	
	if HMenu.JClear.JungleClearE then
		JCLRE()
	end
	
	if HMenu.JClear.JungleClearW then
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
	if HMenu.Combo.ComboSaveEQ or not Qready then return end
	for _, jminions in pairs(jungleMinions.objects) do
		if ValidTarget(jminions, 770) then
			CastQ(jminions)
		end
	end
end

--[[JungleClearE]]--

function JCLRE()
	if HMenu.Combo.ComboSaveEQ or not Qready then return end
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
	if HMenu.Drawings.AllDraw then
	
		if HMenu.Drawings.DrawQ and Qready then
			DrawCircle(myHero.x, myHero.y, myHero.z, 700, ARGB(255, 0, 0, 80))
		end	

		if HMenu.Drawings.DrawW and Wready then
			DrawCircle(myHero.x, myHero.y, myHero.z, 525, ARGB(255, 0, 0, 80))
		end

		if HMenu.Drawings.DrawE and Eready then
			DrawCircle(myHero.x, myHero.y, myHero.z, 830, ARGB(255, 0, 0, 80))
		end

		if HMenu.Drawings.DrawAA then
			DrawCircle(myHero.x, myHero.y, myHero.z, 250, ARGB(255, 0, 0, 80))
		end
	
		if HMenu.Drawings.DrawR and Rready then
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
	if ts.target ~= nil and HMenu.ultb[target.charName] then
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
    if HitChance >= HMenu.Prediction.QVPHC then
      CastSpell(_Q, CastPosition.x, CastPosition.z)
    end
  end
  if DP ~= nil then
    local state,hitPos,perc = DP:predict(nil,unit,myHero,SkillShot.TYPE.LINE,VARS.Q.SPEED,VARS.Q.RANGE,VARS.Q.WIDTH,VARS.Q.DELAY*1000,0,{Minions = false,Champions = false})
    if perc >= HMenu.Prediction.QHC then
      CastSpell(_Q, hitPos.x, hitPos.z)
    end
  end
  if FHPred and HMenu.Prediction.activePred == 3 then
    local CastPosition, hc, info = FHPrediction.GetPrediction("Q", unit)
    if hc > 0 and CastPosition ~= nil then
      CastSpell(_Q, CastPosition.x, CastPosition.z)
    end
  end
  if KP ~= nil then
    local CastPosition, hc = KP:GetPrediction(JQ, unit, myHero)
    if hc >= HMenu.Prediction.QKPHC then
      CastSpell(_Q, CastPosition.x, CastPosition.z)
    end
  end
end

--[[CastE]]--

function CastE(unit)
  if unit == nil and Eready then return end
  if VP ~= nil then
    local CastPosition, HitChance = VP:GetLineCastPosition(unit, VARS.E.DELAY, VARS.E.WIDTH, VARS.E.RANGE, VARS.E.SPEED, myHero, true)
    if HitChance >= HMenu.Prediction.EVPHC then
      CastSpell(_E, CastPosition.x, CastPosition.z)
    end
  end
  if DP ~= nil then
    local state,hitPos,perc = DP:predict(nil,unit,myHero,SkillShot.TYPE.CIRCLE,VARS.E.SPEED,VARS.E.RANGE,VARS.E.WIDTH,VARS.E.DELAY*1000,0,{Minions = false,Champions = false})
    if perc >= HMenu.Prediction.EHC then
      CastSpell(_E, hitPos.x, hitPos.z)
    end
  end
  if FHPred and HMenu.Prediction.activePred == 3 then
    local CastPosition, hc, info = FHPrediction.GetPrediction("E", unit)
    if hc > 0 and CastPosition ~= nil then
      CastSpell(_E, CastPosition.x, CastPosition.z)
    end
  end
  if KP ~= nil then
    local CastPosition, hc = KP:GetPrediction(JE, unit, myHero)
    if hc >= HMenu.Prediction.EKPHC then
      CastSpell(_E, CastPosition.x, CastPosition.z)
    end
  end
end

--[[CastW]]--

function CastW()
  if Wready and ValidTarget(ts.target, 525) then
    CastSpell(_W)
  end
end

--[[CastR]]--

function CastR(unit)
  if unit == nil then return end
    if ValidTarget(unit, 650) and blCheck(unit) then
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
  if (HMenu.Item.AttackItem.UseTiamat) then
    GetTiamat()
  end
  if (HMenu.Item.AttackItem.UseTitanic) then
    GetTitanic()
  end
  if (HMenu.Item.AttackItem.UseBOTRK) then
    GetBOTRK()
  end
  if (HMenu.Item.AttackItem.UseCutlass) then
    GetCutlass()
  end
  if (HMenu.Item.AttackItem.UseYoumu) then
    GetYoumu()
  end
  if (HMenu.Item.AttackItem.UseGunblade) then
    GetGunblade()
  end
  if (HMenu.Item.DefItem.UseQSS) then
    GetQSS()
  end
  if (HMenu.Item.DefItem.UseDervish) then
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
      if (((myHero.health*100)/myHero.maxHealth) <= HMenu.Auto.autoPOTHealth and not REGENTIME) then
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

--[[End]]--
