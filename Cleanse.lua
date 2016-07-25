local SummonerBoost = nil

function OnLoad()
    if myHero:GetSpellData(SUMMONER_1).name:find("SummonerBoost") then SummonerBoost = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("SummonerBoost") then SummonerBoost = SUMMONER_2 end
    if SummonerBoost ~= nil then
        Cleanse()
    end
end

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
    self.Menu:addParam("ComboEnable", "Use only in Combo Mode:", SCRIPT_PARAM_ONOFF, true)
    self.Menu:addParam("Key", "You Combo Mode Key:", SCRIPT_PARAM_ONKEYDOWN, false, 32)
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
end 

function Cleanse:Loader()
    AddApplyBuffCallback(function() self:OnApplyBuff() end)
    self.NoCleanseSpamMsg = 0
end


function Cleanse:OnApplyBuff(unit, sourse, buff)
    if unit and unit.isMe then
        print(buff.name)
        if buff.name == "SummonerExhaust" and  self.Menu.DeBuff_List.Exhaust then
            self:AutoCleanse("Exhaust")
            if os.clock() - NoCleanseSpamMsg > 2 then
                NoCleanseSpamMsg = os.clock()
                self:Message("Cleanse", "Exhaust Removed", 0)
            end
        end
        if buff.name == "SummonerDot" and  self.Menu.DeBuff_List.Ignite then
            self:AutoCleanse("Ignite")
            if os.clock() - NoCleanseSpamMsg > 2 then
                NoCleanseSpamMsg = os.clock()
                self:Message("Cleanse", "Ignite Removed", 0)
            end
        end
        if buff.type == 5 and  self.Menu.DeBuff_List.Stun then
            self:AutoCleanse("Stun")
            if os.clock() - NoCleanseSpamMsg > 2 then
                NoCleanseSpamMsg = os.clock()
                self:Message("Cleanse", "Stun Removed", 0)
            end
        end
        if buff.type == 7 and  self.Menu.DeBuff_List.Silence then
            self:AutoCleanse("Silence")
            if os.clock() - NoCleanseSpamMsg > 2 then
                NoCleanseSpamMsg = os.clock()
                self:Message("Cleanse", "Silence Removed", 0)
            end
        end
        if buff.type == 8 and  self.Menu.DeBuff_List.Taunt then
            self:AutoCleanse("Taunt")
            if os.clock() - NoCleanseSpamMsg > 2 then
                NoCleanseSpamMsg = os.clock()
                self:Message("Cleanse", "Taunt Removed", 0)
            end
        end
        if buff.type == 10 and  self.Menu.DeBuff_List.Fear then
            self:AutoCleanse("Fear")
            if os.clock() - NoCleanseSpamMsg > 2 then
                NoCleanseSpamMsg = os.clock()
                self:Message("Cleanse", "Fear Removed", 0)
            end
        end
        if buff.type == 11 and  self.Menu.DeBuff_List.Root then
            self:AutoCleanse("Root")
            if os.clock() - NoCleanseSpamMsg > 2 then
                NoCleanseSpamMsg = os.clock()
                self:Message("Cleanse", "Root Removed", 0)
            end
        end
        if buff.type == 21 and  self.Menu.DeBuff_List.Charm then
            self:AutoCleanse("Charm")
            if os.clock() - NoCleanseSpamMsg > 2 then
                NoCleanseSpamMsg = os.clock()
                self:Message("Cleanse", "Charm Removed", 0)
            end
        end
        if buff.type == 24 and  self.Menu.DeBuff_List.Suppression then
            self:AutoCleanse("Suppression")
            if os.clock() - NoCleanseSpamMsg > 2 then
                NoCleanseSpamMsg = os.clock()
                self:Message("Cleanse", "Suppression Removed", 0)
            end
        end
        if buff.type == 25 and  self.Menu.DeBuff_List.Blind then
            self:AutoCleanse("Blind")
            if os.clock() - NoCleanseSpamMsg > 2 then
                NoCleanseSpamMsg = os.clock()
                self:Message("Cleanse", "Blind Removed", 0)
            end
        end
        if buff.type == 29 and  self.Menu.DeBuff_List.KnockUp then
            self:AutoCleanse("KnockUp")
            if os.clock() - NoCleanseSpamMsg > 2 then
                NoCleanseSpamMsg = os.clock()
                self:Message("Cleanse", "Knock-Up Removed", 0)
            end
        end
    end
end

function Cleanse:AutoCleanse(BuffType)
    if myHero:CanUseSpell(SummonerBoost) then
        DelayAction(function() CastSpell(SummonerBoost) end, self.Menu.Humanizer/1000)
    end
end

function Cleanse:Message(class,msg,time)
    DelayAction(function() PrintChat("<b><font color=\"#c0392b\">[</font><font color=\"#27ae60\">HeRo</font> <font color=\"#2980b9\">"..class.." Class</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#c0392b\">]</font></b> <font color=\"#c5eff7\">: ".. msg .."</font>") end, time)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
