local SummonerBarrier = nil
local SummunerHeal = nil
local SummunerIgnite = nil
local SummonerExhaust = nil
local SummonerBoost = nil
local Ball = nil
local SummonerSmite = nil
local SummonerFlash = nil
local SummonerM = nil

_G.SSScriptVersion = {1.42, "1.42", "|1.42|"}
_G.SSScriptAuthor = "HeRoBaNd"

-- BoL Tools Tracker --
assert(load(Base64Decode("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"), nil, "bt", _ENV))()
TrackerLoad("B5YWDGqBAUGrO1AT")
-- BoL Tools Tracker --

function OnLoad()
    local ToUpdate = {}
    ToUpdate.Version = _G.SSScriptVersion[1]
    ToUpdate.UseHttps = true
    ToUpdate.Host = "raw.githubusercontent.com"
    ToUpdate.VersionPath = "/HeRoBaNd/Scripts/master/HeRo%20Classe's.version"
    ToUpdate.ScriptPath =  "/HeRoBaNd/Scripts/master/HeRo%20Classe's.lua"
    ToUpdate.SavePath = SCRIPT_PATH.."/HeRo Classe's.lua"
    ToUpdate.CallbackUpdate = function(NewVersion,OldVersion) print("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">HeRo</font> <font color=\"#F7CB72\"> Classe's</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: "..NewVersion.."</font></b>") end
    ToUpdate.CallbackNoUpdate = function(OldVersion) print("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">HeRo</font> <font color=\"#F7CB72\"> Classe's</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: No Updates Found!</font></b>") end
    ToUpdate.CallbackNewVersion = function(NewVersion) print("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">HeRo</font> <font color=\"#F7CB72\"> Classe's</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: New Version Found ("..NewVersion.."). Please wait until it's Downloaded!</font></b>") end
    ToUpdate.CallbackError = function(NewVersion) print("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">HeRo</font> <font color=\"#F7CB72\"> Classe's</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: Error while Downloading! Please try again!</font></b>") end
    ScriptUpdate(ToUpdate.Version, ToUpdate.UseHttps, ToUpdate.Host, ToUpdate.VersionPath, ToUpdate.ScriptPath, ToUpdate.SavePath, ToUpdate.CallbackUpdate, ToUpdate.CallbackNoUpdate, ToUpdate.CallbackNewVersion, ToUpdate.CallbackError)

    if myHero:GetSpellData(SUMMONER_1).name:find("SummonerDot") then SummunerIgnite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("SummonerDot") then SummunerIgnite = SUMMONER_2 end
    if SummunerIgnite ~= nil then
        Ignite()
    end

    if myHero:GetSpellData(SUMMONER_1).name:find("SummonerHeal") then SummunerHeal = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("SummonerHeal") then SummunerHeal = SUMMONER_2 end
    if SummunerHeal ~= nil then
        Heal()
    end

    if myHero:GetSpellData(SUMMONER_1).name:find("SummonerBarrier") then SummonerBarrier = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("SummonerBarrier") then SummonerBarrier = SUMMONER_2 end
    if SummonerBarrier ~= nil then
        Barrier()
    end

    if myHero:GetSpellData(SUMMONER_1).name:find("SummonerExhaust") then SummonerExhaust = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("SummonerExhaust") then SummonerExhaust = SUMMONER_2 end
    if SummonerExhaust ~= nil then
        Exhaust()
    end

    if myHero:GetSpellData(SUMMONER_1).name:find("SummonerBoost") then SummonerBoost = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("SummonerBoost") then SummonerBoost = SUMMONER_2 end
    if SummonerBoost ~= nil then
        Cleanse()
    end

    if myHero:GetSpellData(SUMMONER_1).name:find("SummonerMana") then SummonerM = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("SummonerMana") then SummonerM = SUMMONER_2 end
    if SummonerM ~= nil then
        Clarity()
    end

    --[[
    -------------WAIT UPL UPDATE--------------
    if myHero:GetSpellData(SUMMONER_1).name:find("SummonerSnowball") then Ball = SUMMONER_1 SKey = "D" elseif myHero:GetSpellData(SUMMONER_2).name:find("SummonerSnowball") then Ball = SUMMONER_2 SKey = "F" end
    if Ball ~= nil  then 
        Poro_Shoot()
    end
    -------------WAIT UPL UPDATE--------------
    ]]--

    if myHero:GetSpellData(SUMMONER_1).name:find("SummonerSmite") then SummonerSmite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("SummonerSmite") then SummonerSmite = SUMMONER_2 end
    if SummonerSmite ~= nil then
        Smite()
    end

    if myHero:GetSpellData(SUMMONER_1).name:find("SummonerFlash") then SummonerFlash = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("SummonerFlash") then SummonerFlash = SUMMONER_2 end
    if SummonerFlash ~= nil then
        Flash()
    end
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------WORKED FINE--------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
class("Flash")

function Flash:__init()
    
    self:Message("Flash", "Class loaded!", 3)
    self:Global_Menu()
    self:Loader()
 
end 

function Flash:Global_Menu()
    self.Menu = scriptConfig("[HeRo] Flash Class", "HeRoFlash")

    self.Menu:addParam('Key', 'You Flash Key:', SCRIPT_PARAM_ONKEYDOWN, false, GetKey('N'))
    self.Menu:addParam('FlashMaxDistance', 'Max Distance If Wall:', SCRIPT_PARAM_ONOFF, false);
    self.Menu:addParam('FlashRange', 'Draw Flash Range:', SCRIPT_PARAM_ONOFF, true)
    ------------------------------------------------------------------------------------------------------------------
    self.Menu:addParam("b", "", SCRIPT_PARAM_INFO, "")
    if VIP_USER then
        self.Menu:addParam("b1", "User: "..GetUser().." (VIP)", SCRIPT_PARAM_INFO, "")
    else
        self.Menu:addParam("b2", "User: "..GetUser().." (FREE)", SCRIPT_PARAM_INFO, "")
    end
    self.Menu:addParam("b3", "Script Version: ".._G.SSScriptVersion[2], SCRIPT_PARAM_INFO, "")
    self.Menu:addParam("b4", "Script Author: ".._G.SSScriptAuthor, SCRIPT_PARAM_INFO, "")
end

function Flash:Loader()
    self.FlashDelay = 0
    self.NoFlashSpamMsg = 0
    AddTickCallback(function() self:OnTick() end)
    AddDrawCallback(function() self:OnDraw() end)    
end

function Flash:OnDraw()
    if SummonerFlash ~= nil then
        if self.Menu.FlashRange then
            if myHero:CanUseSpell(SummonerFlash) == READY then
                self.MaxDistance = self:GetMaxLocation(450)
                _G.DrawFPSCircle(myHero.x, myHero.z, 400, RGB(255, 0, 0), 7)
                _G.DrawFPSCircle(self.MaxDistance.x, self.MaxDistance.z, 50, RGB(255, 0, 0), 7)
            end
        end
    end
end

function Flash:OnTick()
    if SummonerFlash ~= nil then
        if self.Menu.Key then
            if self:CurrentTime() - self.FlashDelay > 250 then
                self.FlashDelay = self:CurrentTime()
                if myHero:CanUseSpell(SummonerFlash) == READY then
                    self:UseFlash()
                    if os.clock() - self.NoFlashSpamMsg > 2 then
                        self.NoFlashSpamMsg = os.clock()
                        self:Message("Flash", "Flash Casted!", 0)
                    end
                end
            end
        end
    end
end

function Flash:UseFlash()
    self.MaxDistance = self:GetMaxLocation(450)
    self.UseSummonerFlash = true 
    if self.Menu.FlashMaxDistance then
        if not self:IsWall() then
            return CastSpell(SummonerFlash, mousePos.x, mousePos.z);
        end
    end
    return CastSpell(SummonerFlash, self.MaxDistance.x, self.MaxDistance.z)
end

function Flash:IsWall()
    for I = 250, 450, 50 do
        self.MaxDistance = self:GetMaxLocation(I);
        if CalculatePath(myHero, D3DXVECTOR3(self.MaxDistance.x, self.MaxDistance.y, self.MaxDistance.z)).count ~= 2 and IsWall(D3DXVECTOR3(self.MaxDistance.x, self.MaxDistance.y, self.MaxDistance.z)) then
            return true
        end
    end
    return false
end


function Flash:GetMaxLocation(Range)
    self.MouseVector = Vector(mousePos.x, mousePos.z, mousePos.y)
    self.HeroVector = Vector(myHero.x, myHero.z, myHero.y)
    self.FlashVector = ((self.MouseVector - self.HeroVector):normalized() * Range) + self.HeroVector 
    self.XV, self.ZV, self.YV = self.FlashVector:unpack()
    return {x = self.XV, y = self.YV, z = self.ZV}
end

function Flash:CurrentTime()
    return os.clock() * 1000
end

function Flash:Message(class,msg,time)
    DelayAction(function() PrintChat("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">HeRo</font> <font color=\"#F7CB72\">"..class.." Class</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: ".. msg .."</font></b>") end, time)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------WORKED FINE--------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
class("Smite")

function Smite:__init()
    
    self:Message("Smite", "Class loaded!", 3)
    self:Global_Menu()
    self:Loader()
 
end 

function Smite:Global_Menu()
    self.Menu = scriptConfig("[HeRo] Smite Class", "HeRoSmite")

    self.Menu:addParam("Enable", "Enable Auto Smite:", SCRIPT_PARAM_ONKEYTOGGLE, true, string.byte("H"))
    self.Menu:addParam("DrawSmiteRange", "Draw Smite Range:" , SCRIPT_PARAM_ONOFF, true)
    self.Menu:addParam("DrawSmiteProcess", "Draw Smite Process:", SCRIPT_PARAM_ONOFF, true)
        
    self.Menu:addSubMenu("Smite Monsters:", "Smite")
        if GetGame().map.shortName == "twistedTreeline" then
            self.Menu.Smite:addParam("Wraith", "Use Smite on: Wraith", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Smite:addParam("Golem", "Use Smite on: Golem", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Smite:addParam("Wolf", "Use Smite on: Wolf", SCRIPT_PARAM_ONOFF, true)
           self.Menu.Smite:addParam("Spiderboss", "Use Smite on: SpiderBoss", SCRIPT_PARAM_ONOFF, true)
        else
            self.Menu.Smite:addParam("Dragon", "Use Smite on: Dragon", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Smite:addParam("Baron", "Use Smite on: Baron", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Smite:addParam("RiftHerald", "Use Smite on: Baron", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Smite:addParam("Razorbeak", "Use Smite on: Wraith", SCRIPT_PARAM_ONOFF, false)
            self.Menu.Smite:addParam("Murkwolf", "Use Smite on: Wolf", SCRIPT_PARAM_ONOFF, false)
            self.Menu.Smite:addParam("Krug", "Use Smite on: Krug", SCRIPT_PARAM_ONOFF, false)
            self.Menu.Smite:addParam("Crab", "Use Smite on: Crab", SCRIPT_PARAM_ONOFF, false)
            self.Menu.Smite:addParam("Gromp", "Use Smite on: Gromp", SCRIPT_PARAM_ONOFF, false)
            self.Menu.Smite:addParam("Red", "Use Smite on: Red Buff", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Smite:addParam("Blue", "Use Smite on: Blue Buff", SCRIPT_PARAM_ONOFF, true)
        end
    ------------------------------------------------------------------------------------------------------------------
    self.Menu:addParam("b", "", SCRIPT_PARAM_INFO, "")
    if VIP_USER then
        self.Menu:addParam("b1", "User: "..GetUser().." (VIP)", SCRIPT_PARAM_INFO, "")
    else
        self.Menu:addParam("b2", "User: "..GetUser().." (FREE)", SCRIPT_PARAM_INFO, "")
    end
    self.Menu:addParam("b3", "Script Version: ".._G.SSScriptVersion[2], SCRIPT_PARAM_INFO, "")
    self.Menu:addParam("b4", "Script Author: ".._G.SSScriptAuthor, SCRIPT_PARAM_INFO, "")
end

function Smite:Loader()
    self.NoSmiteSpamMsg = 0
    AddTickCallback(function() self:OnTick() end)
    AddDrawCallback(function() self:OnDraw() end)
end

function Smite:GetSmiteDamage()
    self.level = myHero.level
    return math.max(20 * self.level + 370, 30 * self.level + 330, 40 * self.level + 240, 50 * self.level + 100)
end

function Smite:OnTick()
    self.SmiteDmg = self:GetSmiteDamage()
    for _, jminions in pairs(minionManager(MINION_JUNGLE, 1000, myHero, MINION_SORT_HEALTH_ASC).objects) do
        if not jminions.dead and jminions.visible and ValidTarget(jminions, 560) then
                local name = jminions.charName
                local name = name:sub(name:find("_")+1, name:len())
                local name = name:sub(1, (name:find("_") or name:len()+1)-1)
                if self.Menu.Smite[name] then
                if myHero:CanUseSpell(SummonerSmite) == READY and GetDistance(myHero, jminions) <= 560 and self.SmiteDmg >= jminions.health then
                    CastSpell(SummonerSmite, jminions)
                    if os.clock() - self.NoSmiteSpamMsg > 2 then
                        self.NoSmiteSpamMsg = os.clock()
                        self:Message("Smite", "Smite Casted on: "..name.."!", 0)
                    end
                end
            end
        end
    end
end

function Smite:OnDraw()
    if (self.Menu.DrawSmiteProcess and not myHero.dead and myHero:CanUseSpell(SummonerSmite) == READY) then
        self.SmiteDmg = self:GetSmiteDamage()
        for _, jminion in pairs(minionManager(MINION_JUNGLE, 1000, myHero, MINION_SORT_HEALTH_ASC).objects) do
            if not jminion.dead and jminion.visible and ValidTarget(jminion, 560) then
                local name = jminion.charName
                local name = name:sub(name:find("_")+1, name:len())
                local name = name:sub(1, (name:find("_") or name:len()+1)-1)
                if self.Menu.Smite[name] then
                    self.posMinion = WorldToScreen(D3DXVECTOR3(jminion.x, jminion.y, jminion.z))
                    self.SmiteProcess = math.round(100 - 100 * (jminion.health - self.SmiteDmg)/jminion.maxHealth)
                    if myHero:CanUseSpell(SummonerSmite) == READY and GetDistance(myHero, jminion) <= 560 then
                        DrawText("Smite Process - "..self.SmiteProcess.."%", 20, self.posMinion.x - GetTextArea("Smite Process - "..self.SmiteProcess.."%", 20).x/2, self.posMinion.y, ARGB(255,255,0,0))
                        DrawCircle(jminion.x, jminion.y, jminion.z, 1.5 * self.SmiteProcess, ARGB(255, 255 * (1 - self.SmiteProcess/100), 255 * self.SmiteProcess/100, 255*(1 - self.SmiteProcess/100)))
                        DrawCircle(jminion.x, jminion.y, jminion.z, 150, ARGB(55, 55, 155, 55))
                    end
                end
            end
        end
    end
    if self.Menu.DrawSmiteRange and not myHero.dead and myHero:CanUseSpell(SummonerSmite) then
        _G.DrawFPSCircle(myHero.x, myHero.z, 560, RGB(255, 128, 0), 7)
    end
end

function Smite:Message(class,msg,time)
    DelayAction(function() PrintChat("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">HeRo</font> <font color=\"#F7CB72\">"..class.." Class</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: ".. msg .."</font></b>") end, time)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------WAIT UPL UPDATE--------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------WAIT UPL UPDATE--------------
--[[class("Poro_Shoot")

function Poro_Shoot:__init()
    
    self:Message("Poro-Shoot", "Class loaded!", 3)
    self:PredictionLoader()
    self:Global_Menu()
    self:Loader()
 
end 

function Poro_Shoot:PredictionLoader()
    require("UPL")
    self.UPL = UPL()
    ts = TargetSelector(TARGET_PRIORITY, 2000, DAMAGE_MAGIC, true)
end


function Poro_Shoot:Global_Menu()
    self.Menu = scriptConfig("[HeRo] Poro-Shoot Class", "HeRoPoro")

    self.Menu:addParam("Enable", "Enable Auto Poro-Shoot:", SCRIPT_PARAM_ONOFF, true)
    self.Menu:addParam("Key", "You Poro-Shoot Key:", SCRIPT_PARAM_ONKEYDOWN, false, GetKey(SKey))
    self.Menu:addParam("Draw", "Enable Poro-Shoot Range Draw:", SCRIPT_PARAM_ONOFF, true)
    self.Menu:addSubMenu("Prediction:", "Prediction")
        self.UPL:AddToMenu(self.Menu.Prediction)
        --self.UPL:AddSpell(SummonerBall, {speed = 1600, delay = 0.33, range = 1580, width = 50, collision = true, aoe = false, type = "linear"})
    ------------------------------------------------------------------------------------------------------------------
    self.Menu:addParam("b", "", SCRIPT_PARAM_INFO, "")
    if VIP_USER then
        self.Menu:addParam("b1", "User: "..GetUser().." (VIP)", SCRIPT_PARAM_INFO, "")
    else
        self.Menu:addParam("b2", "User: "..GetUser().." (FREE)", SCRIPT_PARAM_INFO, "")
    end
    self.Menu:addParam("b3", "Script Version: ".._G.SSScriptVersion[2], SCRIPT_PARAM_INFO, "")
    self.Menu:addParam("b4", "Script Author: ".._G.SSScriptAuthor, SCRIPT_PARAM_INFO, "")
       
end

function Poro_Shoot:Loader()
    self.NoPoroSpamMsg = 0
    AddTickCallback(function() self:OnTick() end)
    AddDrawCallback(function() self:OnDraw() end)
end

function Poro_Shoot:OnTick()
    if self.Menu.Enable and self.Menu.Key then
        print(self.UPL.spellData[SummonerBall])
        ts:update()
        self:AutoPoroShoot()
    end
end

function Poro_Shoot:OnDraw()
    if not myHero.dead and self.Menu.Draw and myHero:CanUseSpell(SummonerBall) == READY then
        _G.DrawFPSCircle(myHero.x, myHero.z, 1580, RGB(255, 128, 0), 7)
    end
end

--local spellShot = {1200, 1600, 50, 0.33}  --range, speed, width, cast time.
function Poro_Shoot:AutoPoroShoot()
    if ValidTarget(ts.target) and ts.target.type == myHero.type then
        CastPosition, HitChance, HeroPosition = self.UPL:Predict(SummonerBall, myHero, ts.target)
        if CastPosition and HitChance > 0 then
            CastSpell(SummonerBall, CastPosition.x, CastPosition.z)
            if os.clock() - self.NoPoroSpamMsg > 2 then
                self.NoPoroSpamMsg = os.clock()
                self:Message("Poro-Shoot", "Poro Shooted on: "..ts.target, 0)
            end
        end
    end
end

function Poro_Shoot:Message(class,msg,time)
    DelayAction(function() PrintChat("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">HeRo</font> <font color=\"#F7CB72\">"..class.." Class</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: ".. msg .."</font></b>") end, time)
end]]--
-------------WAIT UPL UPDATE--------------

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------WORKED FINE--------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

class("Clarity")

function Clarity:__init()

    self:Message("Clarity", "Class loaded!", 3)
    self:Loader()
    self:Global_Menu()

end

function Clarity:Global_Menu()
    self.Menu = scriptConfig("[HeRo] Clarity Class", "HeRoClarity")

    self.Menu:addParam("Enable", "Enable Auto Clarity:", SCRIPT_PARAM_ONOFF, true)
    self.Menu:addParam("MinMana", "Mana to Use Auto Clarity:", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)
    self.Menu:addParam("ComboEnable", "Use only in Combo Mode:", SCRIPT_PARAM_ONOFF, true)
    self.Menu:addParam("Key", "You Combo Mode Key:", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    self.Menu:addParam("AllyClarity", "Use on Ally:", SCRIPT_PARAM_ONOFF, true)
    self.Menu:addParam("AllyMinMana", "Ally Mana to Use Auto Clarity:", SCRIPT_PARAM_SLICE, 10, 0, 100, 0)
    self.Menu:addParam("Draw", "Enable Clarity Range Draw:", SCRIPT_PARAM_ONOFF, true)
    ------------------------------------------------------------------------------------------------------------------
    self.Menu:addParam("b", "", SCRIPT_PARAM_INFO, "")
    if VIP_USER then
        self.Menu:addParam("b1", "User: "..GetUser().." (VIP)", SCRIPT_PARAM_INFO, "")
    else
        self.Menu:addParam("b2", "User: "..GetUser().." (FREE)", SCRIPT_PARAM_INFO, "")
    end
    self.Menu:addParam("b3", "Script Version: ".._G.SSScriptVersion[2], SCRIPT_PARAM_INFO, "")
    self.Menu:addParam("b4", "Script Author: ".._G.SSScriptAuthor, SCRIPT_PARAM_INFO, "")
end

function Clarity:Loader()
    self.NoClaritySpamMsg = 0
    AddTickCallback(function() self:OnTick() end)
    AddDrawCallback(function() self:OnDraw() end)
end

function Clarity:OnTick()
    if (self.Menu.Enable and not self.Menu.ComboEnable) then
        self:AutoClarity()
    elseif self.Menu.Enable and self.Menu.ComboEnable and self.Menu.Key then
        self:AutoClarity()
    end
    if (self.Menu.Enable and self.Menu.AllyClarity) then
        self:AllyAutoClarity()
    end
end

function Clarity:OnDraw()
    if not myHero.dead and self.Menu.Draw and myHero:CanUseSpell(SummonerM) == READY then
        _G.DrawFPSCircle(myHero.x, myHero.z, 600, RGB(0, 153, 0), 7)
    end
end

function Clarity:AutoClarity()
    if SummonerM == nil then return end
    if ((myHero.mana*100)/myHero.maxMana) <= self.Menu.MinMana and myHero:CanUseSpell(SummonerM) == READY then
        CastSpell(SummonerM)
        if os.clock() - self.NoClaritySpamMsg > 2 then
            self.NoClaritySpamMsg = os.clock()
            self:Message("Clarity", "Clarity Casted on: Yourself", 0)
        end
    end
end

function Clarity:AllyAutoClarity()
    for k, ally in pairs(GetAllyHeroes()) do
        if not ally.dead and ally.visible then
            if SummonerM ~= nil and GetDistance(myHero, ally) <= 600 and myHero:CanUseSpell(SummonerM) == READY then
                if ((ally.mana*100)/ally.maxMana) <= self.Menu.AllyMinMana and not ally.dead then
                    CastSpell(SummonerM)
                    if os.clock() - self.NoClaritySpamMsg > 2 then
                        self.NoClaritySpamMsg = os.clock()
                        self:Message("Clarity", "Clarity Casted on: "..ally.charName, 0)
                    end
                end
            end
        end
    end
end

function Clarity:Message(class,msg,time)
    DelayAction(function() PrintChat("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">HeRo</font> <font color=\"#F7CB72\">"..class.." Class</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: ".. msg .."</font></b>") end, time)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------WORKED FINE--------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

class("Cleanse")

function Cleanse:__init()
    
    self:Message("Сleanse", "Class loaded!", 3)
    self:Global_Menu()
    self:Loader()
 
end  

function Cleanse:Global_Menu()
    self.Menu = scriptConfig("[HeRo] Cleanse Class", "HeRoCleanse")
 
    self.Menu:addParam("Enable", "Enable Auto Cleanse:", SCRIPT_PARAM_ONOFF, true)
    self.Menu:addParam("Humanizer", "Use Humanizer:", SCRIPT_PARAM_SLICE, 200, 0, 1000, 0)
    self.Menu:addSubMenu("DeBuff_List", "DeBuff_List")
        self.Menu.DeBuff_List:addParam("Stun", "Remove Stun:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.DeBuff_List:addParam("Silence", "Remove Silence:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.DeBuff_List:addParam("Taunt", "Remove Taunt:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.DeBuff_List:addParam("Root", "Remove Root:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.DeBuff_List:addParam("Fear", "Remove Fear:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.DeBuff_List:addParam("Charm", "Remove Charm:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.DeBuff_List:addParam("Suppression", "Remove Suppression:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.DeBuff_List:addParam("Blind", "Remove Blind:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.DeBuff_List:addParam("KnockUp", "Remove Knock-Up:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.DeBuff_List:addParam("Exhaust", "Remove Exhaust:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.DeBuff_List:addParam("Ignite", "Remove Ignite:", SCRIPT_PARAM_ONOFF, true)
    ------------------------------------------------------------------------------------------------------------------
    self.Menu:addParam("b", "", SCRIPT_PARAM_INFO, "")
    if VIP_USER then
        self.Menu:addParam("b1", "User: "..GetUser().." (VIP)", SCRIPT_PARAM_INFO, "")
    else
        self.Menu:addParam("b2", "User: "..GetUser().." (FREE)", SCRIPT_PARAM_INFO, "")
    end
    self.Menu:addParam("b3", "Script Version: ".._G.SSScriptVersion[2], SCRIPT_PARAM_INFO, "")
    self.Menu:addParam("b4", "Script Author: ".._G.SSScriptAuthor, SCRIPT_PARAM_INFO, "")
end 

function Cleanse:Loader()
    self.NoCleanseSpamMsg = 0
    AddApplyBuffCallback(function(unit, sourse, buff) self:OnApplyBuff(unit, sourse, buff) end)
end


function Cleanse:OnApplyBuff(unit, sourse, buff)
    if sourse and sourse.isMe and self.Menu.Enable then
        if buff.name == "SummonerExhaust" and  self.Menu.DeBuff_List.Exhaust then
            self:AutoCleanse("Exhaust")
        end

        if buff.name == "SummonerDot" and  self.Menu.DeBuff_List.Ignite then
            self:AutoCleanse("Ignite")
        end

        if buff.type == 5 and  self.Menu.DeBuff_List.Stun then
            self:AutoCleanse("Stun")
        end

        if buff.type == 7 and  self.Menu.DeBuff_List.Silence then
            self:AutoCleanse("Silence")
        end

        if buff.type == 8 and  self.Menu.DeBuff_List.Taunt then
            self:AutoCleanse("Taunt")
        end

        if buff.type == 10 and  self.Menu.DeBuff_List.Fear then
            self:AutoCleanse("Fear")
        end

        if buff.type == 11 and  self.Menu.DeBuff_List.Root then
            self:AutoCleanse("Root")
        end

        if buff.type == 21 and  self.Menu.DeBuff_List.Charm then
            self:AutoCleanse("Charm")
        end

        if buff.type == 24 and  self.Menu.DeBuff_List.Suppression then
            self:AutoCleanse("Suppression")
        end

        if buff.type == 25 and  self.Menu.DeBuff_List.Blind then
            self:AutoCleanse("Blind")
        end

        if buff.type == 29 and  self.Menu.DeBuff_List.KnockUp then
            self:AutoCleanse("KnockUp")
        end
    end
end

function Cleanse:AutoCleanse(BuffType)
    if myHero:CanUseSpell(SummonerBoost) == READY then
        DelayAction(function() CastSpell(SummonerBoost) end, self.Menu.Humanizer/1000)
        if os.clock() - self.NoCleanseSpamMsg > 2 then
            self.NoCleanseSpamMsg = os.clock()
            self:Message("Cleanse", BuffType.." Removed!", 0)
        end
    end
end

function Cleanse:Message(class,msg,time)
    DelayAction(function() PrintChat("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">HeRo</font> <font color=\"#F7CB72\">"..class.." Class</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: ".. msg .."</font></b>") end, time)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------WORKED FINE--------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

class("Exhaust")
 
function Exhaust:__init()
    
    self:Message("Exhaust", "Class loaded!", 3)
    self:Global_Menu()
    self:Loader()
 
end  

function Exhaust:Global_Menu()
    self.Menu = scriptConfig("[HeRo] Exhaust Class", "HeRoExhaust")

    self.Menu:addParam("b5", "", SCRIPT_PARAM_INFO, "")

    self.Menu:addParam("Enable", "Enable Auto Exhaust:", SCRIPT_PARAM_ONOFF, true)
    self.Menu:addParam("Key", "You Auto Exhaust Key:", SCRIPT_PARAM_ONKEYDOWN, false, GetKey("N"))
    self.Menu:addParam("Draw", "Enable Exhaust Range Draw:", SCRIPT_PARAM_ONOFF, true)

    ts = TargetSelector(TARGET_PRIORITY, 1000, DAMAGE_PHYSICAL)
    --self.Menu.:addTS(ts)
    --ts.name = "Exhaust Targeting"
    ------------------------------------------------------------------------------------------------------------------
    self.Menu:addParam("b", "", SCRIPT_PARAM_INFO, "")
    if VIP_USER then
        self.Menu:addParam("b1", "User: "..GetUser().." (VIP)", SCRIPT_PARAM_INFO, "")
    else
        self.Menu:addParam("b2", "User: "..GetUser().." (FREE)", SCRIPT_PARAM_INFO, "")
    end
    self.Menu:addParam("b3", "Script Version: ".._G.SSScriptVersion[2], SCRIPT_PARAM_INFO, "")
    self.Menu:addParam("b4", "Script Author: ".._G.SSScriptAuthor, SCRIPT_PARAM_INFO, "")
end 
 
function Exhaust:Loader()
    self.NoExhaustSpamMsg = 0
    AddTickCallback(function() self:OnTick() end)
    AddDrawCallback(function() self:OnDraw() end)
end
 
function Exhaust:OnTick()
    if self.Menu.Enable and self.Menu.Key then
        self:AutoExhoust()
    end
end
 
function Exhaust:OnDraw()
    if not myHero.dead and self.Menu.Draw and myHero:CanUseSpell(SummonerExhaust) then
        _G.DrawFPSCircle(myHero.x, myHero.z, 650, RGB(255, 128, 0), 7)
    end
end
 
function Exhaust:AutoExhoust()
    if myHero:CanUseSpell(SummonerExhaust) == READY then
        ts:update()
        if ValidTarget(ts.target) and ts.target.type == myHero.type then
            CastSpell(SummonerExhaust, ts.target) 
            if os.clock() - self.NoExhaustSpamMsg > 2 then
                self.NoExhaustSpamMsg = os.clock()
                self:Message("Exhaust", "Exhaust Casted on: "..ts.target, 0)
            end
        end
    end
end
 
function Exhaust:Message(class,msg,time)
    DelayAction(function() PrintChat("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">HeRo</font> <font color=\"#F7CB72\">"..class.." Class</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: ".. msg .."</font></b>") end, time)
end
 
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------WORKED FINE--------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

class("Barrier")

function Barrier:__init()

    self:Message("Barrier", "Class loaded!", 3)
    self:Loader()
    self:Global_Menu()

end

function Barrier:Global_Menu()
    self.Menu = scriptConfig("[HeRo] Barrier Class", "HeRoBarrier")

    self.Menu:addParam("Enable", "Enable Auto Barrier:", SCRIPT_PARAM_ONOFF, true)
    self.Menu:addParam("MinHealth", "Health to Use Auto Barrier:", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)
    self.Menu:addParam("ComboEnable", "Use only in Combo Mode:", SCRIPT_PARAM_ONOFF, true)
    self.Menu:addParam("Key", "You Combo Mode Key:", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    ------------------------------------------------------------------------------------------------------------------
    self.Menu:addParam("b", "", SCRIPT_PARAM_INFO, "")
    if VIP_USER then
        self.Menu:addParam("b1", "User: "..GetUser().." (VIP)", SCRIPT_PARAM_INFO, "")
    else
        self.Menu:addParam("b2", "User: "..GetUser().." (FREE)", SCRIPT_PARAM_INFO, "")
    end
    self.Menu:addParam("b3", "Script Version: ".._G.SSScriptVersion[2], SCRIPT_PARAM_INFO, "")
    self.Menu:addParam("b4", "Script Author: ".._G.SSScriptAuthor, SCRIPT_PARAM_INFO, "")
end

function Barrier:Loader()
    self.NoBarrierSpamMsg = 0
    AddTickCallback(function() self:OnTick() end)
end

function Barrier:OnTick()
    if (self.Menu.Enable and not self.Menu.ComboEnable) then
        self:AutoBarrier()
    elseif self.Menu.Enable and self.Menu.ComboEnable and self.Menu.Key then
        self:AutoBarrier()
    end
end

function Barrier:AutoBarrier()
    if SummonerBarrier == nil then return end
    if ((myHero.health*100)/myHero.maxHealth) <= self.Menu.MinHealth and myHero:CanUseSpell(SummonerBarrier) == READY then
        CastSpell(SummonerBarrier)
        if os.clock() - self.NoBarrierSpamMsg > 2 then
            self.NoBarrierSpamMsg = os.clock()
            self:Message("Barrier", "Barrier Casted on: Yourself", 0)
        end
    end
end

function Barrier:Message(class,msg,time)
    DelayAction(function() PrintChat("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">HeRo</font> <font color=\"#F7CB72\">"..class.." Class</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: ".. msg .."</font></b>") end, time)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------WORKED FINE--------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
class("Heal")

function Heal:__init()

    self:Message("Heal", "Class loaded!", 3)
    self:Loader()
    self:Global_Menu()

end

function Heal:Global_Menu()
    self.Menu = scriptConfig("[HeRo] Heal Class", "HeRoHeal")

    self.Menu:addParam("Enable", "Enable Auto Heal:", SCRIPT_PARAM_ONOFF, true)
    self.Menu:addParam("MinHealth", "Health to Use Auto Heal:", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)
    self.Menu:addParam("ComboEnable", "Use only in Combo Mode:", SCRIPT_PARAM_ONOFF, true)
    self.Menu:addParam("Key", "You Combo Mode Key:", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    self.Menu:addParam("AllyHeal", "Use on Ally:", SCRIPT_PARAM_ONOFF, true)
    self.Menu:addParam("AllyMinHealth", "Ally Health to Use Auto Heal:", SCRIPT_PARAM_SLICE, 10, 0, 100, 0)
    self.Menu:addParam("Draw", "Enable Heal Range Draw:", SCRIPT_PARAM_ONOFF, true)
    ------------------------------------------------------------------------------------------------------------------
    self.Menu:addParam("b", "", SCRIPT_PARAM_INFO, "")
    if VIP_USER then
        self.Menu:addParam("b1", "User: "..GetUser().." (VIP)", SCRIPT_PARAM_INFO, "")
    else
        self.Menu:addParam("b2", "User: "..GetUser().." (FREE)", SCRIPT_PARAM_INFO, "")
    end
    self.Menu:addParam("b3", "Script Version: ".._G.SSScriptVersion[2], SCRIPT_PARAM_INFO, "")
    self.Menu:addParam("b4", "Script Author: ".._G.SSScriptAuthor, SCRIPT_PARAM_INFO, "")
end

function Heal:Loader()
    self.NoHealSpamMsg = 0
    self.invul = {"undyingrage", "sionpassivezombie", "aatroxpassivedeath", "chronoshift", "judicatorintervention"}
    AddTickCallback(function() self:OnTick() end)
    AddDrawCallback(function() self:OnDraw() end)
end

function Heal:OnTick()
    if (self.Menu.Enable and not self.Menu.ComboEnable) then
        self:AutoHeal()
    elseif (self.Menu.Enable and self.Menu.ComboEnable and self.Menu.Key) then
        self:AutoHeal()
    end
    if (self.Menu.Enable and self.Menu.AllyHeal) then
        self:AllyAutoHeal()
    end
end

function Heal:OnDraw()
    if not myHero.dead and self.Menu.Draw and myHero:CanUseSpell(SummunerHeal) == READY then
        _G.DrawFPSCircle(myHero.x, myHero.z, 840, RGB(0, 153, 0), 7)
    end
end

function Heal:CheckFail(unit)
    for i, buff in pairs(self.invul) do
        if TargetHaveBuff(buff, unit) then
            return true
        end
    end
    return false
end

function Heal:AutoHeal()
    if SummunerHeal == nil then return end
    if ((myHero.health*100)/myHero.maxHealth) <= self.Menu.MinHealth and myHero:CanUseSpell(SummunerHeal) == READY then
        CastSpell(SummunerHeal)
        if os.clock() - self.NoHealSpamMsg > 2 then
            self.NoHealSpamMsg = os.clock()
            self:Message("Heal", "Heal Casted on: Yourself", 0)
        end
    end
end

function Heal:AllyAutoHeal()
    for k, ally in pairs(GetAllyHeroes()) do
        if not ally.dead and ally.visible and not self:CheckFail(ally) then
            if SummunerHeal ~= nil and GetDistance(myHero, ally) <= 840 and myHero:CanUseSpell(SummunerHeal) == READY then
                if ((ally.health*100)/ally.maxHealth) <= self.Menu.AllyMinHealth and not ally.dead then
                    CastSpell(SummunerHeal)
                    if os.clock() - self.NoHealSpamMsg > 2 then
                        self.NoHealSpamMsg = os.clock()
                        self:Message("Heal", "Heal Casted on: "..ally.charName, 0)
                    end
                end
            end
        end
    end
end

function Heal:Message(class,msg,time)
    DelayAction(function() PrintChat("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">HeRo</font> <font color=\"#F7CB72\">"..class.." Class</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: ".. msg .."</font></b>") end, time)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------WORKED FINE--------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

class("Ignite")

function Ignite:__init()

    self:Message("Ignite", "Class loaded!", 3)
    self:Loader()
    self:Global_Menu()

end

function Ignite:Global_Menu()
    self.Menu = scriptConfig("[HeRo] Ignite Class", "HeRoIgnite")
    self.Menu:addParam("Enable", "Enable Auto Ignite:", SCRIPT_PARAM_ONOFF, true)
    self.Menu:addParam("Draw", "Enable Ignite Range Draw:", SCRIPT_PARAM_ONOFF, true)
    ------------------------------------------------------------------------------------------------------------------
    self.Menu:addParam("b", "", SCRIPT_PARAM_INFO, "")
    if VIP_USER then
        self.Menu:addParam("b1", "User: "..GetUser().." (VIP)", SCRIPT_PARAM_INFO, "")
    else
        self.Menu:addParam("b2", "User: "..GetUser().." (FREE)", SCRIPT_PARAM_INFO, "")
    end
    self.Menu:addParam("b3", "Script Version: ".._G.SSScriptVersion[2], SCRIPT_PARAM_INFO, "")
    self.Menu:addParam("b4", "Script Author: ".._G.SSScriptAuthor, SCRIPT_PARAM_INFO, "")
end


function Ignite:Loader()
    self.NoIgniteSpamMsg = 0
    AddTickCallback(function() self:OnTick() end)
    AddDrawCallback(function() self:OnDraw() end)
end


function Ignite:OnTick()
    if self.Menu.Enable then
        self:AutoIgnite()
    end
end

function Ignite:OnDraw()
    if not myHero.dead and self.Menu.Draw and myHero:CanUseSpell(SummunerIgnite) == READY then
       _G.DrawFPSCircle(myHero.x, myHero.z, 600, RGB(255, 0, 0), 7)
    end
end

function Ignite:AutoIgnite()
    for i, enemy in pairs(GetEnemyHeroes()) do
        if not enemy.dead and enemy.visible then
            if ValidTarget(enemy, 1000) then
                if Ignite ~= nil and GetDistance(myHero, enemy) <= 600 and myHero:CanUseSpell(SummunerIgnite) == READY then
                    local igniteDmg = 50 + 20 * myHero.level
                    if igniteDmg >= enemy.health and not enemy.dead then
                        CastSpell(SummunerIgnite, enemy)
                        if os.clock() - self.NoIgniteSpamMsg > 2 then
                            self.NoIgniteSpamMsg = os.clock()
                            self:Message("Ignite", "Ignite Casted on: "..enemy.charName, 0)
                        end
                    end
                end
            end
        end
    end
end

function Ignite:Message(class,msg,time)
    DelayAction(function() PrintChat("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">HeRo</font> <font color=\"#F7CB72\">"..class.." Class</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: ".. msg .."</font></b>") end, time)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------_G.DrawFPSCircle Start--------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

function _G.DrawLineA(x1, y1, x2, y2, color)
    DrawLine(x1, y1, x2, y2, 1, color)
end

function _G.DrawFPSCircle(x, z, radius, color, quality)
    for i = -radius * math.cos(math.pi/4), radius * math.cos(math.pi/4) - 1, radius * math.cos(math.pi/4)/quality do
        local v = WorldToScreen(D3DXVECTOR3((x + i), myHero.y, (z + math.sqrt(radius * radius - i * i))))
        local c = WorldToScreen(D3DXVECTOR3((x + i), myHero.y, (z - math.sqrt(radius * radius - i * i))))
        local k = WorldToScreen(D3DXVECTOR3((x + i + radius * math.cos(math.pi/4)/quality), myHero.y, (z + math.sqrt(radius * radius - (i + radius * math.cos(math.pi/4)/quality) * (i + radius * math.cos(math.pi/4)/quality)))))
        local n = WorldToScreen(D3DXVECTOR3((x + i + radius * math.cos(math.pi/4)/quality), myHero.y, (z - math.sqrt(radius * radius - (i + radius * math.cos(math.pi/4)/quality) * (i + radius * math.cos(math.pi/4)/quality)))))
        if (v.x > 0 and v.x < WINDOW_W) and (v.y > 0 and v.y < WINDOW_H) and (k.x > 0 and k.x < WINDOW_W) and (k.y > 0 and k.y < WINDOW_H) then
            _G.DrawLineA(v.x, v.y, k.x, k.y, color)
        end
        if (c.x > 0 and c.x < WINDOW_W) and (c.y > 0 and c.y < WINDOW_H) and (n.x > 0 and n.x < WINDOW_W) and (n.y > 0 and n.y < WINDOW_H) then
            _G.DrawLineA(c.x, c.y, n.x, n.y, color)
        end
    end

    for i = -radius * math.cos(math.pi/4), radius * math.cos(math.pi/4) - 1, radius * math.cos(math.pi/4)/quality do
        local v = WorldToScreen(D3DXVECTOR3((x + math.sqrt(radius * radius - i * i)), myHero.y, (z + i)))
        local c = WorldToScreen(D3DXVECTOR3((x - math.sqrt(radius * radius - i * i)), myHero.y, (z + i)))
        local k = WorldToScreen(D3DXVECTOR3((x + math.sqrt(radius * radius - (i + radius * math.cos(math.pi/4)/quality) * (i + radius * math.cos(math.pi/4)/quality))), myHero.y, (z + i + radius * math.cos(math.pi/4)/quality)))
        local n = WorldToScreen(D3DXVECTOR3((x - math.sqrt(radius * radius-(i + radius * math.cos(math.pi/4)/quality) * (i + radius * math.cos(math.pi/4)/quality))), myHero.y, (z + i + radius*  math.cos(math.pi/4)/quality)))
        if (v.x > 0 and v.x < WINDOW_W) and (v.y > 0 and v.y < WINDOW_H) and (k.x > 0 and k.x < WINDOW_W) and (k.y > 0 and k.y < WINDOW_H) then
            _G.DrawLineA(v.x, v.y, k.x, k.y, color)
        end
        if (c.x > 0 and c.x < WINDOW_W) and (c.y > 0 and c.y < WINDOW_H) and (n.x > 0 and n.x < WINDOW_W) and (n.y > 0 and n.y < WINDOW_H) then
            _G.DrawLineA(c.x, c.y, n.x, n.y, color)
        end
    end
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------_G.DrawFPSCircle End--------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

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
