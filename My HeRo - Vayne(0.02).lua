if myHero.charName ~= "Vayne" then return end

_G.VayneScriptName = "My HeRo - Vayne"
_G.VayneScriptVersion = {1.0, "1.0"}
_G.VayneScriptAuthor = "HeRoBaNd"

function OnLoad()
    require 'VPrediction'
    VP = VPrediction()
    MyHeRoVayne()
end

class 'MyHeRoVayne'

function MyHeRoVayne:__init()
    ts = TargetSelector(TARGET_PRIORITY, 1000, DAMAGE_MAGIC)
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

    self.Menu:addSubMenu("["..myHero.charName.."] - Combo", "Combo")
        self.Menu.Combo:addParam("ComboKey", "Combo Key:", SCRIPT_PARAM_ONKEYDOWN, false, 32)
        self.Menu.Combo:addParam("ComboQ", "Use Q in Combo:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.Combo:addParam("ComboR", "Use R in Combo:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.Combo:addParam("ComboRRange", "Enemies in Range for R:", SCRIPT_PARAM_SLICE, 2, 0, 5, 0)
        self.Menu.Combo:addSubMenu("Item usage:", "Items")
            self.Menu.Combo.Items:addParam("BOTRK", "Use BOTRK in Combo:", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Combo.Items:addParam("BWC", "Use Bilgewater Cutlass in Combo:", SCRIPT_PARAM_ONOFF, true)
            self.Menu.Combo.Items:addParam("YGB", "Use Youmu in Combo:", SCRIPT_PARAM_ONOFF, true)

    self.Menu:addSubMenu('['..myHero.charName..'] - AntiGapCloser Settings', 'AntiGapClosers')
    self.Menu:addSubMenu('['..myHero.charName..'] - Auto Stun Target', 'ASTarget')
    self.Menu:addSubMenu('['..myHero.charName..'] - Interrupt Settings', 'Interrupt')

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
    if not Foundinterrupt then self.Menu.Interrupt:addParam('nil','No Enemies to Interrupt found!', SCRIPT_PARAM_INFO, '') end

    self.Menu:addSubMenu("["..myHero.charName.."] - Condemn Settings", "Condemn")
        self.Menu.Condemn:addParam("AfterAACondemn", "Use Condemn After Next Attack:", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("E"))
        self.Menu.Condemn:addParam("AutoStun", "Enable Auto Stun:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.Condemn:addParam("PushDistance", "Push Distance:", SCRIPT_PARAM_SLICE, 440, 440, 450, 0)

    self.Menu:addSubMenu("["..myHero.charName.."] - Lane Clear", "LaneClear")
        self.Menu.LaneClear:addParam("ClearKey", "Lane Clear Key:", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
        self.Menu.LaneClear:addParam("ClearQ", "Use Q in Lane Clear:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.LaneClear:addParam("LaneClearMana", "Min mana % to use Q in Lane Clear:", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)

    self.Menu:addSubMenu("["..myHero.charName.."] - Last Hit", "LastHit")
        self.Menu.LastHit:addParam("LastHitKey", "Last Hit Key:", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
        self.Menu.LastHit:addParam("LastHitQ", "Use Q in Last Hit:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.LastHit:addParam("LastHitMana", "Min mana % to use Q in LastHit:", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)

    self.Menu:addSubMenu("["..myHero.charName.."] - Harass", "Harass")
        self.Menu.Harass:addParam("HarassKey", "Harass Key:", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
        self.Menu.Harass:addParam("BurstHarass", "Use Burst Harass (AA+Q+E):", SCRIPT_PARAM_ONOFF, true)
        self.Menu.Harass:addParam("HarassQ", "Use Q in Harass:", SCRIPT_PARAM_ONOFF, true)
        self.Menu.Harass:addParam("HarassMana", "Min mana % to use Q in Harass:", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)

    self.Menu:addSubMenu("["..myHero.charName.."] - Drawings", "Drawings")
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
    AddProcessSpellCallback(function(unit, spell) self:OnProcessSpell(unit, spell) end)
    AddProcessAttackCallback(function(unit, spell) self:OnProcessAttack(unit, spell) end)
end

function MyHeRoVayne:OnTick()
    ts:update()
    self:BotRK()
    self:BilgeWater()
    self:CondemnStun()
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
    if unit.isMe and spell.name:lower():find("attack") and self.Menu.Combo.ComboKey and self.Menu.Combo.ComboQ then
        SpellTarget = spell.target
        if SpellTarget.type == myHero.type and myHero:CanUseSpell(_Q) == READY then
            DelayAction(function() CastSpell(_Q, mousePos.x, mousePos.z) end, spell.windUpTime - GetLatency() / 2000)
        end
    end

    if unit.isMe and spell.name:lower():find("attack") then
        if spell.target then self.LastTarget = spell.target end
        if self.Menu.Condemn.AfterAACondemn and self.LastTarget.type == myHero.type and myHero:CanUseSpell(_Q) and myHero:CanUseSpell(_E) then
            DelayAction(function() CastSpell(_E, self.LastTarget) end, spell.windUpTime + GetLatency()/2000)
            self.Menu.Condemn.AfterAACondemn = false
        end
    end

    if unit.isMe and spell.name:lower():find("attack") and self.Menu.Harass.HarassKey and self.Menu.Harass.BurstHarass and myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) == READY then
        SpellTarget = spell.target
        if SpellTarget.type == myHero.type and myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) == READY then
            DelayAction(function() CastSpell(_Q, mousePos.x, mousePos.z) end, spell.windUpTime - GetLatency() / 2000)
            DelayAction(function() CastSpell(_E, mousePos.x, mousePos.z) end, spell.windUpTime - GetLatency() / 2000)
        end
    end

    if unit.isMe and spell.name:lower():find("attack") and self.Menu.Harass.HarassQ and self.Menu.Harass.HarassKey and myHero.mana >= (myHero.maxMana*(self.Menu.Harass.HarassMana*0.01)) then
        SpellTarget = spell.target
        if (SpellTarget.type ~= myHero.type) or (SpellTarget.type == myHero.type) and myHero:CanUseSpell(_Q) == READY then
            DelayAction(function() CastSpell(_Q, mousePos.x, mousePos.z) end, spell.windUpTime - GetLatency() / 2000)
        end
    end

    if unit.isMe and spell.name:lower():find("attack") and self.Menu.LaneClear.ClearQ and self.Menu.LaneClear.ClearKey and myHero.mana >= (myHero.maxMana*(self.Menu.LaneClear.LaneClearMana*0.01)) then
        SpellTarget = spell.target
        if SpellTarget.type ~= myHero.type and myHero:CanUseSpell(_Q) == READY then
            DelayAction(function() CastSpell(_Q, mousePos.x, mousePos.z) end, spell.windUpTime - GetLatency() / 2000)
        end
    end
end

function MyHeRoVayne:OnProcessSpell(unit, spell)
    --print("Work")
    if unit.team ~= myHero.team then
        if self.isAGapcloserUnitTarget[spell.name] then
            if spell.target and spell.target.networkID == myHero.networkID then
                if (self.Menu.AntiGapClosers[unit.charName].FightMode and self.Menu.Combo.ComboKey) or (self.Menu.AntiGapClosers[unit.charName].HarassMode and self.Menu.Harass.HarassKey) or (self.Menu.AntiGapClosers[unit.charName].LaneClear and self.Menu.LaneClear.ClearKey) or (self.Menu.AntiGapClosers[unit.charName].LastHit and self.Menu.LastHit.LastHitKey) or self.Menu.AntiGapClosers[unit.charName].Always then CastSpell(_E, unit) end
            end
        end

        if self.isAChampToInterrupt[spell.name] and GetDistanceSqr(unit) <= 715*715 then
            if (self.Menu.Interrupt[unit.charName].FightMode and self.Menu.Combo.ComboKey) or (self.Menu.Interrupt[unit.charName].HarassMode and self.Menu.Harass.HarassKey) or (self.Menu.Interrupt[unit.charName].LaneClear and self.Menu.LaneClear.ClearKey) or (self.Menu.Interrupt[unit.charName].LastHit and self.Menu.LastHit.LastHitKey) or self.Menu.Interrupt[unit.charName].Always then CastSpell(_E, unit) end
        end

        if self.isAGapcloserUnitNoTarget[spell.name] and GetDistanceSqr(unit) <= 2000*2000 and (spell.target == nil or (spell.target and spell.target.isMe)) then
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
end

function MyHeRoVayne:CondemnGapCloser(SpellInfo)
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
end

function MyHeRoVayne:OnDraw()

end

function MyHeRoVayne:CheckWallStun(Target)
    local Pos, Hitchance, PredictPos = VP:GetLineCastPosition(Target, 0.250, 0, 750, 2200, myHero, false)
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
            if Target and Target.type == myHero.type and ValidTarget(Target, 710) and ((self.Menu.ASTarget[Target.charName].FightMode and self.Menu.Combo.ComboKey) or (self.Menu.ASTarget[Target.charName].HarassMode and self.Menu.Harass.HarassKey) or (self.Menu.ASTarget[Target.charName].LaneClear and self.Menu.LaneClear.ClearKey) or (self.Menu.ASTarget[Target.charName].LastHit and self.Menu.LastHit.LastHitKey) or self.Menu.ASTarget[Target.charName].Always) then
                self:CheckWallStun(Target)
            end
        end
    end
end
