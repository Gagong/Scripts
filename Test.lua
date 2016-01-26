if myHero.charName ~= "JarvanIV" then return end

local version = "1.0"
local SCRIPT_NAME = "HeRo Jarvan"
local SOURCELIB_URL = "https://raw.github.com/TheRealSource/public/master/common/SourceLib.lua"
local SOURCELIB_PATH = LIB_PATH.."SourceLib.lua"
if FileExist(SOURCELIB_PATH) then
    require("SourceLib")
else
    DOWNLOADING_SOURCELIB = true
    DownloadFile(SOURCELIB_URL, SOURCELIB_PATH, function() print("Required libraries downloaded successfully, please reload") end)
end

if DOWNLOADING_SOURCELIB then 
print("Downloading required libraries, please wait...") return 
end


local Require = Require("SourceLib")
Require:Add("vPrediction", "https://raw.github.com/Hellsing/BoL/master/common/VPrediction.lua")

Require:Check()

if Require.downloadNeeded == true then return end

require 'VPrediction'

local VP = nil
local ts
local HMenu

local Qready, Wready, Eready, Rready = false, false, false, false

function OnLoad()
	ultActive = false
	EnemyMinions = minionManager(MINION_ENEMY, 700, myHero, MINION_SORT_MAXHEALTH_DEC)
	jungleMinions = minionManager(MINION_JUNGLE, 700, myHero, MINION_SORT_MAXHEALTH_DEC)
	Variables()
	ts = TargetSelector(TARGET_LESS_CAST, 870, DAMAGE_PHYSICAL)
	
	HMenu = scriptConfig("Hero Jarvan", "Hero Jarvan")
	VP = VPrediction()

	HMenu:addSubMenu("[HeRo Jarvan - Combo]", "Combo")
	HMenu.Combo:addParam("ComboMode", "Combo mode", SCRIPT_PARAM_ONKEYDOWN, false, 32)
	HMenu.Combo:addParam("ComboEQ", "Use Q+E in Combo", SCRIPT_PARAM_ONOFF, true)
	HMenu.Combo:addParam("ComboSaveEQ", "Always save E+Q for Combo mode", SCRIPT_PARAM_ONOFF, false)
	HMenu.Combo:addParam("ComboQ", "Use Q in Combo", SCRIPT_PARAM_ONOFF, true)
	HMenu.Combo:addParam("ComboW", "Use W in Combo", SCRIPT_PARAM_ONOFF, true)
	HMenu.Combo:addParam("ComboE", "Use E in Combo", SCRIPT_PARAM_ONOFF, true)
	HMenu.Combo:addParam("ComboR", "Use R in Combo", SCRIPT_PARAM_ONOFF, true)
	HMenu.Combo:addParam("minR", "Auto Ultimate if can hit X enemies", SCRIPT_PARAM_SLICE, 2, 0, 5, 0)
	HMenu.Combo:addParam("AutoUlt", "Use Auto Ultimate", SCRIPT_PARAM_ONOFF, true)
	
	HMenu:addSubMenu("[HeRo Jarvan - KillSteal]", "KillSteal")
	HMenu.KillSteal:addParam("QSteal", "Use Q", SCRIPT_PARAM_ONOFF, true)
	HMenu.KillSteal:addParam("ESteal", "Use E", SCRIPT_PARAM_ONOFF, true)
	HMenu.KillSteal:addParam("RSteal", "Use R", SCRIPT_PARAM_ONOFF, false)

	HMenu:addSubMenu("[HeRo Jarvan - Autokill]", "Autokill")
	HMenu.Autokill:addParam("ALLIN", "Enable AutoKill", SCRIPT_PARAM_ONOFF, true)	
	
	HMenu:addSubMenu("[HeRo Jarvan - Harass]", "Harass")
	HMenu.Harass:addParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
	
	HMenu:addSubMenu("[HeRo Jarvan - Laneclear]", "LaneClear")
	HMenu.LaneClear:addParam("LaneClear", "Laneclear with spells", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
	HMenu.LaneClear:addParam("LaneclearQ", "Use Q in Laneclear", SCRIPT_PARAM_ONOFF, true)
	HMenu.LaneClear:addParam("LaneclearE", "Use E in Laneclear", SCRIPT_PARAM_ONOFF, true)
	HMenu.LaneClear:addParam("LCLRMana", "Use Spells if mana is over %", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)
	
	HMenu:addSubMenu("[HeRo Jarvan - JungleClear]", "JungleClear")
	HMenu.JungleClear:addParam("JungleClear", "Jungleclear with spells", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
	HMenu.JungleClear:addParam("JungleClearQ", "Use Q in Jungleclear", SCRIPT_PARAM_ONOFF, true)
	HMenu.JungleClear:addParam("JungleClearE", "Use E in Jungleclear", SCRIPT_PARAM_ONOFF, true)
	HMenu.JungleClear:addParam("JungleClearW", "Use W in Jungleclear", SCRIPT_PARAM_ONOFF, true)
	HMenu.JungleClear:addParam("JungleClearMana", "Use Spells if mana is over %", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)
	HMenu.JungleClear:addParam("UseItem", "Use Items in Jungleclear", SCRIPT_PARAM_ONOFF, true)
	
	HMenu:addSubMenu("[HeRo Jarvan - Ult Blacklist]", "ultb")
	for i, enemy in pairs(GetEnemyHeroes()) do
		HMenu.ultb:addParam(enemy.charName, "Use ult on: "..enemy.charName, SCRIPT_PARAM_ONOFF, true)
	end
	
	HMenu:addSubMenu("[HeRo Jarvan - Drawings]", "Drawings")
	HMenu.Drawings:addParam("AllDraw", "Enable or Disable all Draws", SCRIPT_PARAM_ONOFF, true)
	HMenu.Drawings:addParam("DrawAA", "Draw AA Range", SCRIPT_PARAM_ONOFF, true)
	HMenu.Drawings:addParam("DrawQ", "Draw Q Range", SCRIPT_PARAM_ONOFF, true)	
	HMenu.Drawings:addParam("DrawW", "Draw W Range", SCRIPT_PARAM_ONOFF, true)
	HMenu.Drawings:addParam("DrawE", "Draw E Range", SCRIPT_PARAM_ONOFF, true)
	HMenu.Drawings:addParam("DrawR", "Draw R Range", SCRIPT_PARAM_ONOFF, true)
	
	HMenu:addSubMenu("[HeRo Jarvan - Target Selector]", "targetSelector")
	HMenu.targetSelector:addTS(ts)
	ts.name = "Focus"

	--[[IDPerma = HMenu:permaShow("ComboMode")
	HMenu.permaShowEdit(IDPerma, "lText", "[Combo Mode]")
	HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)

	IDPerma = HMenu:permaShow("Harass")
	HMenu.permaShowEdit(IDPerma, "lText", "[Harass]")
	HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)
	
	IDPerma = HMenu:permaShow("LaneClear")
	HMenu.permaShowEdit(IDPerma, "lText", "[Lane Clear]")
	HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)
	
	IDPerma = HMenu:permaShow("JungleClear")
	HMenu.permaShowEdit(IDPerma, "lText", "[Jungle Clear]")
	HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)

	IDPerma = HMenu:permaShow("ComboSaveEQ")
	HMenu.permaShowEdit(IDPerma, "lText", "[Always save E+Q for Combo mode]")
	HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)
	
	IDPerma = HMenu:permaShow("AutoUlt")
	HMenu.permaShowEdit(IDPerma, "lText", "[Use Auto Ultimate]")
	HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)	

	IDPerma = HMenu:permaShow("minR")
	HMenu.permaShowEdit(IDPerma, "lText", "[Auto Ultimate if can hit X enemies]")
	HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)

	IDPerma = HMenu:permaShow("ALLIN")
	HMenu.permaShowEdit(IDPerma, "lText", "[Enable AutoKill]")
	HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)
]]--
	DelayAction(function() PrintChat("HeRo Jarvan Version " ..version.. " Loaded.") end, 4)
end

function Variables()
	AARange = 175
	Q = {Range = 700, Wigth = 70, Speed = math.huge, Delay = 0.5}
	W = {Range = 300, Wigth = 300, Speed = nil, Delay = 0.5}
	E = {Range = 830, Wigth = 75, Speed = math.huge, Delay = 0.5}
	R = {Range = 650, Wigth = 325, Speed = nil, Delay = 0.5}
end

function OnTick()
	if myHero.dead then return end
	EnemyMinions:update()
	jungleMinions:update()
	spell_check()
	ts:update()
	
	if HMenu.Combo.ComboMode then
		JarvanCombo()
	end
	
	if UltActive then
		if CountEnemyHeroInRange(Variables.R.Width) == 0 then
			CastSpell(_R)
		end
	end
	
	if HMenu.AutoUlt then AutoUlt() end
	
end

function spell_check()
	Qready = (myHero:CanUseSpell(_Q) == READY)
	Wready = (myHero:CanUseSpell(_W) == READY)
	Eready = (myHero:CanUseSpell(_E) == READY)
	Rready = (myHero:CanUseSpell(_R) == READY)
end

function GetDamageSpell()
	local QDamage
		QLevel = myHero:GetSpellData(_Q).level
	if QLevel == 1 then
		QDamage = 70 + (1.2*myHero.totalDamage)
	elseif QLevel == 2 then
		QDamage = 115 + (1.2*myHero.totalDamage)
	elseif QLevel == 3 then
		QDamage = 160 + (1.2*myHero.totalDamage)
	elseif QLevel == 4 then
		QDamage = 205 + (1.2*myHero.totalDamage)
	elseif QLevel == 5 then
		SpellDamage = 250 + (1.2*myHero.totalDamage)
	end
	return QDamage
	end

function GetDamageSpell()	
	local EDamage
		ELevel = myHero:GetSpellData(_E).level
	if ELevel == 1 then
		EDamage = 60 + (0.8*myHero.ap)
	elseif ELevel == 2 then
		EDamage = 105 + (0.8*myHero.ap)
	elseif ELevel == 3 then
		EDamage = 150 + (0.8*myHero.ap)
	elseif ELevel == 4 then
		EDamage = 195 + (0.8*myHero.ap)
	elseif ELevel == 5 then
		EDamage = 240 + (0.8*myHero.ap)
	end
	return EDamage
	end
	
function GetDamageSpell()	
	local RDamage
	RLevel = myHero:GetSpellData(_R).level
	if QLevel == 1 then
		RDamage = 200 + (1.2*myHero.totalDamage)
	elseif QLevel == 2 then
		RDamage = 325 + (1.2*myHero.totalDamage)
	elseif QLevel == 3 then
		RDamage = 450 + (1.2*myHero.totalDamage)
	end
	return RDamage
end

function AutoUlt()
local target = ts.target
	for i, enemy in ipairs(GetEnemyHeroes()) do
		if enemy ~= nil and GetDistance(enemy) < 650 and not UltActive then
			if CountEnemies(Rwidth, enemy) >= HMenu.Combo.minR and blCheck(enemy) then
				CastSpell(_R, enemy)
			end
		end
	end
end

function CountEnemies(range, unit)
	local Enemies = 0
	for _, enemy in ipairs(GetEnemyHeroes()) do
		if ValidTarget(enemy) and GetDistance(enemy, unit) < (range or math.huge) then
			Enemies = Enemies + 1
		end
	end
	return Enemies
end

function ManaCheck(unit, ManaValue)
	if unit.mana < (unit.maxMana * (ManaValue/100))
	then return true
	else
		return false
	end
end

function HealthCheck(unit, HealthValue)
	if unit.health < (unit.maxHealth * (HealthValue/100))
	then return true
	else
		return false
	end
end

function blCheck(target)
	if target ~= nil and HMenu.ultb[target.charName] then
		return true
	else
		return false
	end
end

function OnCreateObj(obj)
if obj == nil then return end
	if obj.name:lower():find("jarvancataclysm_sound") then
	ultActive = true
	DelayAction(function() ultActive = false end, 3.5)
	end
	end

function OnDeleteteObj(obj)
if obj == nil then return end
	if obj.name:lower():find("jarvancataclysm_sound") then
	ultActive = true
	DelayAction(function() ultActive = false end, 3.5)
	end
	end

function JarvanCombo()
	if HMenu.Combo.ComboEQ then
		ComboEQ()
	end

	if HMenu.Combo.ComboQ then
		ComboQ()
	end
	
	if HMenu.Combo.ComboE then
		ComboE()
	end
	
	if HMenu.Combo.comboW then
		ComboW()
	end
	
	if HMenu.Combo.comboR then
		ComboR()
	end
end

function ComboEQ()
	if not Eready and not Qready then return end
	if ValidTarget(ts.target, 770) then
		local CastPosition, HitChance, Position = VP:GetCircularCastPosition(ts.target, 0.5, 70, 870, 1000, myHero, false)
		if HitChance >= 2 then
			CastSpell(_E, CastPosition.x, CastPosition.z)
			DelayAction(function() CastSpell(_Q, CastPosition.x, CastPosition.z) end, 0.35)
		end
	end
end

function ComboQ()
	if HMenu.Combo.ComboSaveEQ or not Qready then return end
	if ValidTarget(ts.target, 770) then
		local CastPosition, HitChance, Position = VP:GetLineCastPosition(ts.target, 0.5, 70, 870, 1000, myHero, false)
		if HitChance >= 2 then
			CastSpell(_Q, CastPosition.x, CastPosition.z)
		end
	end
end

function ComboE()
	if HMenu.Combo.ComboSaveEQ or not Eready then return end
	if ValidTarget(ts.target, 770) then
		local CastPosition, HitChance, Position = VP:GetCircularCastPosition(ts.target, 0.5, 70, 870, 1000, myHero, false)
		if HitChance >= 2 then
			CastSpell(_E, CastPosition.x, CastPosition.z)
		end
	end
end

function ComboW()
if HMenu.Combo.ComboW or not Wready then return end
	if CountEnemyHeroInRange(280) >= 1 then
		CastSpell(_W)
	end
end

function ComboR()
if HMenu.Combo.ComboR then
	if not Rready then return end
	if ValidTarget(ts.target, 650) then
		CastSpell(_R, ts.target)
	end
	end
end

function OnDraw()
	if myHero.dead then return end

	if HMenu.Drawings.AllDraw then
	
		if HMenu.Drawings.DrawQ and Qready then
			DrawCircle(myHero.x, myHero.y, myHero.z, 700, ARGB(255, 0, 0, 80))
		end	

		if HMenu.Drawings.DrawW and Wready then
			DrawCircle(myHero.x, myHero.y, myHero.z, 300, ARGB(255, 0, 0, 80))
		end

		if HMenu.Drawings.DrawE and Eready then
			DrawCircle(myHero.x, myHero.y, myHero.z, 830, ARGB(255, 0, 0, 80))
		end

		if HMenu.Drawings.drawAA then
			DrawCircle(myHero.x, myHero.y, myHero.z, 250, ARGB(255, 0, 0, 80))
		end
	
		if HMenu.Drawings.drawCR and Rready then
			DrawCircle(myHero.x, myHero.y, myHero.z, 650, ARGB(255, 0, 0, 80))
		end
	end
end
