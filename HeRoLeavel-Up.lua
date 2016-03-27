---Auto Leavel Up Developed by HeRoBaNd---
--[[
 _   _     ______      _                          _        _   _       
| | | |    | ___ \    | |                        | |      | | | |      
| |_| | ___| |_/ /___ | |     ___  __ ___   _____| |      | | | |_ __  
|  _  |/ _ \    // _ \| |    / _ \/ _` \ \ / / _ \ |      | | | | '_ \ 
| | | |  __/ |\ \ (_) | |___|  __/ (_| |\ V /  __/ |      | |_| | |_) |
\_| |_/\___\_| \_\___/\_____/\___|\__,_| \_/ \___|_|       \___/| .__/ 
                                                                | |    
                                                                |_|  
]]--																																

local version = "3.4"
local SCRIPT_NAME = "HeRo Jarvan"
local SCRIPT_AUTHOR = "HeRoBaNd"
--------------------------------------------------------------
local FizzCustomGG = {'AP', 'AD/AS'}
local JinxCustomGG = {'Q - OP', 'W - OP'}
local GnarCustomGG = {'Q - OP', 'W - OP'}
local KarmaCustomGG = {'Mid', 'Support'}
local LeblancCustomGG = {'Q - OP', 'W - OP'}
local LuluCustomGG = {'Support', 'Mid'}
local LuxCustomGG = {'Support', 'Mid'}
local MorganaCustomGG = {'Support', 'Mid'}
local RengarCustomGG = {'AP Rengar', 'AD Rengar'}
local RivenCustomGG = {'Q-Riven', 'E-Riven'}
local ShacoCustomGG = {'AD', 'AP'}
local TwistedCustomGG = {'Mid', 'ADC'}
local UdyrCustomGG = {'Fenix', 'Tiger'}
--------------------------------------------------------------
local MySeqFName = {'AP', 'AD/AS'}
local MySeqJName = {'Q - OP', 'W - OP'}
local MySeqGName = {'Q - OP', 'W - OP'}
local MySeqKName = {'Mid', 'Support'}
local MySeqLeName = {'Q - OP', 'W - OP'}
local MySeqLuName = {'Support', 'Mid'}
local MySeqLxName = {'Support', 'Mid'}
local MySeqMName = {'Support', 'Mid'}
local MySeqRName = {'AP Rengar', 'AD Rengar'}
local MySeqRiName = {'Q - Riven', 'E - Riven'}
local MySeqSName = {'AD', 'AP'}
local MySeqTName = {'Mid', 'ADC'}
local MySeqUName = {'Fenix', 'Tiger'}
--------------------------------------------------------------
local CustomChar = {'Fizz', 'Jinx', 'Gnar', 'Karma', 'Leblanc', 'Lulu', 'Lux', 'Morgana', 'Rengar', 'Riven', 'Shaco', 'TwistedFate', 'Udyr'}

-- BoL Tools Tracker --
assert(load(Base64Decode("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"), nil, "bt", _ENV))()
TrackerLoad("XiDFjfqj2dRfEv5v")
-- BoL Tools Tracker --

SequencesName = {
    [0]                 =   '{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}',
    [1]                 =   '{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}', 
    [2]                 =   '{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}', 
    [3]                 =   '{2, 1, 3, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3}', 
    [4]                 =   '{2, 3, 1, 2, 2, 4, 2, 3, 2, 3, 4, 3, 3, 1, 1, 4, 1, 1}', 
    [5]                 =   '{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}', 
    [6]                 =   '{3, 2, 1, 3, 3, 4, 3, 2, 3, 2, 4, 2, 2, 1, 1, 4, 1, 1}',
    ["Aatrox"]          =   '{2, 1, 3, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3}',
    ["AurelionSol"]     =   '{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Ahri"]            =   '{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 2, 2}',
    ["Akali"]           =   '{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Alistar"]         =   '{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Amumu"]           =   '{2, 3, 1, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}',
    ["Anivia"]          =   '{1, 3, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}',
    ["Annie"]           =   '{2, 1, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Ashe"]            =   '{1, 2, 1, 2, 3, 4, 1, 1, 2, 1, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Azir"]            =   '{2, 1, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Bard"]            =   '{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Blitzcrank"]      =   '{1, 3, 2, 3, 2, 4, 3, 2, 3, 2, 4, 3, 2, 1, 1, 4, 1, 1}',
    ["Brand"]           =   '{2, 1, 3, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3}',
    ["Braum"]           =   '{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Caitlyn"]         =   '{2, 1, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Cassiopeia"]      =   '{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}',
    ["Chogath"]         =   '{3, 1, 2, 2, 2, 4, 2, 3, 2, 3, 4, 3, 3, 1, 1, 4, 1, 1}',
    ["Corki"]           =   '{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 2, 3, 2, 4, 2, 2}',
    ["Darius"]          =   '{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Diana"]           =   '{2, 1, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["DrMundo"]         =   '{2, 1, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 3, 2, 2, 2, 2}',
    ["Draven"]          =   '{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Ekko"]            =   '{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Elise"]           =   '{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Evelynn"]         =   '{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Ezreal"]          =   '{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["FiddleSticks"]    =   '{2, 3, 1, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3}',
    ["Fiora"]           =   '{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Fizz"]            =   '{3, 1, 2, 3, 3, 4, 3, 2, 3, 2, 4, 2, 2, 1, 1, 4, 1, 1}',
    ["Galio"]           =   '{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 3, 3, 2, 2, 4, 3, 3}',
    ["Gnar"]            =   '{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Gangplank"]       =   '{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Garen"]           =   '{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}',
    ["Gragas"]          =   '{2, 3, 1, 3, 3, 4, 3, 2, 3, 2, 4, 2, 2, 1, 1, 4, 1, 1}',
    ["Graves"]          =   '{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Hecarim"]         =   '{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Heimerdinger"]    =   '{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Illaoi"]          =   '{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Irelia"]          =   '{1, 3, 2, 2, 2, 4, 2, 3, 2, 3, 4, 3, 3, 1, 1, 4, 1, 1}',
    ["Janna"]           =   '{3, 2, 1, 3, 3, 4, 3, 2, 3, 2, 4, 2, 2, 1, 1, 4, 1, 1}',
    ["JarvanIV"]        =   '{3, 1, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Jax"]             =   '{3, 2, 1, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3}',
    ["Jayce"]           =   '{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Jinx"]            =   '{1, 2, 3, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3}',
    ["Jhin"]            =   '{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Kalista"]         =   '{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}',
    ["Karma"]           =   '{1, 3, 2, 1, 1, 4, 1, 3, 3, 1, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Karthus"]         =   '{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Kassadin"]        =   '{1, 2, 3, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}',
    ["Katarina"]        =   '{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Kayle"]           =   '{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}',
    ["Kennen"]          =   '{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Khazix"]          =   '{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Kindred"]         =   '{2, 1, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["KogMaw"]          =   '{2, 3, 1, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3}',
    ["Leblanc"]         =   '{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 3, 2, 3, 4, 3, 3}',
    ["LeeSin"]          =   '{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Leona"]           =   '{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Lissandra"]       =   '{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Lucian"]          =   '{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Lulu"]            =   '{3, 2, 1, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Lux"]             =   '{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}',
    ["Malphite"]        =   '{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Malzahar"]        =   '{3, 1, 2, 3, 3, 4, 3, 1, 3, 2, 4, 2, 2, 1, 1, 4, 1, 1}',
    ["Maokai"]          =   '{3, 1, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["MasterYi"]        =   '{3, 1, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["MissFortune"]     =   '{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["MonkeyKing"]      =   '{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}',
    ["Mordekaiser"]     =   '{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}',
    ["Morgana"]         =   '{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Nami"]            =   '{1, 2, 3, 2, 2, 4, 2, 3, 2, 3, 4, 3, 3, 1, 1, 4, 1, 1}',
    ["Nasus"]           =   '{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 3, 2, 3, 4, 3, 3}',
    ["Nautilus"]        =   '{2, 3, 1, 2, 2, 4, 2, 3, 2, 3, 4, 3, 3, 1, 1, 4, 1, 1}',
    ["Nidalee"]         =   '{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Nocturne"]        =   '{2, 1, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Nunu"]            =   '{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}',
    ["Olaf"]            =   '{1, 3, 2, 3, 3, 4, 3, 2, 3, 2, 4, 2, 2, 1, 1, 4, 1, 1}',
    ["Orianna"]         =   '{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Pantheon"]        =   '{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 2, 3, 2, 4, 2, 2}',
    ["Poppy"]           =   '{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Quinn"]           =   '{3, 1, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Rammus"]          =   '{2, 1, 3, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3}',
    ["RekSai"]          =   '{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Renekton"]        =   '{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Rengar"]          =   '{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Riven"]           =   '{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Rumble"]          =   '{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Ryze"]            =   '{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Sejuani"]         =   '{2, 1, 3, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}',
    ["Shaco"]           =   '{2, 3, 1, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}',
    ["Shen"]            =   '{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Shyvana"]         =   '{2, 1, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Singed"]          =   '{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Sion"]            =   '{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Sivir"]           =   '{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Skarner"]         =   '{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Sona"]            =   '{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Soraka"]          =   '{1, 2, 3, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3}',
    ["Swain"]           =   '{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}',
    ["Syndra"]          =   '{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["TahmKench"]       =   '{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Talon"]           =   '{2, 3, 1, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3}',
    ["Taric"]           =   '{3, 1, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Teemo"]           =   '{1, 3, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}',
    ["Thresh"]          =   '{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}',
    ["Tristana"]        =   '{3, 2, 1, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}',
    ["Trundle"]         =   '{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Tryndamere"]      =   '{1, 3, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}',
    ["TwistedFate"]     =   '{2, 1, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Twitch"]          =   '{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 1, 2, 2}',
    ["Udyr"]            =   '{1, 3, 2, 1, 1, 4, 1, 4, 1, 3, 3, 3, 3, 2, 4, 4, 4, 4}',
    ["Urgot"]           =   '{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Varus"]           =   '{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Vayne"]           =   '{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Veigar"]          =   '{1, 2, 3, 3, 1, 4, 1, 2, 1, 2, 4, 2, 2, 2, 3, 4, 3, 3}',
    ["Velkoz"]          =   '{2, 1, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Vi"]              =   '{2, 3, 1, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Viktor"]          =   '{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}',
    ["Vladimir"]        =   '{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Volibear"]        =   '{2, 3, 1, 2, 2, 4, 2, 3, 2, 3, 4, 3, 3, 1, 1, 4, 1, 1}',
    ["Warwick"]         =   '{2, 1, 3, 2, 1, 4, 2, 1, 2, 1, 4, 2, 1, 3, 3, 4, 3, 3}',
    ["Xerath"]          =   '{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["XinZhao"]         =   '{2, 1, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Yorick"]          =   '{3, 2, 3, 1, 3, 4, 3, 2, 3, 2, 4, 2, 2, 1, 1, 4, 1, 1}',
    ["Zac"]             =   '{2, 1, 3, 3, 3, 4, 3, 2, 3, 2, 4, 2, 2, 3, 3, 4, 3, 3}',
    ["Zed"]             =   '{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Ziggs"]           =   '{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Zilean"]          =   '{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Zyra"]            =   '{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}',
    ["Yasuo"]           =   '{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}'
}

MySeqF = {{3, 2, 1, 3, 3, 4, 3, 2, 3, 2, 4, 2, 2, 1, 1, 4, 1, 1}, {2, 3, 1, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3}}

MySeqJ = {{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}, {1, 2, 3, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3}}

MySeqG = {{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}, {1, 2, 3, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3}}

MySeqK = {{1, 3, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}, {1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}} 

MySeqLe = {{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}, {1, 2, 3, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3}}

MySeqLu = {{1, 3, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}, {1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}}

MySeqLx = {{2, 1, 3, 2, 2, 4, 2, 3, 2, 3, 4, 3, 3, 1, 1, 4, 1, 1}, {3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}}

MySeqM = {{1, 3, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}, {2, 1, 3, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3}}

MySeqR = {{1, 2, 3, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3}, {1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}} 

MySeqRi = {{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}, {1, 2, 3, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}}

MySeqS = {{2, 3, 1, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}, {2, 3, 1, 3, 3, 4, 3, 2, 3, 2, 4, 2, 2, 1, 1, 4, 1, 1}}

MySeqT = {{2, 1, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}, {3, 2, 3, 2, 3, 4, 3, 3, 2, 2, 4, 2, 1, 1, 1, 4, 1, 1}}

MySeqU = {{4, 1, 3, 2, 4, 4, 4, 3, 4, 3, 3, 3, 2, 2, 2, 2, 1, 1}, {1, 3, 2, 1, 1, 4, 1, 4, 1, 3, 3, 3, 3, 2, 4, 4, 4, 4}}


Sequences = {
	[0]					=	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	[1]					=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}, 
	[2]					=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}, 
	[3]					=	{2, 1, 3, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3}, 
	[4]					=	{2, 3, 1, 2, 2, 4, 2, 3, 2, 3, 4, 3, 3, 1, 1, 4, 1, 1}, 
	[5]					=	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}, 
	[6]					=	{3, 2, 1, 3, 3, 4, 3, 2, 3, 2, 4, 2, 2, 1, 1, 4, 1, 1},
    ["Aatrox"]			=	{2, 1, 3, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3},
    ["AurelionSol"]     =   {1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Ahri"]		    =	{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 2, 2},
    ["Akali"]		  	=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Alistar"]			=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Amumu"]		  	=	{2, 3, 1, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Anivia"]	 		=	{1, 3, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Annie"]		  	=	{2, 1, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Ashe"]		  	=	{1, 2, 1, 2, 3, 4, 1, 1, 2, 1, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Azir"]		  	=	{2, 1, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Bard"]            =   {1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Blitzcrank"]      =	{1, 3, 2, 3, 2, 4, 3, 2, 3, 2, 4, 3, 2, 1, 1, 4, 1, 1},
    ["Brand"]		  	=	{2, 1, 3, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3},
    ["Braum"]		  	=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Caitlyn"]			=	{2, 1, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Cassiopeia"] 	    =	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Chogath"]			=	{3, 1, 2, 2, 2, 4, 2, 3, 2, 3, 4, 3, 3, 1, 1, 4, 1, 1},
    ["Corki"]		  	=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 2, 3, 2, 4, 2, 2},
    ["Darius"]			=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Diana"]	     	=	{2, 1, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["DrMundo"]			=	{2, 1, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 3, 2, 2, 2, 2},
    ["Draven"]			=	{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Ekko"]            =   {1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Elise"]		  	=	{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Evelynn"]			=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Ezreal"]			=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["FiddleSticks"]    =   {2, 3, 1, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3},
    ["Fiora"]			=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Fizz"]		   	=	{3, 1, 2, 3, 3, 4, 3, 2, 3, 2, 4, 2, 2, 1, 1, 4, 1, 1},
    ["Galio"]		  	=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 3, 3, 2, 2, 4, 3, 3},
    ["Gnar"]		  	=	{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Gangplank"]		=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Garen"]		  	=	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Gragas"]	 		=	{2, 3, 1, 3, 3, 4, 3, 2, 3, 2, 4, 2, 2, 1, 1, 4, 1, 1},
    ["Graves"]			=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Hecarim"]			=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Heimerdinger"]    =   {1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Illaoi"]          =   {1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Irelia"]			=	{1, 3, 2, 2, 2, 4, 2, 3, 2, 3, 4, 3, 3, 1, 1, 4, 1, 1},
    ["Janna"]			=	{3, 2, 1, 3, 3, 4, 3, 2, 3, 2, 4, 2, 2, 1, 1, 4, 1, 1},
    ["JarvanIV"]		=	{3, 1, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Jax"]		     	=	{3, 2, 1, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3},
    ["Jayce"]		  	=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Jinx"]		  	=	{1, 2, 3, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3},
    ["Jhin"]            =   {1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Kalista"]			=	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Karma"]		  	=	{1, 3, 2, 1, 1, 4, 1, 3, 3, 1, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Karthus"]			=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Kassadin"]		=	{1, 2, 3, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Katarina"]		=	{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Kayle"]		  	=	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Kennen"]			=	{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Khazix"]			=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Kindred"]         =   {2, 1, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["KogMaw"]			=	{2, 3, 1, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3},
    ["Leblanc"]			=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 3, 2, 3, 4, 3, 3},
    ["LeeSin"]			=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Leona"]		  	=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Lissandra"]		=	{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Lucian"]			=	{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Lulu"]		  	=	{3, 2, 1, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Lux"]		     	=	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Malphite"]		=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Malzahar"]		=	{3, 1, 2, 3, 3, 4, 3, 1, 3, 2, 4, 2, 2, 1, 1, 4, 1, 1},
    ["Maokai"]			=	{3, 1, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["MasterYi"]		=	{3, 1, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["MissFortune"]     =	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["MonkeyKing"]      =	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Mordekaiser"]     =	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Morgana"]			=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Nami"]		  	=	{1, 2, 3, 2, 2, 4, 2, 3, 2, 3, 4, 3, 3, 1, 1, 4, 1, 1},
    ["Nasus"]			=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 3, 2, 3, 4, 3, 3},
    ["Nautilus"]		=	{2, 3, 1, 2, 2, 4, 2, 3, 2, 3, 4, 3, 3, 1, 1, 4, 1, 1},
    ["Nidalee"]			=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Nocturne"]		=	{2, 1, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Nunu"]		  	=	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Olaf"]			=	{1, 3, 2, 3, 3, 4, 3, 2, 3, 2, 4, 2, 2, 1, 1, 4, 1, 1},
    ["Orianna"]			=	{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Pantheon"]		=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 2, 3, 2, 4, 2, 2},
    ["Poppy"]		  	=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Quinn"]		  	=	{3, 1, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Rammus"]			=	{2, 1, 3, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3},
    ["RekSai"]			=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Renekton"]		=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Rengar"]			=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Riven"]		  	=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Rumble"]			=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Ryze"]		  	=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Sejuani"]	 		=	{2, 1, 3, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Shaco"]			=	{2, 3, 1, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Shen"]		  	=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Shyvana"]			=	{2, 1, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Singed"]			=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Sion"]		  	=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Sivir"]		  	=	{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Skarner"]			=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Sona"]		    =	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Soraka"]			=	{1, 2, 3, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3},
    ["Swain"]		  	=	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Syndra"]			=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["TahmKench"]		=   {1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Talon"]		  	=	{2, 3, 1, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3},
    ["Taric"]		  	=	{3, 1, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Teemo"]		  	=	{1, 3, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Thresh"]			=	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Tristana"]		=	{3, 2, 1, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Trundle"]			=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Tryndamere"]      =	{1, 3, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["TwistedFate"]     =	{2, 1, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Twitch"]			=	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 1, 2, 2},
    ["Udyr"]		  	=	{1, 3, 2, 1, 1, 4, 1, 4, 1, 3, 3, 3, 3, 2, 4, 4, 4, 4},
    ["Urgot"]		  	=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Varus"]		  	=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Vayne"]		  	=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Veigar"]			=	{1, 2, 3, 3, 1, 4, 1, 2, 1, 2, 4, 2, 2, 2, 3, 4, 3, 3},
    ["Velkoz"]			=	{2, 1, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Vi"]		  	    =	{2, 3, 1, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Viktor"]			=	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Vladimir"]		=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Volibear"]		=	{2, 3, 1, 2, 2, 4, 2, 3, 2, 3, 4, 3, 3, 1, 1, 4, 1, 1},
    ["Warwick"]			=	{2, 1, 3, 2, 1, 4, 2, 1, 2, 1, 4, 2, 1, 3, 3, 4, 3, 3},
    ["Xerath"]			=	{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["XinZhao"]			=	{2, 1, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Yorick"]			=	{3, 2, 3, 1, 3, 4, 3, 2, 3, 2, 4, 2, 2, 1, 1, 4, 1, 1},
    ["Zac"]		  	    =	{2, 1, 3, 3, 3, 4, 3, 2, 3, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Zed"]		  	    =	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Ziggs"]		  	=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Zilean"]			=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Zyra"]		  	=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Yasuo"]			=	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}
}

Skills = {"Q", "W", "E", "R"}

LastLevel = 0;

function OnLoad()
--Credits SxTeam  
 local ToUpdate = {}
    ToUpdate.Version = 3.4
    ToUpdate.UseHttps = true
    ToUpdate.Host = "raw.githubusercontent.com"
    ToUpdate.VersionPath = "/HeRoBaNd/Scripts/master/HeRoLeavel-Up.version"
    ToUpdate.ScriptPath =  "/HeRoBaNd/Scripts/master/HeRoLeavel-Up.lua"
    ToUpdate.SavePath = SCRIPT_PATH.."/HeRoLeavel-Up_Test.lua"
    ToUpdate.CallbackUpdate = function(NewVersion,OldVersion) print("<font color='#FF0000'><b>[HeRoLeavel-Up]: </b> </font><font color='#00BFFF'><b>Updated to "..NewVersion..". </b></font>") end
    ToUpdate.CallbackNoUpdate = function(OldVersion) print("<font color='#FF0000'><b>[HeRoLeavel-Up]: </b></font> <font color='#00BFFF'><b>No Updates Found</b></font>") end
    ToUpdate.CallbackNewVersion = function(NewVersion) print("<font color='#FF0000'><b>[HeRoLeavel-Up]: </b></font> <font color='#00BFFF'><b>New Version found ("..NewVersion.."). Please wait until its downloaded</b></font>") end
    ToUpdate.CallbackError = function(NewVersion) print("<font color='#FF0000'><b>[HeRoLeavel-Up]: </b></font> <font color='#00BFFF'><b>Error while Downloading. Please try again.</b></font>") end
    ScriptUpdate(ToUpdate.Version,ToUpdate.UseHttps, ToUpdate.Host, ToUpdate.VersionPath, ToUpdate.ScriptPath, ToUpdate.SavePath, ToUpdate.CallbackUpdate,ToUpdate.CallbackNoUpdate, ToUpdate.CallbackNewVersion,ToUpdate.CallbackError)
--Credits SxTeam

    if myHero.charName == 'Fizz' then
        CustomModeGG = FizzCustomGG
    elseif myHero.charName == 'Jinx' then
        CustomModeGG = JinxCustomGG
    elseif myHero.charName == 'Gnar' then
        CustomModeGG = GnarCustomGG
    elseif myHero.charName == 'Karma' then
        CustomModeGG = KarmaCustomGG
    elseif myHero.charName == 'Leblanc' then
        CustomModeGG = LeblancCustomGG
    elseif myHero.charName == 'Lulu' then
        CustomModeGG = LuluCustomGG
    elseif myHero.charName == 'Lux' then
        CustomModeGG = LuxCustomGG
    elseif myHero.charName == 'Morgana' then
        CustomModeGG = MorganaCustomGG
    elseif myHero.charName == 'Rengar' then
        CustomModeGG = RengarCustomGG
    elseif myHero.charName == 'Riven' then
        CustomModeGG = RivenCustomGG
    elseif myHero.charName == 'Shaco' then
        CustomModeGG = ShacoCustomGG
    elseif myHero.charName == 'TwistedFate' then
        CustomModeGG = TwistedCustomGG
    elseif myHero.charName == 'Udyr' then
        CustomModeGG = UdyrCustomGG
    end

    if (string.find(GetGameVersion(), 'Releases/6.6') ~= nil) then 
        DelayAction(function() PrintChat("<font color='#FF0000'><b>[HeRo - Info]: </b></font><font color='#F0F8FF'><b>Game Version - <Releases/6.6></b></font>") end, 4)
    elseif (string.find(GetGameVersion(), 'Releases/6.7') ~= nil) then
        DelayAction(function() PrintChat("<font color='#FF0000'><b>[HeRo - Info]: </b></font><font color='#F0F8FF'><b>Game Version - <Releases/6.7></b></font>") end, 4)
    end

    DelayAction(function() PrintChat("<font color='#FF0000'><b>[HeRoLeavel-Up]: </b></font><font color='#00BFFF'><b>Loaded.</b></font>") end, 4.5)

	Menu = scriptConfig('HeRoLevel-UP', 'HeRoLevel-UP')

    Menu:addParam('Enable', 'Enable', SCRIPT_PARAM_ONOFF, true)

	Menu:addParam('Info', '-----------------------------------------------------', SCRIPT_PARAM_INFO, "-------------")

	Menu:addParam('Mode', 'Mode:', SCRIPT_PARAM_LIST, 1, {'Auto', 'Manual', 'Custom'})
    
    if myHero.charName == 'Fizz' or 'Jinx' or 'Gnar' or 'Karma' or 'Leblanc' or 'Lulu' or 'Lux' or 'Morgana' or 'Rengar' or 'Riven' or 'Shaco' or 'TwistedFate' or 'Udyr' then
        Menu:addParam('CustomSec', myHero.charName.."'s Dominate Enemy Mode", SCRIPT_PARAM_LIST, 1, CustomModeGG)
    end

    Menu:addParam('Info2222', '-----------------------------------------------------', SCRIPT_PARAM_INFO, "-------------")

    Menu:addParam('Infokek', 'Manual Spell Order Changer', SCRIPT_PARAM_INFO, "")
    Menu:addParam('Level13', 'Level 1-3:', SCRIPT_PARAM_LIST, 1, {'Q-W-E',  'Q-E-W',  'W-Q-E',  'W-E-Q',  'E-Q-W',  'E-W-Q'})
    Menu:addParam('Level418', 'Level 4-18:', SCRIPT_PARAM_LIST, 1, {'Q-W-E',  'Q-E-W',  'W-Q-E',  'W-E-Q',  'E-Q-W',  'E-W-Q'})

    Menu:addParam('Info21123222', '-----------------------------------------------------', SCRIPT_PARAM_INFO, "-------------")

    Menu:addParam("ChangeShow", 'Change PermaShow Color (Reload)', SCRIPT_PARAM_ONOFF, false)

    Menu:addParam('Info2222332', '-----------------------------------------------------', SCRIPT_PARAM_INFO, "-------------")

    if (string.find(GetGameVersion(), 'Releases/6.6') ~= nil) then
        Menu:addParam('GameVer', 'Game Version - <Releases/6.6>', SCRIPT_PARAM_INFO, "")
    elseif (string.find(GetGameVersion(), 'Releases/6.7') ~= nil) then
        Menu:addParam('GameVer1', 'Game Version - <Releases/6.7>', SCRIPT_PARAM_INFO, "")
    end

    if (string.find(GetGameVersion(), 'Releases/6.6') ~= nil) then
        Menu:addParam('kek', 'Package Updated', SCRIPT_PARAM_INFO, "")
    elseif (string.find(GetGameVersion(), 'Releases/6.7') ~= nil) then
        Menu:addParam('kek1', 'Package Outdated')
    end

    Menu:addParam('Info2222232332', '-----------------------------------------------------', SCRIPT_PARAM_INFO, "-------------")

    Menu:addParam("info2", ""..SCRIPT_NAME.." [Version - "..version.."]", SCRIPT_PARAM_INFO, "")
    Menu:addParam("info3", "Author - "..SCRIPT_AUTHOR.."", SCRIPT_PARAM_INFO, "")
    
	Menu.Enable = false

    if Menu.ChangeShow then
        IDPerma = Menu:permaShow("Enable")
        Menu.permaShowEdit(IDPerma, "lText", "[HeRoLeavel-Up Active]")
        Menu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)

        IDPerma = Menu:permaShow("Mode")
        Menu.permaShowEdit(IDPerma, "lText", "[HeRoLeavel-Up Mode]")
        Menu.permaShowEdit(IDPerma, "lTextColor", 0xFF00FF00)
    else
        Menu:permaShow('Enable')

        Menu:permaShow('Mode')
    end

    DelayAction(function() PrintChat("<font color='#EE82EE'><b><font color='#FF0000'><b>[HeRo Leavel-UP]: </b></font>" ..myHero.charName.. "<font color='#00FF00'> confirmed!</font></font></b>") end, 5)
    if Menu.Mode == 3 and myHero.charName == 'Fizz' then
        DelayAction(function() PrintChat("<font color='#EE82EE'><b><font color='#FF0000'><b>[HeRo Leavel-UP]: </b></font><font color='#00FF00'>Sequence - </font></font></b>"..MySeqFName[Menu.CustomSec]..'.') end, 5.5)
    elseif Menu.Mode == 3 and myHero.charName == 'Jinx' then
        DelayAction(function() PrintChat("<font color='#EE82EE'><b><font color='#FF0000'><b>[HeRo Leavel-UP]: </b></font><font color='#00FF00'>Sequence - </font></font></b>"..MySeqJName[Menu.CustomSec]..'.') end, 5.5)
    elseif Menu.Mode == 3 and myHero.charName == 'Gnar' then
        DelayAction(function() PrintChat("<font color='#EE82EE'><b><font color='#FF0000'><b>[HeRo Leavel-UP]: </b></font><font color='#00FF00'>Sequence - </font></font></b>"..MySeqGName[Menu.CustomSec]..'.') end, 5.5)
    elseif Menu.Mode == 3 and myHero.charName == 'Karma' then
        DelayAction(function() PrintChat("<font color='#EE82EE'><b><font color='#FF0000'><b>[HeRo Leavel-UP]: </b></font><font color='#00FF00'>Sequence - </font></font></b>"..MySeqKName[Menu.CustomSec]..'.') end, 5.5)
    elseif Menu.Mode == 3 and myHero.charName == 'Leblanc' then
        DelayAction(function() PrintChat("<font color='#EE82EE'><b><font color='#FF0000'><b>[HeRo Leavel-UP]: </b></font><font color='#00FF00'>Sequence - </font></font></b>"..MySeqLeName[Menu.CustomSec]..'.') end, 5.5)
    elseif Menu.Mode == 3 and myHero.charName == 'Lulu' then
        DelayAction(function() PrintChat("<font color='#EE82EE'><b><font color='#FF0000'><b>[HeRo Leavel-UP]: </b></font><font color='#00FF00'>Sequence - </font></font></b>"..MySeqLuName[Menu.CustomSec]..'.') end, 5.5)
    elseif Menu.Mode == 3 and myHero.charName == 'Lux' then
        DelayAction(function() PrintChat("<font color='#EE82EE'><b><font color='#FF0000'><b>[HeRo Leavel-UP]: </b></font><font color='#00FF00'>Sequence - </font></font></b>"..MySeqLxName[Menu.CustomSec]..'.') end, 5.5)
    elseif Menu.Mode == 3 and myHero.charName == 'Morgana' then
        DelayAction(function() PrintChat("<font color='#EE82EE'><b><font color='#FF0000'><b>[HeRo Leavel-UP]: </b></font><font color='#00FF00'>Sequence - </font></font></b>"..MySeqMName[Menu.CustomSec]..'.') end, 5.5)
    elseif Menu.Mode == 3 and myHero.charName == 'Rengar' then
        DelayAction(function() PrintChat("<font color='#EE82EE'><b><font color='#FF0000'><b>[HeRo Leavel-UP]: </b></font><font color='#00FF00'>Sequence - </font></font></b>"..MySeqRName[Menu.CustomSec]..'.') end, 5.5)
    elseif Menu.Mode == 3 and myHero.charName == 'Riven' then
        DelayAction(function() PrintChat("<font color='#EE82EE'><b><font color='#FF0000'><b>[HeRo Leavel-UP]: </b></font><font color='#00FF00'>Sequence - </font></font></b>"..MySeqRiName[Menu.CustomSec]..'.') end, 5.5)
    elseif Menu.Mode == 3 and myHero.charName == 'Shaco' then
        DelayAction(function() PrintChat("<font color='#EE82EE'><b><font color='#FF0000'><b>[HeRo Leavel-UP]: </b></font><font color='#00FF00'>Sequence - </font></font></b>"..MySeqSName[Menu.CustomSec]..'.') end, 5.5)
    elseif Menu.Mode == 3 and myHero.charName == 'TwistedFate' then
        DelayAction(function() PrintChat("<font color='#EE82EE'><b><font color='#FF0000'><b>[HeRo Leavel-UP]: </b></font><font color='#00FF00'>Sequence - </font></font></b>"..MySeqTName[Menu.CustomSec]..'.') end, 5.5)
    elseif Menu.Mode == 3 and myHero.charName == 'Udyr' then
        DelayAction(function() PrintChat("<font color='#EE82EE'><b><font color='#FF0000'><b>[HeRo Leavel-UP]: </b></font><font color='#00FF00'>Sequence - </font></font></b>"..MySeqUName[Menu.CustomSec]..'.') end, 5.5)
    elseif Menu.Mode == 1 then
        DelayAction(function() PrintChat("<font color='#EE82EE'><b><font color='#FF0000'><b>[HeRo Leavel-UP]: </b></font><font color='#00FF00'>Sequence - </font></font></b>"..SequencesName[myHero.charName]..'.') end, 5.5)
    elseif Menu.Mode == 2 and myHero.level < 4 then
        DelayAction(function() PrintChat("<font color='#EE82EE'><b><font color='#FF0000'><b>[HeRo Leavel-UP]: </b></font><font color='#00FF00'>Sequence - </font></font></b>"..SequencesName[Menu.Level13]..'.') end, 5.5)
    elseif Menu.Mode == 2 and myHero.level > 3 then
        DelayAction(function() PrintChat("<font color='#EE82EE'><b><font color='#FF0000'><b>[HeRo Leavel-UP]: </b></font><font color='#00FF00'>Sequence - </font></font></b>"..SequencesName[Menu.Level418]..'.') end, 5.5)
    end
    DelayAction(function() PrintChat("<font color='#FF0000'><b>[Spell Name]: </b></font><font color='#F0F8FF'><b>1 = Q, 2 = W, 3 = E, 4 = R.</b></font>") end, 6)
end

function OnTick()
	if (LastLevel < myHero.level) then
		LevelUp()
	end
end

function LevelUp()
	if Menu.Enable then
        if myHero.charName == "Fizz" and Menu.Mode == 3 then
            Sequence = MySeqF[Menu.CustomSec]
        elseif myHero.charName == "Jinx" and Menu.Mode == 3 then
            Sequence = MySeqJ[Menu.CustomSec]
         elseif myHero.charName == "Gnar" and Menu.Mode == 3 then
            Sequence = MySeqG[Menu.CustomSec]
        elseif myHero.charName == "Karma" and Menu.Mode == 3 then
            Sequence = MySeqK[Menu.CustomSec]
        elseif myHero.charName == "Leblanc" and Menu.Mode == 3 then
            Sequence = MySeqLe[Menu.CustomSec]
        elseif myHero.charName == "Lulu" and Menu.Mode == 3 then
            Sequence = MySeqLu[Menu.CustomSec]
        elseif myHero.charName == "Lux" and Menu.Mode == 3 then
            Sequence = MySeqLx[Menu.CustomSec]
        elseif myHero.charName == "Morgana" and Menu.Mode == 3 then
            Sequence = MySeqM[Menu.CustomSec]
        elseif myHero.charName == "Rengar" and Menu.Mode == 3 then
            Sequence = MySeqR[Menu.CustomSec]
        elseif myHero.charName == "Riven" and Menu.Mode == 3 then
            Sequence = MySeqRi[Menu.CustomSec]
        elseif myHero.charName == "Shaco" and Menu.Mode == 3 then
            Sequence = MySeqS[Menu.CustomSec]
        elseif myHero.charName == "TwistedFate" and Menu.Mode == 3 then
            Sequence = MySeqT[Menu.CustomSec]
        elseif myHero.charName == "Udyr" and Menu.Mode == 3 then
            Sequence = MySeqU[Menu.CustomSec]
		elseif Menu.Mode == 1 then
			Sequence = Sequences[myHero.charName]
		elseif Menu.Mode == 2 and myHero.level < 4 then
			Sequence = Sequences[Menu.Level13]
		elseif Menu.Mode == 2 and myHero.level > 3 then
			Sequence = Sequences[Menu.Level418]
        end
	
		LevelSpell(Sequence[myHero.level])

		if myHero.level < 18 then
			PrintChat("<font color='#00BFFF'>This Level: </font><font color='#7CFC00'>"..Skills[Sequence[myHero.level]].."</font><font color='#00BFFF'><font color='#FF0000'> ===></font> Next level: </font><font color='#7CFC00'>"..Skills[Sequence[myHero.level + 1]].. "</font><font color='#EE82EE'>. </font>")
		end
		LastLevel = myHero.level	
	end
end

function OnDraw()
    if not Menu.Enable and myHero.charName == 'Fizz' or 'Jinx' or 'Gnar' or 'Karma' or 'Leblanc' or 'Lulu' or 'Lux' or 'Morgana' or 'Rengar' or 'Riven' or 'Shaco' or 'TwistedFate' or 'Udyr' then
        local pos = WorldToScreen(D3DXVECTOR3(myHero.x, myHero.y, myHero.z))
        DrawText("Chose Custom Sequence and Enable Script", 20, pos.x, pos.y, 0xFFFFF5EE)
    end
end

    _G.LevelSpell = function(id)
    if (string.find(GetGameVersion(), 'Releases/6.6') ~= nil) then
        local offsets = { 
                [1] = 0xF8,
                [2] = 0x4F,
                [3] = 0x14,
                [4] = 0x9E,
        }
        local p = CLoLPacket(0xA9)
        p.vTable = 0xF3981C
          p:EncodeF(myHero.networkID)
          p:Encode4(0x19)
          p:Encode4(0x44)
          p:Encode1(0xEC)
          p:Encode1(offsets[id])
          p:Encode4(0xF7)
          SendPacket(p)
        end
    end

--Credits SxTeam
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
--Credits SxTeam
