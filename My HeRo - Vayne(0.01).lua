if myHero.charName ~= "Vayne" then return end
local SpellTable = {}
local SpellExpired = true
local eRange, eSpeed, eDelay, eRadius = 1000, 2200, 0.25, nil
local qOff, wOff, eOff, rOff = 0, 0, 0, 0
local ScriptName = "My HeRo - Vayne"
require 'VPrediction'
local VP = VPrediction()

function OnLoad()
    ts = TargetSelector(TARGET_PRIORITY, 2000, DAMAGE_PHYSICAL)
    Menu = scriptConfig("My HeRo - Vayne", "MHVayne")

    Menu:addSubMenu("["..myHero.charName.." - OrbWalkers]", "Orbwalker")

    Menu:addSubMenu("["..myHero.charName.." - Combo]", "Combo")
    Menu.Combo:addParam("ComboKey", "Combo key", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Menu.Combo:addParam("ComboQ", "Use Q in combo", SCRIPT_PARAM_ONOFF, true)
    Menu.Combo:addParam("ComboR", "Use R in combo", SCRIPT_PARAM_ONOFF, true)
    Menu.Combo:addParam("ComboRRange", "Enemies in range for R", SCRIPT_PARAM_SLICE, 2, 0, 5, 0)
    Menu.Combo:addSubMenu("Item usage", "Items")
        Menu.Combo.Items:addParam("BOTRK", "Use BOTRK in combo", SCRIPT_PARAM_ONOFF, true)
        Menu.Combo.Items:addParam("BWC", "Use Bilgewater Cutlass in combo", SCRIPT_PARAM_ONOFF, true)
        Menu.Combo.Items:addParam("YGB", "Use Youmu in combo", SCRIPT_PARAM_ONOFF, true)

    Menu:addSubMenu("["..myHero.charName.." - Condemn]", "Condemn")

    Menu.Condemn:addSubMenu("Features & Settings", "SettingsSubMenu")
        Menu.Condemn.SettingsSubMenu:addParam("PushAwayGapClosers", "Push Gapclosers Away", SCRIPT_PARAM_ONOFF, true)
        Menu.Condemn.SettingsSubMenu:addParam("Interrupter", "Push Interrupt Spell Away", SCRIPT_PARAM_ONOFF, true)
        Menu.Condemn.SettingsSubMenu:addParam("CondemnAssistant", "Condemn Visual Assistant:", SCRIPT_PARAM_ONOFF, true)
        Menu.Condemn.SettingsSubMenu:addParam("PushDistance", "Push Distance", SCRIPT_PARAM_SLICE, 440, 0, 450, 0)
        Menu.Condemn.SettingsSubMenu:addParam("Candy", "After-Condemn Circle:", SCRIPT_PARAM_ONOFF, true)
    Menu.Condemn:addSubMenu("Disable Auto-Condemn on", "CondemnSubMenu")
        for i, enemy in ipairs(GetEnemyHeroes()) do
            Menu.Condemn.CondemnSubMenu:addParam("Disable Condemn"..i, " >> "..enemy.charName, SCRIPT_PARAM_ONOFF, false)
            Menu.Condemn["Disable Condemn"..i] = false
        end
    Menu.Condemn:addSubMenu("Only Condemn Current Target", "OnlyCurrentTarget")
        Menu.Condemn.OnlyCurrentTarget:addParam("CondemnTarget", "Only Condemn Current Target", SCRIPT_PARAM_ONOFF, false)
        Menu.Condemn.OnlyCurrentTarget:addTS(ts)
        ts.name = "Condemn Targeting"
    Menu.Condemn:addParam("AutoCondemn", "Auto-Condemn Toggle:", SCRIPT_PARAM_ONKEYTOGGLE, false, 32)

    Menu:addSubMenu("["..myHero.charName.." - Lane Clear]", "LaneClear")
    Menu.LaneClear:addParam("ClearKey", "Lane Clear Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Menu.LaneClear:addParam("ClearQ", "Use Q in Lane Clear", SCRIPT_PARAM_ONOFF, true)
    Menu.LaneClear:addParam("LaneClearMana", "Min mana % to use Q in Lane Clear", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)

    Menu:addSubMenu("["..myHero.charName.." - Harass]", "Harass")
    Menu.Harass:addParam("HarassKey", "Harass Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Menu.Harass:addParam("HarassQ", "Use Q in Harass", SCRIPT_PARAM_ONOFF, true)
    Menu.Harass:addParam("HarassMana", "Min mana % to use Q in Harass", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)

    Menu:addSubMenu("["..myHero.charName.." - Drawings]", "Drawings")
    Menu.Drawings:addParam("DrawCircleAA", "Draw AA Range", SCRIPT_PARAM_ONOFF, true)
end

function OnTick()
    ts:update()

    if CountEnemyHeroInRange(1000) >= Menu.Combo.ComboRRange then
        if Menu.Combo.ComboR then
            if Menu.Combo.ComboKey then
                if (myHero:CanUseSpell(_R) == READY) then
                    CastSpell(_R)
                end
            end
        end
    end

    if (Menu.Combo.ComboKey) then
        UseBotrk()
        UseBWC()
        UseYGB()
    end
end

function UseBotrk()
    if ts.target ~= nil and Menu.Combo.ComboKey and GetDistance(myHero, ts.target) < 550 and not ts.target.dead and ts.target.visible and GetInventorySlotItem(3153) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3153)) == READY then
        if (Menu.Combo.Items.BOTRK) then 
            CastSpell(GetInventorySlotItem(3153), ts.target)
        end
    end
end

function UseBWC()
    if ts.target ~= nil and Menu.Combo.ComboKey GetDistance(myHero, ts.target) < 550 and not ts.target.dead and ts.target.visible and GetInventorySlotItem(3144) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3144)) == READY then
        if (Menu.Combo.Items.BWC) then 
            CastSpell(GetInventorySlotItem(3144), ts.target)
        end
    end
end
function UseYGB()
    if ts.target ~= nil and Menu.Combo.ComboKey and not ts.target.dead and GetDistance(myHero, ts.target) < 1500 and ts.target.visible and GetInventorySlotItem(3142) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3142)) == READY then
        if (Menu.Combo.Items.YGB) then 
            CastSpell(GetInventorySlotItem(3142))
        end
    end
end

function OnDraw()
    if myHero.dead then return end

    if (Menu.Drawings.DrawCircleAA) then
        DrawCircle(myHero.x, myHero.y, myHero.z, 655, ARGB(255, 0, 255, 0))
    end

    if Menu.Condemn.AutoCondemn then
        if not Menu.Condemn.OnlyCurrentTarget.CondemnTarget then
            CondemnV1()
        elseif Menu.Condemn.OnlyCurrentTarget.CondemnTarget then
            CondemnV2()
        end
    end
end

function CondemnV1()
    if myHero:CanUseSpell(_E) == READY then
        if Menu.Condemn.SettingsSubMenu.PushAwayGapClosers then
            if not SpellExpired and (GetTickCount() - SpellTable.spellCastedTick) <= (SpellTable.spellRange/SpellTable.spellSpeed)*1000 then
                local SpellDirection     = (SpellTable.spellEndPos - SpellTable.spellStartPos):normalized()
                local SpellStartPosition = SpellTable.spellStartPos + SpellDirection
                local SpellEndPosition   = SpellTable.spellStartPos + SpellDirection * SpellTable.spellRange
                local MyHeroPos = Point(myHero.x, myHero.z)
                local Segment = LineSegment(Point(SpellStartPosition.x, SpellStartPosition.y), Point(SpellEndPosition.x, SpellEndPosition.y))
                if Segment:distance(MyHeroPos) <= (not SpellTable.spellIsAnExpetion and 65 or 200) then
                    CastSpell(_E, SpellTable.spellSource)
                    if Menu.Drawings.Debug then
                        Menu.Drawings:addParam("SD", "SpellDirection", SCRIPT_PARAM_ONOFF, true)
                        Menu.Drawings:addParam("SSP", "SpellDirection", SCRIPT_PARAM_ONOFF, true)
                        Menu.Drawings:addParam("SEP", "SpellDirection", SCRIPT_PARAM_ONOFF, true)
                        Menu.Drawings:addParam("MHP", "SpellDirection", SCRIPT_PARAM_ONOFF, true)
                        Menu.Drawings:addParam("Segment", "SpellDirection", SCRIPT_PARAM_ONOFF, true)
                    end

                    if Menu.Drawings.SD then
                        DrawCircle(SpellDirection.x, SpellDirection.y, SpellDirection.z, 100, RGB(255, 0, 0))
                    end
                    if Menu.Drawings.SSP then
                        DrawCircle(SpellStartPosition.x, SpellStartPosition.y, SpellStartPosition.z, 100, RGB(0, 255, 0))
                    end
                    if Menu.Drawings.SEP then
                        DrawCircle(SpellEndPosition.x, SpellEndPosition.y, SpellEndPosition.z, 100, RGB(0, 0, 255))
                    end
                    if Menu.Drawings.MHP then
                        DrawCircle(MyHeroPos.x, MyHeroPos.y, MyHeroPos.z, 100, RGB(155, 155, 155))
                    end
                    if Menu.Drawings.Segment then
                        Segment:draw(RGB(100, 100, 100), 100)
                    end
                end
            else
                SpellExpired = true
                SpellTable = {}
            end
        end
        if not Menu.Condemn.OnlyCurrentTarget.CondemnTarget and Menu.Condemn.AutoCondemn then
            for i, enemyHero in ipairs(GetEnemyHeroes()) do
                if not Menu.Condemn.CondemnSubMenu["Disable Condemn"..i] then 
                    if (enemyHero ~= nil and enemyHero.valid and not enemyHero.dead and enemyHero.visible and GetDistance(myHero, enemyHero) <= 715 and GetDistance(enemyHero) > 0) then
                        local EnemyPos = VP:GetPredictedPos(enemyHero, eDelay, eSpeed)
                        local PushPos = EnemyPos + (Vector(EnemyPos) - myHero):normalized() * Menu.Condemn.SettingsSubMenu.PushDistance
                        if enemyHero.x > 0 and enemyHero.z > 0 then
                            local Checks = math.ceil((Menu.Condemn.SettingsSubMenu.PushDistance)/65)
                            local CheckDistance = (Menu.Condemn.SettingsSubMenu.PushDistance)/Checks
                            local InsideTheWall = false
                            for k = 1, Checks, 1 do
                                local ChecksPos = EnemyPos + (Vector(EnemyPos) - myHero):normalized()*(CheckDistance*k)
                                local WallContainsPosition = IsWall(D3DXVECTOR3(ChecksPos.x, ChecksPos.y, ChecksPos.z))
                                if WallContainsPosition then
                                    InsideTheWall = true
                                    break
                                end
                            end
                            if InsideTheWall then CastSpell(_E, enemyHero) end
                            if Menu.Condemn.SettingsSubMenu.Candy and PushPos.x > 0 and PushPos.z > 0 then
                                DrawCircle(PushPos.x, PushPos.y, PushPos.z, 65, ARGB(255, 0, 255, 0))
                            end
                        end
                    end
                end
            end
        end
    end
end

function CondemnV2()
    if myHero:CanUseSpell(_E) == READY then
        if Menu.Condemn.SettingsSubMenu.PushAwayGapClosers then
            if not SpellExpired and (GetTickCount() - SpellTable.spellCastedTick) <= (SpellTable.spellRange/SpellTable.spellSpeed)*1000 then
                local SpellDirection     = (SpellTable.spellEndPos - SpellTable.spellStartPos):normalized()
                local SpellStartPosition = SpellTable.spellStartPos + SpellDirection
                local SpellEndPosition   = SpellTable.spellStartPos + SpellDirection * SpellTable.spellRange
                local MyHeroPos = Point(myHero.x, myHero.z)
                local Segment = LineSegment(Point(SpellStartPosition.x, SpellStartPosition.y), Point(SpellEndPosition.x, SpellEndPosition.y))
                if Segment:distance(MyHeroPos) <= (not SpellTable.spellIsAnExpetion and 65 or 200) then
                    CastSpell(_E, SpellTable.spellSource)
                    if Menu.Drawings.Debug then
                        Menu.Drawings:addParam("SD", "SpellDirection", SCRIPT_PARAM_ONOFF, true)
                        Menu.Drawings:addParam("SSP", "SpellDirection", SCRIPT_PARAM_ONOFF, true)
                        Menu.Drawings:addParam("SEP", "SpellDirection", SCRIPT_PARAM_ONOFF, true)
                        Menu.Drawings:addParam("MHP", "SpellDirection", SCRIPT_PARAM_ONOFF, true)
                        Menu.Drawings:addParam("Segment", "SpellDirection", SCRIPT_PARAM_ONOFF, true)
                    end

                    if Menu.Drawings.SD then
                        DrawCircle(SpellDirection.x, SpellDirection.y, SpellDirection.z, 100, RGB(255, 0, 0))
                    end
                    if Menu.Drawings.SSP then
                        DrawCircle(SpellStartPosition.x, SpellStartPosition.y, SpellStartPosition.z, 100, RGB(0, 255, 0))
                    end
                    if Menu.Drawings.SEP then
                        DrawCircle(SpellEndPosition.x, SpellEndPosition.y, SpellEndPosition.z, 100, RGB(0, 0, 255))
                    end
                    if Menu.Drawings.MHP then
                        DrawCircle(MyHeroPos.x, MyHeroPos.y, MyHeroPos.z, 100, RGB(155, 155, 155))
                    end
                    if Menu.Drawings.Segment then
                        Segment:draw(RGB(100, 100, 100), 100)
                    end
                end
            else
                SpellExpired = true
                SpellTable = {}
            end
        end

        if Menu.Condemn.autoCondemn and Menu.Condemn.OnlyCurrentTarget.CondemnTarget then
            for i, enemy in ipairs(GetEnemyHeroes()) do
                if not Menu.Condemn.CondemnSubMenu["Disable Condemn"..i] then 
                    if (ts.target ~= nil and ts.target.valid and not ts.target.dead and ts.target.visible and GetDistance(myHero, ts.target) <= 715) then
                        local EnemyPos = VP:GetPredictedPos(ts.target, eDelay, eSpeed)
                        local PushPos = EnemyPos + (Vector(EnemyPos) - myHero):normalized() * Menu.Condemn.SettingsSubMenu.PushDistance
                        if ts.target.x > 0 and ts.target.z > 0 then
                            local Checks = math.ceil((Menu.Condemn.SettingsSubMenu.PushDistance)/65)
                            local CheckDistance = (Menu.Condemn.SettingsSubMenu.PushDistance)/Checks
                            local InsideTheWall = false
                            for k = 1, Checks, 1 do
                                local ChecksPos = EnemyPos + (Vector(EnemyPos) - myHero):normalized()*(CheckDistance * k)
                                local WallContainsPosition = IsWall(D3DXVECTOR3(ChecksPos.x, ChecksPos.y, ChecksPos.z))
                                if WallContainsPosition then
                                    InsideTheWall = true
                                    break
                                end
                            end
                            if InsideTheWall then CastSpell(_E, ts.target) end
                            if Menu.Condemn.SettingsSubMenu.Candy and PushPos.x > 0 and PushPos.z > 0 then
                                DrawCircle(PushPos.x, PushPos.y, PushPos.z, 65, ARGB(255, 0, 255, 0))
                            end
                        end
                    end
                end
            end
        end
    end
end

function OnProcessSpell(unit, spell)
    if unit.isMe and spell.name:lower():find("attack") and Menu.Combo.ComboKey and Menu.Combo.ComboQ then
        SpellTarget = spell.target
        if SpellTarget.type == myHero.type then
            DelayAction(function() CastSpell(_Q, mousePos.x, mousePos.z) end, spell.windUpTime - GetLatency() / 2000)
        end
    end
    if unit.isMe and spell.name:lower():find("attack") and Menu.Harass.HarassQ and Menu.Harass.HarassKey and myHero.mana >= (myHero.maxMana*(Menu.Harass.HarassMana*0.01)) then
        SpellTarget = spell.target
            DelayAction(function() CastSpell(_Q, mousePos.x, mousePos.z) end, spell.windUpTime - GetLatency() / 2000)
    end
    if unit.isMe and spell.name:lower():find("attack") and Menu.LaneClear.ClearQ and Menu.LaneClear.ClearKey and myHero.mana >= (myHero.maxMana*(Menu.LaneClear.LaneClearMana*0.01)) then
        SpellTarget = spell.target
            DelayAction(function() CastSpell(_Q, mousePos.x, mousePos.z) end, spell.windUpTime - GetLatency() / 2000)
    end

    if not Menu.Condemn.SettingsSubMenu.PushAwayGapClosers then return end
    local isAGapcloserUnit = {
        ['Aatrox']      = {true, spell = _Q,                  range = 1000,  projSpeed = 1200, },
        ['Akali']       = {true, spell = _R,                  range = 800,   projSpeed = 2200, }, 
        ['Alistar']     = {true, spell = _W,                  range = 650,   projSpeed = 2000, }, 
        ['Diana']       = {true, spell = _R,                  range = 825,   projSpeed = 2000, }, 
        ['Gragas']      = {true, spell = _E,                  range = 600,   projSpeed = 2000, },
        ['Graves']      = {true, spell = _E,                  range = 425,   projSpeed = 2000, exeption = true },
        ['Hecarim']     = {true, spell = _R,                  range = 1000,  projSpeed = 1200, },
        ['Irelia']      = {true, spell = _Q,                  range = 650,   projSpeed = 2200, }, 
        ['Jax']         = {true, spell = _Q,                  range = 700,   projSpeed = 2000, }, 
        ['Jayce']       = {true, spell = 'JayceToTheSkies',   range = 600,   projSpeed = 2000, }, 
        ['Khazix']      = {true, spell = _E,                  range = 900,   projSpeed = 2000, },
        ['Leblanc']     = {true, spell = _W,                  range = 600,   projSpeed = 2000, },
        ['LeeSin']      = {true, spell = 'blindmonkqtwo',     range = 1300,  projSpeed = 1800, },
        ['Leona']       = {true, spell = _E,                  range = 900,   projSpeed = 2000, },
        ['Maokai']      = {true, spell = _Q,                  range = 600,   projSpeed = 1200, },
        ['MonkeyKing']  = {true, spell = _E,                  range = 650,   projSpeed = 2200, }, 
        ['Pantheon']    = {true, spell = _W,                  range = 600,   projSpeed = 2000, }, 
        ['Poppy']       = {true, spell = _E,                  range = 525,   projSpeed = 2000, }, 
        ['Quinn']       = {true, spell = _E,                  range = 725,   projSpeed = 2000, }, 
        ['Renekton']    = {true, spell = _E,                  range = 450,   projSpeed = 2000, },
        ['Sejuani']     = {true, spell = _Q,                  range = 650,   projSpeed = 2000, },
        ['Shen']        = {true, spell = _E,                  range = 575,   projSpeed = 2000, },
        ['Tristana']    = {true, spell = _W,                  range = 900,   projSpeed = 2000, },
        ['Tryndamere']  = {true, spell = _E,                  range = 650,   projSpeed = 1450, },
        ['XinZhao']     = {true, spell = _E,                  range = 650,   projSpeed = 2000, },
    }
        ----------------------------------------------------------------------------------------
        local Interrupter = {
        ["Caitlyn"]     = {true, spell = _R},
        ["Katarina"]    = {true, spell = _R},
        ["MasterYi"]    = {true, spell = _W},
        ["Fiddlesticks"]= {true, spell = _R},
        ["Galio"]       = {true, spell = _R},
        ["Lucian"]      = {true, spell = _R},
        ["MissFortune"] = {true, spell = _R},
        ["VelKoz"]      = {true, spell = _R},
        ["Nunu"]        = {true, spell = _R},
        ["Shen"]        = {true, spell = _R},
        ["Karthus"]     = {true, spell = _R},
        ["Malzahar"]    = {true, spell = _R},
        ["Pantheon"]    = {true, spell = _R},
        ["Warwick"]     = {true, spell = _R},
        ["Xerath"]      = {true, spell = _R},
        ["TwistedFate"] = {true, spell = _R},
        ["Jhin"]        = {true, spell = _R},
    }

    if Menu.Condemn.SettingsSubMenu.Interrupter and unit and spell and myHero:CanUseSpell(_E) and (spell.name == (type(Interrupter[unit.charName].spell) == 'number' and unit:GetSpellData(Interrupter[unit.charName].spell).name or Interrupter[unit.charName].spell) then
        if unit.team ~= myHero.team and Interrupter[spell.name] ~= nil then
            if GetDistance(myHero, unit) < 1000 then
                CastSpell(_E, unit)
            end
        end
    end
    
    if unit.type == 'obj_AI_Hero' and unit.team == TEAM_ENEMY and isAGapcloserUnit[unit.charName] and GetDistance(unit) < 2000 and spell ~= nil then
        if spell.name == (type(isAGapcloserUnit[unit.charName].spell) == 'number' and unit:GetSpellData(isAGapcloserUnit[unit.charName].spell).name or isAGapcloserUnit[unit.charName].spell) then
            if spell.target ~= nil and spell.target.name == myHero.name or isAGapcloserUnit[unit.charName].spell == 'blindmonkqtwo' or isAGapcloserUnit[unit.charName].spell == 'JayceToTheSkies' then
                CastSpell(_E, unit)
            else
                SpellExpired = false
                SpellTable = {
                    spellSource = unit,
                    spellCastedTick = GetTickCount(),
                    spellStartPos = Point(spell.startPos.x, spell.startPos.z),
                    spellEndPos = Point(spell.endPos.x, spell.endPos.z),
                    spellRange = isAGapcloserUnit[unit.charName].range,
                    spellSpeed = isAGapcloserUnit[unit.charName].projSpeed,
                    spellIsAnExpetion = isAGapcloserUnit[unit.charName].exeption or false,
                }
            end
        end
    end
end
