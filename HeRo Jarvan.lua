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
local VP = nil
local ts
local HMenu
local Qready, Wready, Eready, Rready = false, false, false, false
require 'VPrediction'

--[[OnLoad]]--

function OnLoad()
	FindUpdates()
	ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 900, DAMAGE_PHYSICAL)
	DelayAction(function() PrintChat("<font color='#FF0000'><b>[HeRo Jarvan] </b></font><font color='#00BFFF'><b>Loaded.</b></font>") end, 4.0)
	ultActive = false
	Variables()
	
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
	
--[[LaneClear]]--
	
	HMenu:addSubMenu("[HeRo Jarvan - LaneClear]", "Clear")
		HMenu.Clear:addParam("LaneClear", "LaneClear with spells", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
		HMenu.Clear:addParam("LaneClearQE", "Use E+Q Combo in LineClear", SCRIPT_PARAM_ONOFF, false)
		HMenu.Clear:addParam("LaneClearQ", "Use Q in LaneClear", SCRIPT_PARAM_ONOFF, true)
		HMenu.Clear:addParam("LaneClearE", "Use E in LaneClear", SCRIPT_PARAM_ONOFF, true)
		HMenu.Clear:addParam("LaneClearW", "Use W in LaneClear", SCRIPT_PARAM_ONOFF, true)
		HMenu.Clear:addParam("UseItemL", "Use Items in LaneClear", SCRIPT_PARAM_ONOFF, true)
	
--[[JungleClear]]--
	
	HMenu:addSubMenu("[HeRo Jarvan - JungleClear]", "JClear")
		HMenu.JClear:addParam("JungleClear", "Jungleclear with spells", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
		HMenu.JClear:addParam("JungleClearEQ", "Use E+Q Combo in LineClear", SCRIPT_PARAM_ONOFF, true)
		HMenu.JClear:addParam("JungleClearQ", "Use Q in JungleClear", SCRIPT_PARAM_ONOFF, true)
		HMenu.JClear:addParam("JungleClearE", "Use E in JungleClear", SCRIPT_PARAM_ONOFF, true)
		HMenu.JClear:addParam("JungleClearW", "Use W in JungleClear", SCRIPT_PARAM_ONOFF, true)
		HMenu.JClear:addParam("UseItemJ", "Use Items in JungleClear", SCRIPT_PARAM_ONOFF, true)
	
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
	
	IDPerma = HMenu.JClear:permaShow("JungleClear")
	HMenu.permaShowEdit(IDPerma, "lText", "[Jungle Clear]")
	HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)

	IDPerma = HMenu.Escape:permaShow("EnableEscape")
	HMenu.permaShowEdit(IDPerma, "lText", "[Escape]")
	HMenu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)

	IDPerma = HMenu.Combo:permaShow("ComboSaveEQ")
	HMenu.permaShowEdit(IDPerma, "lText", "[Always save E+Q for Combo mode]")
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
		CastItems()
	end

	if HMenu.KillSteal.Steal then
		KSteal()
	end

	if HMenu.Harass.HS then
		Harass()
	end

	if HMenu.Clear.LaneClear then
		enemyMinions:update()
		LCLR()
		CastItemsFarm()
	end

	if HMenu.JClear.JungleClear then
		jungleMinions:update()
		JCLR()
		CastItemsJFarm()
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

--[[Combo]]--

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

--[[ComboEQ]]--

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

--[[ComboQ]]--

function ComboQ()
	if HMenu.Combo.ComboSaveEQ or not Qready then return end
	if ValidTarget(ts.target, 770) then
		local CastPosition, HitChance, Position = VP:GetLineCastPosition(ts.target, 0.5, 180, 770, 1000, myHero, false)
		if HitChance >= 2 then
			CastSpell(_Q, CastPosition.x, CastPosition.z)
		end
	end
end

--[[ComboE]]--

function ComboE()
	if HMenu.Combo.ComboSaveEQ or not Eready then return end
	if ValidTarget(ts.target, 830) then
		local CastPosition, HitChance, Position = VP:GetCircularCastPosition(ts.target, 0.5, 70, 870, 1000, myHero, false)
		if HitChance >= 2 then
			CastSpell(_E, CastPosition.x, CastPosition.z)
		end
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
	if not Rready then return end
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

	if HMenu.KillSteal.ESteal then
		ESteal()
	end
end

--[[KillStealEQ]]--

function EQSteal()
	if not Eready and not Qready then return end
	if ValidTarget(ts.target, 770) then
		if ts.target.health < getDmg("Q", ts.target, myHero) + getDmg("E", ts.target, myHero) then
		local CastPosition, HitChance, Position = VP:GetCircularCastPosition(ts.target, 0.5, 180, 870, 1000, myHero, false)
		if HitChance >= 2 then
			CastSpell(_E, CastPosition.x, CastPosition.z)
			DelayAction(function() CastSpell(_Q, CastPosition.x, CastPosition.z) end, 0.35)
		end
	end
end

--[[KillStealQ]]--

function QSteal()
	if not Qready then return end
	if ValidTarget(ts.target, 770) then
		if ts.target.health < getDmg("Q", ts.target, myHero) then
		local CastPosition, HitChance, Position = VP:GetLineCastPosition(ts.target, 0.5, 180, 770, 1000, myHero, false)
		if HitChance >= 2 then
			CastSpell(_Q, CastPosition.x, CastPosition.z)
		end
	end
end

--[[KillStealE]]--

function ESteal()
	if not Eready then return end
	if ValidTarget(ts.target, 830) then
		if ts.target.health < getDmg("E", ts.target, myHero) then
		local CastPosition, HitChance, Position = VP:GetCircularCastPosition(ts.target, 0.5, 70, 870, 1000, myHero, false)
		if HitChance >= 2 then
			CastSpell(_E, CastPosition.x, CastPosition.z)
		end
	end
end

--[[KillStealR]]--

function RSteal()
	if HMenu.Combo.ComboR and blCheck(ts.target) then
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
		local CastPosition, HitChance, Position = VP:GetCircularCastPosition(ts.target, 0.5, 180, 870, 1000, myHero, false)
		if HitChance >= 2 then
			CastSpell(_E, CastPosition.x, CastPosition.z)
			DelayAction(function() CastSpell(_Q, CastPosition.x, CastPosition.z) end, 0.35)
		end
	end
end

--[[HarassQ]]--

function HarassQ()
	if HMenu.Combo.ComboSaveEQ or not Qready then return end
	if ValidTarget(ts.target, 770) then
		local CastPosition, HitChance, Position = VP:GetLineCastPosition(ts.target, 0.5, 180, 770, 1000, myHero, false)
		if HitChance >= 2 then
			CastSpell(_Q, CastPosition.x, CastPosition.z)
		end
	end
end

--[[HarassE]]--

function HarassE()
	if HMenu.Combo.ComboSaveEQ or not Eready then return end
	if ValidTarget(ts.target, 830) then
		local CastPosition, HitChance, Position = VP:GetCircularCastPosition(ts.target, 0.5, 70, 870, 1000, myHero, false)
		if HitChance >= 2 then
			CastSpell(_E, CastPosition.x, CastPosition.z)
		end
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
	local CastPosition, HitChance, Position = VP:GetCircularCastPosition(minions, 0.5, 180, 870, 1000, myHero, false)
		if HitChance >= 2 then
		if ValidTarget(minions, 770) then
			CastSpell(_E, minions)
			DelayAction(function() CastSpell(_Q, CastPosition.x, CastPosition.z) end, 0.35)
		end
	end
end
end

--[[LaneClearQ]]--

function LCLRQ()
	if HMenu.Combo.ComboSaveEQ or not Qready then return end
	for _, minions in pairs(enemyMinions.objects) do
	local CastPosition, HitChance, Position = VP:GetCircularCastPosition(minions, 0.5, 180, 870, 1000, myHero, false)
		if HitChance >= 2 then
		if ValidTarget(minions, 770) then
			CastSpell(_Q, CastPosition.x, CastPosition.z)
		end
	end
end
end

--[[LaneClearE]]--

function LCLRE()
	if HMenu.Combo.ComboSaveEQ or not Qready then return end
	for _, minions in pairs(enemyMinions.objects) do
		if ValidTarget(minions, 830) then
			CastSpell(_E, minions)
		end
	end
end

--[[LaneClearW]]--

function LCLRW()
	if not Wready then return end
	for _, minions in pairs(enemyMinions.objects) do
		if ValidTarget(minions, 525) then
			CastSpell(_W)
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
	local CastPosition, HitChance, Position = VP:GetCircularCastPosition(jminions, 0.5, 180, 870, 1000, myHero, false)
		if HitChance >= 2 then
		if ValidTarget(jminions, 770) then
			CastSpell(_E, jminions)
			DelayAction(function() CastSpell(_Q, CastPosition.x, CastPosition.z) end, 0.35)
		end
	end
end
end

--[[JungleClearQ]]--

function JCLRQ()
	if HMenu.Combo.ComboSaveEQ or not Qready then return end
	for _, jminions in pairs(jungleMinions.objects) do
	local CastPosition, HitChance, Position = VP:GetCircularCastPosition(jminions, 0.5, 180, 870, 1000, myHero, false)
		if HitChance >= 2 then
		if ValidTarget(jminions, 770) then
			CastSpell(_Q, CastPosition.x, CastPosition.z)
		end
	end
end
end

--[[JungleClearE]]--

function JCLRE()
	if HMenu.Combo.ComboSaveEQ or not Qready then return end
	for _, jminions in pairs(jungleMinions.objects) do
		if ValidTarget(jminions, 830) then
			CastSpell(_E, jminions)
		end
	end
end

--[[JungleClearW]]--

function JCLRW()
	if not Wready then return end
	for _, jminions in pairs(jungleMinions.objects) do
		if ValidTarget(jminions, 525) then
			CastSpell(_W)
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


--[[Variables]]--

function Variables()
	AARange = 250
	Q = {Range = 700, Wigth = 70, Speed = math.huge, Delay = 0.5}
	W = {Range = 525, Wigth = 525, Speed = nil, Delay = 0.5}
	E = {Range = 830, Wigth = 75, Speed = math.huge, Delay = 0.5}
	R = {Range = 650, Wigth = 325, Speed = nil, Delay = 0.5}
end

--[[SpellCheck]]--

function spell_check()
	Qready = (myHero:CanUseSpell(_Q) == READY)
	Wready = (myHero:CanUseSpell(_W) == READY)
	Eready = (myHero:CanUseSpell(_E) == READY)
	Rready = (myHero:CanUseSpell(_R) == READY)
end

--[[BlockList]]--

function blCheck(ts.target)
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
			DelayAction(function() ultActive = true end, 3.5)
		end
	end

--[[OnDeleteObj]]--	

function OnDeleteteObj(obj)
	if obj == nil then return end
		if obj.name:lower():find("jarvancataclysm_sound") then
			ultActive = false
			DelayAction(function() ultActive = false end, 3.5)
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

--[[Items Found]]--

___GetInventorySlotItem = rawget(_G, "GetInventorySlotItem")
 	_G.GetInventorySlotItem = GetSlotItem
  	_G.ITEM_1 = 06
  	_G.ITEM_2 = 07
  	_G.ITEM_3 = 08
  	_G.ITEM_4 = 09
  	_G.ITEM_5 = 10
  	_G.ITEM_6 = 11
 	_G.ITEM_7 = 12
ItemNames = {
		    [3144]        = "BilgewaterCutlass",
		    [3748]		  =	"TitanicHydra",
			[3153]        = "ItemSwordOfFeastAndFamine",
			[3405]        = "TrinketSweeperLvl1",
			[3166]        = "TrinketTotemLvl1",
		  	[3361]        = "TrinketTotemLvl3",
		  	[3362]        = "TrinketTotemLvl4",
		  	[2003]        = "RegenerationPotion",
		  	[3146]        = "HextechGunblade",
		  	[3187]        = "HextechSweeper",
		  	[3364]        = "TrinketSweeperLvl3",
		  	[3074]        = "ItemTiamatCleave",
		  	[3077]        = "ItemTiamatCleave",
		  	[3340]        = "TrinketTotemLvl1",
		 	[3090]        = "ZhonyasHourglass",
		  	[3142]        = "YoumusBlade",
			[3157]        = "ZhonyasHourglass",
		 	[3350]        = "TrinketTotemLvl2",
		 	[3140]        = "QuicksilverSash",
		  	[3139]        = "ItemMercurial",
		  	[3153]		  = "Blade Of The Ruined King"
			}

--[[GetSlotItem]]--

function GetSlotItem(id, unit)
	unit = unit or myHero
  	if (not ItemNames[id]) then
  		return ___GetInventorySlotItem(id, unit)
  	end
  	local name  = ItemNames[id]
  	for slot = ITEM_1, ITEM_7 do
  		local item = unit:GetSpellData(slot).name
  		if ((#item > 0) and (item:lower() == name:lower())) then
  			return slot
  		end
  	end
end

--[[CastItems]]--

function CastItems()
  	if ts.target ~= nil then
  		if HMenu.Combo.UseItemC then
  				local slot = GetInventorySlotItem(3153)		--[["Blade Of The Ruined King"]]--
  				if ts.target ~= nil and ValidTarget(ts.target) and not ts.target.dead and slot ~= nil and myHero:CanUseSpell(slot) == READY and GetDistance(ts.target) <= 550 then
  					CastSpell(slot, ts.target)
  				end
  			end

  			if HMenu.Combo.UseItemC then
  				local slot = GetInventorySlotItem(3144)		--[["BilgewaterCutlass"]]--
  				if ts.target ~= nil and ValidTarget(ts.target) and not ts.target.dead and slot ~= nil and myHero:CanUseSpell(slot) == READY and GetDistance(ts.target) <= 550 then
  					CastSpell(slot, ts.target)
  				end
  			end

  			if HMenu.Combo.UseItemC then
  				local slot = GetInventorySlotItem(3074)		--[["Ravenous Hydra"]]--
  				if ts.target ~= nil and ValidTarget(ts.target) and not ts.target.dead and slot ~= nil and myHero:CanUseSpell(slot) == READY and GetDistance(ts.target) <= 200 then
  					CastSpell(slot)
  				end
  			end

  			if HMenu.Combo.UseItemC then
  				local slot = GetInventorySlotItem(3748)		--[["Titanic Hydra"]]--
  				if ts.target ~= nil and ValidTarget(ts.target) and not ts.target.dead and slot ~= nil and myHero:CanUseSpell(slot) == READY then
  					CastSpell(slot)
  				end
  			end

  			if HMenu.Combo.UseItemC then
  				local slot = GetInventorySlotItem(3333)		--[["Tiamat"]]--
  				if ts.target ~= nil and ValidTarget(ts.target) and not ts.target.dead and slot ~= nil and myHero:CanUseSpell(slot) == READY then
  					CastSpell(slot)
  				end
  			end

  			if HMenu.Combo.UseItemC then
  				local slot = GetInventorySlotItem(3142)		--[["Youmuu's Ghostblade"]]--
  				if ts.target ~= nil and ValidTarget(ts.target) and not ts.target.dead and slot ~= nil and myHero:CanUseSpell(slot) == READY then
  					CastSpell(slot)
  				end
  			end
  		end
  	end
end

--[[CastItemsFarm]]--

function CastItemsFarm()
	if HMenu.Clear.UseItemL then
		for _, minions in pairs(enemyMinions.objects) do
			local slot = GetInventorySlotItem(3333)		--[["Tiamat"]]--
			if minions ~= nil and ValidTarget(minions) and not minions.dead and slot ~= nil and myHero:CanUseSpell(slot) == READY then
  				CastSpell(slot)
  			end
  		end
	end

	if HMenu.Clear.UseItemL then
		for _, minions in pairs(enemyMinions.objects) do
			local slot = GetInventorySlotItem(3074)		--[["Ravenous Hydra"]]--
			if minions ~= nil and ValidTarget(minions) and not minions.dead and slot ~= nil and myHero:CanUseSpell(slot) == READY then
  				CastSpell(slot)
  			end
  		end
	end

	if HMenu.Clear.UseItemL then
		for _, minions in pairs(enemyMinions.objects) do
			local slot = GetInventorySlotItem(3748)		--[["Titanic Hydra"]]--
			if minions ~= nil and ValidTarget(minions) and not minions.dead and slot ~= nil and myHero:CanUseSpell(slot) == READY then
  				CastSpell(slot)
  			end
  		end
	end
end

--[[CastItemsJFarm]]--

function CastItemsJFarm()
	if HMenu.JClear.UseItemJ then
		for _, jminions in pairs(enemyMinions.objects) do
			local slot = GetInventorySlotItem(3333)		--[["Tiamat"]]--
			if jminions ~= nil and ValidTarget(jminions) and not jminions.dead and slot ~= nil and myHero:CanUseSpell(slot) == READY then
  				CastSpell(slot)
  			end
  		end
	end

	if HMenu.JClear.UseItemJ then
		for _, jminions in pairs(enemyMinions.objects) do
			local slot = GetInventorySlotItem(3074)		--[["Ravenous Hydra"]]--
			if jminions ~= nil and ValidTarget(jminions) and not jminions.dead and slot ~= nil and myHero:CanUseSpell(slot) == READY then
  				CastSpell(slot)
  			end
  		end
	end

	if HMenu.JClear.UseItemJ then
		for _, jminions in pairs(enemyMinions.objects) do
			local slot = GetInventorySlotItem(3748)		--[["Titanic Hydra"]]--
			if jminions ~= nil and ValidTarget(jminions) and not jminions.dead and slot ~= nil and myHero:CanUseSpell(slot) == READY then
  				CastSpell(slot)
  			end
  		end
	end
end

--[[End]]--
