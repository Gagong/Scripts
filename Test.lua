if myHero.charName ~= "JarvanIV" then return end

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
	ts = TargetSelector(TARGET_LESS_CAST, 900, DAMAGE_PHYSICAL)
	
	HMenu = scriptConfig("Hero Jarvan", "Hero Jarvan")
	VP = VPrediction()

	HMenu:addSubMenu("[HeRo Jarvan - Combo]", "Combo")
	HMenu.Combo:addParam("ComboMode", "Combo mode", SCRIPT_PARAM_ONKEYDOWN, false, 32)
	HMenu.Combo:addParam("ComboEQ", "Use Q+E and QE in Combo", SCRIPT_PARAM_ONOFF, true)
	HMenu.Combo:addParam("ComboSaveEQ", "Always save E+Q for EQ combo", SCRIPT_PARAM_ONOFF, false)
	HMenu.Combo:addParam("ComboW", "Use W in Combo", SCRIPT_PARAM_ONOFF, true)
	HMenu.Combo:addParam("ComboE", "Use E in Combo", SCRIPT_PARAM_ONOFF, true)
	HMenu.Combo:addParam("ComboR", "Use R in Combo", SCRIPT_PARAM_ONOFF, true)
	HMenu.Combo:addParam("minR", "Auto Ultimate if can hit X enemies", SCRIPT_PARAM_SLICE, 2, 0, 5, 0)
	HMenu.Combo:addParam("AutoUlt", "Use Auto Ultimate", SCRIPT_PARAM_ONOFF, true)
	
	HMenu:addSubMenu("[HeRo Jarvan - Harass]", "Harass")
	HMenu.Harass:addParam("hHarass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
	
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
	
	
	HMenu:addSubMenu("[HeRo Jarvan - Additionals]", "Ads")
	HMenu.Ads:addParam("EQEscape", "Key for EQ Escape", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("S"))
	
	HMenu:addSubMenu("[HeRo Jarvan - Ult Blacklist]", "ultb")
	for i, enemy in pairs(GetEnemyHeroes()) do
		HMenu.ultb:addParam(enemy.charName, "Use ult on: "..enemy.charName, SCRIPT_PARAM_ONOFF, true)
	end
	
	HMenu:addSubMenu("[HeRo Jarvan - Drawings]", "Drawings")
	HMenu.Drawings:addParam("DrawCircleAA", "Draw AA Range", SCRIPT_PARAM_ONOFF, true)
	HMenu.Drawings:addParam("DrawCircleQ", "Draw Q Range", SCRIPT_PARAM_ONOFF, true)	
	HMenu.Drawings:addParam("DrawCircleW", "Draw W Range", SCRIPT_PARAM_ONOFF, true)
	HMenu.Drawings:addParam("DrawCircleE", "Draw E Range", SCRIPT_PARAM_ONOFF, true)
	HMenu.Drawings:addParam("DrawCircleEQ", "Draw EQ Range", SCRIPT_PARAM_ONOFF, true)
	HMenu.Drawings:addParam("DrawCircleR", "Draw R Range", SCRIPT_PARAM_ONOFF, true)
	
	HMenu:addSubMenu("[HeRo Jarvan - Target Selector]", "targetSelector")
	HMenu.targetSelector:addTS(ts)
	ts.name = "Focus"
		
	print("<font color = \"#33CCCC\">HeRo Jarvan by</font> <font color = \"#fff8e7\">HeRoBaNd Loaded.</font>")
end

function Variables()
	AARange = 175
	Q = {Range = 700, Wigth = 70, Speed = math.huge, Delay = 0.5}
	Q = {Range = 300, Wigth = 300, Speed = nil, Delay = 0.5}
	Q = {Range = 830, Wigth = 75, Speed = math.huge, Delay = 0.5}
	Q = {Range = 650, Wigth = 325, Speed = nil, Delay = 0.5}
end

function OnTick()
	if myHero.dead then return end
	EnemyMinions:update()
	jungleMinions:update()
	spell_check()
	ts:update()
	
	if HMenu.ComboMode then
		JarvanCombo()
	end
	
	if HMenu.EQEscape then
		mousePosEQ()
	end
	
	if HMenu.LaneClearQ and HMenu.LaneClear then
		LCLR()
	end
	
	if HMenu.jungleclear then
		JungleClear()
	end
	
	if HMenu.Harass then
		UseHarass()
	end
	
	if UltActive then
		if CountEnemyHeroInRange(Rwidth) == 0 then
			CastSpell(_R)
		end
	end
	
	killsteal()
	
	if HMenu.AutoUlt then AutoUlt() end
	
end

function spell_check()
	Qready = (myHero:CanUseSpell(_Q) == READY)
	Wready = (myHero:CanUseSpell(_W) == READY)
	Eready = (myHero:CanUseSpell(_E) == READY)
	Rready = (myHero:CanUseSpell(_R) == READY)
end

function UseHarass()
	for i, target in pairs(GetEnemyHeroes()) do
		local CastPosition, HitChance, Position = VP:GetLineCastPosition(target, 0.5, 70, 700, 1000, myHero, false)
			if target ~= nil and Qready and ValidTarget(target) and HitChance >= 2 and GetDistance(CastPosition) < 700 then
				CastSpell(_Q, CastPosition.x, CastPosition.z)
		end
	end
end

function killsteal()
	for i, enemy in ipairs (GetEnemyHeroes()) do
		QDmg = getDmg("Q", enemy, myHero)
			local CastPosition, HitChance, Position = VP:GetLineCastPosition(enemy, 0.5, 70, 700, 1000, myHero, false)
				if Qready and enemy ~= nil and not enemy.dead and enemy.health < QDmg and GetDistance(CastPosition) < QRange then
					CastSpell(_Q, pos.x, pos.z)
			end
	end
end

function LCLR()
	if jungleMinion == nil then
		for i, minion in pairs(EnemyMinions.objects) do
			if minion ~= nil and ValidTarget(minion, 700) then
				local CastPosition, HitChance, Position = VP:GetLineCastPosition(minion, 0.5, 70, 700, 1000, myHero, false)
				if HitChance >= 2 and Qready and GetDistance(CastPosition) < 700 and ManaCheck(myHero, HMenu.LaneClear.lclrMana) == false then
					CastSpell(_Q, CastPosition.x, CastPosition.z)
				end
				CastSpell(_E, minion.x, minion.z)
			end
		end
	end
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

function AutoUlt()
	for i, enemy in ipairs(GetEnemyHeroes()) do
		if enemy ~= nil and GetDistance(enemy) < Rrange and not UltActive then
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

function JarvanCombo()
	if HMenu.Combo.ComboEQ then
		ComboEQ()
	end
	
	if HMenu.Combo.ComdoE then
		ComboE()
	end
	
	if HMenu.Combo.comboW then
		ComboW()
	end
	
	if HMenu.Combo.comboR then
		ComboR()
	end
end

function ComboR()
	local target = ts.target
	if HMenu.Combo.combo then
		for i, target in pairs(GetEnemyHeroes()) do
			if target ~= nil and ValidTarget(target, Rrange) and not ultActive then
				if HealthCheck(target, HMenu.Combo.RHealth) == true and blCheck(target) then
						CastSpell(_R, target)
					end
				end
			end
		end
	end
	
	function ComboE()
		for i, target in pairs(GetEnemyHeroes()) do
				local CastPosition, HitChance, Position = VP:GetCircularCastPosition(target, 0.5, 70, 800, 1000)
				if target ~= nil and Eready and ValidTarget(target) and HitChance >= 2 and GetDistance(CastPosition) < 830 then
					CastSpell(_E, CastPosition.x, CastPosition.z)
				end
		end
end

	
function ComboW()
	if CountEnemyHeroInRange(280) >= 1 then
		CastSpell(_W)
	end
end

function ComboEQ()
    if HMenu.Combo.combo then
		if HMenu.Combo.ComboSaveEQ then
			for i, target in pairs(GetEnemyHeroes()) do
				local CastPosition, HitChance, Position = VP:GetCircularCastPosition(target, 0.5, 70, 770, 1000)
				if target ~= nil and Qready and Eready and ValidTarget(target, 770) and HitChance >= 2 then
						CastSpell(_E, CastPosition.x, CastPosition.z)
						DelayAction(function() CastSpell(_Q, CastPosition.x, CastPosition.z) end, 0.2)
					end
				end
			end
		else
			for i, target in pairs(GetEnemyHeroes()) do
				local CastPosition, HitChance, CastPosition = VP:GetCircularCastPosition(target, 0.5, 70, 770, 1000)
				if target ~= nil and ValidTarget(target, 770) and HitChance >= 2 then
						CastSpell(_E, CastPosition.x, CastPosition.z)
						DelayAction(function() CastSpell(_Q, CastPosition.x, CastPosition.z) end, 0.2)
				end
			end
		end
end

function MousePosEQ()
	if Eready and Qready then
		CastSpell(_E, mousePos.x, mousePos.z)
		CastSpell(_Q, mousePos.x, mousePos.z)
	end
	myHero:MoveTo(mousePos.x, mousePos.z)
end

function OnDraw()
	if myHero.dead then return end
	
	if HMenu.Drawings.DrawCircleEQ and Qready and Eready then
		DrawCircle(myHero.x, myHero.y, myHero.z, 800, ARGB(255, 0, 0, 80))
	end

	if HMenu.Drawings.DrawCircleQ and Qready == READY then
		DrawCircle(myHero.x, myHero.y, myHero.z, 700, ARGB(255, 0, 0, 80))
	end	

	if HMenu.Drawings.DrawCircleW and Wready == READY then
		DrawCircle(myHero.x, myHero.y, myHero.z, 300, ARGB(255, 0, 0, 80))
	end

	if HMenu.Drawings.DrawCircleE and Eready == READY then
		DrawCircle(myHero.x, myHero.y, myHero.z, 830, ARGB(255, 0, 0, 80))
	end

	if HMenu.Drawings.drawCircleAA then
		DrawCircle(myHero.x, myHero.y, myHero.z, 250, ARGB(255, 0, 0, 80))
	end
	
	if HMenu.Drawings.drawCircleR and Rready then
		DrawCircle(myHero.x, myHero.y, myHero.z, 650, ARGB(255, 0, 0, 80))
	end
end


function JungleClear()
	for i, jungleMinion in pairs(jungleMinions.objects) do
		if jungleMinion ~= nil then
			if Eready and Qready and HMenu.JungleClear.JungleClearQ and HMenu.JungleClear.JungleClearE and ManaCheck(myHero, HMenu.JungleClear.JungleClearMana) == false then
				if ValidTarget(jungleMinion, Erange) then
					CastSpell(_E, jungleMinion.x, jungleMinion.z)
					CastSpell(_Q, jungleMinion.x, jungleMinion.z)
				end
			else
				if HMenu.JungleClear.jungleclearQ and ManaCheck(myHero, HMenu.JungleClear.jungleclearMana) == false and ValidTarget(jungleMinion, Qrange) and Qready then
					CastSpell(_Q, jungleMinion.x, jungleMinion.z)
				end
				
				if HMenu.JungleClear.jungleclearE and ManaCheck(myHero, HMenu.JungleClear.jungleclearMana) == false and ValidTarget(jungleMinion, Erange) and Eready then
					CastSpell(_E, jungleMinion)
				end
			end
			if HMenu.JungleClear.jungleclearW and ManaCheck(myHero, HMenu.JungleClear.jungleclearMana) == false and ValidTarget(jungleMinion, Wrange) and Wready then
				CastSpell(_W)
			end
		end
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
	DelayAction(function() ultActive = false) end, 3.5)
	end

function OnDeleteteObj(obj)
if obj == nil then return end
	if obj.name:lower():find("jarvancataclysm_sound") then
	ultActive = true
	DelayAction(function() ultActive = false) end, 3.5)
	end
