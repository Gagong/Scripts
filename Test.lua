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
local VP = nil
local ts
local HMenu
local Qready, Wready, Eready, Rready = false, false, false, false
require 'VPrediction'

function OnLoad()
	FindUpdates()
	DelayAction(function() PrintChat("<font color='#FF0000'><b>[HeRo Jarvan] </b></font>".."<font color='#00BFFF'><b>Loaded. Version </b></font>" " ..version.. " ) end, 4.0)
	ultActive = false
	Variables()
	ts = TargetSelector(TARGET_LESS_CAST, 870, DAMAGE_PHYSICAL)
	VP = VPrediction()
	HMenu = scriptConfig("Hero Jarvan", "Hero Jarvan")
	
	--[[Combo]]--
	
	HMenu:addSubMenu("[HeRo Jarvan - Combo]", "Combo")
	HMenu.Combo:addParam("ComboMode", "Combo mode", SCRIPT_PARAM_ONKEYDOWN, false, 32)
	HMenu.Combo:addParam("ComboEQ", "Use Q+E in Combo", SCRIPT_PARAM_ONOFF, true)
	HMenu.Combo:addParam("ComboSaveEQ", "Always save E+Q for Combo mode", SCRIPT_PARAM_ONOFF, false)
	HMenu.Combo:addParam("ComboQ", "Use Q in Combo", SCRIPT_PARAM_ONOFF, true)
	HMenu.Combo:addParam("ComboW", "Use W in Combo", SCRIPT_PARAM_ONOFF, true)
	HMenu.Combo:addParam("ComboE", "Use E in Combo", SCRIPT_PARAM_ONOFF, true)
	HMenu.Combo:addParam("ComboR", "Use R in Combo", SCRIPT_PARAM_ONOFF, true)
	HMenu.Combo:addParam("UseItemC", "Use Items in Combo", SCRIPT_PARAM_ONOFF, true)
	
	--[[KillSteal]]--
	
	HMenu:addSubMenu("[HeRo Jarvan - KillSteal]", "KillSteal")
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
	HMenu.Harass:addParam("UseItemH", "Use Items in Harass", SCRIPT_PARAM_ONOFF, true)
	
	--[[LaneClear]]--
	
	HMenu:addSubMenu("[HeRo Jarvan - LaneClear]", "Clear")
	HMenu.Clear:addParam("LaneClear", "Laneclear with spells", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
	HMenu.Clear.addParam("LaneClearQE", "Use E+Q Combo in LineClear", SCRIPT_PARAM_ONOFF, false)
	HMenu.Clear:addParam("LaneClearQ", "Use Q in Laneclear", SCRIPT_PARAM_ONOFF, true)
	HMenu.Clear:addParam("LaneClearE", "Use E in Laneclear", SCRIPT_PARAM_ONOFF, true)
	HMenu.Clear:addParam("LaneClearW", "Use W in Laneclear", SCRIPT_PARAM_ONOFF, true)
	HMenu.Clear:addParam("UseItemL", "Use Items in LaneClear", SCRIPT_PARAM_ONOFF, true)
	
	--[[JungleClear]]--
	
	HMenu:addSubMenu("[HeRo Jarvan - JungleClear]", "JClear")
	HMenu.JClear:addParam("JungleClear", "Jungleclear with spells", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
	HMenu.JClear:addParam("JungleClearEQ", "Use E+Q Combo in LineClear", SCRIPT_PARAM_ONOFF, true)
	HMenu.JClear:addParam("JungleClearQ", "Use Q in Jungleclear", SCRIPT_PARAM_ONOFF, true)
	HMenu.JClear:addParam("JungleClearE", "Use E in Jungleclear", SCRIPT_PARAM_ONOFF, true)
	HMenu.JClear:addParam("JungleClearW", "Use W in Jungleclear", SCRIPT_PARAM_ONOFF, true)
	HMenu.JClear:addParam("UseItemJ", "Use Items in Jungleclear", SCRIPT_PARAM_ONOFF, true)
	
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
	
	--[[PermaShow]]--
	
	IDPerma = HMenu.Combo:permaShow("ComboMode")
	HMenu.permaShowEdit(IDPerma, "lText", "[Combo Mode]")
	HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)

	IDPerma = HMenu.Harass:permaShow("HS")
	HMenu.permaShowEdit(IDPerma, "lText", "[Harass]")
	HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)
	
	IDPerma = HMenu.Clear:permaShow("LaneClear")
	HMenu.permaShowEdit(IDPerma, "lText", "[Lane Clear]")
	HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)
	
	IDPerma = HMenu.JungleClear:permaShow("JungleClear")
	HMenu.permaShowEdit(IDPerma, "lText", "[Jungle Clear]")
	HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)

	IDPerma = HMenu.Escape:permaShow("EnableEscape")
	HMenu.permaShowEdit(IDPerma, "lText", "[Escape]")
	HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)

	IDPerma = HMenu.Combo:permaShow("ComboSaveEQ")
	HMenu.permaShowEdit(IDPerma, "lText", "[Always save E+Q for Combo mode]")
	HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)	
	
	DelayAction(function() PrintChat("HeRo Jarvan Version " ..version.. " Loaded.") end, 4)
end

function Variables()
	AARange = 250
	Q = {Range = 700, Wigth = 70, Speed = math.huge, Delay = 0.5}
	W = {Range = 525, Wigth = 525, Speed = nil, Delay = 0.5}
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

	if HMenu.Harass.HS then
		Harass()
	end

	if HMenu.Clear.LaneClear then
		LCLR()
	end

	if HMenu.JClear.JungleClear then
		JCLR()
	end
	
	if UltActive then
		if ValidTarget(ts.target, 650) == 0 then
			CastSpell(_R)
		end
	end
	
	if HMenu.Escape.EnableEscape then
		EQEscape()
	end
end

function spell_check()
	Qready = (myHero:CanUseSpell(_Q) == READY)
	Wready = (myHero:CanUseSpell(_W) == READY)
	Eready = (myHero:CanUseSpell(_E) == READY)
	Rready = (myHero:CanUseSpell(_R) == READY)
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
			DelayAction(function() ultActive = true end, 3.5)
		end
	end

function OnDeleteteObj(obj)
	if obj == nil then return end
		if obj.name:lower():find("jarvancataclysm_sound") then
			ultActive = false
			DelayAction(function() ultActive = false end, 3.5)
		end
	end

function EQEscape()
  myHero:MoveTo(mousePos.x, mousePos.z)
		if Eready and Qready then
			MousePos = Vector(mousePos.x, mousePos.y, mousePos.z)
			CastSpell(_E, mousePos.x, mousePos.z)
			DelayAction(function() CastSpell(_Q, mousePos.x, mousePos.z) end, 0.35)
			myHero:MoveTo(mousePos.x, mousePos.z)
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
	
	if HMenu.Combo.ComboW then
		ComboW()
	end
	
	if HMenu.Combo.ComboR then
		ComboR()
	end
end

function ComboEQ()
	if not Eready and not Qready then return end
	if ValidTarget(ts.target, 770) then
		local CastPosition, HitChance, Position = VP:GetCircularCastPosition(ts.target, 0.5, 180, 870, 1000, myHero, false)
		if HitChance >= 2 then
			CastSpell(_E, CastPosition.x, CastPosition.z)
			DelayAction(function() CastSpell(_Q, CastPosition.x, CastPosition.z) end, 0.35)
		end
	end
end

function ComboQ()
	if HMenu.Combo.ComboSaveEQ or not Qready then return end
	if ValidTarget(ts.target, 770) then
		local CastPosition, HitChance, Position = VP:GetLineCastPosition(ts.target, 0.5, 180, 770, 1000, myHero, false)
		if HitChance >= 2 then
			CastSpell(_Q, CastPosition.x, CastPosition.z)
		end
	end
end

function ComboE()
	if HMenu.Combo.ComboSaveEQ or not Eready then return end
	if ValidTarget(ts.target, 830) then
		local CastPosition, HitChance, Position = VP:GetCircularCastPosition(ts.target, 0.5, 70, 870, 1000, myHero, false)
		if HitChance >= 2 then
			CastSpell(_E, CastPosition.x, CastPosition.z)
		end
	end
end

function ComboW()
if not HMenu.Combo.ComboW or not Wready then return end
  if ValidTarget(ts.target, 520) then
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

function HarassEQ()
	if not Eready and not Qready then return end
	if ValidTarget(ts.target, 770) then
		local CastPosition, HitChance, Position = VP:GetCircularCastPosition(ts.target, 0.5, 180, 870, 1000, myHero, false)
		if HitChance >= 2 then
			CastSpell(_E, CastPosition.x, CastPosition.z)
			DelayAction(function() CastSpell(_Q, CastPosition.x, CastPosition.z) end, 0.35)
		end
	end
end

function HarassQ()
	if HMenu.Combo.ComboSaveEQ or not Qready then return end
	if ValidTarget(ts.target, 770) then
		local CastPosition, HitChance, Position = VP:GetLineCastPosition(ts.target, 0.5, 180, 770, 1000, myHero, false)
		if HitChance >= 2 then
			CastSpell(_Q, CastPosition.x, CastPosition.z)
		end
	end
end

function HarassE()
	if HMenu.Combo.ComboSaveEQ or not Eready then return end
	if ValidTarget(ts.target, 830) then
		local CastPosition, HitChance, Position = VP:GetCircularCastPosition(ts.target, 0.5, 70, 870, 1000, myHero, false)
		if HitChance >= 2 then
			CastSpell(_E, CastPosition.x, CastPosition.z)
		end
	end
end

function HarassW()
if not HMenu.Harass.HarassW or not Wready then return end
  if ValidTarget(ts.target, 520) then
		CastSpell(_W)
	end
end

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

function LCLREQ()
	if not Eready and not Qready then return end
	for _, minion in pairs(minionManager(MINION_ENEMY, 870, myHero, MINION_SORT_HEALTH_ASC).objects) do
		if ValidTarget(minion, 770) then
			local CastPosition, HitChance, Position = VP:GetCircularCastPosition(minion, 0.5, 180, 770, 1000, myHero, false)
				CastSpell(_E, CastPosition.x, CastPosition.z)
				DelayAction(function() CastSpell(_Q, CastPosition.x, CastPosition.z) end, 0.35)
			end
		end
end

function LCLRQ()
	if HMenu.Combo.ComboSaveEQ or not Qready then return end
	for _, minion in pairs(minionManager(MINION_ENEMY, 770, myHero, MINION_SORT_HEALTH_ASC).objects) do
		if ValidTarget(minion, 770) then
			local CastPosition, HitChance, Position = VP:GetCircularCastPosition(minion, 0.5, 180, 770, 1000, myHero, false)
				CastSpell(_Q, CastPosition.x, CastPosition.z)
			end
		end
end

function LCLRE()
	if HMenu.Combo.ComboSaveEQ or not Qready then return end
	for _, minion in pairs(minionManager(MINION_ENEMY, 830, myHero, MINION_SORT_HEALTH_ASC).objects) do
		if ValidTarget(minion, 830) then
			local CastPosition, HitChance, Position = VP:GetCircularCastPosition(minion, 0.5, 75, 830, 1000, myHero, false)
				CastSpell(_E, CastPosition.x, CastPosition.z)
			end
		end
end

function LCLRW()
	if not Wready then return end
	for _, minion in pairs(minionManager(MINION_ENEMY, 525, myHero, MINION_SORT_HEALTH_ASC).objects) do
		if ValidTarget(minion, 525) then
				CastSpell(_W)
			end
		end
end

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

function JCLREQ()
	if not Eready and not Qready then return end
	for _, minion in pairs(minionManager(MINION_JUNGLE, 870, myHero, MINION_SORT_MAXHEALTH_DEC).objects)
		if ValidTarget(minion, 770) then
			local CastPosition, HitChance, Position = VP:GetCircularCastPosition(minion, 0.5, 180, 770, 1000, myHero, false)
				CastSpell(_E, CastPosition.x, CastPosition.z)
				DelayAction(function() CastSpell(_Q, CastPosition.x, CastPosition.z) end, 0.35)
			end
		end

function JCLRQ()
	if HMenu.Combo.ComboSaveEQ or not Qready then return end
	for _, minion in pairs(minionManager(MINION_JUNGLE, 770, myHero, MINION_SORT_MAXHEALTH_DEC).objects)
		if ValidTarget(minion, 770) then
			local CastPosition, HitChance, Position = VP:GetCircularCastPosition(minion, 0.5, 180, 770, 1000, myHero, false)
				CastSpell(_Q, CastPosition.x, CastPosition.z)
			end
		end

function JCLRE()
	if HMenu.Combo.ComboSaveEQ or not Qready then return end
	for _, minion in pairs(minionManager(MINION_JUNGLE, 830, myHero, MINION_SORT_MAXHEALTH_DEC).objects)
		if ValidTarget(minion, 830) then
			local CastPosition, HitChance, Position = VP:GetCircularCastPosition(minion, 0.5, 75, 830, 1000, myHero, false)
				CastSpell(_E, CastPosition.x, CastPosition.z)
			end
		end

function JCLRW()
	if not Wready then return end
	for _, minion in pairs(minionManager(MINION_JUNGLE, 525, myHero, MINION_SORT_MAXHEALTH_DEC).objects)
		if ValidTarget(minion, 525) then
				CastSpell(_W)
			end
		end


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

function Update()
	DownloadFile("http://"..serveradress..scriptadress.."/HeRo Jarvan.lua",SCRIPT_PATH.."HeRo Jarvan.lua", function ()
	PrintChat("<font color='#FF0000'><b>[HeRo Jarvan] </b></font>".."<font color='#00BFFF'><b>Updated, press 2xF9.</b></font>")
	end)
end
