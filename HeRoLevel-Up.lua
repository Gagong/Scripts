_G.LvLFixBugSplat = false
_G.LvLScriptVersion = {2.0, "2.0", "|2.0|"}
_G.LvLScriptAuthor = "HeRoBaNd"

-- BoL Tools Tracker --
assert(load(Base64Decode("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"), nil, "bt", _ENV))()
TrackerLoad("XiDFjfqj2dRfEv5v")
-- BoL Tools Tracker --

function OnLoad()
    HeRoLvL()
end

class('HeRoLvL')

function HeRoLvL:__init()
    self:AutoUpdater()
    self:Message("Loaded!", 3)
    self:Message(myHero.charName.." confirmed!", 5)
    self:LoadVar()
    self:Global_Menu()
    self.Menu.Enable = false
    self.Menu.Mode = 1
    self:Loader()
end

function HeRoLvL:LoadVar()
    self.SequencesName = {
        [0]                 =   {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        [1]                 =   {"Q", "W", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"}, 
        [2]                 =   {"Q", "E", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"}, 
        [3]                 =   {"W", "Q", "E", "W", "W", "R", "W", "Q", "W", "Q", "R", "Q", "Q", "E", "E", "R", "E", "E"}, 
        [4]                 =   {"W", "E", "Q", "W", "W", "R", "W", "E", "W", "E", "R", "E", "E", "Q", "Q", "R", "Q", "Q"}, 
        [5]                 =   {"E", "Q", "W", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "R", "W", "W"}, 
        [6]                 =   {"E", "W", "Q", "E", "E", "R", "E", "W", "E", "W", "R", "W", "W", "Q", "Q", "R", "Q", "Q"},
        ["Aatrox"]          =   {"W", "Q", "E", "W", "W", "R", "W", "Q", "W", "Q", "R", "Q", "Q", "E", "E", "R", "E", "E"},
        ["AurelionSol"]     =   {"Q", "W", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Ahri"]            =   {"Q", "E", "W", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "W", "W"},
        ["Akali"]           =   {"Q", "E", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Alistar"]         =   {"Q", "W", "E", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Amumu"]           =   {"W", "E", "Q", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "R", "W", "W"},
        ["Anivia"]          =   {"Q", "E", "W", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "R", "W", "W"},
        ["Annie"]           =   {"W", "Q", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Ashe"]            =   {"Q", "W", "Q", "W", "E", "R", "Q", "Q", "W", "Q", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Azir"]            =   {"W", "Q", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Bard"]            =   {"Q", "W", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Blitzcrank"]      =   {"Q", "E", "W", "E", "W", "R", "E", "W", "E", "W", "R", "E", "W", "Q", "Q", "R", "Q", "Q"},
        ["Brand"]           =   {"W", "Q", "E", "W", "W", "R", "W", "Q", "W", "Q", "R", "Q", "Q", "E", "E", "R", "E", "E"},
        ["Braum"]           =   {"Q", "E", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Caitlyn"]         =   {"W", "Q", "E", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Cassiopeia"]      =   {"E", "Q", "W", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "R", "W", "W"},
        ["Chogath"]         =   {"E", "Q", "W", "W", "W", "R", "W", "E", "W", "E", "R", "E", "E", "Q", "Q", "R", "Q", "Q"},
        ["Corki"]           =   {"Q", "W", "E", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "W", "E", "W", "R", "W", "W"},
        ["Darius"]          =   {"Q", "W", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Diana"]           =   {"W", "Q", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["DrMundo"]         =   {"W", "Q", "E", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "E", "W", "W", "W", "W"},
        ["Draven"]          =   {"Q", "E", "W", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Ekko"]            =   {"Q", "E", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Elise"]           =   {"Q", "E", "W", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Evelynn"]         =   {"Q", "E", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Ezreal"]          =   {"Q", "E", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["FiddleSticks"]    =   {"W", "E", "Q", "W", "W", "R", "W", "Q", "W", "Q", "R", "Q", "Q", "E", "E", "R", "E", "E"},
        ["Fiora"]           =   {"Q", "E", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Fizz"]            =   {"E", "Q", "W", "E", "E", "R", "E", "W", "E", "W", "R", "W", "W", "Q", "Q", "R", "Q", "Q"},
        ["Galio"]           =   {"Q", "W", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "E", "E", "W", "W", "R", "E", "E"},
        ["Gnar"]            =   {"Q", "E", "W", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Gangplank"]       =   {"Q", "W", "E", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Garen"]           =   {"E", "Q", "W", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "R", "W", "W"},
        ["Gragas"]          =   {"W", "E", "Q", "E", "E", "R", "E", "W", "E", "W", "R", "W", "W", "Q", "Q", "R", "Q", "Q"},
        ["Graves"]          =   {"Q", "E", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Hecarim"]         =   {"Q", "W", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Heimerdinger"]    =   {"Q", "W", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Illaoi"]          =   {"Q", "W", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Irelia"]          =   {"Q", "E", "W", "W", "W", "R", "W", "E", "W", "E", "R", "E", "E", "Q", "Q", "R", "Q", "Q"},
        ["Janna"]           =   {"E", "W", "Q", "E", "E", "R", "E", "W", "E", "W", "R", "W", "W", "Q", "Q", "R", "Q", "Q"},
        ["JarvanIV"]        =   {"E", "Q", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Jax"]             =   {"E", "W", "Q", "W", "W", "R", "W", "Q", "W", "Q", "R", "Q", "Q", "E", "E", "R", "E", "E"},
        ["Jayce"]           =   {"Q", "E", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Jinx"]            =   {"Q", "W", "E", "W", "W", "R", "W", "Q", "W", "Q", "R", "Q", "Q", "E", "E", "R", "E", "E"},
        ["Jhin"]            =   {"Q", "W", "E", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Kalista"]         =   {"E", "Q", "W", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "R", "W", "W"},
        ["Karma"]           =   {"Q", "E", "W", "Q", "Q", "R", "Q", "E", "E", "Q", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Karthus"]         =   {"Q", "E", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Kassadin"]        =   {"Q", "W", "E", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "R", "W", "W"},
        ["Katarina"]        =   {"Q", "E", "W", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Kayle"]           =   {"E", "Q", "W", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "R", "W", "W"},
        ["Kennen"]          =   {"Q", "E", "W", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Khazix"]          =   {"Q", "W", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Kindred"]         =   {"W", "Q", "E", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["KogMaw"]          =   {"W", "E", "Q", "W", "W", "R", "W", "Q", "W", "Q", "R", "Q", "Q", "E", "E", "R", "E", "E"},
        ["Leblanc"]         =   {"Q", "W", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "E", "W", "E", "R", "E", "E"},
        ["LeeSin"]          =   {"Q", "E", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Leona"]           =   {"Q", "E", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Lissandra"]       =   {"Q", "E", "W", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Lucian"]          =   {"Q", "E", "W", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Lulu"]            =   {"E", "W", "Q", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Lux"]             =   {"E", "Q", "W", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "R", "W", "W"},
        ["Malphite"]        =   {"Q", "E", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Malzahar"]        =   {"E", "Q", "W", "E", "E", "R", "E", "Q", "E", "W", "R", "W", "W", "Q", "Q", "R", "Q", "Q"},
        ["Maokai"]          =   {"E", "Q", "W", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["MasterYi"]        =   {"E", "Q", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["MissFortune"]     =   {"Q", "W", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["MonkeyKing"]      =   {"E", "Q", "W", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "R", "W", "W"},
        ["Mordekaiser"]     =   {"E", "Q", "W", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "R", "W", "W"},
        ["Morgana"]         =   {"Q", "W", "E", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Nami"]            =   {"Q", "W", "E", "W", "W", "R", "W", "E", "W", "E", "R", "E", "E", "Q", "Q", "R", "Q", "Q"},
        ["Nasus"]           =   {"Q", "W", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "E", "W", "E", "R", "E", "E"},
        ["Nautilus"]        =   {"W", "E", "Q", "W", "W", "R", "W", "E", "W", "E", "R", "E", "E", "Q", "Q", "R", "Q", "Q"},
        ["Nidalee"]         =   {"Q", "E", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Nocturne"]        =   {"W", "Q", "E", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Nunu"]            =   {"E", "Q", "W", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "R", "W", "W"},
        ["Olaf"]            =   {"Q", "E", "W", "E", "E", "R", "E", "W", "E", "W", "R", "W", "W", "Q", "Q", "R", "Q", "Q"},
        ["Orianna"]         =   {"Q", "E", "W", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Pantheon"]        =   {"Q", "W", "E", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "W", "E", "W", "R", "W", "W"},
        ["Poppy"]           =   {"Q", "W", "E", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Quinn"]           =   {"E", "Q", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Rammus"]          =   {"W", "Q", "E", "W", "W", "R", "W", "Q", "W", "Q", "R", "Q", "Q", "E", "E", "R", "E", "E"},
        ["RekSai"]          =   {"Q", "W", "E", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Renekton"]        =   {"Q", "W", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Rengar"]          =   {"Q", "W", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Riven"]           =   {"Q", "W", "E", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Rumble"]          =   {"Q", "W", "E", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Ryze"]            =   {"Q", "W", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Sejuani"]         =   {"W", "Q", "E", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "R", "W", "W"},
        ["Shaco"]           =   {"W", "E", "Q", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "R", "W", "W"},
        ["Shen"]            =   {"Q", "W", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Shyvana"]         =   {"W", "Q", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Singed"]          =   {"Q", "E", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Sion"]            =   {"Q", "W", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Sivir"]           =   {"Q", "E", "W", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Skarner"]         =   {"Q", "W", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Sona"]            =   {"Q", "W", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Soraka"]          =   {"Q", "W", "E", "W", "W", "R", "W", "Q", "W", "Q", "R", "Q", "Q", "E", "E", "R", "E", "E"},
        ["Swain"]           =   {"E", "Q", "W", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "R", "W", "W"},
        ["Syndra"]          =   {"Q", "E", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Taliyah"]         =   {"Q", "E", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["TahmKench"]       =   {"Q", "W", "E", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Talon"]           =   {"W", "E", "Q", "W", "W", "R", "W", "Q", "W", "Q", "R", "Q", "Q", "E", "E", "R", "E", "E"},
        ["Taric"]           =   {"E", "Q", "E", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Teemo"]           =   {"Q", "E", "W", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "R", "W", "W"},
        ["Thresh"]          =   {"E", "Q", "W", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "R", "W", "W"},
        ["Tristana"]        =   {"E", "W", "Q", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "R", "W", "W"},
        ["Trundle"]         =   {"Q", "W", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Tryndamere"]      =   {"Q", "E", "W", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "R", "W", "W"},
        ["TwistedFate"]     =   {"W", "Q", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Twitch"]          =   {"E", "Q", "W", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "Q", "W", "W"},
        ["Udyr"]            =   {"Q", "E", "W", "Q", "Q", "R", "Q", "R", "Q", "E", "E", "E", "E", "W", "R", "R", "R", "R"},
        ["Urgot"]           =   {"Q", "E", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Varus"]           =   {"Q", "W", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Vayne"]           =   {"Q", "W", "E", "W", "W", "R", "W", "Q", "W", "Q", "R", "Q", "Q", "E", "E", "R", "E", "E"},
        ["Veigar"]          =   {"Q", "W", "E", "E", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "W", "E", "R", "E", "E"},
        ["Velkoz"]          =   {"W", "Q", "E", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Vi"]              =   {"W", "E", "Q", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Viktor"]          =   {"E", "Q", "W", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "R", "W", "W"},
        ["Vladimir"]        =   {"Q", "E", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Volibear"]        =   {"W", "E", "Q", "W", "W", "R", "W", "E", "W", "E", "R", "E", "E", "Q", "Q", "R", "Q", "Q"},
        ["Warwick"]         =   {"W", "Q", "E", "W", "Q", "R", "W", "Q", "W", "Q", "R", "W", "Q", "E", "E", "R", "E", "E"},
        ["Xerath"]          =   {"Q", "E", "W", "Q", "Q", "R", "Q", "W", "Q", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["XinZhao"]         =   {"W", "Q", "E", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Yorick"]          =   {"E", "W", "E", "Q", "E", "R", "E", "W", "E", "W", "R", "W", "W", "Q", "Q", "R", "Q", "Q"},
        ["Zac"]             =   {"W", "Q", "E", "E", "E", "R", "E", "W", "E", "W", "R", "W", "W", "E", "E", "R", "E", "E"},
        ["Zed"]             =   {"Q", "E", "W", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Ziggs"]           =   {"Q", "W", "E", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Zilean"]          =   {"Q", "W", "E", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Zyra"]            =   {"Q", "W", "E", "Q", "Q", "R", "Q", "E", "Q", "E", "R", "E", "E", "W", "W", "R", "W", "W"},
        ["Yasuo"]           =   {"E", "Q", "W", "E", "E", "R", "E", "Q", "E", "Q", "R", "Q", "Q", "W", "W", "R", "W", "W"}
    }

    self.Sequences = {
        [0]                 =   {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        [1]                 =   {_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E}, 
        [2]                 =   {_Q, _E, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W}, 
        [3]                 =   {_W, _Q, _E, _W, _W, _R, _W, _Q, _W, _Q, _R, _Q, _Q, _E, _E, _R, _E, _E}, 
        [4]                 =   {_W, _E, _Q, _W, _W, _R, _W, _E, _W, _E, _R, _E, _E, _Q, _Q, _R, _Q, _Q}, 
        [5]                 =   {_E, _Q, _W, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W}, 
        [6]                 =   {_E, _W, _Q, _E, _E, _R, _E, _W, _E, _W, _R, _W, _W, _Q, _Q, _R, _Q, _Q},
        ["Aatrox"]          =   {_W, _Q, _E, _W, _W, _R, _W, _Q, _W, _Q, _R, _Q, _Q, _E, _E, _R, _E, _E},
        ["AurelionSol"]     =   {_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Ahri"]            =   {_Q, _E, _W, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _W, _W},
        ["Akali"]           =   {_Q, _E, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Alistar"]         =   {_Q, _W, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Amumu"]           =   {_W, _E, _Q, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W},
        ["Anivia"]          =   {_Q, _E, _W, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W},
        ["Annie"]           =   {_W, _Q, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Ashe"]            =   {_Q, _W, _Q, _W, _E, _R, _Q, _Q, _W, _Q, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Azir"]            =   {_W, _Q, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Bard"]            =   {_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Blitzcrank"]      =   {_Q, _E, _W, _E, _W, _R, _E, _W, _E, _W, _R, _E, _W, _Q, _Q, _R, _Q, _Q},
        ["Brand"]           =   {_W, _Q, _E, _W, _W, _R, _W, _Q, _W, _Q, _R, _Q, _Q, _E, _E, _R, _E, _E},
        ["Braum"]           =   {_Q, _E, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Caitlyn"]         =   {_W, _Q, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Cassiopeia"]      =   {_E, _Q, _W, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W},
        ["Chogath"]         =   {_E, _Q, _W, _W, _W, _R, _W, _E, _W, _E, _R, _E, _E, _Q, _Q, _R, _Q, _Q},
        ["Corki"]           =   {_Q, _W, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _W, _E, _W, _R, _W, _W},
        ["Darius"]          =   {_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Diana"]           =   {_W, _Q, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["DrMundo"]         =   {_W, _Q, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _E, _W, _W, _W, _W},
        ["Draven"]          =   {_Q, _E, _W, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Ekko"]            =   {_Q, _E, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Elise"]           =   {_Q, _E, _W, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Evelynn"]         =   {_Q, _E, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Ezreal"]          =   {_Q, _E, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["FiddleSticks"]    =   {_W, _E, _Q, _W, _W, _R, _W, _Q, _W, _Q, _R, _Q, _Q, _E, _E, _R, _E, _E},
        ["Fiora"]           =   {_Q, _E, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Fizz"]            =   {_E, _Q, _W, _E, _E, _R, _E, _W, _E, _W, _R, _W, _W, _Q, _Q, _R, _Q, _Q},
        ["Galio"]           =   {_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _E, _E, _W, _W, _R, _E, _E},
        ["Gnar"]            =   {_Q, _E, _W, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Gangplank"]       =   {_Q, _W, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Garen"]           =   {_E, _Q, _W, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W},
        ["Gragas"]          =   {_W, _E, _Q, _E, _E, _R, _E, _W, _E, _W, _R, _W, _W, _Q, _Q, _R, _Q, _Q},
        ["Graves"]          =   {_Q, _E, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Hecarim"]         =   {_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Heimerdinger"]    =   {_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Illaoi"]          =   {_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Irelia"]          =   {_Q, _E, _W, _W, _W, _R, _W, _E, _W, _E, _R, _E, _E, _Q, _Q, _R, _Q, _Q},
        ["Janna"]           =   {_E, _W, _Q, _E, _E, _R, _E, _W, _E, _W, _R, _W, _W, _Q, _Q, _R, _Q, _Q},
        ["JarvanIV"]        =   {_E, _Q, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Jax"]             =   {_E, _W, _Q, _W, _W, _R, _W, _Q, _W, _Q, _R, _Q, _Q, _E, _E, _R, _E, _E},
        ["Jayce"]           =   {_Q, _E, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Jinx"]            =   {_Q, _W, _E, _W, _W, _R, _W, _Q, _W, _Q, _R, _Q, _Q, _E, _E, _R, _E, _E},
        ["Jhin"]            =   {_Q, _W, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Kalista"]         =   {_E, _Q, _W, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W},
        ["Karma"]           =   {_Q, _E, _W, _Q, _Q, _R, _Q, _E, _E, _Q, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Karthus"]         =   {_Q, _E, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Kassadin"]        =   {_Q, _W, _E, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W},
        ["Katarina"]        =   {_Q, _E, _W, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Kayle"]           =   {_E, _Q, _W, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W},
        ["Kennen"]          =   {_Q, _E, _W, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Khazix"]          =   {_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Kindred"]         =   {_W, _Q, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["KogMaw"]          =   {_W, _E, _Q, _W, _W, _R, _W, _Q, _W, _Q, _R, _Q, _Q, _E, _E, _R, _E, _E},
        ["Leblanc"]         =   {_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _E, _W, _E, _R, _E, _E},
        ["LeeSin"]          =   {_Q, _E, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Leona"]           =   {_Q, _E, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Lissandra"]       =   {_Q, _E, _W, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Lucian"]          =   {_Q, _E, _W, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Lulu"]            =   {_E, _W, _Q, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Lux"]             =   {_E, _Q, _W, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W},
        ["Malphite"]        =   {_Q, _E, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Malzahar"]        =   {_E, _Q, _W, _E, _E, _R, _E, _Q, _E, _W, _R, _W, _W, _Q, _Q, _R, _Q, _Q},
        ["Maokai"]          =   {_E, _Q, _W, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["MasterYi"]        =   {_E, _Q, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["MissFortune"]     =   {_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["MonkeyKing"]      =   {_E, _Q, _W, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W},
        ["Mordekaiser"]     =   {_E, _Q, _W, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W},
        ["Morgana"]         =   {_Q, _W, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Nami"]            =   {_Q, _W, _E, _W, _W, _R, _W, _E, _W, _E, _R, _E, _E, _Q, _Q, _R, _Q, _Q},
        ["Nasus"]           =   {_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _E, _W, _E, _R, _E, _E},
        ["Nautilus"]        =   {_W, _E, _Q, _W, _W, _R, _W, _E, _W, _E, _R, _E, _E, _Q, _Q, _R, _Q, _Q},
        ["Nidalee"]         =   {_Q, _E, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Nocturne"]        =   {_W, _Q, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Nunu"]            =   {_E, _Q, _W, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W},
        ["Olaf"]            =   {_Q, _E, _W, _E, _E, _R, _E, _W, _E, _W, _R, _W, _W, _Q, _Q, _R, _Q, _Q},
        ["Orianna"]         =   {_Q, _E, _W, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Pantheon"]        =   {_Q, _W, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _W, _E, _W, _R, _W, _W},
        ["Poppy"]           =   {_Q, _W, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Quinn"]           =   {_E, _Q, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Rammus"]          =   {_W, _Q, _E, _W, _W, _R, _W, _Q, _W, _Q, _R, _Q, _Q, _E, _E, _R, _E, _E},
        ["RekSai"]          =   {_Q, _W, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Renekton"]        =   {_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Rengar"]          =   {_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Riven"]           =   {_Q, _W, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Rumble"]          =   {_Q, _W, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Ryze"]            =   {_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Sejuani"]         =   {_W, _Q, _E, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W},
        ["Shaco"]           =   {_W, _E, _Q, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W},
        ["Shen"]            =   {_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Shyvana"]         =   {_W, _Q, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Singed"]          =   {_Q, _E, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Sion"]            =   {_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Sivir"]           =   {_Q, _E, _W, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Skarner"]         =   {_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Sona"]            =   {_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Soraka"]          =   {_Q, _W, _E, _W, _W, _R, _W, _Q, _W, _Q, _R, _Q, _Q, _E, _E, _R, _E, _E},
        ["Swain"]           =   {_E, _Q, _W, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W},
        ["Syndra"]          =   {_Q, _E, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Taliyah"]         =   {_Q, _E, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["TahmKench"]       =   {_Q, _W, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Talon"]           =   {_W, _E, _Q, _W, _W, _R, _W, _Q, _W, _Q, _R, _Q, _Q, _E, _E, _R, _E, _E},
        ["Taric"]           =   {_E, _Q, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Teemo"]           =   {_Q, _E, _W, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W},
        ["Thresh"]          =   {_E, _Q, _W, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W},
        ["Tristana"]        =   {_E, _W, _Q, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W},
        ["Trundle"]         =   {_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Tryndamere"]      =   {_Q, _E, _W, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W},
        ["TwistedFate"]     =   {_W, _Q, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Twitch"]          =   {_E, _Q, _W, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _Q, _W, _W},
        ["Udyr"]            =   {_Q, _E, _W, _Q, _Q, _R, _Q, _R, _Q, _E, _E, _E, _E, _W, _R, _R, _R, _R},
        ["Urgot"]           =   {_Q, _E, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Varus"]           =   {_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Vayne"]           =   {_Q, _W, _E, _W, _W, _R, _W, _Q, _W, _Q, _R, _Q, _Q, _E, _E, _R, _E, _E},
        ["Veigar"]          =   {_Q, _W, _E, _E, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _W, _E, _R, _E, _E},
        ["Velkoz"]          =   {_W, _Q, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Vi"]              =   {_W, _E, _Q, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Viktor"]          =   {_E, _Q, _W, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W},
        ["Vladimir"]        =   {_Q, _E, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Volibear"]        =   {_W, _E, _Q, _W, _W, _R, _W, _E, _W, _E, _R, _E, _E, _Q, _Q, _R, _Q, _Q},
        ["Warwick"]         =   {_W, _Q, _E, _W, _Q, _R, _W, _Q, _W, _Q, _R, _W, _Q, _E, _E, _R, _E, _E},
        ["Xerath"]          =   {_Q, _E, _W, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["XinZhao"]         =   {_W, _Q, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Yorick"]          =   {_E, _W, _E, _Q, _E, _R, _E, _W, _E, _W, _R, _W, _W, _Q, _Q, _R, _Q, _Q},
        ["Zac"]             =   {_W, _Q, _E, _E, _E, _R, _E, _W, _E, _W, _R, _W, _W, _E, _E, _R, _E, _E},
        ["Zed"]             =   {_Q, _E, _W, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Ziggs"]           =   {_Q, _W, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Zilean"]          =   {_Q, _W, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Zyra"]            =   {_Q, _W, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W},
        ["Yasuo"]           =   {_E, _Q, _W, _E, _E, _R, _E, _Q, _E, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W}
    }
end

function HeRoLvL:Global_Menu()
	self.Menu = scriptConfig('HeRo Level-UP', 'LvLUP')
    self.Menu:addParam('Enable', 'Enable', SCRIPT_PARAM_ONOFF, true)
	self.Menu:addParam('b1', '', SCRIPT_PARAM_INFO, "")
	self.Menu:addParam('Mode', 'Mode:', SCRIPT_PARAM_LIST, 1, {'Auto', 'Manual'})
    self.Menu:addParam('b2', '', SCRIPT_PARAM_INFO, "")
    self.Menu:addParam('b9', 'Manual Spell Order Changer', SCRIPT_PARAM_INFO, "")
    self.Menu:addParam('Level13', 'Level 1-3:', SCRIPT_PARAM_LIST, 1, {'Q-W-E',  'Q-E-W',  'W-Q-E',  'W-E-Q',  'E-Q-W',  'E-W-Q'})
    self.Menu:addParam('Level418', 'Level 4-18:', SCRIPT_PARAM_LIST, 1, {'Q-W-E',  'Q-E-W',  'W-Q-E',  'W-E-Q',  'E-Q-W',  'E-W-Q'})
    self.Menu:addParam('b8', '', SCRIPT_PARAM_INFO, "")
    self.Menu:addParam("Humanizer", "Use Humanizer:", SCRIPT_PARAM_SLICE, 100, 0, 1000, 0)
    ------------------------------------------------------------------------------------------------------------------
    self.Menu:addParam("b3", "", SCRIPT_PARAM_INFO, "")
    if VIP_USER then
        self.Menu:addParam("b4", "User: "..GetUser().." (VIP)", SCRIPT_PARAM_INFO, "")
    else
        self.Menu:addParam("b5", "User: "..GetUser().." (FREE)", SCRIPT_PARAM_INFO, "")
    end
    self.Menu:addParam("b6", "Script Version: ".._G.LvLScriptVersion[2], SCRIPT_PARAM_INFO, "")
    self.Menu:addParam("b7", "Script Author: ".._G.LvLScriptAuthor, SCRIPT_PARAM_INFO, "")
end

function HeRoLvL:Loader()
    self.LastLevel = 0
    self.NoFixSpamMsg = 0
    AddTickCallback(function() self:OnTick() end)
end

function HeRoLvL:OnTick()
	if not _G.LvLFixBugSplat then
		self:LevelSpell()
	elseif self.Menu.Enable then
        if os.clock() - self.NoFixSpamMsg > 2 then
            self.NoFixSpamMsg = os.clock()
            self:Message("Try [_G.LvLFixBugSplat = false] if you haven't BugSplat and(or) Bol Fully Updated!", 0)
            self.Menu.Enable = false
        end
    end
end

function HeRoLvL:LevelSpell()
    if (self.LastLevel < myHero.level) then
        self:LevelUp()
    end
end

function HeRoLvL:LevelUp()
	if self.Menu.Enable then
		if self.Menu.Mode == 1 then
			self.Sequence = self.Sequences[myHero.charName]
            self.SequenceName = self.SequencesName[myHero.charName]
		elseif self.Menu.Mode == 2 and myHero.level < 4 then
			self.Sequence = self.Sequences[self.Menu.Level13]
            self.SequenceName = self.SequencesName[self.Menu.Level13]
		elseif self.Menu.Mode == 2 and myHero.level > 3 then
			self.Sequence = self.Sequences[self.Menu.Level418]
            self.SequenceName = self.SequencesName[self.Menu.Level418]
        end

	    DelayAction(function() LevelSpell(self.Sequence[myHero.level]) end, self.Menu.Humanizer/1000)

		if myHero.level < 18 then
            self:Message("This Level: "..self.SequenceName[myHero.level].." ===> Next Level: "..self.SequenceName[myHero.level + 1], self.Menu.Humanizer/1000)
		end
		self.LastLevel = myHero.level	
	end
end

function HeRoLvL:Message(msg, time)
     DelayAction(function() PrintChat("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">HeRo Level - Up</font> <font color=\"#F7CB72\"></font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: ".. msg .."</font></b>") end, time)
end

function HeRoLvL:AutoUpdater() 
    local ToUpdate = {}
    ToUpdate.Version = _G.LvLScriptVersion[1]
    ToUpdate.UseHttps = true
    ToUpdate.Host = "raw.githubusercontent.com"
    ToUpdate.VersionPath = "/HeRoBaNd/Scripts/master/HeRoLevel-Up.version"
    ToUpdate.ScriptPath =  "/HeRoBaNd/Scripts/master/HeRoLevel-Up.lua"
    ToUpdate.SavePath = SCRIPT_PATH.."/HeRoLevel-Up.lua"
    ToUpdate.CallbackUpdate = function(NewVersion,OldVersion) print("<font color='#FF0000'><b>[HeRo Info]: </b> </font><font color='#00BFFF'><b>Updated to "..NewVersion..". </b></font>") end
    ToUpdate.CallbackNoUpdate = function(OldVersion) print("<font color='#FF0000'><b>[HeRo Info]: </b></font> <font color='#00BFFF'><b>No Updates Found</b></font>") end
    ToUpdate.CallbackNewVersion = function(NewVersion) print("<font color='#FF0000'><b>[HeRo Info]: </b></font> <font color='#00BFFF'><b>New Version found ("..NewVersion.."). Please wait until its downloaded</b></font>") end
    ToUpdate.CallbackError = function(NewVersion) print("<font color='#FF0000'><b>[HeRo Info]: </b></font> <font color='#00BFFF'><b>Error while Downloading. Please try again.</b></font>") end
    ScriptUpdate(ToUpdate.Version,ToUpdate.UseHttps, ToUpdate.Host, ToUpdate.VersionPath, ToUpdate.ScriptPath, ToUpdate.SavePath, ToUpdate.CallbackUpdate,ToUpdate.CallbackNoUpdate, ToUpdate.CallbackNewVersion,ToUpdate.CallbackError)
end

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
