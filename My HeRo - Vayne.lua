if myHero.charName ~= "Vayne" then return end

_G.VayneScriptName = "My HeRo - Vayne"
_G.VayneScriptVersion = {1.15, "1.15"}
_G.VayneScriptAuthor = "HeRoBaNd"

-- BoL Tools Tracker --
assert(load(Base64Decode("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"), nil, "bt", _ENV))()
TrackerLoad("SthOtiPosir5RwpV")
-- BoL Tools Tracker --

function OnLoad()
    require 'VPrediction'
    VP = VPrediction()

    local ToUpdate = {}
    ToUpdate.Version = _G.HextechScriptVersion[1]
    ToUpdate.UseHttps = true
    ToUpdate.Host = "raw.githubusercontent.com"
    ToUpdate.VersionPath = "/HeRoBaNd/Scripts/master/My%20HeRo%20-%20Vayne.version"
    ToUpdate.ScriptPath =  "/HeRoBaNd/Scripts/master/My%20HeRo%20-%20Vayne.lua"
    ToUpdate.SavePath = SCRIPT_PATH.."/My HeRo - Vayne.lua"
    ToUpdate.CallbackUpdate = function(NewVersion,OldVersion) print("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">My HeRo - </font> <font color=\"#F7CB72\">Vayne</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: "..NewVersion.."</font></b>") end
    ToUpdate.CallbackNoUpdate = function(OldVersion) print("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">My HeRo - </font> <font color=\"#F7CB72\">Vayne</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: No Updates Found!</font></b>") end
    ToUpdate.CallbackNewVersion = function(NewVersion) print("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">My HeRo - </font> <font color=\"#F7CB72\">Vayne</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: New Version Found ("..NewVersion.."). Please wait until it's Downloaded!</font></b>") end
    ToUpdate.CallbackError = function(NewVersion) print("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">My HeRo - </font> <font color=\"#F7CB72\">Vayne</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: Error while Downloading! Please try again!</font></b>") end
    ScriptUpdate(ToUpdate.Version, ToUpdate.UseHttps, ToUpdate.Host, ToUpdate.VersionPath, ToUpdate.ScriptPath, ToUpdate.SavePath, ToUpdate.CallbackUpdate, ToUpdate.CallbackNoUpdate, ToUpdate.CallbackNewVersion, ToUpdate.CallbackError)
    
    MyHeRoVayne()

end

class("MyHeRoVayne")

function MyHeRoVayne:__init()

    self:Message("Loaded!")
    ts = TargetSelector(TARGET_PRIORITY, 1500, DAMAGE_PHYSICAL)
    self:Tables()
    self:Global_Menu()
    self:Loader()

end

function MyHeRoVayne:Tables()
    self.isAGapcloserUnitTarget = {
        ['AkaliShadowDance']        = {true, Champ = 'Akali',       spellKey = 'R'},
        ['Headbutt']                = {true, Champ = 'Alistar',     spellKey = 'W'},
        ['DianaTeleport']           = {true, Champ = 'Diana',       spellKey = 'R'},
        ['IreliaGatotsu']           = {true, Champ = 'Irelia',      spellKey = 'Q'},
        ['JaxLeapStrike']           = {true, Champ = 'Jax',         spellKey = 'Q'},
        ['JayceToTheSkies']         = {true, Champ = 'Jayce',       spellKey = 'Q'},
        ['MaokaiUnstableGrowth']    = {true, Champ = 'Maokai',      spellKey = 'W'},
        ['MonkeyKingNimbus']        = {true, Champ = 'MonkeyKing',  spellKey = 'E'},
        ['Pantheon_LeapBash']       = {true, Champ = 'Pantheon',    spellKey = 'W'},
        ['PoppyHeroicCharge']       = {true, Champ = 'Poppy',       spellKey = 'E'},
        ['QuinnE']                  = {true, Champ = 'Quinn',       spellKey = 'E'},
        ['XenZhaoSweep']            = {true, Champ = 'XinZhao',     spellKey = 'E'},
        ['blindmonkqtwo']           = {true, Champ = 'LeeSin',      spellKey = 'Q'},
        ['FizzPiercingStrike']      = {true, Champ = 'Fizz',        spellKey = 'Q'},
        ['RengarLeap']              = {true, Champ = 'Rengar',      spellKey = 'Q/R'},
    }

    self.isAGapcloserUnitNoTarget = {
        ['AatroxQ']                 = {true, Champ = 'Aatrox',      range = 1000,   projSpeed = 1200, spellKey = 'Q'},
        ['GragasE']                 = {true, Champ = 'Gragas',      range = 600,    projSpeed = 2000, spellKey = 'E'},
        ['GravesMove']              = {true, Champ = 'Graves',      range = 425,    projSpeed = 2000, spellKey = 'E'},
        ['HecarimUlt']              = {true, Champ = 'Hecarim',     range = 1000,   projSpeed = 1200, spellKey = 'R'},
        ['JarvanIVDragonStrike']    = {true, Champ = 'JarvanIV',    range = 770,    projSpeed = 2000, spellKey = 'Q'},
        ['JarvanIVCataclysm']       = {true, Champ = 'JarvanIV',    range = 650,    projSpeed = 2000, spellKey = 'R'},
        ['KhazixE']                 = {true, Champ = 'Khazix',      range = 900,    projSpeed = 2000, spellKey = 'E'},
        ['khazixelong']             = {true, Champ = 'Khazix',      range = 900,    projSpeed = 2000, spellKey = 'E'},
        ['LeblancSlide']            = {true, Champ = 'Leblanc',     range = 600,    projSpeed = 2000, spellKey = 'W'},
        ['LeblancSlideM']           = {true, Champ = 'Leblanc',     range = 600,    projSpeed = 2000, spellKey = 'WMimic'},
        ['LeonaZenithBlade']        = {true, Champ = 'Leona',       range = 900,    projSpeed = 2000, spellKey = 'E'},
        ['UFSlash']                 = {true, Champ = 'Malphite',    range = 1000,   projSpeed = 1800, spellKey = 'R'},
        ['RenektonSliceAndDice']    = {true, Champ = 'Renekton',    range = 450,    projSpeed = 2000, spellKey = 'E'},
        ['SejuaniArcticAssault']    = {true, Champ = 'Sejuani',     range = 650,    projSpeed = 2000, spellKey = 'Q'},
        ['ShenShadowDash']          = {true, Champ = 'Shen',        range = 575,    projSpeed = 2000, spellKey = 'E'},
        ['RocketJump']              = {true, Champ = 'Tristana',    range = 900,    projSpeed = 2000, spellKey = 'W'},
        ['slashCast']               = {true, Champ = 'Tryndamere',  range = 650,    projSpeed = 1450, spellKey = 'E'},
    }

    self.isAChampToInterrupt = {
        ['KatarinaR']                   = {true, Champ = 'Katarina',    spellKey = 'R'},
        ['GalioIdolOfDurand']           = {true, Champ = 'Galio',       spellKey = 'R'},
        ['Crowstorm']                   = {true, Champ = 'FiddleSticks',spellKey = 'R'},
        ['Drain']                       = {true, Champ = 'FiddleSticks',spellKey = 'W'},
        ['AbsoluteZero']                = {true, Champ = 'Nunu',        spellKey = 'R'},
        ['ShenStandUnited']             = {true, Champ = 'Shen',        spellKey = 'R'},
        ['UrgotSwap2']                  = {true, Champ = 'Urgot',       spellKey = 'R'},
        ['AlZaharNetherGrasp']          = {true, Champ = 'Malzahar',    spellKey = 'R'},
        ['FallenOne']                   = {true, Champ = 'Karthus',     spellKey = 'R'},
        ['Pantheon_GrandSkyfall_Jump']  = {true, Champ = 'Pantheon',    spellKey = 'R'},
        ['VarusQ']                      = {true, Champ = 'Varus',       spellKey = 'Q'},
        ['CaitlynAceintheHole']         = {true, Champ = 'Caitlyn',     spellKey = 'R'},
        ['MissFortuneBulletTime']       = {true, Champ = 'MissFortune', spellKey = 'R'},
        ['InfiniteDuress']              = {true, Champ = 'Warwick',     spellKey = 'R'},
        ['LucianR']                     = {true, Champ = 'Lucian',      spellKey = 'R'},
        ['JhinR']                       = {true, Champ = 'Jhin',        spellKey = 'R'}
    }
end
function MyHeRoVayne:Global_Menu()
    self.Menu = scriptConfig('My HeRo - Vayne', 'MHV')

    self.Menu:addSubMenu("[Vayne] - Combo", "Combo")
        self.Menu.Combo:addParam("ComboKey", "Combo Key:", SCRIPT_PARAM_ONKEYDOWN, false, 32)
        self.Menu.Combo:addParam("ComboQ", "Use Q in Combo:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.Combo:addParam("ComboR", "Use R in Combo:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.Combo:addParam("ComboRRange", "Enemies in Range for R:", SCRIPT_PARAM_SLICE, 2, 0, 5, 0)
        self.Menu.Combo:addSubMenu("Item usage:", "Items")
            self.Menu.Combo.Items:addParam("BOTRK", "Use BOTRK in Combo:", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Combo.Items:addParam("BWC", "Use Bilgewater Cutlass in Combo:", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Combo.Items:addParam("YGB", "Use Youmu in Combo:", SCRIPT_PARAM_ONOFF, true)

    --[[self.Menu:addSubMenu('[Vayne] - AntiGapCloser Settings', 'AntiGapClosers')
    self.Menu:addSubMenu('[Vayne] - Auto Stun Target', 'ASTarget')
    self.Menu:addSubMenu('[Vayne] - Interrupt Settings', 'Interrupt')

    local FoundAGapCloser = false
    for index, data in pairs(self.isAGapcloserUnitTarget) do
        for index2, enemy in ipairs(GetEnemyHeroes()) do
            if data['Champ'] == enemy.charName then
                self.Menu.AntiGapClosers:addSubMenu(enemy.charName..' ('..data.spellKey..')', enemy.charName)
                self.Menu.AntiGapClosers[enemy.charName]:addParam('fap', 'Supported Spell Found: '..enemy.charName..' ('..data.spellKey..')', SCRIPT_PARAM_INFO, '')
                self.Menu.AntiGapClosers[enemy.charName]:addParam('FightMode', 'AntiGapCloser in Fight Mode:', SCRIPT_PARAM_ONOFF, true)
                self.Menu.AntiGapClosers[enemy.charName]:addParam('HarassMode', 'AntiGapCloser in Harass Mode:', SCRIPT_PARAM_ONOFF, true)
                self.Menu.AntiGapClosers[enemy.charName]:addParam('LaneClear', 'AntiGapCloser in LaneClear Mode:', SCRIPT_PARAM_ONOFF, false)
                self.Menu.AntiGapClosers[enemy.charName]:addParam('LastHit', 'AntiGapCloser in LastHit Mode:', SCRIPT_PARAM_ONOFF, false)
                self.Menu.AntiGapClosers[enemy.charName]:addParam('Always', 'AntiGapCloser Always Mode:', SCRIPT_PARAM_ONOFF, false)
                FoundAGapCloser = true
            end
        end
    end
    for index, data in pairs(self.isAGapcloserUnitNoTarget) do
        for index2, enemy in ipairs(GetEnemyHeroes()) do
            if data['Champ'] == enemy.charName then
                self.Menu.AntiGapClosers:addSubMenu(enemy.charName..' ('..data.spellKey..')', enemy.charName)
                self.Menu.AntiGapClosers[enemy.charName]:addParam('fap', 'Supported Spell Found: '..enemy.charName..' ('..data.spellKey..')', SCRIPT_PARAM_INFO, '')
                self.Menu.AntiGapClosers[enemy.charName]:addParam('FightMode', 'AntiGapCloser in Fight Mode:', SCRIPT_PARAM_ONOFF, true)
                self.Menu.AntiGapClosers[enemy.charName]:addParam('HarassMode', 'AntiGapCloser in Harass Mode:', SCRIPT_PARAM_ONOFF, true)
                self.Menu.AntiGapClosers[enemy.charName]:addParam('LaneClear', 'AntiGapCloser in LaneClear Mode:', SCRIPT_PARAM_ONOFF, false)
                self.Menu.AntiGapClosers[enemy.charName]:addParam('LastHit', 'AntiGapCloser in LastHit Mode:', SCRIPT_PARAM_ONOFF, false)
                self.Menu.AntiGapClosers[enemy.charName]:addParam('Always', 'AntiGapCloser Always:', SCRIPT_PARAM_ONOFF, false)
                FoundAGapCloser = true
            end
        end
    end
    if not FoundAGapCloser then self.Menu.AntiGapClosers:addParam('nil','No Enemy Gapclosers found!', SCRIPT_PARAM_INFO, '') end

    local FoundStunTarget = false
    for index, enemy in ipairs(GetEnemyHeroes()) do
        self.Menu.ASTarget:addSubMenu(enemy.charName, enemy.charName)
        self.Menu.ASTarget[enemy.charName]:addParam('fap', 'Auto Stun '..enemy.charName..' Settings:', SCRIPT_PARAM_INFO, '')
        self.Menu.ASTarget[enemy.charName]:addParam('FightMode', 'Auto Stun in Fight Mode:', SCRIPT_PARAM_ONOFF, true)
        self.Menu.ASTarget[enemy.charName]:addParam('HarassMode', 'Auto Stun in Harass Mode:', SCRIPT_PARAM_ONOFF, false)
        self.Menu.ASTarget[enemy.charName]:addParam('LaneClear', 'Auto Stun in LaneClear Mode:', SCRIPT_PARAM_ONOFF, false)
        self.Menu.ASTarget[enemy.charName]:addParam('LastHit', 'Auto Stun in LastHit Mode:', SCRIPT_PARAM_ONOFF, false)
        self.Menu.ASTarget[enemy.charName]:addParam('Always', 'Auto Stun Always:', SCRIPT_PARAM_ONOFF, false)
        FoundStunTarget = true
    end
    if not FoundStunTarget then self.Menu.ASTarget:addParam('nil','No Enemies to Stun found!', SCRIPT_PARAM_INFO, '') end

    local Foundinterrupt = false
    for index, data in pairs(self.isAChampToInterrupt) do
        for index, enemy in ipairs(GetEnemyHeroes()) do
            if data['Champ'] == enemy.charName then
                self.Menu.Interrupt:addSubMenu(enemy.charName..' ('..data.spellKey..')', enemy.charName)
                self.Menu.Interrupt[enemy.charName]:addParam('fap', 'Interrupt Spell Found: '..enemy.charName..' ('..data.spellKey..')', SCRIPT_PARAM_INFO, '')
                self.Menu.Interrupt[enemy.charName]:addParam('FightMode', 'Auto Interrupt in Fight Mode:', SCRIPT_PARAM_ONOFF, true)
                self.Menu.Interrupt[enemy.charName]:addParam('HarassMode', 'Auto Interrupt in Harass Mode:', SCRIPT_PARAM_ONOFF, true)
                self.Menu.Interrupt[enemy.charName]:addParam('LaneClear', 'Auto Interrupt in LaneClear Mode:', SCRIPT_PARAM_ONOFF, true)
                self.Menu.Interrupt[enemy.charName]:addParam('LastHit', 'Auto Interrupt in LastHit Mode:', SCRIPT_PARAM_ONOFF, true)
                self.Menu.Interrupt[enemy.charName]:addParam('Always', 'Auto Interrupt Always:', SCRIPT_PARAM_ONOFF, true)
                Foundinterrupt = true
            end
        end
    end
    if not Foundinterrupt then self.Menu.Interrupt:addParam('nil','No Enemies to Interrupt found!', SCRIPT_PARAM_INFO, '') end]]--

    self.Menu:addSubMenu("[Vayne] - Condemn Settings", "Condemn")
        --self.Menu.Condemn:addParam("AfterAACondemn", "Use Condemn After Next Attack:", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("E"))
        --self.Menu.Condemn:addParam("AutoStun", "Enable Auto Stun:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.Condemn:addParam("PushDistance", "Push Distance:", SCRIPT_PARAM_SLICE, 440, 440, 450, 0)

    self.Menu:addSubMenu("[Vayne] - Lane Clear", "LaneClear")
        self.Menu.LaneClear:addParam("ClearKey", "Lane Clear Key:", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
        self.Menu.LaneClear:addParam("ClearQ", "Use Q in Lane Clear:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.LaneClear:addParam("LaneClearMana", "Min mana % to use Q in Lane Clear:", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)

    self.Menu:addSubMenu("[Vayne] - Last Hit", "LastHit")
        self.Menu.LastHit:addParam("LastHitKey", "Last Hit Key:", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
        self.Menu.LastHit:addParam("LastHitQ", "Use Q in Last Hit:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.LastHit:addParam("LastHitMana", "Min mana % to use Q in LastHit:", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)

    self.Menu:addSubMenu("[Vayne] - Harass", "Harass")
        self.Menu.Harass:addParam("HarassKey", "Harass Key:", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
        --self.Menu.Harass:addParam("BurstHarass", "Use Burst Harass (AA+Q+E):", SCRIPT_PARAM_ONOFF, true) (This released soon)
        self.Menu.Harass:addParam("HarassQ", "Use Q in Harass:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.Harass:addParam("HarassMana", "Min mana % to use Q in Harass:", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)

    self.Menu:addSubMenu("[Vayne] - Drawings", "Drawings")
        self.Menu.Drawings:addParam("DrawCircleAA", "Draw AA Range:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.Drawings:addParam("DrawCircleE", "Draw E Range:", SCRIPT_PARAM_ONOFF, true)
    ------------------------------------------------------------------------------------------------------------------
    self.Menu:addParam("b", "", SCRIPT_PARAM_INFO, "")
    if VIP_USER then
        self.Menu:addParam("b1", "User: "..GetUser().." (VIP)", SCRIPT_PARAM_INFO, "")
    else
        self.Menu:addParam("b2", "User: "..GetUser().." (FREE)", SCRIPT_PARAM_INFO, "")
    end
    self.Menu:addParam("b3", "Script Version: ".._G.VayneScriptVersion[2], SCRIPT_PARAM_INFO, "")
    self.Menu:addParam("b4", "Script Author: ".._G.VayneScriptAuthor, SCRIPT_PARAM_INFO, "")
end

function MyHeRoVayne:Loader()
    self.LastTarget = nil
    AddTickCallback(function() self:OnTick() end)
    AddDrawCallback(function() self:OnDraw() end)
    --AddProcessSpellCallback(function(unit, spell) self:OnProcessSpell(unit, spell) end)
    AddProcessAttackCallback(function(unit, spell) self:OnProcessAttack(unit, spell) end)
end

function MyHeRoVayne:OnTick()
    ts:update()
    self:BotRK()
    self:BilgeWater()
    --self:CondemnStun()
    self:ComboREnemy()
end

function MyHeRoVayne:BotRK()
    if self.Menu.Combo.Items.BOTRK and GetInventorySlotItem(3153) ~= nil then
        local Target = ts.target
        if Target and ValidTarget(Target, 610) then
            if myHero:CanUseSpell(GetInventorySlotItem(3153)) == READY then
                CastSpell(GetInventorySlotItem(3153), Target)
            end
        end
    end
end

function MyHeRoVayne:BilgeWater()
    if self.Menu.Combo.Items.BWC and GetInventorySlotItem(3152) ~= nil then
        local Target = ts.target
        if Target and ValidTarget(Target, 610) then
            if myHero:CanUseSpell(GetInventorySlotItem(3152)) == READY then
                CastSpell(GetInventorySlotItem(3152), Target)
            end
        end

    end
end

function MyHeRoVayne:Youmuus()
    if self.Menu.Combo.Items.YGB and GetInventorySlotItem(3142) ~= nil then
        if myHero:CanUseSpell(GetInventorySlotItem(3142)) == READY then
            CastSpell(GetInventorySlotItem(3142))
        end
    end
end

function MyHeRoVayne:CountEnemy(range, object)
    object = object or myHero
    range = range and range * range or myHero.range * myHero.range
    local enemyInRange = 0
    for i = 1, heroManager.iCount, 1 do
        local hero = heroManager:getHero(i)
        if ValidTarget(hero) and GetDistanceSqr(object, hero) <= range then
            enemyInRange = enemyInRange + 1
        end
    end
    return enemyInRange
end

function MyHeRoVayne:ComboREnemy()
    if self:CountEnemy(1000, myHero) >= self.Menu.Combo.ComboRRange then
        if self.Menu.Combo.ComboKey then
            if myHero:CanUseSpell(_R) == READY then
                CastSpell(_R)
            end
        end
    end
end

function MyHeRoVayne:OnProcessAttack(unit, spell)
    --[[if self.Menu.Harass.HarassKey and self.Menu.Harass.BurstHarass and myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) == READY then
        if unit.isMe and spell.name:lower():find("attack") then
            SpellTarget = spell.target
            if SpellTarget.type == myHero.type then
                CastSpell(_Q, mousePos.x, mousePos.z)
            end
        end
        if unit.isMe and spell.name:lower():find("vaynetumbleattack") then
            SpellTarget = spell.target
            if SpellTarget.type == myHero.type then
                print("TumbleAttack find")
                CastSpell(_E, SpellTarget)
            end
        end
    end]]--

    if unit.isMe and spell.name:lower():find("attack") then
        if self.Menu.Combo.ComboKey and self.Menu.Combo.ComboQ then
            SpellTarget = spell.target
            if SpellTarget.type == myHero.type and myHero:CanUseSpell(_Q) == READY then
                CastSpell(_Q, mousePos.x, mousePos.z)
            end
        end

        if spell.target then self.LastTarget = spell.target end
        if self.Menu.Condemn.AfterAACondemn and self.LastTarget.type == myHero.type and myHero:CanUseSpell(_Q) and myHero:CanUseSpell(_E) then
            CastSpell(_E, self.LastTarget)
            self.Menu.Condemn.AfterAACondemn = false
        end

        if self.Menu.Harass.HarassQ and self.Menu.Harass.HarassKey and myHero.mana >= (myHero.maxMana*(self.Menu.Harass.HarassMana*0.01)) then
            SpellTarget = spell.target
            if (SpellTarget.type ~= myHero.type) or (SpellTarget.type == myHero.type) and myHero:CanUseSpell(_Q) == READY then
                CastSpell(_Q, mousePos.x, mousePos.z)
            end
        end

        if self.Menu.LaneClear.ClearQ and self.Menu.LaneClear.ClearKey and myHero.mana >= (myHero.maxMana*(self.Menu.LaneClear.LaneClearMana*0.01)) then
            SpellTarget = spell.target
            if SpellTarget.type ~= myHero.type and myHero:CanUseSpell(_Q) == READY then
                CastSpell(_Q, mousePos.x, mousePos.z)
            end
        end
    end
end

--[[function MyHeRoVayne:OnProcessSpell(unit, spell)
    if unit.team ~= myHero.team then
        if self.isAGapcloserUnitTarget[spell.name] then
            if spell.target and spell.target.networkID == myHero.networkID then
                if (self.Menu.AntiGapClosers[unit.charName].FightMode and self.Menu.Combo.ComboKey) or (self.Menu.AntiGapClosers[unit.charName].HarassMode and self.Menu.Harass.HarassKey) or (self.Menu.AntiGapClosers[unit.charName].LaneClear and self.Menu.LaneClear.ClearKey) or (self.Menu.AntiGapClosers[unit.charName].LastHit and self.Menu.LastHit.LastHitKey) or self.Menu.AntiGapClosers[unit.charName].Always then 
                    CastSpell(_E, unit) 
                end
            end
        end

        if self.isAChampToInterrupt[spell.name] and GetDistance(unit) <= 770 then
            if (self.Menu.Interrupt[unit.charName].FightMode and self.Menu.Combo.ComboKey) or (self.Menu.Interrupt[unit.charName].HarassMode and self.Menu.Harass.HarassKey) or (self.Menu.Interrupt[unit.charName].LaneClear and self.Menu.LaneClear.ClearKey) or (self.Menu.Interrupt[unit.charName].LastHit and self.Menu.LastHit.LastHitKey) or self.Menu.Interrupt[unit.charName].Always then 
                CastSpell(_E, unit) 
            end
        end

        if self.isAGapcloserUnitNoTarget[spell.name] and GetDistance(unit) <= 2000 and (spell.target == nil or (spell.target and spell.target.isMe)) then
            if (self.Menu.AntiGapClosers[unit.charName].FightMode and self.Menu.Combo.ComboKey) or (self.Menu.AntiGapClosers[unit.charName].HarassMode and self.Menu.Harass.HarassKey) or (self.Menu.AntiGapClosers[unit.charName].LaneClear and self.Menu.LaneClear.ClearKey) or (self.Menu.AntiGapClosers[unit.charName].LastHit and self.Menu.LastHit.LastHitKey) or self.Menu.AntiGapClosers[unit.charName].Always then
                SpellInfo = {
                    Source = unit,
                    CastTime = os.clock(),
                    Direction = (spell.endPos - spell.startPos):normalized(),
                    StartPos = Point(unit.pos.x, unit.pos.z),
                    Range = self.isAGapcloserUnitNoTarget[spell.name].range,
                    Speed = self.isAGapcloserUnitNoTarget[spell.name].projSpeed,
                }
                self:CondemnGapCloser(SpellInfo)
            end
        end
    end
end]]--

--[[function MyHeRoVayne:CondemnGapCloser(SpellInfo)
    if (os.clock() - SpellInfo.CastTime) <= (SpellInfo.Range/SpellInfo.Speed) and myHero:CanUseSpell(_E) == READY then
        local EndPosition = Vector(SpellInfo.StartPos) + (Vector(SpellInfo.StartPos) - SpellInfo.EndPos):normalized()*(SpellInfo.Range)
        local StartPosition = SpellInfo.StartPos + SpellInfo.Direction
        local EndPosition   = SpellInfo.StartPos + (SpellInfo.Direction * SpellInfo.Range)
        local MyPosition = Point(myHero.x, myHero.z)
        local SkillShot = LineSegment(Point(StartPosition.x, StartPosition.y), Point(EndPosition.x, EndPosition.y))
        if GetDistanceSqr(MyPosition,SkillShot) <= 400*400 then
            self.CondemnTarget = SpellInfo.Source
            CastSpell(_E, self.CondemnTarget)
        else
            DelayAction(function() self:CondemnGapCloser(SpellInfo) end)
        end
    end
end]]--

function MyHeRoVayne:OnDraw()
    if self.Menu.Drawings.DrawCircleE and myHero:CanUseSpell(_E) == READY then
        _G.VayneDrawFPSCircle(myHero.x, myHero.z, 770, RGB(255, 0, 0), 7)
    end
    if self.Menu.Drawings.DrawCircleAA then
        _G.VayneDrawFPSCircle(myHero.x, myHero.z, 620, RGB(0, 255, 0), 7)
    end
end

--[[function MyHeRoVayne:CheckWallStun(Target)
    local Pos, Hitchance, PredictPos = VP:GetLineCastPosition(Target, 0.250, 0, 770, 2200, myHero, false)
    if Hitchance > 1 then
        local checks = 30
        local CheckD = math.ceil(self.Menu.Condemn.PushDistance / checks)
        local FoundGrass = false
        for i = 1, checks  do
            local CheckWallPos = Vector(PredictPos) + Vector(Vector(PredictPos) - Vector(myHero)):normalized()*(CheckD*i)
            if not FoundGrass and IsWallOfGrass(D3DXVECTOR3(CheckWallPos.x, CheckWallPos.y, CheckWallPos.z)) then
                FoundGrass = CheckWallPos
            end
            local WallPoint = IsWall(D3DXVECTOR3(CheckWallPos.x, CheckWallPos.y, CheckWallPos.z))
            if WallPoint then
                CastSpell(_E, Target)
                break
            end
        end
    end
end

function MyHeRoVayne:CondemnStun()
    if myHero:CanUseSpell(_E) == READY then
        if self.Menu.Condemn.AutoStun then
            local Target = ts.target
            if Target and Target.type == myHero.type and ValidTarget(Target, 770) and ((self.Menu.ASTarget[Target.charName].FightMode and self.Menu.Combo.ComboKey) or (self.Menu.ASTarget[Target.charName].HarassMode and self.Menu.Harass.HarassKey) or (self.Menu.ASTarget[Target.charName].LaneClear and self.Menu.LaneClear.ClearKey) or (self.Menu.ASTarget[Target.charName].LastHit and self.Menu.LastHit.LastHitKey) or self.Menu.ASTarget[Target.charName].Always) then
                self:CheckWallStun(Target)
            end
        end
    end
end]]--

function MyHeRoVayne:Message(msg)
    PrintChat("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">My HeRo - </font> <font color=\"#F7CB72\">Vayne</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: ".. msg .."</font></b>")
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------_G.VayneDrawFPSCircle Start--------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

function _G.VayneDrawLineA(x1, y1, x2, y2, color)
    DrawLine(x1, y1, x2, y2, 1, color)
end

function _G.VayneDrawFPSCircle(x, z, radius, color, quality)
    for i = -radius * math.cos(math.pi/4), radius * math.cos(math.pi/4) - 1, radius * math.cos(math.pi/4)/quality do
        local v = WorldToScreen(D3DXVECTOR3((x + i), myHero.y, (z + math.sqrt(radius * radius - i * i))))
        local c = WorldToScreen(D3DXVECTOR3((x + i), myHero.y, (z - math.sqrt(radius * radius - i * i))))
        local k = WorldToScreen(D3DXVECTOR3((x + i + radius * math.cos(math.pi/4)/quality), myHero.y, (z + math.sqrt(radius * radius - (i + radius * math.cos(math.pi/4)/quality) * (i + radius * math.cos(math.pi/4)/quality)))))
        local n = WorldToScreen(D3DXVECTOR3((x + i + radius * math.cos(math.pi/4)/quality), myHero.y, (z - math.sqrt(radius * radius - (i + radius * math.cos(math.pi/4)/quality) * (i + radius * math.cos(math.pi/4)/quality)))))
        if (v.x > 0 and v.x < WINDOW_W) and (v.y > 0 and v.y < WINDOW_H) and (k.x > 0 and k.x < WINDOW_W) and (k.y > 0 and k.y < WINDOW_H) then
            _G.VayneDrawLineA(v.x, v.y, k.x, k.y, color)
        end
        if (c.x > 0 and c.x < WINDOW_W) and (c.y > 0 and c.y < WINDOW_H) and (n.x > 0 and n.x < WINDOW_W) and (n.y > 0 and n.y < WINDOW_H) then
            _G.VayneDrawLineA(c.x, c.y, n.x, n.y, color)
        end
    end

    for i = -radius * math.cos(math.pi/4), radius * math.cos(math.pi/4) - 1, radius * math.cos(math.pi/4)/quality do
        local v = WorldToScreen(D3DXVECTOR3((x + math.sqrt(radius * radius - i * i)), myHero.y, (z + i)))
        local c = WorldToScreen(D3DXVECTOR3((x - math.sqrt(radius * radius - i * i)), myHero.y, (z + i)))
        local k = WorldToScreen(D3DXVECTOR3((x + math.sqrt(radius * radius - (i + radius * math.cos(math.pi/4)/quality) * (i + radius * math.cos(math.pi/4)/quality))), myHero.y, (z + i + radius * math.cos(math.pi/4)/quality)))
        local n = WorldToScreen(D3DXVECTOR3((x - math.sqrt(radius * radius-(i + radius * math.cos(math.pi/4)/quality) * (i + radius * math.cos(math.pi/4)/quality))), myHero.y, (z + i + radius*  math.cos(math.pi/4)/quality)))
        if (v.x > 0 and v.x < WINDOW_W) and (v.y > 0 and v.y < WINDOW_H) and (k.x > 0 and k.x < WINDOW_W) and (k.y > 0 and k.y < WINDOW_H) then
            _G.VayneDrawLineA(v.x, v.y, k.x, k.y, color)
        end
        if (c.x > 0 and c.x < WINDOW_W) and (c.y > 0 and c.y < WINDOW_H) and (n.x > 0 and n.x < WINDOW_W) and (n.y > 0 and n.y < WINDOW_H) then
            _G.VayneDrawLineA(c.x, c.y, n.x, n.y, color)
        end
    end
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------_G.HextechDrawFPSCircle End--------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
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
