_G.HSVersion = {1.0, "1.0", "|1.0|"}
_G.HSName = "HeRo Auto Harass"
_G.HSAuthor = "HeRoBaNd"

local Support = {"Caitlyn", "Ezreal", "Tristana", "Lucian"}

if not (myHero.charName ~= Support[1] or myHero.charName ~= Support[2] or myHero.charName ~= Support[3] or myHero.charName ~= Support[4]) then return end 

function OnLoad()
	print(myHero.charName)
	AutoUpdater()
	if myHero.charName == Support[1] then
		Caitlyn()
	elseif myHero.charName == Support[2] then
		Ezreal()
	elseif myHero.charName == Support[3] then
		Tristana()
	elseif myHero.charName == Support[4] then
		Lucian()
	end
end

class('AutoUpdater')

function AutoUpdater:__init()
	local ToUpdate = {}
    ToUpdate.Version = _G.HSVersion[1]
    ToUpdate.UseHttps = true
    ToUpdate.Host = "raw.githubusercontent.com"
    ToUpdate.VersionPath = "/HeRoBaNd/Scripts/master/Auto%20Harass.version"
    ToUpdate.ScriptPath =  "/HeRoBaNd/Scripts/master/Auto%20Harass.lua"
    ToUpdate.SavePath = SCRIPT_PATH.."/Auto Harass.lua"
    ToUpdate.CallbackUpdate = function(NewVersion,OldVersion) self:Message("Auto Harass.lua", "Auto Updater - Version: "..NewVersion.." Downloaded! Please, reload script!") end
    ToUpdate.CallbackNoUpdate = function(OldVersion) self:Message("Auto Harass.lua", "Auto Updater - No Updates Found!") end
    ToUpdate.CallbackNewVersion = function(NewVersion) self:Message("Auto Harass.lua", "Auto Updater - New Version Found: ("..NewVersion.."). Please wait until it's Downloaded!") end
    ToUpdate.CallbackError = function(NewVersion) self:Message("Auto Harass.lua", "Auto Updater - Error while Downloading! Please try again!") end
    ScriptUpdate(ToUpdate.Version, ToUpdate.UseHttps, ToUpdate.Host, ToUpdate.VersionPath, ToUpdate.ScriptPath, ToUpdate.SavePath, ToUpdate.CallbackUpdate, ToUpdate.CallbackNoUpdate, ToUpdate.CallbackNewVersion, ToUpdate.CallbackError)
    self:Message("Auto Harass.lua", "Version: ".._G.HSVersion[2].." Loaded!", 1)
end

function AutoUpdater:Message(Msg, msg, time)
    DelayAction(function() PrintChat("<b><font color=\"#FF0000\">["..Msg.."]: </font><font color=\"#F1D400\">".. msg .."</font></b>") end, time)
end

class('Caitlyn')

function Caitlyn:__init()
	self.Mode = {"Toggle", "Press Key"}
    self.PredList = {"VPred", "FHPred", "SPred", "KPred", "HPred"}
    self.ts = TargetSelector(TARGET_PRIORITY, 1000, DAMAGE_PHYSICAL)
    self.VP = nil
    self.FHPred = false
    self.SP = nil
    self.KP = nil
    self.HP = nil

    self.SpellInfo = {
    	Q = {Spell = _Q, Range = 1250, Speed = 2200, Delay = 0.625, Radius = 45, Type = "DelayLine", Width = 90, Collision = false}
    }

    self:Message("Caitlyn", "Auto Harass loaded!", 3)
    self:Global_Menu()

    AddTickCallback(function() self:OnTick() end)
    AddDrawCallback(function() self:OnDraw() end)
end

function Caitlyn:Message(Msg, msg, time)
    DelayAction(function() PrintChat("<b><font color=\"#FF0000\">["..Msg.."]: </font><font color=\"#F1D400\">".. msg .."</font></b>") end, time)
end

function Caitlyn:Global_Menu()
	self.Menu = scriptConfig("[Caitlyn] Auto Harass", "CaitlynHS")

    self.Menu:addParam("b", "-----------------------------------------------------", SCRIPT_PARAM_INFO, "")
    self.Menu:addTS(self.ts)
    self.ts.name = "Target"

    self.Menu:addParam("List", "(Require Reload!) Mode:", SCRIPT_PARAM_LIST, 1, self.Mode)

    if self.Menu.List == 1 then
    	self.Menu:addParam("Enable", "Enable Auto Harass:", SCRIPT_PARAM_ONKEYTOGGLE, false, GetKey("C"))
    elseif self.Menu.List == 2 then
    	self.Menu:addParam("Enable", "Enable Auto Harass:", SCRIPT_PARAM_ONKEYDOWN, false, GetKey("C"))
	end

	self.Menu:addSubMenu("Draw Settings: [Caitlyn] - (Q)", "CaitlynQ")
	self.Menu:addSubMenu("Spell Settings: [Caitlyn] - (Q)", "SetQ")
	self.Menu:addSubMenu("-----------------------------------------------------", "")
	
	self.Menu.SetQ:addParam("SelectPred", "(Require Reload!) Prediction:", SCRIPT_PARAM_LIST, 1, self.PredList)
	if self.Menu.SetQ.SelectPred == 1 then
	    if FileExist(LIB_PATH.."VPrediction.lua") then
	        require "VPrediction"
	        self.VP = VPrediction()
	        self.Menu.SetQ:addParam("QVPHC", "Q Hit Chance:", SCRIPT_PARAM_SLICE, 2, 1, 5, 0) 
	    end
	elseif self.Menu.SetQ.SelectPred == 2 then
	    if FileExist(LIB_PATH.."FHPrediction.lua") then
	        require "FHPrediction"
	        self.FHPred = true
	    end
	elseif self.Menu.SetQ.SelectPred == 3 then
	    if FileExist(LIB_PATH.."SPrediction.lua") then
	        require "SPrediction"
	        self.SP = SPrediction()
	        self.Menu.SetQ:addParam("QSPHC", "Q Hit Chance:", SCRIPT_PARAM_SLICE, 1.5, 0, 3, 0) 
	    end
	elseif self.Menu.SetQ.SelectPred == 4 then
	   	if FileExist(LIB_PATH.."KPrediction.lua") then
	        require "KPrediction"
	        self.KP = KPrediction()
	        self.Menu.SetQ:addParam("QKPHC", "Q Hit Chance:", SCRIPT_PARAM_SLICE, 1.75, 0, 3, 2) 
	    end
	elseif self.Menu.SetQ.SelectPred== 5 then
	    if FileExist(LIB_PATH.."HPrediction.lua") then
	        require "HPrediction"
	        self.HP = HPrediction()
	        self.Menu.SetQ:addParam("QHPHC", "Q Hit Chance:", SCRIPT_PARAM_SLICE, 1.05, 0, 3, 2)
	    end            
    end
    self.Menu.SetQ:addParam("ManaQ", "Mana Manager:", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)

	self.Menu.CaitlynQ:addParam("Enable", "Enable (Q) Draw:", SCRIPT_PARAM_ONOFF, true)
	self.Menu.CaitlunQ:addParam("Width", "Width Changer:", SCRIPT_PARAM_SLICE, 1, 1, 10, 0)
	self.Menu.CaitlunQ:addParam("Quality", "Quality Changer:", SCRIPT_PARAM_SLICE, 2, 2, 5, 0)
	self.Menu.CaitlynQ:addParam("Color", "Color Changer:", SCRIPT_PARAM_COLOR, {255, 255, 255, 255})
	self.Menu:permaShow("Enable")
	--------------------------------------------------------------------------------------------------------------------------------- 
	self.Menu:addParam("b", "-----------------------------------------------------", SCRIPT_PARAM_INFO, "")
    if VIP_USER then
        self.Menu:addParam("b1", "User: "..GetUser().." (VIP)", SCRIPT_PARAM_INFO, "")
    else
        self.Menu:addParam("b2", "User: "..GetUser().." (FREE)", SCRIPT_PARAM_INFO, "")
    end
    self.Menu:addParam("b3", "Script Version: ".._G.HSVersion[2], SCRIPT_PARAM_INFO, "")
    self.Menu:addParam("b4", "Script Author: ".._G.HSAuthor, SCRIPT_PARAM_INFO, "") 
end

function Caitlyn:OnDraw()
	if self.Menu.CaitlynQ.EnableQ and myHero:CanUseSpell(_Q) == READY then
		DrawCircle3D(myHero.x, myHero.y, myHero.z, self.SpellInfo.Q.Range, self.Menu.CaitlynQ.Width, ARGB(self.Menu.CaitlynQ.Color[1], self.Menu.CaitlynQ.Color[2], self.Menu.CaitlynQ.Color[3], self.Menu.CaitlynQ.Color[4]), self.Menu.CaitlynQ.Quality*10)
	end
end

function Caitlyn:OnTick()
	for _, enemy in pairs(GetEnemyHeroes()) do
		if self.Menu.Enable then
			if GetDistance(enemy) <= self.SpellInfo.Q.Range then
				if enemy.visible and not enemy.deat and ValidTarget(enemy, self.SpellInfo.Q.Range) then
					if myHero:CanUseSpell(_Q) == READY and (myHero.mana >= (myHero.maxMana*(self.Menu.SetQ.ManaQ*0.01))) then
						self:GetQPredict(enemy)
					end
				end
			end 
		end
	end
end

function Caitlyn:GetQPredict(unit)
	if unit == nil then return end
	local Spell = {range = self.SpellInfo.Q.Range, speed = self.SpellInfo.Q.Speed, delay = self.SpellInfo.Q.Delay, radius = self.SpellInfo.Q.Radius, type = self.SpellInfo.Q.Type, width = self.SpellInfo.Q.Width, collision = self.SpellInfo.Q.Collision}
	if VP ~= nil then
	    local CastPosition, HitChance = VP:GetLineCastPosition(unit, self.SpellInfo.Q.Delay, self.SpellInfo.Q.Width, self.SpellInfo.Q.Range, self.SpellInfo.Q.Speed, myHero, self.SpellInfo.Q.Collision)
	    if HitChance >= self.Menu.SetQ.QVPHC then
	        CastSpell(_Q, CastPosition.x, CastPosition.z)
	    end
	elseif KP ~= nil then
	    local CastPosition, hc = KP:GetPrediction(Spell, unit, myHero)
	    if hc >= self.Menu.SetQ.QKPHC then
	        CastSpell(_Q, CastPosition.x, CastPosition.z)
	    end
	elseif FHPred and Menu.SetQ.SelectPred == 3 then
	    local CastPosition, hc, info = FHPrediction.GetPrediction(Spell, unit)
	    if hc > 0 and CastPosition ~= nil and info.collision then
	        CastSpell(_Q, CastPosition.x, CastPosition.z)
	    end
	elseif SP ~= nil then
	    local CastPosition, Chance, PredPos = SP:Predict(unit, self.SpellInfo.Q.Range, self.SpellInfo.Q.Speed, self.SpellInfo.Q.Delay, self.SpellInfo.Q.Width, self.SpellInfo.Q.Collision, myHero)
	    if Chance >= self.Menu.SetQ.QSPHC then
	        CastSpell(_Q, CastPosition.x, CastPosition.z)
	    end
	elseif HP ~= nil then
	    local Position, HitChance = HPred:GetPredict(HPSkillshot({type = self.SpellInfo.Q.Type, delay = self.SpellInfo.Q.Delay, range = self.SpellInfo.Q.Rangee, speed = self.SpellInfo.Q.Speed, collisionH = self.SpellInfo.Q.Collision, collisionM = self.SpellInfo.Q.Collision, width = self.SpellInfo.Q.Width}), unit, myHero)
	    if HitChance > self.Menu.SetQ.QHPHC then
	        CastSpell(_Q, Position.x, Position.z)
	    end
	end
end

class('Ezreal')

function Ezreal:__init()
	self.Mode = {"Toggle", "Press Key"}
    self.PredList = {"VPred", "FHPred", "SPred", "KPred", "HPred"}
    self.ts = TargetSelector(TARGET_PRIORITY, 1000, DAMAGE_PHYSICAL)
    self.VP = nil
    self.FHPred = false
    self.SP = nil
    self.KP = nil
    self.HP = nil

    self.SpellInfo = {
    	Q = {Spell = _Q, Range = 1150, Speed = 2000, Delay = 0.25, Radius = 30, Type = "DelayLine", Width = 60, Collision = true},
    	W = {Spell = _W, Range = 1000, Speed = 1600, Delay = 0.25, Radius = 40, Type = "DelayLine", Width = 80, Collision = false}
    }

    self:Message("Ezreal", "Auto Harass loaded!", 3)
    self:Global_Menu()

    AddTickCallback(function() self:OnTick() end)
    AddDrawCallback(function() self:OnDraw() end)
end

function Ezreal:Message(Msg, msg, time)
    DelayAction(function() PrintChat("<b><font color=\"#FF0000\">["..Msg.."]: </font><font color=\"#F1D400\">".. msg .."</font></b>") end, time)
end

function Ezreal:Global_Menu()
    self.Menu = scriptConfig("[Ezreal] Auto Harass", "EzrealHS")

    self.Menu:addParam("b", "-----------------------------------------------------", SCRIPT_PARAM_INFO, "")
    self.Menu:addTS(self.ts)
    self.ts.name = "Target"

    self.Menu:addParam("List", "(Require Reload!) Mode:", SCRIPT_PARAM_LIST, 1, self.Mode)

    if self.Menu.List == 1 then
    	self.Menu:addParam("Enable", "Enable Auto Harass:", SCRIPT_PARAM_ONKEYTOGGLE, false, GetKey("C"))
    elseif self.Menu.List == 2 then
    	self.Menu:addParam("Enable", "Enable Auto Harass:", SCRIPT_PARAM_ONKEYDOWN, false, GetKey("C"))
	end

	self.Menu:addSubMenu("Draw Settings: [Ezreal] - (Q)", "EzrealQ")
	self.Menu:addSubMenu("Draw Settings: [Ezreal] - (W)", "EzrealW")
	self.Menu:addSubMenu("Spell Settings: [Ezreal] - (Q)", "SetQ")
	self.Menu:addSubMenu("Spell Settings: [Ezreal] - (W)", "SetW")
	self.Menu:addSubMenu("-----------------------------------------------------", "")
	
	self.Menu.SetQ:addParam("SelectPred", "(Require Reload!) Prediction:", SCRIPT_PARAM_LIST, 1, self.PredList)
	if self.Menu.SetQ.SelectPred == 1 then
	    if FileExist(LIB_PATH.."VPrediction.lua") then
	        require "VPrediction"
	        VP = VPrediction()
	        self.Menu.SetQ:addParam("QVPHC", "Q Hit Chance:", SCRIPT_PARAM_SLICE, 2, 1, 5, 0) 
	    end
	elseif self.Menu.SetQ.SelectPred == 2 then
	    if FileExist(LIB_PATH.."FHPrediction.lua") then
	        require "FHPrediction"
	        self.FHPred = true
	    end
	elseif self.Menu.SetQ.SelectPred == 3 then
	    if FileExist(LIB_PATH.."SPrediction.lua") then
	        require "SPrediction"
	        SP = SPrediction()
	        self.Menu.SetQ:addParam("QSPHC", "Q Hit Chance:", SCRIPT_PARAM_SLICE, 1.5, 0, 3, 0) 
	    end
	elseif self.Menu.SetQ.SelectPred == 4 then
	    if FileExist(LIB_PATH.."KPrediction.lua") then
	        require "KPrediction"
	        KP = KPrediction()
	        self.Menu.SetQ:addParam("QKPHC", "Q Hit Chance:", SCRIPT_PARAM_SLICE, 1.75, 0, 3, 2) 
	    end
	elseif self.Menu.SetQ.SelectPred== 5 then
	    if FileExist(LIB_PATH.."HPrediction.lua") then
	        require "HPrediction"
	        HP = HPrediction()
	        self.Menu.SetQ:addParam("QHPHC", "Q Hit Chance:", SCRIPT_PARAM_SLICE, 1.05, 0, 3, 2)
	    end            
    end
    self.Menu.SetQ:addParam("ManaQ", "Mana Manager:", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)

	self.Menu.SetW:addParam("SelectPred", "(Require Reload!) Prediction:", SCRIPT_PARAM_LIST, 1, self.PredList)
	if self.Menu.SetW.SelectPred == 1 then
	    if FileExist(LIB_PATH.."VPrediction.lua") then
	        require "VPrediction"
	        VP = VPrediction()
	        self.Menu.SetW:addParam("WVPHC", "W Hit Chance:", SCRIPT_PARAM_SLICE, 2, 1, 5, 0) 
	    end
	elseif self.Menu.SetW.SelectPred == 2 then
	    if FileExist(LIB_PATH.."FHPrediction.lua") then
	        require "FHPrediction"
	        self.FHPred = true
	    end
	elseif self.Menu.SetW.SelectPred == 3 then
	    if FileExist(LIB_PATH.."SPrediction.lua") then
	        require "SPrediction"
	        SP = SPrediction()
	        self.Menu.SetW:addParam("WSPHC", "W Hit Chance:", SCRIPT_PARAM_SLICE, 1.5, 0, 3, 0) 
	    end
	elseif self.Menu.SetW.SelectPred == 4 then
		if FileExist(LIB_PATH.."KPrediction.lua") then
	    	require "KPrediction"
	        KP = KPrediction()
	        self.Menu.SetW:addParam("WKPHC", "W Hit Chance:", SCRIPT_PARAM_SLICE, 1.75, 0, 3, 2) 
	    end
	elseif self.Menu.SetW.SelectPred== 5 then
	    if FileExist(LIB_PATH.."HPrediction.lua") then
	        require "HPrediction"
	        HP = HPrediction()
	        self.Menu.SetW:addParam("WHPHC", "W Hit Chance:", SCRIPT_PARAM_SLICE, 1.05, 0, 3, 2)
	    end            
	end
	self.Menu.SetW:addParam("ManaW", "Mana Manager:", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)

	self.Menu.EzrealQ:addParam("EnableQ", "Enable (Q) Draw:", SCRIPT_PARAM_ONOFF, true)
	self.Menu.EzrealQ:addParam("Width", "Width Changer:", SCRIPT_PARAM_SLICE, 1, 1, 10, 0)
	self.Menu.EzrealQ:addParam("Quality", "Quality Changer:", SCRIPT_PARAM_SLICE, 2, 2, 5, 0)
	self.Menu.EzrealQ:addParam("Color", "Color Changer:", SCRIPT_PARAM_COLOR, {255, 255, 255, 255})
	 	
	self.Menu.EzrealW:addParam("EnableW", "Enable (W) Draw:", SCRIPT_PARAM_ONOFF, true)
	self.Menu.EzrealW:addParam("Width", "Width Changer:", SCRIPT_PARAM_SLICE, 1, 1, 10, 0)
	self.Menu.EzrealW:addParam("Quality", "Quality Changer:", SCRIPT_PARAM_SLICE, 2, 2, 5, 0)
	self.Menu.EzrealW:addParam("Color", "Color Changer:", SCRIPT_PARAM_COLOR, {255, 255, 255, 255})

	self.Menu:permaShow("Enable")
	--------------------------------------------------------------------------------------------------------------------------------- 
	self.Menu:addParam("b", "-----------------------------------------------------", SCRIPT_PARAM_INFO, "")
    if VIP_USER then
        self.Menu:addParam("b1", "User: "..GetUser().." (VIP)", SCRIPT_PARAM_INFO, "")
    else
        self.Menu:addParam("b2", "User: "..GetUser().." (FREE)", SCRIPT_PARAM_INFO, "")
    end
    self.Menu:addParam("b3", "Script Version: ".._G.HSVersion[2], SCRIPT_PARAM_INFO, "")
    self.Menu:addParam("b4", "Script Author: ".._G.HSAuthor, SCRIPT_PARAM_INFO, "") 
end

function Ezreal:OnDraw()
	if self.Menu.EzrealQ.EnableQ and myHero:CanUseSpell(_Q) == READY then
		DrawCircle3D(myHero.x, myHero.y, myHero.z, self.SpellInfo.Q.Range, self.Menu.EzrealQ.Width, ARGB(self.Menu.EzrealQ.Color[1], self.Menu.EzrealQ.Color[2], self.Menu.EzrealQ.Color[3], self.Menu.EzrealQ.Color[4]), self.Menu.EzrealQ.Quality*10)
	end
	if self.Menu.EzrealW.EnableW and myHero:CanUseSpell(_W) == READY then
		DrawCircle3D(myHero.x, myHero.y, myHero.z, self.SpellInfo.W.Range, self.Menu.EzrealW.Width, ARGB(self.Menu.EzrealW.Color[1], self.Menu.EzrealW.Color[2], self.Menu.EzrealW.Color[3], self.Menu.EzrealW.Color[4]), self.Menu.EzrealW.Quality*10)
	end
end

function Ezreal:OnTick()
	for _, enemy in pairs(GetEnemyHeroes()) do
		if self.Menu.Enable then
			if GetDistance(enemy) <= self.SpellInfo.Q.Range then
				if enemy.visible and not enemy.deat and ValidTarget(enemy, self.SpellInfo.Q.Range) then
					if myHero:CanUseSpell(_Q) == READY and (myHero.mana >= (myHero.maxMana*(self.Menu.SetQ.ManaQ*0.01))) then
						self:GetQPredict(enemy)
					end
				end
			end 
			if GetDistance(enemy) <= self.SpellInfo.W.Range then
				if enemy.visible and not enemy.deat and ValidTarget(enemy, self.SpellInfo.W.Range) then
					if myHero:CanUseSpell(_W) == READY and (myHero.mana >= (myHero.maxMana*(self.Menu.SetW.ManaW*0.01))) then
						self:GetWPredict(enemy)
					end
				end
			end 
		end
	end
end

function Ezreal:GetQPredict(unit)
	if unit == nil then return end
	local Spell = {range = self.SpellInfo.Q.Range, speed = self.SpellInfo.Q.Speed, delay = self.SpellInfo.Q.Delay, radius = self.SpellInfo.Q.Radius, type = self.SpellInfo.Q.Type, width = self.SpellInfo.Q.Width, collision = self.SpellInfo.Q.Collision}
	if VP ~= nil then
	    local CastPosition, HitChance = VP:GetLineCastPosition(unit, self.SpellInfo.Q.Delay, self.SpellInfo.Q.Width, self.SpellInfo.Q.Range, self.SpellInfo.Q.Speed, myHero, self.SpellInfo.Q.Collision)
	    if HitChance >= self.Menu.SetQ.QVPHC then
	        CastSpell(_Q, CastPosition.x, CastPosition.z)
	    end
	elseif KP ~= nil then
	    local CastPosition, hc = KP:GetPrediction(Spell, unit, myHero)
	    if hc >= self.Menu.SetQ.QKPHC then
	        CastSpell(_Q, CastPosition.x, CastPosition.z)
	    end
	elseif FHPred and Menu.SetQ.SelectPred == 3 then
	    local CastPosition, hc, info = FHPrediction.GetPrediction(Spell, unit)
	    if hc > 0 and CastPosition ~= nil and info.collision then
	        CastSpell(_Q, CastPosition.x, CastPosition.z)
	    end
	elseif SP ~= nil then
	    local CastPosition, Chance, PredPos = SP:Predict(unit, self.SpellInfo.Q.Range, self.SpellInfo.Q.Speed, self.SpellInfo.Q.Delay, self.SpellInfo.Q.Width, self.SpellInfo.Q.Collision, myHero)
	    if Chance >= self.Menu.SetQ.QSPHC then
	        CastSpell(_Q, CastPosition.x, CastPosition.z)
	    end
	elseif HP ~= nil then
	    local Position, HitChance = HPred:GetPredict(HPSkillshot({type = self.SpellInfo.Q.Type, delay = self.SpellInfo.Q.Delay, range = self.SpellInfo.Q.Rangee, speed = self.SpellInfo.Q.Speed, collisionH = self.SpellInfo.Q.Collision, collisionM = self.SpellInfo.Q.Collision, width = self.SpellInfo.Q.Width}), unit, myHero)
	    if HitChance > self.Menu.SetQ.QHPHC then
	        CastSpell(_Q, Position.x, Position.z)
	    end
	end
end

function Ezreal:GetWPredict(unit)
	if unit == nil then return end
	local Spell = {range = self.SpellInfo.W.Range, speed = self.SpellInfo.W.Speed, delay = self.SpellInfo.W.Delay, radius = self.SpellInfo.W.Radius, type = self.SpellInfo.W.Type, width = self.SpellInfo.W.Width, collision = self.SpellInfo.W.Collision}
	if VP ~= nil then
	    local CastPosition, HitChance = VP:GetLineCastPosition(unit, self.SpellInfo.W.Delay, self.SpellInfo.W.Width, self.SpellInfo.W.Range, self.SpellInfo.W.Speed, myHero, self.SpellInfo.W.Collision)
	    if HitChance >= self.Menu.SetW.WVPHC then
	        CastSpell(_W, CastPosition.x, CastPosition.z)
	    end
	elseif KP ~= nil then
	    local CastPosition, hc = KP:GetPrediction(Spell, unit, myHero)
	    if hc >= self.Menu.SetW.WKPHC then
	        CastSpell(_W, CastPosition.x, CastPosition.z)
	    end
	elseif FHPred and Menu.SetW.SelectPred == 3 then
	    local CastPosition, hc, info = FHPrediction.GetPrediction(Spell, unit)
	    if hc > 0 and CastPosition ~= nil and info.collision then
	        CastSpell(_W, CastPosition.x, CastPosition.z)
	    end
	elseif SP ~= nil then
	    local CastPosition, Chance, PredPos = SP:Predict(unit, self.SpellInfo.W.Range, self.SpellInfo.W.Speed, self.SpellInfo.W.Delay, self.SpellInfo.W.Width, self.SpellInfo.W.Collision, myHero)
	    if Chance >= self.Menu.SetW.WSPHC then
	        CastSpell(_W, CastPosition.x, CastPosition.z)
	    end
	elseif HP ~= nil then
	    local Position, HitChance = HPred:GetPredict(HPSkillshot({type = self.SpellInfo.W.Type, delay = self.SpellInfo.W.Delay, range = self.SpellInfo.W.Rangee, speed = self.SpellInfo.W.Speed, collisionH = self.SpellInfo.W.Collision, collisionM = self.SpellInfo.W.Collision, width = self.SpellInfo.W.Width}), unit, myHero)
	    if HitChance > self.Menu.SetW.WHPHC then
	        CastSpell(_W, Position.x, Position.z)
	    end
	end
end

class('Tristana')

function Tristana:__init()
	self.Mode = {"Toggle", "Press Key"}
    self.PredList = {"VPred", "FHPred", "SPred", "KPred", "HPred"}
    self.ts = TargetSelector(TARGET_PRIORITY, 1000, DAMAGE_PHYSICAL)
    self.VP = nil
    self.FHPred = false
    self.SP = nil
    self.KP = nil
    self.HP = nil

    self.SpellInfo = {
    	E = {Spell = _E, Range = 590 + 9 * myHero.level}
    }

    self:Message("Tristana", "Auto Harass loaded!", 3)
    self:Global_Menu()

    AddTickCallback(function() self:OnTick() end)
    AddDrawCallback(function() self:OnDraw() end)
end

function Tristana:Message(Msg, msg, time)
    DelayAction(function() PrintChat("<b><font color=\"#FF0000\">["..Msg.."]: </font><font color=\"#F1D400\">".. msg .."</font></b>") end, time)
end

function Tristana:Global_Menu()
    self.Menu = scriptConfig("[Tristana] Auto Harass", "TristanaHS")

    self.Menu:addParam("b", "-----------------------------------------------------", SCRIPT_PARAM_INFO, "")
    self.Menu:addTS(self.ts)
    self.ts.name = "Target"

    self.Menu:addParam("List", "(Require Reload!) Mode:", SCRIPT_PARAM_LIST, 1, self.Mode)

    if self.Menu.List == 1 then
    	self.Menu:addParam("Enable", "Enable Auto Harass:", SCRIPT_PARAM_ONKEYTOGGLE, false, GetKey("C"))
    elseif self.Menu.List == 2 then
    	self.Menu:addParam("Enable", "Enable Auto Harass:", SCRIPT_PARAM_ONKEYDOWN, false, GetKey("C"))
	end

	self.Menu:addSubMenu("Draw Settings: [Tristana] - (E)", "TristanaE")
	self.Menu:addSubMenu("Spell Settings: [Tristana] - (E)", "SetE")
	self.Menu:addSubMenu("-----------------------------------------------------", "")
	
	self.Menu.SetE:addParam("ManaE", "Mana Manager:", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)

	self.Menu.TristanaE:addParam("EnableE", "Enable (E) Draw:", SCRIPT_PARAM_ONOFF, true)
	self.Menu.TristanaE:addParam("Width", "Width Changer:", SCRIPT_PARAM_SLICE, 1, 1, 10, 0)
	self.Menu.TristanaE:addParam("Quality", "Quality Changer:", SCRIPT_PARAM_SLICE, 2, 2, 5, 0)
	self.Menu.TristanaE:addParam("Color", "Color Changer:", SCRIPT_PARAM_COLOR, {255, 255, 255, 255})

	self.Menu:permaShow("Enable")
	--------------------------------------------------------------------------------------------------------------------------------- 
	self.Menu:addParam("b", "-----------------------------------------------------", SCRIPT_PARAM_INFO, "")
    if VIP_USER then
        self.Menu:addParam("b1", "User: "..GetUser().." (VIP)", SCRIPT_PARAM_INFO, "")
    else
        self.Menu:addParam("b2", "User: "..GetUser().." (FREE)", SCRIPT_PARAM_INFO, "")
    end
    self.Menu:addParam("b3", "Script Version: ".._G.HSVersion[2], SCRIPT_PARAM_INFO, "")
    self.Menu:addParam("b4", "Script Author: ".._G.HSAuthor, SCRIPT_PARAM_INFO, "") 
end

function Tristana:OnDraw()
	if self.Menu.TristanaE.EnableE and myHero:CanUseSpell(_E) == READY then
		DrawCircle3D(myHero.x, myHero.y, myHero.z, self.SpellInfo.E.Range, self.Menu.TristanaE.Width, ARGB(self.Menu.TristanaE.Color[1], self.Menu.TristanaE.Color[2], self.Menu.TristanaE.Color[3], self.Menu.TristanaE.Color[4]), self.Menu.TristanaE.Quality*10)
	end
end

function Tristana:OnTick()
	for _, enemy in pairs(GetEnemyHeroes()) do
		if self.Menu.Enable then
			if GetDistance(enemy) <= self.SpellInfo.E.Range then
				if enemy.visible and not enemy.deat and ValidTarget(enemy, self.SpellInfo.E.Range) then
					if myHero:CanUseSpell(_E) == READY and (myHero.mana >= (myHero.maxMana*(self.Menu.SetE.ManaQ*0.01))) then
						self:GetEPredict(enemy)
					end
				end
			end 
		end
	end
end

function Tristana:GetEPredict(unit)
	if unit == nil then return end
	if unit.visible and not unit.deat and ValidTarget(unit, self.SpellInfo.E.Range) then
		CastSpell(_E, unit)
	end
end

class('Lucian')

function Lucian:__init()
	self.Mode = {"Toggle", "Press Key"}
    self.PredList = {"VPred", "FHPred", "SPred", "KPred", "HPred"}
    self.ts = TargetSelector(TARGET_PRIORITY, 1000, DAMAGE_PHYSICAL)

    self.VP = nil
    self.FHPred = false
    self.SP = nil
    self.KP = nil
    self.HP = nil
    self.SpellInfo = {
    	Q = {Spell = _Q, Range = 750, Speed = math.huge, Delay = 0.35, Radius = 32.5, Type = "DelayLine", Width = 65, Collision = false},
    	W = {Spell = _W, Range = 900, Speed = 1600, Delay = 0.3, Radius = 80, Type = "DelayCircle", Width = 160, Collision = true}
    }

    self:Message("Lucian", "Auto Harass loaded!", 3)
    self:Global_Menu()

    AddTickCallback(function() self:OnTick() end)
    AddDrawCallback(function() self:OnDraw() end)
end

function Lucian:Message(Msg, msg, time)
    DelayAction(function() PrintChat("<b><font color=\"#FF0000\">["..Msg.."]: </font><font color=\"#F1D400\">".. msg .."</font></b>") end, time)
end

function Lucian:Global_Menu()
    self.Menu = scriptConfig("[Lucian] Auto Harass", "LucianHS")

    self.Menu:addParam("b", "-----------------------------------------------------", SCRIPT_PARAM_INFO, "")
    self.Menu:addTS(self.ts)
    self.ts.name = "Target"

    self.Menu:addParam("List", "(Require Reload!) Mode:", SCRIPT_PARAM_LIST, 1, self.Mode)

    if self.Menu.List == 1 then
    	self.Menu:addParam("Enable", "Enable Auto Harass:", SCRIPT_PARAM_ONKEYTOGGLE, false, GetKey("C"))
    elseif self.Menu.List == 2 then
    	self.Menu:addParam("Enable", "Enable Auto Harass:", SCRIPT_PARAM_ONKEYDOWN, false, GetKey("C"))
	end

	self.Menu:addSubMenu("Draw Settings: [Lucian] - (Q)", "LucianQ")
	self.Menu:addSubMenu("Draw Settings: [Lucian] - (W)", "LucianW")
	self.Menu:addSubMenu("Spell Settings: [Lucian] - (Q)", "SetQ")
	self.Menu:addSubMenu("Spell Settings: [Lucian] - (W)", "SetW")
	self.Menu:addSubMenu("-----------------------------------------------------", "")

    self.Menu.SetQ:addParam("ManaQ", "Mana Manager:", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)

	self.Menu.SetW:addParam("SelectPred", "(Require Reload!) Prediction:", SCRIPT_PARAM_LIST, 1, self.PredList)
	if self.Menu.SetW.SelectPred == 1 then
	    if FileExist(LIB_PATH.."VPrediction.lua") then
	        require "VPrediction"
	        VP = VPrediction()
	        self.Menu.SetW:addParam("WVPHC", "W Hit Chance:", SCRIPT_PARAM_SLICE, 2, 1, 5, 0) 
	    end
	elseif self.Menu.SetW.SelectPred == 2 then
	    if FileExist(LIB_PATH.."FHPrediction.lua") then
	        require "FHPrediction"
	        self.FHPred = true
	    end
	elseif self.Menu.SetW.SelectPred == 3 then
	    if FileExist(LIB_PATH.."SPrediction.lua") then
	        require "SPrediction"
	        SP = SPrediction()
	        self.Menu.SetW:addParam("WSPHC", "W Hit Chance:", SCRIPT_PARAM_SLICE, 1.5, 0, 3, 0) 
	    end
	elseif self.Menu.SetW.SelectPred == 4 then
	    if FileExist(LIB_PATH.."KPrediction.lua") then
	        require "KPrediction"
	        KP = KPrediction()
	        self.Menu.SetW:addParam("WKPHC", "W Hit Chance:", SCRIPT_PARAM_SLICE, 1.75, 0, 3, 2) 
	    end
	elseif self.Menu.SetW.SelectPred== 5 then
	    if FileExist(LIB_PATH.."HPrediction.lua") then
	        require "HPrediction"
	        HP = HPrediction()
	        self.Menu.SetW:addParam("WHPHC", "W Hit Chance:", SCRIPT_PARAM_SLICE, 1.05, 0, 3, 2)
	    end            
	end
	self.Menu.SetW:addParam("ManaW", "Mana Manager:", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)

	self.Menu.LucianQ:addParam("EnableQ", "Enable (Q) Draw:", SCRIPT_PARAM_ONOFF, true)
	self.Menu.LucianQ:addParam("Width", "Width Changer:", SCRIPT_PARAM_SLICE, 1, 1, 10, 0)
	self.Menu.LucianQ:addParam("Quality", "Quality Changer:", SCRIPT_PARAM_SLICE, 2, 2, 5, 0)
	self.Menu.LucianQ:addParam("Color", "Color Changer:", SCRIPT_PARAM_COLOR, {255, 255, 255, 255})
	self.Menu.LucianW:addParam("EnableW", "Enable (W) Draw:", SCRIPT_PARAM_ONOFF, true)
	self.Menu.LucianW:addParam("Width", "Width Changer:", SCRIPT_PARAM_SLICE, 1, 1, 10, 0)
	self.Menu.LucianW:addParam("Quality", "Quality Changer:", SCRIPT_PARAM_SLICE, 2, 2, 5, 0)
	self.Menu.LucianW:addParam("Color", "Color Changer:", SCRIPT_PARAM_COLOR, {255, 255, 255, 255})

	self.Menu:permaShow("Enable")
	--------------------------------------------------------------------------------------------------------------------------------- 
	self.Menu:addParam("b", "-----------------------------------------------------", SCRIPT_PARAM_INFO, "")
    if VIP_USER then
        self.Menu:addParam("b1", "User: "..GetUser().." (VIP)", SCRIPT_PARAM_INFO, "")
    else
        self.Menu:addParam("b2", "User: "..GetUser().." (FREE)", SCRIPT_PARAM_INFO, "")
    end
    self.Menu:addParam("b3", "Script Version: ".._G.HSVersion[2], SCRIPT_PARAM_INFO, "")
    self.Menu:addParam("b4", "Script Author: ".._G.HSAuthor, SCRIPT_PARAM_INFO, "") 
end

function Lucian:OnDraw()
	if self.Menu.LucianQ.EnableQ and myHero:CanUseSpell(_Q) == READY then
		DrawCircle3D(myHero.x, myHero.y, myHero.z, self.SpellInfo.Q.Range, self.Menu.LucianQ.Width, ARGB(self.Menu.LucianQ.Color[1], self.Menu.LucianQ.Color[2], self.Menu.LucianQ.Color[3], self.Menu.LucianQ.Color[4]), self.Menu.LucianQ.Quality*10)
	end
	if self.Menu.LucianW.EnableW and myHero:CanUseSpell(_W) == READY then
		DrawCircle3D(myHero.x, myHero.y, myHero.z, self.SpellInfo.W.Range, self.Menu.LucianW.Width, ARGB(self.Menu.LucianW.Color[1], self.Menu.LucianW.Color[2], self.Menu.LucianW.Color[3], self.Menu.LucianW.Color[4]), self.Menu.LucianW.Quality*10)
	end
end

function Lucian:OnTick()
	for _, enemy in pairs(GetEnemyHeroes()) do
		if self.Menu.Enable then
			if GetDistance(enemy) <= self.SpellInfo.Q.Range then
				if enemy.visible and not enemy.deat and ValidTarget(enemy, self.SpellInfo.Q.Range) then
					if myHero:CanUseSpell(_Q) == READY and (myHero.mana >= (myHero.maxMana*(self.Menu.SetQ.ManaQ*0.01))) then
						self:GetQPredict(enemy)
					end
				end
			end 
			if GetDistance(enemy) <= self.SpellInfo.W.Range then
				if enemy.visible and not enemy.deat and ValidTarget(enemy, self.SpellInfo.W.Range) then
					if myHero:CanUseSpell(_W) == READY and (myHero.mana >= (myHero.maxMana*(self.Menu.SetW.ManaW*0.01))) then
						self:GetWPredict(enemy)
					end
				end
			end 
		end
	end
end

function Lucian:GetQPredict(unit)
	if unit == nil then return end
	if unit.visible and not unit.deat and ValidTarget(unit, self.SpellInfo.Q.Range) then
		CastSpell(_Q, unit)
	end
end

function Lucian:GetWPredict(unit)
	if unit == nil then return end
	local Spell = {range = self.SpellInfo.W.Range, speed = self.SpellInfo.W.Speed, delay = self.SpellInfo.W.Delay, radius = self.SpellInfo.W.Radius, type = self.SpellInfo.W.Type, width = self.SpellInfo.W.Width, collision = self.SpellInfo.W.Collision}
	if VP ~= nil then
	    local CastPosition, HitChance = VP:GetLineCastPosition(unit, self.SpellInfo.W.Delay, self.SpellInfo.W.Width, self.SpellInfo.W.Range, self.SpellInfo.W.Speed, myHero, self.SpellInfo.W.Collision)
	    if HitChance >= self.Menu.SetW.WVPHC then
	        CastSpell(_W, CastPosition.x, CastPosition.z)
	    end
	elseif KP ~= nil then
	    local CastPosition, hc = KP:GetPrediction(Spell, unit, myHero)
	    if hc >= self.Menu.SetW.WKPHC then
	        CastSpell(_W, CastPosition.x, CastPosition.z)
	    end
	elseif FHPred and Menu.SetW.SelectPred == 3 then
	    local CastPosition, hc, info = FHPrediction.GetPrediction(Spell, unit)
	    if hc > 0 and CastPosition ~= nil and info.collision then
	        CastSpell(_W, CastPosition.x, CastPosition.z)
	    end
	elseif SP ~= nil then
	    local CastPosition, Chance, PredPos = SP:Predict(unit, self.SpellInfo.W.Range, self.SpellInfo.W.Speed, self.SpellInfo.W.Delay, self.SpellInfo.W.Width, self.SpellInfo.W.Collision, myHero)
	    if Chance >= self.Menu.SetW.WSPHC then
	        CastSpell(_W, CastPosition.x, CastPosition.z)
	    end
	elseif HP ~= nil then
	    local Position, HitChance = HPred:GetPredict(HPSkillshot({type = self.SpellInfo.W.Type, delay = self.SpellInfo.W.Delay, range = self.SpellInfo.W.Rangee, speed = self.SpellInfo.W.Speed, collisionH = self.SpellInfo.W.Collision, collisionM = self.SpellInfo.W.Collision, width = self.SpellInfo.W.Width}), unit, myHero)
	    if HitChance > self.Menu.SetW.WHPHC then
	        CastSpell(_W, Position.x, Position.z)
	    end
	end
end

class "ScriptUpdate"

function ScriptUpdate:__init(LocalVersion, UseHttps, Host, VersionPath, ScriptPath, SavePath, CallbackUpdate, CallbackNoUpdate, CallbackNewVersion, CallbackError)
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
-------------------------------------------------------------------------------------------------------------------------------------------------------------

