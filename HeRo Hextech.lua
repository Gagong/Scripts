_G.HextechScriptVersion = {1.1, "1.1", "|1.1|"}
_G.HextechScriptAuthor = "HeRoBaNd"

-- BoL Tools Tracker --
assert(load(Base64Decode("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"), nil, "bt", _ENV))()
TrackerLoad("GfZy4lgtmjmA5QH4")
-- BoL Tools Tracker --

function OnLoad()
    local ToUpdate = {}
    ToUpdate.Version = _G.HextechScriptVersion[1]
    ToUpdate.UseHttps = true
    ToUpdate.Host = "raw.githubusercontent.com"
    ToUpdate.VersionPath = "/HeRoBaNd/Scripts/master/HeRo%20Hextech.version"
    ToUpdate.ScriptPath =  "/HeRoBaNd/Scripts/master/HeRo%20Hextech.lua"
    ToUpdate.SavePath = SCRIPT_PATH.."/HeRo Hextech.lua"
    ToUpdate.CallbackUpdate = function(NewVersion,OldVersion) print("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">HeRo</font> <font color=\"#F7CB72\"> Hextech Class</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: "..NewVersion.."</font></b>") end
    ToUpdate.CallbackNoUpdate = function(OldVersion) print("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">HeRo</font> <font color=\"#F7CB72\"> Hextech Class</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: No Updates Found!</font></b>") end
    ToUpdate.CallbackNewVersion = function(NewVersion) print("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">HeRo</font> <font color=\"#F7CB72\"> Hextech Class</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: New Version Found ("..NewVersion.."). Please wait until it's Downloaded!</font></b>") end
    ToUpdate.CallbackError = function(NewVersion) print("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">HeRo</font> <font color=\"#F7CB72\"> Hextech Class</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: Error while Downloading! Please try again!</font></b>") end
    ScriptUpdate(ToUpdate.Version, ToUpdate.UseHttps, ToUpdate.Host, ToUpdate.VersionPath, ToUpdate.ScriptPath, ToUpdate.SavePath, ToUpdate.CallbackUpdate, ToUpdate.CallbackNoUpdate, ToUpdate.CallbackNewVersion, ToUpdate.CallbackError)
    
    Hextech()

end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
class("Hextech")

function Hextech:__init()
    
    self:Message("Hextech", "Class loaded!", 3)
    self:Global_Menu()
    self:Loader()
 
end 

function Hextech:Global_Menu()
    self.Menu = scriptConfig("[HeRo] Hextech Class", "HeRoHextech")

    self.Menu:addParam("b7", "", SCRIPT_PARAM_INFO, "")

    self.Menu:addParam("Key", "You Hextech Activate Key:", SCRIPT_PARAM_ONKEYDOWN, false, 32)

    self.Menu:addParam("b6", "", SCRIPT_PARAM_INFO, "")

    self.Menu:addParam("EnableGLP", "Enable Hextech GLP-800 Usage:", SCRIPT_PARAM_ONOFF, true)
    self.Menu:addParam("EnableGunblade", "Enable Hextech Gunblade Usage:", SCRIPT_PARAM_ONOFF, true)
    self.Menu:addParam("EnableProtobelt", "Enable Hextech Protobelt-01 Usage:", SCRIPT_PARAM_ONOFF, true)
    self.Menu:addParam("EnableBWC", "Enable Bilgewater Cutlass Usage:", SCRIPT_PARAM_ONOFF, true)

    self.Menu:addParam("b5", "", SCRIPT_PARAM_INFO, "")

    self.Menu:addParam("EnableGLPRange", "Draw Hextech GLP-800 Range:", SCRIPT_PARAM_ONOFF, true)
    self.Menu:addParam("EnableGunbladeRange", "Draw Hextech Gunblade Range:", SCRIPT_PARAM_ONOFF, true)
    self.Menu:addParam("EnableProtobeltRange", "Draw Hextech Protobelt-01 Range:", SCRIPT_PARAM_ONOFF, true)
    self.Menu:addParam("EnableBWCRange", "Draw Bilgewater Cutlass Range:", SCRIPT_PARAM_ONOFF, true)

    ts = TargetSelector(TARGET_PRIORITY, 1000, DAMAGE_MAGIC)
    self.Menu:addTS(ts)
    ts.name = "Hextech Targeting"
    ------------------------------------------------------------------------------------------------------------------
    self.Menu:addParam("b", "", SCRIPT_PARAM_INFO, "")
    if VIP_USER then
        self.Menu:addParam("b1", "User: "..GetUser().." (VIP)", SCRIPT_PARAM_INFO, "")
    else
        self.Menu:addParam("b2", "User: "..GetUser().." (FREE)", SCRIPT_PARAM_INFO, "")
    end
    self.Menu:addParam("b3", "Script Version: ".._G.HextechScriptVersion[2], SCRIPT_PARAM_INFO, "")
    self.Menu:addParam("b4", "Script Author: ".._G.HextechScriptAuthor, SCRIPT_PARAM_INFO, "")
end

function Hextech:Loader()
    self.GLPRange = 850
    self.GunbladeRange = 700
    self.ProtobeltRange = 1200
    self.BWCRange = 610
    self.FindGLPMsg = false
    self.FindGunbladeMsg = false
    self.FingPrototebeltMsg = false
    self.FingBWCMsg = false
    self.NoGLPSpam = 0
    self.NoGBSpam = 0
    self.NoProtSpam = 0
    self.NoBWCSpam = 0
    AddTickCallback(function() self:OnTick() end)
    AddDrawCallback(function() self:OnDraw() end)    
end

function Hextech:OnDraw()
    if not myHero.dead and GetInventorySlotItem(3030) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3030)) == READY and self.Menu.EnableGLP and self.Menu.EnableGLPRange then
        _G.HextechDrawFPSCircle(myHero.x, myHero.z, self.GLPRange, RGB(255, 0, 0), 7)
    end

    if not myHero.dead and GetInventorySlotItem(3146) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3146)) == READY and self.Menu.EnableGunblade and self.Menu.EnableGunbladeRange then
        _G.HextechDrawFPSCircle(myHero.x, myHero.z, self.GunbladeRange, RGB(0, 255, 0), 7)
    end

    if not myHero.dead and GetInventorySlotItem(3152) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3152)) == READY and self.Menu.EnableProtobelt and self.Menu.EnableProtobeltRange then
        _G.HextechDrawFPSCircle(myHero.x, myHero.z, self.ProtobeltRange, RGB(0, 0, 255), 7)
    end

    if not myHero.dead and GetInventorySlotItem(3144) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3144)) == READY and self.Menu.EnableBWC and self.Menu.EnableBWCRange then
        _G.HextechDrawFPSCircle(myHero.x, myHero.z, self.BWCRange, RGB(155, 155, 155), 7)
    end
end

function Hextech:OnTick()
    self:FindNewItems()
    ts:update()

    if self.Menu.Key and self.Menu.EnableGLP and GetInventorySlotItem(3030) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3030)) == READY then
        self:UseGLP()
    end

    if self.Menu.Key and self.Menu.EnableGunblade and GetInventorySlotItem(3146) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3146)) == READY  then
        self:UseGunblade()
    end

    if self.Menu.Key and self.Menu.EnableProtobelt and GetInventorySlotItem(3152) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3152)) == READY then
        self:UseProtobelt()
    end

    if self.Menu.Key and self.Menu.EnableBWC and GetInventorySlotItem(3144) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3144)) == READY then
        self:UseBWC()
    end
end

function Hextech:FindNewItems()
    if GetInventorySlotItem(3030) ~= nil then
        if self.FindGLPMsg == false then
            self.FindGLPMsg = true
            self:Message("Hextech", "New Item Find: Hextech GLP-800!", 0)
        end
    end

    if GetInventorySlotItem(3146) ~= nil then
        if self.FindGunbladeMsg == false then
            self.FindGunbladeMsg = true
            self:Message("Hextech", "New Item Find: Hextech Gunblade!", 0)
        end
    end

    if GetInventorySlotItem(3152) ~= nil then
        if self.FingPrototebeltMsg == false then
            self.FingPrototebeltMsg = true
            self:Message("Hextech", "New Item Find: Hextech Protobelt-01!", 0)
        end
    end

    if GetInventorySlotItem(3144) ~= nil then
        if self.FingBWCMsg == false then
            self.FingBWCMsg = true
            self:Message("Hextech", "New Item Find: Bilgewater Cutlass!", 0)
        end
    end
end

function Hextech:UseGLP()
    if (ts.target ~= nil and not ts.target.dead and (GetDistance(myHero, ts.target) < self.GLPRange) and ts.target.visible and GetInventorySlotItem(3030) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3030)) == READY) then
        CastSpell(GetInventorySlotItem(3030), ts.target)
        if os.clock() - self.NoGLPSpam > 2 then
            self.NoGLPSpam = os.clock()
            self:Message("Hextech", "Hextech GLP-800 Casted on: "..ts.target.."!", 0)
        end
    end
end

function Hextech:UseGunblade()
    if (ts.target ~= nil and not ts.target.dead and GetDistance(myHero, ts.target) < self.GunbladeRange and ts.target.visible and GetInventorySlotItem(3146) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3146)) == READY) then
        CastSpell(GetInventorySlotItem(3146), ts.target)
        if os.clock() - self.NoGBSpam > 2 then
            self.NoGBSpam = os.clock()
            self:Message("Hextech", "Hextech Gunblade Casted on: "..ts.target.."!", 0)
        end
    end
end

function Hextech:UseProtobelt()
    if ts.target ~= nil and not ts.target.dead and GetDistance(myHero, ts.target) < self.ProtobeltRange and ts.target.visible and GetInventorySlotItem(3152) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3152)) == READY then
        CastSpell(GetInventorySlotItem(3152), ts.target)
        if os.clock() - self.NoProtSpam > 2 then
            self.NoProtSpam = os.clock()
            self:Message("Hextech", "Hextech Protobelt-01 Casted on: "..ts.target.."!", 0)
        end
    end
end

function Hextech:UseBWC()
    if ts.target ~= nil and not ts.target.dead and GetDistance(myHero, ts.target) < self.BWCRange and ts.target.visible and GetInventorySlotItem(3144) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3144)) == READY then
        CastSpell(GetInventorySlotItem(3144), ts.target)
        if os.clock() - self.NoBWCSpam > 2 then
            self.NoBWCSpam = os.clock()
            self:Message("Hextech", "Bilgewater Cutlass Casted on: "..ts.target.."!", 0)
        end
    end
end

function Hextech:Message(class,msg,time)
    DelayAction(function() PrintChat("<b><font color=\"#6A56EB\">[</font><font color=\"#F7CB72\">HeRo</font> <font color=\"#F7CB72\">"..class.." Class</font><font color=\"#c0392b\"></font><font color=\"#27ae60\"></font><font color=\"#6A56EB\">]</font><font color=\"#FFCCE5\">: ".. msg .."</font></b>") end, time)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------_G.HextechDrawFPSCircle Start--------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

function _G.HextechDrawLineA(x1, y1, x2, y2, color)
    DrawLine(x1, y1, x2, y2, 1, color)
end

function _G.HextechDrawFPSCircle(x, z, radius, color, quality)
    for i = -radius * math.cos(math.pi/4), radius * math.cos(math.pi/4) - 1, radius * math.cos(math.pi/4)/quality do
        local v = WorldToScreen(D3DXVECTOR3((x + i), myHero.y, (z + math.sqrt(radius * radius - i * i))))
        local c = WorldToScreen(D3DXVECTOR3((x + i), myHero.y, (z - math.sqrt(radius * radius - i * i))))
        local k = WorldToScreen(D3DXVECTOR3((x + i + radius * math.cos(math.pi/4)/quality), myHero.y, (z + math.sqrt(radius * radius - (i + radius * math.cos(math.pi/4)/quality) * (i + radius * math.cos(math.pi/4)/quality)))))
        local n = WorldToScreen(D3DXVECTOR3((x + i + radius * math.cos(math.pi/4)/quality), myHero.y, (z - math.sqrt(radius * radius - (i + radius * math.cos(math.pi/4)/quality) * (i + radius * math.cos(math.pi/4)/quality)))))
        if (v.x > 0 and v.x < WINDOW_W) and (v.y > 0 and v.y < WINDOW_H) and (k.x > 0 and k.x < WINDOW_W) and (k.y > 0 and k.y < WINDOW_H) then
            _G.HextechDrawLineA(v.x, v.y, k.x, k.y, color)
        end
        if (c.x > 0 and c.x < WINDOW_W) and (c.y > 0 and c.y < WINDOW_H) and (n.x > 0 and n.x < WINDOW_W) and (n.y > 0 and n.y < WINDOW_H) then
            _G.HextechDrawLineA(c.x, c.y, n.x, n.y, color)
        end
    end

    for i = -radius * math.cos(math.pi/4), radius * math.cos(math.pi/4) - 1, radius * math.cos(math.pi/4)/quality do
        local v = WorldToScreen(D3DXVECTOR3((x + math.sqrt(radius * radius - i * i)), myHero.y, (z + i)))
        local c = WorldToScreen(D3DXVECTOR3((x - math.sqrt(radius * radius - i * i)), myHero.y, (z + i)))
        local k = WorldToScreen(D3DXVECTOR3((x + math.sqrt(radius * radius - (i + radius * math.cos(math.pi/4)/quality) * (i + radius * math.cos(math.pi/4)/quality))), myHero.y, (z + i + radius * math.cos(math.pi/4)/quality)))
        local n = WorldToScreen(D3DXVECTOR3((x - math.sqrt(radius * radius-(i + radius * math.cos(math.pi/4)/quality) * (i + radius * math.cos(math.pi/4)/quality))), myHero.y, (z + i + radius*  math.cos(math.pi/4)/quality)))
        if (v.x > 0 and v.x < WINDOW_W) and (v.y > 0 and v.y < WINDOW_H) and (k.x > 0 and k.x < WINDOW_W) and (k.y > 0 and k.y < WINDOW_H) then
            _G.HextechDrawLineA(v.x, v.y, k.x, k.y, color)
        end
        if (c.x > 0 and c.x < WINDOW_W) and (c.y > 0 and c.y < WINDOW_H) and (n.x > 0 and n.x < WINDOW_W) and (n.y > 0 and n.y < WINDOW_H) then
            _G.HextechDrawLineA(c.x, c.y, n.x, n.y, color)
        end
    end
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------_G.HextechDrawFPSCircle End--------------
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
