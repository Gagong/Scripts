---Auto Leavel Up Developed by HeRoBaNd---
---Changelog---
---1.0 - Reliased For Bol---
---1.1 - Fix Punctuation errors---
---1.2 - Fix Color Bug---
---1.3 - Added on ScriptStatus---
---1.4 - Add New Taric and Yorick logic---
---1.5 - Added AutoUpdater (Credit - Simple & HiranN & BF Team)---
local LocalVersion = "1.6"
local autoupdate = true 
Sequences = {
	[0]					=	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	[1]					=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3}, 
	[2]					=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2}, 
	[3]					=	{2, 1, 3, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3}, 
	[4]					=	{2, 3, 1, 2, 2, 4, 2, 3, 2, 3, 4, 3, 3, 1, 1, 4, 1, 1}, 
	[5]					=	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}, 
	[6]					=	{3, 2, 1, 3, 3, 4, 3, 2, 3, 2, 4, 2, 2, 1, 1, 4, 1, 1},
    ["Aatrox"]			=	{2, 1, 3, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3},
    ["Ahri"]		    =	{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 2, 2},
    ["Akali"]		  	=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Alistar"]			=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Amumu"]		  	=	{2, 3, 1, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Anivia"]	 		=	{1, 3, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Annie"]		  	=	{2, 1, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Ashe"]		  	=	{1, 2, 1, 2, 3, 4, 1, 1, 2, 1, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Azir"]		  	=	{2, 1, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Bard"]        = {1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Blitzcrank"]  =	{1, 3, 2, 3, 2, 4, 3, 2, 3, 2, 4, 3, 2, 1, 1, 4, 1, 1},
    ["Brand"]		  	=	{2, 1, 3, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3},
    ["Braum"]		  	=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Caitlyn"]			=	{2, 1, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Cassiopeia"] 	=	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Chogath"]			=	{3, 1, 2, 2, 2, 4, 2, 3, 2, 3, 4, 3, 3, 1, 1, 4, 1, 1},
    ["Corki"]		  	=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 2, 3, 2, 4, 2, 2},
    ["Darius"]			=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Diana"]	     	=	{2, 1, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["DrMundo"]			=	{2, 1, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 3, 2, 2, 2, 2},
    ["Draven"]			=	{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Ekko"]        = {1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Elise"]		  	=	{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Evelynn"]			=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Ezreal"]			=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["FiddleSticks"]= {2, 3, 1, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3},
    ["Fiora"]			  =	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Fizz"]		   	=	{3, 1, 2, 3, 3, 4, 3, 2, 3, 2, 4, 2, 2, 1, 1, 4, 1, 1},
    ["Galio"]		  	=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 3, 3, 2, 2, 4, 3, 3},
    ["Gnar"]		  	=	{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Gangplank"]		=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Garen"]		  	=	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Gragas"]	 		=	{2, 3, 1, 3, 3, 4, 3, 2, 3, 2, 4, 2, 2, 1, 1, 4, 1, 1},
    ["Graves"]			=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Hecarim"]			=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Heimerdinger"]= {1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Illaoi"]      = {1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Irelia"]			=	{1, 3, 2, 2, 2, 4, 2, 3, 2, 3, 4, 3, 3, 1, 1, 4, 1, 1},
    ["Janna"]			  =	{3, 2, 1, 3, 3, 4, 3, 2, 3, 2, 4, 2, 2, 1, 1, 4, 1, 1},
    ["JarvanIV"]		=	{3, 1, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Jax"]		     	=	{3, 2, 1, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3},
    ["Jayce"]		  	=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Jinx"]		  	=	{1, 2, 3, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3},
    ["Kalista"]			=	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Karma"]		  	=	{1, 3, 2, 1, 1, 4, 1, 3, 3, 1, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Karthus"]			=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Kassadin"]		=	{1, 2, 3, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Katarina"]		=	{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Kayle"]		  	=	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Kennen"]			=	{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Khazix"]			=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Kindred"]     = {2, 1, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
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
    ["MissFortune"] =	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["MonkeyKing"]  =	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Mordekaiser"] =	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Morgana"]			=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Nami"]		  	=	{1, 2, 3, 2, 2, 4, 2, 3, 2, 3, 4, 3, 3, 1, 1, 4, 1, 1},
    ["Nasus"]			  =	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 3, 2, 3, 4, 3, 3},
    ["Nautilus"]		=	{2, 3, 1, 2, 2, 4, 2, 3, 2, 3, 4, 3, 3, 1, 1, 4, 1, 1},
    ["Nidalee"]			=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Nocturne"]		=	{2, 1, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Nunu"]		  	=	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Olaf"]			  =	{1, 3, 2, 3, 3, 4, 3, 2, 3, 2, 4, 2, 2, 1, 1, 4, 1, 1},
    ["Orianna"]			=	{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Pantheon"]		=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 2, 3, 2, 4, 2, 2},
    ["Poppy"]		  	=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Quinn"]		  	=	{3, 1, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Rammus"]			=	{2, 1, 3, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3},
    ["Rek'Sai"]			=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Renekton"]		=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Rengar"]			=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Riven"]		  	=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Rumble"]			=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Ryze"]		  	=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Sejuani"]	 		=	{2, 1, 3, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Shaco"]			  =	{2, 3, 1, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
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
    ["TahmKench"]		= {1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Talon"]		  	=	{2, 3, 1, 2, 2, 4, 2, 1, 2, 1, 4, 1, 1, 3, 3, 4, 3, 3},
    ["Taric"]		  	=	{3, 1, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Teemo"]		  	=	{1, 3, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Thresh"]			=	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Tristana"]		=	{3, 2, 1, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Trundle"]			=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Tryndamere"]  =	{1, 3, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["TwistedFate"] =	{2, 1, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Twitch"]			=	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 1, 2, 2},
    ["Udyr"]		  	=	{1, 3, 2, 1, 1, 4, 1, 4, 1, 3, 3, 3, 3, 2, 4, 4, 4, 4},
    ["Urgot"]		  	=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Varus"]		  	=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Vayne"]		  	=	{1, 2, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Veigar"]			=	{1, 2, 3, 3, 1, 4, 1, 2, 1, 2, 4, 2, 2, 2, 3, 4, 3, 3},
    ["Velkoz"]			=	{2, 1, 3, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Vi"]		  	  =	{2, 3, 1, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Viktor"]			=	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2},
    ["Vladimir"]		=	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Volibear"]		=	{2, 3, 1, 2, 2, 4, 2, 3, 2, 3, 4, 3, 3, 1, 1, 4, 1, 1},
    ["Warwick"]			=	{2, 1, 3, 2, 1, 4, 2, 1, 2, 1, 4, 2, 1, 3, 3, 4, 3, 3},
    ["Xerath"]			=	{1, 3, 2, 1, 1, 4, 1, 2, 1, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["XinZhao"]			=	{2, 1, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Yorick"]			=	{3, 2, 3, 1, 3, 4, 3, 2, 3, 2, 4, 2, 2, 1, 1, 4, 1, 1},
    ["Zac"]		  	  =	{2, 1, 3, 3, 3, 4, 3, 2, 3, 2, 4, 2, 2, 3, 3, 4, 3, 3},
    ["Zed"]		  	  =	{1, 3, 2, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Ziggs"]		  	=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Zilean"]			=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Zyra"]		  	=	{1, 2, 3, 1, 1, 4, 1, 3, 1, 3, 4, 3, 3, 2, 2, 4, 2, 2},
    ["Yasuo"]			  =	{3, 1, 2, 3, 3, 4, 3, 1, 3, 1, 4, 1, 1, 2, 2, 4, 2, 2}
}

Skills = {"Q", "W", "E", "R"}

LastLevel = 0;

function OnLoad()

FindUpdates()
PrintChat("<font color='#FF0000'><b>[HeRo Leavel-UP] </b></font>".."<font color='#FF0000'><b>Loaded.</b></font>")

	HLUMainMenu = scriptConfig('HeRoLevel-UP', 'HLU_MAIN')
	
	HLUMainMenu:addParam('Enable', 'Enable', SCRIPT_PARAM_ONOFF, false)
	HLUMainMenu:addParam('AlwaysON', 'Always ON', SCRIPT_PARAM_ONOFF, false)
	HLUMainMenu:addParam('Info', '-----------------------------------------------------', SCRIPT_PARAM_INFO, "-------------")
	HLUMainMenu:addParam('Mode', 'Mode:', SCRIPT_PARAM_LIST, 1, {'Auto', 'Manual'})
    HLUMainMenu:addParam('Level13', 'Level 1-3:', SCRIPT_PARAM_LIST, 1, {'Q-W-E',  'Q-E-W',  'W-Q-E',  'W-E-Q',  'E-Q-W',  'E-W-Q'})
    HLUMainMenu:addParam('Level418', 'Level 4-18:', SCRIPT_PARAM_LIST, 1, {'Q-W-E',  'Q-E-W',  'W-Q-E',  'W-E-Q',  'E-Q-W',  'E-W-Q'})
	
	HLUMainMenu.Enable = false
	

	PrintChat("<font color='#EE82EE'><b><font color='#FF0000'><b>[HeRo Leavel-UP]: </b></font>" ..myHero.charName.. "<font color='#00FF00'> confirmed!</font></font></b>")
	
end

function OnTick()
	if (LastLevel < myHero.level) then
		LevelUp()
	end
end

function LevelUp()
	if HLUMainMenu.Enable or HLUMainMenu.AlwaysON then
		if HLUMainMenu.Mode == 1 then
			Sequence = Sequences[myHero.charName]
		elseif myHero.level < 4 then
			Sequence = Sequences[HLUMainMenu.Level13]
		else
			Sequence = Sequences[HLUMainMenu.Level418]
		end
		
		
		LevelSpell(Sequence[myHero.level])
		
		if myHero.level < 18 then
			PrintChat("<font color='#00BFFF'>This Level: </font><font color='#7CFC00'>"..Skills[Sequence[myHero.level]].."</font><font color='#00BFFF'><font color='#FF0000'> ===></font> Next level: </font><font color='#7CFC00'>"..Skills[Sequence[myHero.level + 1]].. "</font><font color='#EE82EE'>. </font>")
		end
		
		LastLevel = myHero.level
	else
		
	end

end

_G.LevelSpell = function(id)
  local offsets = { 
   [1] = 0x1E,
   [2] = 0xD3,
   [3] = 0x3A,
   [4] = 0xA8,
  }
  local p = CLoLPacket(0x00B6)
  p.vTable = 0xFE3124
  p:EncodeF(myHero.networkID)
  p:Encode1(0xC1)
  p:Encode1(offsets[id])
  for i = 1, 4 do p:Encode1(0x63) end
  for i = 1, 4 do p:Encode1(0xC5) end
  for i = 1, 4 do p:Encode1(0x6A) end
  for i = 1, 4 do p:Encode1(0x00) end
  SendPacket(p)
 end

local serveradress = "raw.githubusercontent.com"
local scriptadress = "/HeRoBaNd/Scripts/master"
	function FindUpdates()
	if not autoupdate then return end
	local ServerVersionDATA = GetWebResult(serveradress , scriptadress.."/HeRoLeavel-Up.version")
	if ServerVersionDATA then
		local ServerVersion = tonumber(ServerVersionDATA)
		if ServerVersion then
			if ServerVersion > tonumber(LocalVersion) then
			PrintChat("<font color='#FF0000'><b>[HR Smite] </b></font>".."<font color='#FAEBD7'><b>Updating, don't press F9.</b></font>")
			Update()
			else
			PrintChat("<font color='#FF0000'><b>[HR Smite] </b></font>".."<font color='#FAEBD7'><b>You have the latest version.</b></font>")
			end
		else
		PrintChat("<font color='#FF0000'><b>[HR Smite] </b></font>".."<font color='#FAEBD7'><b>An error occured, while updating, please reload.</b></font>")
		end
	else
	PrintChat("<font color='#FF0000'><b>[HR Smite] </b></font>".."<font color='#FAEBD7'><b>Could not connect to update Server.</b></font>")
	end
end

function Update()
	DownloadFile("http://"..serveradress..scriptadress.."/HeRoLeavel-Up.lua",SCRIPT_PATH.."HeRoLeavel-Up.lua", function ()
	PrintChat("<font color='#FF0000'><b>[HR Smite] </b></font>".."<font color='#FAEBD7'><b>Updated, press 2xF9.</b></font>")
	end)
end
