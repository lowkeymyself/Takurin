
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- SKIN LISTS
local SkinLists = {
    ["Assault Rifle"] = {"Default", "AK-47", "AUG", "Tommy Gun", "Boneclaw Rifle", "Gingerbread AUG", "AKEY-47", "100K Visits", "10 Billion Visits", "Phoenix Rifle"},
    ["Bow"] = {"Default", "Compound Bow", "Raven Bow", "Dream Bow", "Bat Bow", "Frostbite Bow", "Beloved Bow", "Balloon Bow", "Glorious Bow", "Key Bow", "Arch Bow"},
    ["Burst Rifle"] = {"Default", "Electro Burst", "Aqua Burst", "FAMAS", "Spectral Burst", "Pine Burst"},
    ["Crossbow"] = {"Default", "Pixel Crossbow", "Harpoon Crossbow", "Violin Crossbow", "Crossbone", "Frostbite Crossbow", "Arch Crossbow", "Glorious Crossbow"},
    ["Distortion"] = {"Default", "Plasma Distortion", "Magma Distortion", "Cyber Distortion", "Expirement D15", "Sleighstortion"},
    ["Energy Rifle"] = {"Default", "Hacker Rifle", "Hydro Rifle", "Void Rifle", "Soul Rifle", "New Years Energy Rifle"},
    ["Flamethrower"] = {"Default", "Pixel Flamethrower", "Lamethrower", "Glitterthrower", "Jack O' Thrower", "Snowblower", "Keythrower", "Rainbowthrower"},
    ["Grenade Launcher"] = {"Default", "Swashbuckler", "Uranium Launcher", "Gearnade Launcher", "Skull Grenade Launcher", "Snowball Launcher"},
    ["Gunblade"] = {"Default", "Hyper Gunblade", "Crude Gunblade", "Gunsaw", "Boneblade", "Elf's Gunblade"},
    ["Minigun"] = {"Default", "Lasergun 3000", "Pixel Minigun", "Fighter Jet", "Pumpkin Minigun", "Wrapped Minigun"},
    ["Paintball Gun"] = {"Default", "Slime Gun", "Boba Gun", "Ketchup Gun", "Brain Gun", "Snowball Gun"},
    ["RPG"] = {"Default", "Nuke Launcher", "Spaceship Launcher", "Squid Launcher", "Pumpkin Launcher", "Firework Launcher"},
    ["Shotgun"] = {"Default", "Balloon Shotgun", "Hyper Shotgun", "Cactus Shotgun", "Broomstick", "Wrapped Shotgun"},
    ["Sniper"] = {"Default", "Pixel Sniper", "Hyper Sniper", "Event Horizon", "Eyething Sniper", "Gingerbread Sniper", "Keyper", "Glorious Sniper"},
    ["Daggers"] = {"Default", "Aces", "Paper Planes", "Shurikens", "Bat Daggers", "Cookies", "Crystal Daggers", "Keynais"},
    ["Energy Pistols"] = {"Default", "Void Pistols", "Hydro Pistols", "Soul Pistols", "New Years Energy Pistols"},
    ["Exogun"] = {"Default", "Singularity", "Raygun", "Repulsor", "Exogourd", "Midnight Festive Exogun"},
    ["Flare Gun"] = {"Default", "Firework Gun", "Dynamite Gun", "Banana Flare", "Vexed Flare Gun", "Wrapped Flare Gun"},
    ["Handgun"] = {"Default", "Blaster", "Hand Gun", "Gumball Handgun", "Pumpkin Handgun", "Gingerbread Handgun"},
    ["Revolver"] = {"Default", "Desert Eagle", "Sheriff", "Peppergun", "Boneclaw Revolver", "Peppermint Sheriff"},
    ["Shorty"] = {"Default", "Not So Shorty", "Lovely Shorty", "Balloon Shorty", "Demon Shorty", "Wrapped Shorty"},
    ["Slingshot"] = {"Default", "Stick", "Goal Post", "Harp", "Boneshot", "Reindeer Slingshot", "Lucky Horseshoe"},
    ["Spray"] = {"Default", "Lovely Spray", "Nail Gun", "Bottle Spray", "Boneclaw Spray", "Pine Spray", "Key Spray"},
    ["Uzi"] = {"Default", "Water Uzi", "Electro Uzi", "Money Gun", "Demon Uzi", "Pine Uzi"},
    ["Warper"] = {"Default", "Glitter Warper", "Arcane Warper", "Hotel Bell", "Experiment W4", "Frost Warper"},
    ["Battle Axe"] = {"Default", "The Shred", "Ban Axe", "Cerulean Axe", "Mimic Axe", "Nordic Axe"},
    ["Chainsaw"] = {"Default", "Blobsaw", "Handsaws", "Mega Drill", "Buzzsaw", "Festive Buzzsaw"},
    ["Fists"] = {"Default", "Boxing Gloves", "Brass Knuckles", "Fists Of Hurt", "Pumpkin Claws", "Festive Fists"},
    ["Katana"] = {"Default", "Saber", "Lightning Bolt", "Stellar Katana", "Evil Trident", "New Years Katana", "Keytana", "Arch Katana", "Crystal Katana", "Pixel Katana", "Glorious Katana"},
    ["Knife"] = {"Default", "Chancla", "Karambit", "Balisong", "Machete", "Candy Cane", "Keylisong", "Keyrambit", "Caladbolg"},
    ["Riot Shield"] = {"Default", "Door", "Energy Shield", "Masterpiece", "Tombstone Shield", "Sled"},
    ["Scythe"] = {"Default", "Scythe of Death", "Anchor", "Sakura Scythe", "Bat Scythe", "Cryo Scythe", "Crystal Scythe", "Keythe", "Bug Net", "Arch Scythe"},
    ["Trowel"] = {"Default", "Plastic Shovel", "Garden Shovel", "Paintbrush", "Pumpkin Carver", "Snow Shovel"},
    ["Flashbang"] = {"Default", "Disco Ball", "Camera", "Lightbulb", "Skullbang", "Shining Star"},
    ["Freeze Ray"] = {"Default", "Temporal Ray", "Bubble Ray", "Gum Ray", "Spider Ray", "Wrapped Freeze Ray"},
    ["Grenade"] = {"Default", "Whoopee Cushion", "Water Balloon", "Dynamite", "Soul Grenade", "Jingle Grenade"},
    ["Jump Pad"] = {"Default", "Trampoline", "Bounce House", "Shady Chicken Sandwich", "Spider Web", "Jolly Man"},
    ["Medkit"] = {"Default", "Sandwich", "Laptop", "Medkitty", "Bucket of Candy", "Milk & Cookies", "Box of Chocolates", "Briefcase"},
    ["Molotov"] = {"Default", "Coffee", "Torch", "Lava Lamp", "Vexed Candle", "Hot Coals", "Arch Molotov"},
    ["Satchel"] = {"Default", "Advanced Satchel", "Notebook Satchel", "Bag O' Money", "Potion Satchel", "Suspicious Gift"},
    ["Smoke Grenade"] = {"Default", "Emoji Cloud", "Balance", "Hourglass", "Eyeball", "Snowglobe"},
    ["Subspace Tripmine"] = {"Default", "Don't Press", "Spring", "DIY Tripmine", "Trick or Treat", "Dev In the Box", "Pot O Keys"},
    ["War Horn"] = {"Default", "Trumpet", "Megaphone", "Air Horn", "Boneclaw Horn", "Mammoth Horn"},
    ["Warpstone"] = {"Default", "Cyber Warpstone", "Teleport Disc", "Electropunk Warpstone", "Warpbone", "Warpstar"},
    ["Permafrost"] = {"Default", "Snowman Permafrost", "Ice Permafrost", "Glorious Permafrost"},
}

local WrapList = {
    "None", "Gold", "Diamond", "Midas Touch", "Community Wrap", "Blush Wrapping", "Brain", "Crystalliz",
    "Damascus", "Black Damascus", ".exe wrap", "Groove", "Hollow Wrap", "Hesper", "Hyperdrive",
    "Gingerbread", "Neon Lights", "Hologram Arena", "Sunset", "Pink Lemonade", "Lovely Leopard",
    "Dawn", "Spectral", "Danger", "Termination", "Moonstone", "Starfall", "Black Glass",
    "Rift Wrap", "Starblaze", "Maganite", "Watermelon", "Reptile", "Water", "OranGG", "A5", "Cheese",
    "Nova", "Supernova", "Glass", "Mesh", "Meat Wrap", "Black Dark Wrap", "Cardinal", "Pixel Camo",
    "Nauseite", "Sensite", "Urban Camo", "Frosted", "Slime Wrap", "Carpet Wrap", "Cross Wrap",
    "Mainframe Wrap", "Honeycomb Wrap", "Black Opal Wrap", "Patriot", "PB&J Wrap", "Digital Camo",
    "Street Camo", "Ocean Camo", "Circuit", "Clouds", "Woven", "Ladybug"
}

-- SAVE / LOAD
local SAVE_FILE = "TakurinRivalsSkinConfig.json"
local LEGACY_SAVE_FILES = {"KenyaSkinConfig.json", "AnihaSkinConfig.json"}

local function SaveConfig()
    local success, err = pcall(function()
        local data = {}
        for weapon, info in pairs(_G.EquippedData) do
            data[weapon] = {Skin = info.Skin or "Default", Wrap = info.Wrap or "None"}
        end
        writefile(SAVE_FILE, game:GetService("HttpService"):JSONEncode(data))
    end)
    return success
end

local function LoadConfig()
    local success, result = pcall(function()
        local pickFile
        if isfile(SAVE_FILE) then
            pickFile = SAVE_FILE
        else
            for _, legacy in ipairs(LEGACY_SAVE_FILES) do
                if isfile(legacy) then pickFile = legacy; break end
            end
        end
        if not pickFile then return nil end
        local raw = readfile(pickFile)
        local decoded = game:GetService("HttpService"):JSONDecode(raw)
        if pickFile ~= SAVE_FILE then
            pcall(function() writefile(SAVE_FILE, raw) end)
        end
        return decoded
    end)
    if success and result then
        for weapon, info in pairs(result) do
            if _G.EquippedData[weapon] then
                _G.EquippedData[weapon].Skin = info.Skin or "Default"
                _G.EquippedData[weapon].Wrap = info.Wrap or "None"
            end
        end
        return true
    end
    return false
end

-- GLOBAL STATE
_G.ActiveSelection = nil
_G.ActiveTab = "Skins"
_G.Telemetry = {}
_G.EquippedData = _G.EquippedData or {}
for weapon in pairs(SkinLists) do
    if not _G.EquippedData[weapon] then
        _G.EquippedData[weapon] = {Skin = "Default", Wrap = "None"}
    end
end

LoadConfig()
print("Loading...")
_G.TakurinRivalsVersion = "2.3"

-- HOOKS & INIT
local function robust_require(module)
    local mName = tostring(module)
    local setidentity = setthreadidentity or set_thread_identity or (syn and syn.set_thread_identity) or (fluxus and fluxus.set_thread_identity) or (getgenv and getgenv().set_thread_identity)
    local getidentity = getthreadidentity or get_thread_identity or (syn and syn.get_thread_identity) or (fluxus and fluxus.set_thread_identity) or (getgenv and getgenv().get_thread_identity)

    if shared[mName] or _G[mName] then
        _G.Telemetry[mName] = "cache"
        return (shared[mName] or _G[mName])
    end
    if getrenv and (getrenv()._G[mName] or getrenv().shared[mName]) then
        _G.Telemetry[mName] = "shared"
        return (getrenv()._G[mName] or getrenv().shared[mName])
    end

    local old_identity
    pcall(function() if getidentity and setidentity then old_identity = getidentity() setidentity(2) end end)
    local success, result = pcall(require, module)
    if not success and getgenv and getgenv().require then
        local ok, res = pcall(getgenv().require, module)
        if ok then success, result = true, res end
    end
    pcall(function() if setidentity and old_identity then setidentity(old_identity) end end)
    if success then
        _G.Telemetry[mName] = "ok"
        return result
    end

    local getupvalues = debug.getupvalues or getupvalues
    local scan_apis = {getgc, getregistry, debug.getregistry}
    for _, api in pairs(scan_apis) do
        if type(api) == "function" then
            local ok, objects = pcall(api, true)
            if ok and type(objects) == "table" then
                for _, v in pairs(objects) do
                    if type(v) == "table" then
                        if mName:find("CosmeticLibrary") and (v.Cosmetics or rawget(v, "Cosmetics")) and (type(v.Equip) == "function" or type(v.GetSkins) == "function") then
                            _G.Telemetry[mName] = "gc"
                            return v
                        elseif mName:find("ItemLibrary") and (v.ViewModels or rawget(v, "ViewModels")) then
                            _G.Telemetry[mName] = "gc"
                            return v
                        elseif mName:find("ClientViewModel") and (v.new or rawget(v, "new")) and (v.GetWrap or rawget(v, "GetWrap")) then
                            _G.Telemetry[mName] = "gc"
                            return v
                        elseif mName:find("ReplicatedClass") and type(v.ToEnum) == "function" then
                            _G.Telemetry[mName] = "gc"
                            return v
                        end
                    elseif type(v) == "function" and getupvalues then
                        local ups = getupvalues(v)
                        for _, upv in pairs(ups) do
                            if type(upv) == "table" then
                                if mName:find("CosmeticLibrary") and upv.Cosmetics and upv.Equip then
                                    _G.Telemetry[mName] = "upval"
                                    return upv
                                end
                                if mName:find("ItemLibrary") and upv.ViewModels then
                                    _G.Telemetry[mName] = "upval"
                                    return upv
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    _G.Telemetry[mName] = "fail"
    warn("failed to get " .. mName)
    return nil
end

task.spawn(function()
    task.wait(1.5)
    CosmeticLibrary = robust_require(ReplicatedStorage:WaitForChild("Modules", 20):WaitForChild("CosmeticLibrary", 20))
    ItemLibrary = robust_require(ReplicatedStorage.Modules:WaitForChild("ItemLibrary", 20))
    ReplicatedClass = robust_require(ReplicatedStorage.Modules:WaitForChild("ReplicatedClass", 20))

    local Modules = player.PlayerScripts:WaitForChild("Modules", 15)
    local ClientItem = robust_require(Modules:WaitForChild("ClientReplicatedClasses", 15):WaitForChild("ClientFighter", 15):WaitForChild("ClientItem", 15))
    ClientViewModel = robust_require(Modules.ClientReplicatedClasses.ClientFighter.ClientItem:WaitForChild("ClientViewModel", 15))

    if not CosmeticLibrary or not ItemLibrary or not ClientViewModel or not ReplicatedClass then
        warn("modules didnt load")
        return
    end




    pcall(function()
        if ClientViewModel and not rawget(ClientViewModel, "__TakurinVMTracked") then
            rawset(ClientViewModel, "__TakurinVMTracked", true)

            local oldPlayHit = rawget(ClientViewModel, "PlayHitmarkerSound")
            if oldPlayHit then
                rawset(ClientViewModel, "PlayHitmarkerSound", function(self, isLocal, hitType, ...)
                    pcall(function() if self then self.__TakurinHitType = hitType end end)
                    return oldPlayHit(self, isLocal, hitType, ...)
                end)
            end

            local oldCreateHit = rawget(ClientViewModel, "_CreateHitmarkerSound")
            if oldCreateHit then
                rawset(ClientViewModel, "_CreateHitmarkerSound", function(self, soundId, volume, pitch, ...)
                    if _G.TakurinRivalsSettings.HitFXEnabled then
                        local custom = _G.TakurinRivalsSettings.HitSoundId
                        if custom and custom ~= "" then
                            custom = custom:match("^%s*(.-)%s*$") or custom
                            local lower = custom:lower()
                            if custom:sub(-1) == "/" then
                                local files = _G.TakurinLBFolderMap and _G.TakurinLBFolderMap[custom]
                                if files and #files > 0 then
                                    local pick = files[math.random(1, #files)]
                                    local toAsset = getsynasset or getcustomasset
                                    if toAsset then
                                        local ok, asset = pcall(toAsset, pick)
                                        if ok and asset then soundId = asset end
                                    end
                                end
                            elseif lower:match("%.mp3") or lower:match("%.wav") or lower:match("%.ogg") then
                                local toAsset = getsynasset or getcustomasset
                                if toAsset then
                                    local ok, asset = pcall(toAsset, custom)
                                    if ok and asset then soundId = asset end
                                end
                            else
                                if not custom:find("rbxassetid://") then custom = "rbxassetid://" .. custom:gsub("%D", "") end
                                soundId = custom
                            end
                        end
                        local mult = tonumber(_G.TakurinRivalsSettings.HitVolumeMult) or 1
                        if mult ~= 1 then volume = (volume or 1) * mult end
                    end
                    return oldCreateHit(self, soundId, volume, pitch, ...)
                end)
            end
        end
    end)



-- LOGGING (alias at module scope so hooks defined outside task.spawn can use it)
_G.TakurinRivalsLog = _G.TakurinRivalsLog or {}
local function logEvent(level, msg)
    local entry = ("[%s] %s  %s"):format(os.date("%H:%M:%S"), level, msg)
    table.insert(_G.TakurinRivalsLog, entry)
    if #_G.TakurinRivalsLog > 100 then table.remove(_G.TakurinRivalsLog, 1) end
    if level == "ERR" then warn("[Takurin] " .. msg) else print("[Takurin] " .. msg) end
    if _G.TakurinRivalsOnLog then pcall(_G.TakurinRivalsOnLog, level, msg, entry) end
end

local RANDOM_SKIN = "__RANDOM__"
local RANDOM_WRAP = "__RANDOM__"

-- BROKEN SKINS
local BROKEN_FILE = "TakurinRivalsBrokenSkins.json"
local LEGACY_BROKEN_FILES = {"KenyaBrokenSkins.json", "AnihaBrokenSkins.json"}
_G.BrokenSkins = _G.BrokenSkins or {}

local function isBroken(weapon, skin)
    return false
end

local function markBroken(weapon, skin, reason)
    -- Disabled
end

local function unmarkBroken(weapon, skin)
    -- Disabled
end

pcall(function()
    local pickFile
    if isfile(BROKEN_FILE) then
        pickFile = BROKEN_FILE
    else
        for _, legacy in ipairs(LEGACY_BROKEN_FILES) do
            if isfile(legacy) then pickFile = legacy; break end
        end
    end
    if not pickFile then return end
    local raw = readfile(pickFile)
    local decoded = game:GetService("HttpService"):JSONDecode(raw)
    if type(decoded) == "table" then
        _G.BrokenSkins = decoded
        local n = 0
        for _, set in pairs(decoded) do for _ in pairs(set) do n += 1 end end
        logEvent("INF", n .. " broken skins loaded" .. (pickFile ~= BROKEN_FILE and " (migrated from " .. pickFile .. ")" or ""))
        if pickFile ~= BROKEN_FILE then
            pcall(function() writefile(BROKEN_FILE, raw) end)
        end
    end
end)

local function deepClone(t, seen)
    if type(t) ~= "table" then return t end
    seen = seen or {}
    if seen[t] then return seen[t] end
    local out = {}
    seen[t] = out
    for k, v in pairs(t) do
        out[deepClone(k, seen)] = deepClone(v, seen)
    end
    return setmetatable(out, getmetatable(t))
end

local function getCosmeticData(name, cType)
    local base = CosmeticLibrary.Cosmetics[name]
    if not base then return nil end
    local data = deepClone(base)
    data.Name = name
    data.Type = cType
    if name == "AKEY-47" then
        data.IsMythical = true
        data.BundlePath = "Bundles"
    elseif name:find("Gingerbread") then
        data.BundlePath = "Festive Skin Case"
    elseif name == "Evil Trident" or name == "Devil's Trident" then
        data.DisplayName = "Evil Trident"
    end
    return data
end

local function rollRandomSkin(weapon)
    local list = _G.TakurinRivalsSkinLists and _G.TakurinRivalsSkinLists[weapon]
    if not list then return nil end
    local pool = {}
    for _, s in ipairs(list) do
        if s ~= "Default" and s ~= RANDOM_SKIN then table.insert(pool, s) end
    end
    if #pool == 0 then return nil end
    return pool[math.random(1, #pool)]
end
local function rollRandomWrap()
    local list = _G.TakurinRivalsWrapList
    if not list then return nil end
    local pool = {}
    for _, w in ipairs(list) do
        if w ~= "None" and w ~= RANDOM_WRAP then table.insert(pool, w) end
    end
    if #pool == 0 then return nil end
    return pool[math.random(1, #pool)]
end

local function resolveSkin(weapon)
    local d = _G.EquippedData[weapon]; if not d then return nil end
    if d.Skin == RANDOM_SKIN then return rollRandomSkin(weapon) end
    if d.Skin and d.Skin ~= "Default" then return d.Skin end
    return nil
end
local function resolveWrap(weapon)
    local d = _G.EquippedData[weapon]; if not d then return nil end
    if d.Wrap == RANDOM_WRAP then return rollRandomWrap() end
    if d.Wrap and d.Wrap ~= "None" then return d.Wrap end
    return nil
end

-- HOOKS
local oldGetWrap = ClientViewModel.GetWrap
ClientViewModel.GetWrap = function(self)
    local ok, result = pcall(function()
        local weaponName = self.ClientItem and self.ClientItem.Name
        if not weaponName then return end
        local wrapName = resolveWrap(weaponName)
        if wrapName then
            return getCosmeticData(wrapName, "Wrap")
        end
    end)
    if ok and result then return result end
    return oldGetWrap(self)
end

local function tryEnum(name)
    local ok, val = pcall(function() return ReplicatedClass:ToEnum(name) end)
    if ok then return val end
    return nil
end

local oldNew = ClientViewModel.new
ClientViewModel.new = function(replicatedData, clientItem)
    local injectedSkin, injectedWrap, weaponName
    pcall(function()
        if not clientItem then return end
        weaponName = clientItem.Name
        if not weaponName then return end
        if not _G.EquippedData[weaponName] then return end

        local cf = rawget(clientItem, "ClientFighter")
            or (pcall(function() return clientItem.ClientFighter end) and clientItem.ClientFighter)
        if not cf or cf.Player ~= player then return end

        local dataKey = tryEnum("Data")
        local skinKey = tryEnum("Skin")
        local nameKey = tryEnum("Name")
        local wrapKey = tryEnum("Wrap")

        if dataKey then
            replicatedData[dataKey] = replicatedData[dataKey] or {}
        end

        local selectedSkin = resolveSkin(weaponName)
        if selectedSkin then

            if isBroken(weaponName, selectedSkin) then
                logEvent("WARN", "skipping " .. selectedSkin .. " on " .. weaponName .. " (broken)")
                selectedSkin = nil
            else
                local cosData = getCosmeticData(selectedSkin, "Skin")
                if cosData and dataKey and skinKey then
                    replicatedData[dataKey][skinKey] = cosData
                    if nameKey then replicatedData[dataKey][nameKey] = selectedSkin end
                    injectedSkin = selectedSkin
                    logEvent("DBG", selectedSkin .. " -> " .. weaponName)
                end
            end
        end

        local selectedWrap = resolveWrap(weaponName)
        if selectedWrap and wrapKey then
            local wrapData = getCosmeticData(selectedWrap, "Wrap")
            if wrapData and dataKey then
                replicatedData[dataKey][wrapKey] = wrapData
                injectedWrap = selectedWrap
                logEvent("DBG", selectedWrap .. " wrap -> " .. weaponName)
            end
        end
    end)

    local okNew, vmOrErr = pcall(oldNew, replicatedData, clientItem)
    if not okNew then
        logEvent("ERR", "vm failed: " .. tostring(weaponName) .. " - " .. tostring(vmOrErr))
        if injectedSkin then markBroken(weaponName, injectedSkin, "crashed") end
        return nil
    end
    local vm = vmOrErr


    local healthy = false
    task.delay(0.1, function()
        local ok, err = pcall(function()
            if vm and vm._UpdateWrap then vm:_UpdateWrap() end
        end)
        if ok then
            healthy = true
            if injectedSkin then logEvent("DBG", weaponName .. " / " .. injectedSkin .. " ok") end
        else
            logEvent("ERR", "wrap update failed: " .. tostring(weaponName) .. " - " .. tostring(err))
            if injectedSkin then markBroken(weaponName, injectedSkin, "wrap error") end
        end
    end)


    if injectedSkin then
        task.delay(4, function()
            if not healthy then
                markBroken(weaponName, injectedSkin, "timed out")
                if _G.EquippedData[weaponName] and _G.EquippedData[weaponName].Skin == injectedSkin then
                    _G.EquippedData[weaponName].Skin = "Default"
                    logEvent("INF", weaponName .. " reverted to default")
                    if _G.TakurinRivalsOnAutoRevert then pcall(_G.TakurinRivalsOnAutoRevert, weaponName, injectedSkin) end
                end
            end
        end)
    end

    return vm
end

-- LIBRARY BUILD
local function BuildLibrariesFromGame()
    if not CosmeticLibrary then return false end

    if type(CosmeticLibrary.Skins) == "table" then
        for weaponName, skinTbl in pairs(CosmeticLibrary.Skins) do
            if type(skinTbl) == "table" then
                SkinLists[weaponName] = SkinLists[weaponName] or {"Default"}
                for skinName in pairs(skinTbl) do
                    if not table.find(SkinLists[weaponName], skinName) then
                        table.insert(SkinLists[weaponName], skinName)
                    end
                end
            end
        end
    end

    if type(CosmeticLibrary.Wraps) == "table" then
        for wrapName in pairs(CosmeticLibrary.Wraps) do
            if not table.find(WrapList, wrapName) then
                table.insert(WrapList, wrapName)
            end
        end
    end
    if type(CosmeticLibrary.Cosmetics) == "table" then
        for name, data in pairs(CosmeticLibrary.Cosmetics) do
            if type(data) == "table" and (data.Type == "Wrap" or data.Type == "wrap") then
                if not table.find(WrapList, name) then
                    table.insert(WrapList, name)
                end
            end
            if type(data) == "table" and (data.Type == "Skin" or data.Type == "skin") then
                local w = data.Weapon or data.WeaponName or data.Item
                if type(w) == "string" and SkinLists[w] then
                    if not table.find(SkinLists[w], name) then
                        table.insert(SkinLists[w], name)
                    end
                end
            end
        end
    end

    for _, list in pairs(SkinLists) do
        table.sort(list, function(a, b)
            if a == "Default" then return true end
            if b == "Default" then return false end
            return a < b
        end)
    end
    table.sort(WrapList, function(a, b)
        if a == "None" then return true end
        if b == "None" then return false end
        return a < b
    end)

    for weapon in pairs(SkinLists) do
        if not _G.EquippedData[weapon] then
            _G.EquippedData[weapon] = {Skin = "Default", Wrap = "None"}
        end
    end

    _G.TakurinRivalsSkinLists = SkinLists
    _G.TakurinRivalsWrapList = WrapList

    local nWeapons, nSkins = 0, 0
    for _, l in pairs(SkinLists) do nWeapons += 1; nSkins += #l - 1 end
    logEvent("INF", nWeapons .. " weapons, " .. nSkins .. " skins, " .. (#WrapList - 1) .. " wraps")
    return true
end

BuildLibrariesFromGame()


local KNOWN_BROKEN = {
    Bow         = {"Key Bow", "Dream Bow", "Raven Bow"},
    Crossbow    = {"Arch Crossbow"},
    Daggers     = {"Keynais", "Crystal Daggers", "Paper Planes"},
}
for weapon, skins in pairs(KNOWN_BROKEN) do
    _G.BrokenSkins[weapon] = _G.BrokenSkins[weapon] or {}
    for _, s in ipairs(skins) do
        if _G.BrokenSkins[weapon][s] == nil then
            _G.BrokenSkins[weapon][s] = true
        end
    end
end
pcall(function()
    writefile(BROKEN_FILE, game:GetService("HttpService"):JSONEncode(_G.BrokenSkins))
end)

local function ApplyAllSkins()
    if not CosmeticLibrary then return end
    for weapon in pairs(_G.EquippedData) do
        local s = resolveSkin(weapon)
        if s then pcall(function() CosmeticLibrary.Equip(weapon, "Skin", s) end) end
    end
    logEvent("INF", "skins applied")
end

local function BulkApplyWrap(wrapName)
    local applied = 0
    for weapon in pairs(SkinLists) do
        _G.EquippedData[weapon] = _G.EquippedData[weapon] or {Skin="Default", Wrap="None"}
        _G.EquippedData[weapon].Wrap = wrapName
        applied += 1
    end
    logEvent("INF", "bulk wrap -> " .. applied .. " weapons")
    return applied
end

local function BulkApplySkin(mode)
    local applied = 0
    for weapon in pairs(SkinLists) do
        _G.EquippedData[weapon] = _G.EquippedData[weapon] or {Skin="Default", Wrap="None"}
        if mode == "Random" then _G.EquippedData[weapon].Skin = RANDOM_SKIN
        else _G.EquippedData[weapon].Skin = "Default" end
        applied += 1
    end
    logEvent("INF", "bulk skin -> " .. applied .. " weapons")
    return applied
end

-- GUI
local TweenService = game:GetService("TweenService")


local C = {
    Bg       = Color3.fromRGB(28, 28, 30),
    Panel    = Color3.fromRGB(36, 36, 38),
    Sub      = Color3.fromRGB(44, 44, 46),
    Card     = Color3.fromRGB(50, 50, 54),
    CardHov  = Color3.fromRGB(60, 60, 64),
    Border   = Color3.fromRGB(72, 72, 76),
    BorderSub= Color3.fromRGB(56, 56, 60),
    Accent   = Color3.fromRGB(10, 132, 255),
    AccentDim= Color3.fromRGB(28, 70, 130),
    Text     = Color3.fromRGB(235, 235, 240),
    TextDim  = Color3.fromRGB(165, 165, 172),
    TextMute = Color3.fromRGB(120, 120, 128),
    Ok       = Color3.fromRGB(50, 215, 75),
    Warn     = Color3.fromRGB(255, 214, 10),
    Err      = Color3.fromRGB(255, 95, 87),
    Light1   = Color3.fromRGB(255, 95, 87),
    Light2   = Color3.fromRGB(255, 189, 46),
    Light3   = Color3.fromRGB(39, 201, 63),
}

local function corner(p, r) local c=Instance.new("UICorner",p); c.CornerRadius=UDim.new(0,r or 6); return c end
local function stroke(p, col, t) local s=Instance.new("UIStroke",p); s.Color=col or C.BorderSub; s.Thickness=1; s.Transparency=t or 0; s.ApplyStrokeMode=Enum.ApplyStrokeMode.Border; return s end
local function tw(o, t, p) TweenService:Create(o, TweenInfo.new(t, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), p):Play() end

-- SETTINGS / THEMES / FONTS
local SETTINGS_FILE = "TakurinRivalsSettings.json"
_G.TakurinRivalsSettings = _G.TakurinRivalsSettings or {
    Theme = "macOS Dark",
    FontPreset = "Gotham",
    Mode = "Computer",
    HitFXEnabled = false,
    HitSoundId = "",
    HitVolumeMult = 1,
}
pcall(function()
    if isfile(SETTINGS_FILE) then
        local d = game:GetService("HttpService"):JSONDecode(readfile(SETTINGS_FILE))
        if type(d) == "table" then for k, v in pairs(d) do _G.TakurinRivalsSettings[k] = v end end
    end
end)
local function saveSettings()
    pcall(function()
        writefile(SETTINGS_FILE, game:GetService("HttpService"):JSONEncode(_G.TakurinRivalsSettings))
    end)
end

local Themes = {
    ["macOS Dark"] = {
        Bg=Color3.fromRGB(28,28,30), Panel=Color3.fromRGB(36,36,38), Sub=Color3.fromRGB(44,44,46),
        Card=Color3.fromRGB(50,50,54), CardHov=Color3.fromRGB(60,60,64),
        Border=Color3.fromRGB(72,72,76), BorderSub=Color3.fromRGB(56,56,60),
        Accent=Color3.fromRGB(10,132,255), AccentDim=Color3.fromRGB(28,70,130),
        Text=Color3.fromRGB(235,235,240), TextDim=Color3.fromRGB(165,165,172), TextMute=Color3.fromRGB(120,120,128),
    },
    ["macOS Light"] = {
        Bg=Color3.fromRGB(236,236,238), Panel=Color3.fromRGB(245,245,247), Sub=Color3.fromRGB(228,228,232),
        Card=Color3.fromRGB(255,255,255), CardHov=Color3.fromRGB(240,240,244),
        Border=Color3.fromRGB(200,200,206), BorderSub=Color3.fromRGB(218,218,222),
        Accent=Color3.fromRGB(0,122,255), AccentDim=Color3.fromRGB(160,200,250),
        Text=Color3.fromRGB(28,28,30), TextDim=Color3.fromRGB(80,80,90), TextMute=Color3.fromRGB(140,140,148),
    },
    ["Midnight"] = {
        Bg=Color3.fromRGB(14,16,28), Panel=Color3.fromRGB(20,24,40), Sub=Color3.fromRGB(28,32,52),
        Card=Color3.fromRGB(34,40,64), CardHov=Color3.fromRGB(46,54,80),
        Border=Color3.fromRGB(58,68,100), BorderSub=Color3.fromRGB(40,48,72),
        Accent=Color3.fromRGB(140,110,255), AccentDim=Color3.fromRGB(70,55,130),
        Text=Color3.fromRGB(225,228,240), TextDim=Color3.fromRGB(155,160,180), TextMute=Color3.fromRGB(100,108,128),
    },
    ["Sunset"] = {
        Bg=Color3.fromRGB(32,22,28), Panel=Color3.fromRGB(44,28,36), Sub=Color3.fromRGB(54,34,44),
        Card=Color3.fromRGB(64,40,52), CardHov=Color3.fromRGB(80,50,64),
        Border=Color3.fromRGB(110,70,80), BorderSub=Color3.fromRGB(80,52,62),
        Accent=Color3.fromRGB(255,140,90), AccentDim=Color3.fromRGB(150,80,55),
        Text=Color3.fromRGB(245,232,224), TextDim=Color3.fromRGB(190,160,150), TextMute=Color3.fromRGB(140,110,108),
    },
}

local function _f(name)
    local ok, v = pcall(function() return Enum.Font[name] end)
    return (ok and v) or Enum.Font.Gotham
end
local FontPresets = {
    Gotham    = {Reg=_f"Gotham", Med=_f"GothamMedium", Semi=_f"GothamSemibold", Bold=_f"GothamBold", Mono=_f"Code"},
    GothamBlk = {Reg=_f"Gotham", Med=_f"GothamMedium", Semi=_f"GothamBlack", Bold=_f"GothamBlack", Mono=_f"Code"},
    Source    = {Reg=_f"SourceSans", Med=_f"SourceSans", Semi=_f"SourceSansSemibold", Bold=_f"SourceSansBold", Mono=_f"RobotoMono"},
    SrcLight  = {Reg=_f"SourceSansLight", Med=_f"SourceSans", Semi=_f"SourceSansSemibold", Bold=_f"SourceSansBold", Mono=_f"RobotoMono"},
    Roboto    = {Reg=_f"Roboto", Med=_f"Roboto", Semi=_f"Roboto", Bold=_f"Roboto", Mono=_f"RobotoMono"},
    RobotoCnd = {Reg=_f"RobotoCondensed", Med=_f"RobotoCondensed", Semi=_f"RobotoCondensed", Bold=_f"RobotoCondensed", Mono=_f"RobotoMono"},
    Ubuntu    = {Reg=_f"Ubuntu", Med=_f"Ubuntu", Semi=_f"Ubuntu", Bold=_f"Ubuntu", Mono=_f"Code"},
    Arial     = {Reg=_f"Arial", Med=_f"Arial", Semi=_f"ArialBold", Bold=_f"ArialBold", Mono=_f"Code"},
    Nunito    = {Reg=_f"Nunito", Med=_f"Nunito", Semi=_f"Nunito", Bold=_f"Nunito", Mono=_f"Code"},
    Merri     = {Reg=_f"Merriweather", Med=_f"Merriweather", Semi=_f"Merriweather", Bold=_f"Merriweather", Mono=_f"Code"},
    Oswald    = {Reg=_f"Oswald", Med=_f"Oswald", Semi=_f"Oswald", Bold=_f"Oswald", Mono=_f"Code"},
    Titil     = {Reg=_f"TitilliumWeb", Med=_f"TitilliumWeb", Semi=_f"TitilliumWeb", Bold=_f"TitilliumWeb", Mono=_f"Code"},
    Inconsol  = {Reg=_f"Inconsolata", Med=_f"Inconsolata", Semi=_f"Inconsolata", Bold=_f"Inconsolata", Mono=_f"RobotoMono"},
    Mono      = {Reg=_f"Code", Med=_f"Code", Semi=_f"Code", Bold=_f"Code", Mono=_f"Code"},
    Highway   = {Reg=_f"Highway", Med=_f"Highway", Semi=_f"Highway", Bold=_f"Highway", Mono=_f"Code"},
    SciFi     = {Reg=_f"SciFi", Med=_f"SciFi", Semi=_f"SciFi", Bold=_f"SciFi", Mono=_f"Code"},
    Michroma  = {Reg=_f"Michroma", Med=_f"Michroma", Semi=_f"Michroma", Bold=_f"Michroma", Mono=_f"Code"},
    Sarpanch  = {Reg=_f"Sarpanch", Med=_f"Sarpanch", Semi=_f"Sarpanch", Bold=_f"Sarpanch", Mono=_f"Code"},
    Indie     = {Reg=_f"IndieFlower", Med=_f"IndieFlower", Semi=_f"IndieFlower", Bold=_f"IndieFlower", Mono=_f"Code"},
    Kalam     = {Reg=_f"Kalam", Med=_f"Kalam", Semi=_f"Kalam", Bold=_f"Kalam", Mono=_f"Code"},
    Patrick   = {Reg=_f"PatrickHand", Med=_f"PatrickHand", Semi=_f"PatrickHand", Bold=_f"PatrickHand", Mono=_f"Code"},
    Marker    = {Reg=_f"PermanentMarker", Med=_f"PermanentMarker", Semi=_f"PermanentMarker", Bold=_f"PermanentMarker", Mono=_f"Code"},
    Bodoni    = {Reg=_f"Bodoni", Med=_f"Bodoni", Semi=_f"Bodoni", Bold=_f"Bodoni", Mono=_f"Code"},
    Garamond  = {Reg=_f"Garamond", Med=_f"Garamond", Semi=_f"Garamond", Bold=_f"Garamond", Mono=_f"Code"},
    Antique   = {Reg=_f"Antique", Med=_f"Antique", Semi=_f"Antique", Bold=_f"Antique", Mono=_f"Code"},
    Cartoon   = {Reg=_f"Cartoon", Med=_f"Cartoon", Semi=_f"Cartoon", Bold=_f"Cartoon", Mono=_f"Code"},
    Fantasy   = {Reg=_f"Fantasy", Med=_f"Fantasy", Semi=_f"Fantasy", Bold=_f"Fantasy", Mono=_f"Code"},
    Arcade    = {Reg=_f"Arcade", Med=_f"Arcade", Semi=_f"Arcade", Bold=_f"Arcade", Mono=_f"Code"},
    Zekton    = {Reg=_f"Zekton", Med=_f"Zekton", Semi=_f"Zekton", Bold=_f"Zekton", Mono=_f"Code"},
    Special   = {Reg=_f"SpecialElite", Med=_f"SpecialElite", Semi=_f"SpecialElite", Bold=_f"SpecialElite", Mono=_f"Code"},
    Legacy    = {Reg=_f"Legacy", Med=_f"Legacy", Semi=_f"Legacy", Bold=_f"Legacy", Mono=_f"Code"},
}

local Modes = {
    Computer = {W=1000, H=660, MinW=720, MinH=480},
    Mobile   = {W=480,  H=720, MinW=360, MinH=560},
}

local function applyThemeToC(name)
    local t = Themes[name] or Themes["macOS Dark"]
    for k, v in pairs(t) do C[k] = v end
end
applyThemeToC(_G.TakurinRivalsSettings.Theme)

local CurrentFont = _G.TakurinRivalsSettings.FontPreset or "Gotham"

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = "TakurinRivals"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 2147483647
local _hostGui
pcall(function() _hostGui = (gethui and gethui()) or (get_hidden_ui and get_hidden_ui()) or (gethiddenui and gethiddenui()) end)
if not _hostGui then _hostGui = player.PlayerGui end
local _okParent = pcall(function() ScreenGui.Parent = _hostGui end)
if not _okParent then ScreenGui.Parent = player.PlayerGui end
pcall(function() if syn and syn.protect_gui then syn.protect_gui(ScreenGui) end end)

local Main = Instance.new("Frame", ScreenGui)
local _initMode = Modes[_G.TakurinRivalsSettings.Mode] or Modes.Computer
Main.Size = UDim2.new(0, _initMode.W, 0, _initMode.H)
Main.Position = UDim2.new(0.5, -_initMode.W/2, 0.5, -_initMode.H/2)
Main.BackgroundColor3 = C.Bg
Main.BorderSizePixel = 0
corner(Main, 10)
stroke(Main, C.Border, 0)
local mainShadow = Instance.new("ImageLabel", Main)
mainShadow.AnchorPoint = Vector2.new(0.5, 0.5)
mainShadow.Position = UDim2.new(0.5, 0, 0.5, 6)
mainShadow.Size = UDim2.new(1, 60, 1, 60)
mainShadow.BackgroundTransparency = 1
mainShadow.Image = "rbxassetid://6014261993"
mainShadow.ImageColor3 = Color3.new(0, 0, 0)
mainShadow.ImageTransparency = 0.55
mainShadow.ScaleType = Enum.ScaleType.Slice
mainShadow.SliceCenter = Rect.new(49, 49, 450, 450)
mainShadow.ZIndex = 0


local TitleBar = Instance.new("Frame", Main)
TitleBar.Size = UDim2.new(1, 0, 0, 38)
TitleBar.BackgroundColor3 = C.Panel
TitleBar.BorderSizePixel = 0
corner(TitleBar, 10)
local tbCap = Instance.new("Frame", TitleBar)
tbCap.Size = UDim2.new(1, 0, 0.5, 0); tbCap.Position = UDim2.new(0, 0, 0.5, 0)
tbCap.BackgroundColor3 = C.Panel; tbCap.BorderSizePixel = 0
local tbDivider = Instance.new("Frame", TitleBar)
tbDivider.Size = UDim2.new(1, 0, 0, 1); tbDivider.Position = UDim2.new(0, 0, 1, -1)
tbDivider.BackgroundColor3 = C.Border; tbDivider.BorderSizePixel = 0

local TitleText = Instance.new("TextLabel", TitleBar)
TitleText.Size = UDim2.new(1, -160, 1, 0)
TitleText.Position = UDim2.new(0, 80, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "Takurin Rivals"
TitleText.TextColor3 = C.Text
TitleText.Font = Enum.Font.GothamSemibold
TitleText.TextSize = 13
TitleText.TextXAlignment = Enum.TextXAlignment.Center

local Version = Instance.new("TextLabel", TitleBar)
Version.Size = UDim2.new(0, 60, 1, 0)
Version.Position = UDim2.new(1, -70, 0, 0)
Version.BackgroundTransparency = 1
Version.Text = "v" .. _G.TakurinRivalsVersion
Version.TextColor3 = C.TextMute
Version.Font = Enum.Font.Code
Version.TextSize = 10
Version.TextXAlignment = Enum.TextXAlignment.Right

local Hint = Instance.new("TextLabel", TitleBar)
Hint.Size = UDim2.new(0, 0, 0, 0)
Hint.Visible = false

local function MakeLight(color, x)
    local b = Instance.new("TextButton", TitleBar)
    b.Size = UDim2.new(0, 12, 0, 12)
    b.Position = UDim2.new(0, x, 0.5, -6)
    b.BackgroundColor3 = color
    b.AutoButtonColor = false
    b.BorderSizePixel = 0
    b.Text = ""
    corner(b, 6)
    local s = stroke(b, Color3.fromRGB(0, 0, 0), 0.7)
    b.MouseEnter:Connect(function() tw(b, 0.08, {BackgroundColor3 = color:Lerp(Color3.new(1,1,1), 0.2)}) end)
    b.MouseLeave:Connect(function() tw(b, 0.08, {BackgroundColor3 = color}) end)
    return b
end
local CloseBtn = MakeLight(C.Light1, 12)
local MinBtn = MakeLight(C.Light2, 32)
local ZoomBtn = MakeLight(C.Light3, 52)

local GearBtn = Instance.new("TextButton", TitleBar)
GearBtn.Size = UDim2.new(0, 24, 0, 24)
GearBtn.Position = UDim2.new(1, -100, 0.5, -12)
GearBtn.BackgroundColor3 = C.Sub
GearBtn.AutoButtonColor = false
GearBtn.BorderSizePixel = 0
GearBtn.Text = "⚙"
GearBtn.TextColor3 = C.TextDim
GearBtn.Font = Enum.Font.GothamBold
GearBtn.TextSize = 14
corner(GearBtn, 6)
GearBtn.MouseEnter:Connect(function() tw(GearBtn, 0.1, {BackgroundColor3 = C.CardHov, TextColor3 = C.Text}) end)
GearBtn.MouseLeave:Connect(function() tw(GearBtn, 0.1, {BackgroundColor3 = C.Sub, TextColor3 = C.TextDim}) end)


local Body = Instance.new("Frame", Main)
Body.Size = UDim2.new(1, -20, 1, -38 - 36 - 12)
Body.Position = UDim2.new(0, 10, 0, 44)
Body.BackgroundTransparency = 1


local Left = Instance.new("Frame", Body)
Left.Size = UDim2.new(0, 280, 1, 0)
Left.BackgroundColor3 = C.Panel
Left.BorderSizePixel = 0
corner(Left, 8); stroke(Left, C.BorderSub)

local LeftHead = Instance.new("Frame", Left)
LeftHead.Size = UDim2.new(1, -20, 0, 24)
LeftHead.Position = UDim2.new(0, 10, 0, 8)
LeftHead.BackgroundTransparency = 1

local LeftLabel = Instance.new("TextLabel", LeftHead)
LeftLabel.Size = UDim2.new(0.5, 0, 1, 0)
LeftLabel.BackgroundTransparency = 1
LeftLabel.Text = "WEAPONS"
LeftLabel.TextColor3 = C.TextDim
LeftLabel.Font = Enum.Font.GothamBold
LeftLabel.TextSize = 10
LeftLabel.TextXAlignment = Enum.TextXAlignment.Left

local LeftCount = Instance.new("TextLabel", LeftHead)
LeftCount.Size = UDim2.new(0.5, 0, 1, 0)
LeftCount.Position = UDim2.new(0.5, 0, 0, 0)
LeftCount.BackgroundTransparency = 1
LeftCount.Text = ""
LeftCount.TextColor3 = C.TextMute
LeftCount.Font = Enum.Font.Code
LeftCount.TextSize = 11
LeftCount.TextXAlignment = Enum.TextXAlignment.Right


local SearchWrap = Instance.new("Frame", Left)
SearchWrap.Size = UDim2.new(1, -20, 0, 28)
SearchWrap.Position = UDim2.new(0, 10, 0, 36)
SearchWrap.BackgroundColor3 = C.Sub
SearchWrap.BorderSizePixel = 0
corner(SearchWrap, 6)
local searchStroke = stroke(SearchWrap, C.BorderSub)

local WeaponSearch = Instance.new("TextBox", SearchWrap)
WeaponSearch.Size = UDim2.new(1, -16, 1, 0)
WeaponSearch.Position = UDim2.new(0, 8, 0, 0)
WeaponSearch.BackgroundTransparency = 1
WeaponSearch.PlaceholderText = "Search weapons"
WeaponSearch.PlaceholderColor3 = C.TextMute
WeaponSearch.TextColor3 = C.Text
WeaponSearch.Font = Enum.Font.Gotham
WeaponSearch.TextSize = 12
WeaponSearch.BorderSizePixel = 0
WeaponSearch.ClearTextOnFocus = false
WeaponSearch.Text = ""
WeaponSearch.TextXAlignment = Enum.TextXAlignment.Left
WeaponSearch.Focused:Connect(function() tw(searchStroke, 0.1, {Color = C.Accent}) end)
WeaponSearch.FocusLost:Connect(function() tw(searchStroke, 0.1, {Color = C.BorderSub}) end)

local WeaponScroll = Instance.new("ScrollingFrame", Left)
WeaponScroll.Size = UDim2.new(1, -10, 1, -76)
WeaponScroll.Position = UDim2.new(0, 5, 0, 72)
WeaponScroll.BackgroundTransparency = 1
WeaponScroll.ScrollBarThickness = 3
WeaponScroll.ScrollBarImageColor3 = C.Border
WeaponScroll.BorderSizePixel = 0
WeaponScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
WeaponScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
WeaponScroll.ScrollingDirection = Enum.ScrollingDirection.Y

local WeaponLayout = Instance.new("UIListLayout", WeaponScroll)
WeaponLayout.Padding = UDim.new(0, 3)
WeaponLayout.SortOrder = Enum.SortOrder.Name
local weaponPad = Instance.new("UIPadding", WeaponScroll)
weaponPad.PaddingLeft = UDim.new(0, 5); weaponPad.PaddingRight = UDim.new(0, 5)
weaponPad.PaddingTop = UDim.new(0, 4); weaponPad.PaddingBottom = UDim.new(0, 4)


local Right = Instance.new("Frame", Body)
Right.Size = UDim2.new(1, -290, 1, 0)
Right.Position = UDim2.new(0, 290, 0, 0)
Right.BackgroundColor3 = C.Panel
Right.BorderSizePixel = 0
corner(Right, 8); stroke(Right, C.BorderSub)


local SectionBar = Instance.new("Frame", Right)
SectionBar.Size = UDim2.new(1, -24, 0, 28)
SectionBar.Position = UDim2.new(0, 12, 0, 8)
SectionBar.BackgroundTransparency = 1
local sectionBarLine = Instance.new("Frame", SectionBar)
sectionBarLine.Size = UDim2.new(1, 0, 0, 1)
sectionBarLine.Position = UDim2.new(0, 0, 1, 0)
sectionBarLine.BackgroundColor3 = C.BorderSub
sectionBarLine.BorderSizePixel = 0

local SectionButtons, SectionUnderlines = {}, {}
local CurrentSection = "Skins"
local SwitchSection
local function makeSection(id, label, x)
    local b = Instance.new("TextButton", SectionBar)
    b.Size = UDim2.new(0, 90, 1, 0)
    b.Position = UDim2.new(0, x, 0, 0)
    b.BackgroundTransparency = 1
    b.Text = label
    b.TextColor3 = C.TextDim
    b.Font = Enum.Font.GothamBold
    b.TextSize = 11
    b.AutoButtonColor = false
    local u = Instance.new("Frame", b)
    u.Size = UDim2.new(1, -16, 0, 2); u.Position = UDim2.new(0, 8, 1, -2)
    u.BackgroundColor3 = C.Accent; u.BorderSizePixel = 0
    u.Visible = false
    b.MouseButton1Click:Connect(function() SwitchSection(id) end)
    SectionButtons[id] = b; SectionUnderlines[id] = u
end
makeSection("Skins", "SKINS", 0)
makeSection("HitFX", "HITFX", 90)
makeSection("Skies", "SKIES", 180)

local TabBar = Instance.new("Frame", Right)
TabBar.Size = UDim2.new(1, -24, 0, 32)
TabBar.Position = UDim2.new(0, 12, 0, 44)
TabBar.BackgroundTransparency = 1
local tabBarLine = Instance.new("Frame", TabBar)
tabBarLine.Size = UDim2.new(1, 0, 0, 1)
tabBarLine.Position = UDim2.new(0, 0, 1, 0)
tabBarLine.BackgroundColor3 = C.BorderSub
tabBarLine.BorderSizePixel = 0

local TabButtons, TabUnderlines = {}, {}
local CurrentTab = "Skin"
local SwitchTab
local function makeTab(id, label, x)
    local b = Instance.new("TextButton", TabBar)
    b.Size = UDim2.new(0, 110, 1, 0)
    b.Position = UDim2.new(0, x, 0, 0)
    b.BackgroundTransparency = 1
    b.Text = label
    b.TextColor3 = C.TextDim
    b.Font = Enum.Font.GothamMedium
    b.TextSize = 12
    b.AutoButtonColor = false
    local u = Instance.new("Frame", b)
    u.Size = UDim2.new(1, -16, 0, 2); u.Position = UDim2.new(0, 8, 1, -2)
    u.BackgroundColor3 = C.Accent; u.BorderSizePixel = 0
    u.Visible = false
    b.MouseButton1Click:Connect(function() SwitchTab(id) end)
    TabButtons[id] = b; TabUnderlines[id] = u
end
makeTab("Skin", "SKINS", 0)
makeTab("Wrap", "WRAPS", 110)
makeTab("Bulk", "BULK CHANGE", 220)


local Head = Instance.new("Frame", Right)
Head.Size = UDim2.new(1, -24, 0, 32)
Head.Position = UDim2.new(0, 12, 0, 84)
Head.BackgroundTransparency = 1

local SelectedLabel = Instance.new("TextLabel", Head)
SelectedLabel.Size = UDim2.new(1, -240, 1, 0)
SelectedLabel.BackgroundTransparency = 1
SelectedLabel.Text = "Select a weapon"
SelectedLabel.TextColor3 = C.Text
SelectedLabel.Font = Enum.Font.GothamMedium
SelectedLabel.TextSize = 14
SelectedLabel.TextXAlignment = Enum.TextXAlignment.Left

local SelectedSub = Instance.new("TextLabel", Head)
SelectedSub.Size = UDim2.new(1, -240, 0, 14)
SelectedSub.Position = UDim2.new(0, 0, 1, -14)
SelectedSub.BackgroundTransparency = 1
SelectedSub.Text = ""
SelectedSub.TextColor3 = C.TextMute
SelectedSub.Font = Enum.Font.Code
SelectedSub.TextSize = 11
SelectedSub.TextXAlignment = Enum.TextXAlignment.Left

local SkinSearchWrap = Instance.new("Frame", Head)
SkinSearchWrap.Size = UDim2.new(0, 220, 0, 26)
SkinSearchWrap.Position = UDim2.new(1, -220, 0.5, -13)
SkinSearchWrap.BackgroundColor3 = C.Sub
SkinSearchWrap.BorderSizePixel = 0
corner(SkinSearchWrap, 6)
local skinSStroke = stroke(SkinSearchWrap, C.BorderSub)
local SkinSearch = Instance.new("TextBox", SkinSearchWrap)
SkinSearch.Size = UDim2.new(1, -16, 1, 0)
SkinSearch.Position = UDim2.new(0, 8, 0, 0)
SkinSearch.BackgroundTransparency = 1
SkinSearch.PlaceholderText = "Filter"
SkinSearch.PlaceholderColor3 = C.TextMute
SkinSearch.TextColor3 = C.Text
SkinSearch.Font = Enum.Font.Gotham
SkinSearch.TextSize = 11
SkinSearch.BorderSizePixel = 0
SkinSearch.ClearTextOnFocus = false
SkinSearch.Text = ""
SkinSearch.TextXAlignment = Enum.TextXAlignment.Left
SkinSearch.Focused:Connect(function() tw(skinSStroke, 0.1, {Color = C.Accent}) end)
SkinSearch.FocusLost:Connect(function() tw(skinSStroke, 0.1, {Color = C.BorderSub}) end)


local Content = Instance.new("Frame", Right)
Content.Size = UDim2.new(1, -24, 1, -130)
Content.Position = UDim2.new(0, 12, 0, 122)
Content.BackgroundTransparency = 1

local SectionPlaceholder = Instance.new("TextLabel", Right)
SectionPlaceholder.Size = UDim2.new(1, -24, 1, -50)
SectionPlaceholder.Position = UDim2.new(0, 12, 0, 44)
SectionPlaceholder.BackgroundTransparency = 1
SectionPlaceholder.Text = "Being worked on."
SectionPlaceholder.TextColor3 = C.TextMute
SectionPlaceholder.Font = Enum.Font.GothamMedium
SectionPlaceholder.TextSize = 14
SectionPlaceholder.Visible = false


local SkinScroll = Instance.new("ScrollingFrame", Content)
SkinScroll.Size = UDim2.new(1, 0, 1, 0)
SkinScroll.BackgroundTransparency = 1
SkinScroll.ScrollBarThickness = 3
SkinScroll.ScrollBarImageColor3 = C.Border
SkinScroll.BorderSizePixel = 0
SkinScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
SkinScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

local SkinGrid = Instance.new("UIGridLayout", SkinScroll)
SkinGrid.CellSize = UDim2.new(0, 150, 0, 180)
SkinGrid.CellPadding = UDim2.new(0, 10, 0, 10)
SkinGrid.SortOrder = Enum.SortOrder.LayoutOrder

local EmptyState = Instance.new("TextLabel", Content)
EmptyState.Size = UDim2.new(1, 0, 1, 0)
EmptyState.BackgroundTransparency = 1
EmptyState.Text = "Select a weapon"
EmptyState.TextColor3 = C.TextMute
EmptyState.Font = Enum.Font.Gotham
EmptyState.TextSize = 12


local BulkView = Instance.new("Frame", Content)
BulkView.Size = UDim2.new(1, 0, 1, 0)
BulkView.BackgroundTransparency = 1
BulkView.Visible = false

local BulkSelected = nil

local BulkSection = Instance.new("Frame", BulkView)
BulkSection.Size = UDim2.new(1, 0, 0, 88)
BulkSection.BackgroundColor3 = C.Sub
BulkSection.BorderSizePixel = 0
corner(BulkSection, 8); stroke(BulkSection, C.BorderSub)

local BulkTitle = Instance.new("TextLabel", BulkSection)
BulkTitle.Size = UDim2.new(0, 400, 0, 18)
BulkTitle.Position = UDim2.new(0, 12, 0, 8)
BulkTitle.BackgroundTransparency = 1
BulkTitle.Text = "Bulk wrap"
BulkTitle.TextColor3 = C.Text
BulkTitle.Font = Enum.Font.GothamMedium
BulkTitle.TextSize = 12
BulkTitle.TextXAlignment = Enum.TextXAlignment.Left

local BulkSubtitle = Instance.new("TextLabel", BulkSection)
BulkSubtitle.Size = UDim2.new(0, 500, 0, 16)
BulkSubtitle.Position = UDim2.new(0, 12, 0, 28)
BulkSubtitle.BackgroundTransparency = 1
BulkSubtitle.Text = "Pick one, hit Apply"
BulkSubtitle.TextColor3 = C.TextMute
BulkSubtitle.Font = Enum.Font.Gotham
BulkSubtitle.TextSize = 11
BulkSubtitle.TextXAlignment = Enum.TextXAlignment.Left

local BulkApplyBtn = Instance.new("TextButton", BulkSection)
BulkApplyBtn.Size = UDim2.new(0, 110, 0, 28)
BulkApplyBtn.Position = UDim2.new(1, -120, 0, 8)
BulkApplyBtn.BackgroundColor3 = C.AccentDim
BulkApplyBtn.AutoButtonColor = false
BulkApplyBtn.BorderSizePixel = 0
BulkApplyBtn.Text = "Apply"
BulkApplyBtn.TextColor3 = C.Text
BulkApplyBtn.Font = Enum.Font.GothamMedium
BulkApplyBtn.TextSize = 12
corner(BulkApplyBtn, 6)

local BulkResetBtn = Instance.new("TextButton", BulkSection)
BulkResetBtn.Size = UDim2.new(0, 110, 0, 28)
BulkResetBtn.Position = UDim2.new(1, -240, 0, 8)
BulkResetBtn.BackgroundColor3 = C.Sub
BulkResetBtn.AutoButtonColor = false
BulkResetBtn.BorderSizePixel = 0
BulkResetBtn.Text = "Clear All Wraps"
BulkResetBtn.TextColor3 = C.TextDim
BulkResetBtn.Font = Enum.Font.Gotham
BulkResetBtn.TextSize = 11
corner(BulkResetBtn, 6); stroke(BulkResetBtn, C.Border)


local BulkSearchWrap = Instance.new("Frame", BulkSection)
BulkSearchWrap.Size = UDim2.new(1, -24, 0, 28)
BulkSearchWrap.Position = UDim2.new(0, 12, 0, 50)
BulkSearchWrap.BackgroundColor3 = C.Bg
BulkSearchWrap.BorderSizePixel = 0
corner(BulkSearchWrap, 6)
local bulkSStroke = stroke(BulkSearchWrap, C.BorderSub)
local BulkSearch = Instance.new("TextBox", BulkSearchWrap)
BulkSearch.Size = UDim2.new(1, -16, 1, 0)
BulkSearch.Position = UDim2.new(0, 8, 0, 0)
BulkSearch.BackgroundTransparency = 1
BulkSearch.PlaceholderText = "Search wraps"
BulkSearch.PlaceholderColor3 = C.TextMute
BulkSearch.TextColor3 = C.Text
BulkSearch.Font = Enum.Font.Gotham
BulkSearch.TextSize = 12
BulkSearch.BorderSizePixel = 0
BulkSearch.ClearTextOnFocus = false
BulkSearch.Text = ""
BulkSearch.TextXAlignment = Enum.TextXAlignment.Left
BulkSearch.Focused:Connect(function() tw(bulkSStroke, 0.1, {Color = C.Accent}) end)
BulkSearch.FocusLost:Connect(function() tw(bulkSStroke, 0.1, {Color = C.BorderSub}) end)

local BulkScroll = Instance.new("ScrollingFrame", BulkView)
BulkScroll.Size = UDim2.new(1, 0, 1, -100)
BulkScroll.Position = UDim2.new(0, 0, 0, 100)
BulkScroll.BackgroundTransparency = 1
BulkScroll.ScrollBarThickness = 3
BulkScroll.ScrollBarImageColor3 = C.Border
BulkScroll.BorderSizePixel = 0
BulkScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
BulkScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

local BulkGrid = Instance.new("UIGridLayout", BulkScroll)
BulkGrid.CellSize = UDim2.new(0, 150, 0, 180)
BulkGrid.CellPadding = UDim2.new(0, 10, 0, 10)
BulkGrid.SortOrder = Enum.SortOrder.LayoutOrder


local Footer = Instance.new("Frame", Main)
Footer.Size = UDim2.new(1, -20, 0, 32)
Footer.Position = UDim2.new(0, 10, 1, -42)
Footer.BackgroundColor3 = C.Panel
Footer.BorderSizePixel = 0
corner(Footer, 8); stroke(Footer, C.BorderSub)

local StatusLabel = Instance.new("TextLabel", Footer)
StatusLabel.Size = UDim2.new(1, -300, 1, 0)
StatusLabel.Position = UDim2.new(0, 12, 0, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "ready"
StatusLabel.TextColor3 = C.TextDim
StatusLabel.Font = Enum.Font.Code
StatusLabel.TextSize = 11
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left

local function MakeFooterBtn(text, xOff, primary)
    local b = Instance.new("TextButton", Footer)
    b.Size = UDim2.new(0, 90, 0, 22)
    b.Position = UDim2.new(1, xOff, 0.5, -11)
    b.BackgroundColor3 = primary and C.AccentDim or C.Sub
    b.AutoButtonColor = false
    b.BorderSizePixel = 0
    b.Text = text
    b.TextColor3 = C.Text
    b.Font = Enum.Font.GothamMedium
    b.TextSize = 11
    corner(b, 6)
    if not primary then stroke(b, C.Border) end
    local base = b.BackgroundColor3
    b.MouseEnter:Connect(function() tw(b, 0.1, {BackgroundColor3 = primary and C.Accent or C.CardHov}) end)
    b.MouseLeave:Connect(function() tw(b, 0.1, {BackgroundColor3 = base}) end)
    return b
end

local SaveBtn = MakeFooterBtn("Save", -98, true)
local LoadBtn = MakeFooterBtn("Load", -194, false)
local ApplyBtn = MakeFooterBtn("Re-apply", -290, false)
ApplyBtn.Size = UDim2.new(0, 90, 0, 22)


local CurrentToast
local function Toast(msg, kind)
    if CurrentToast then CurrentToast:Destroy() end
    local f = Instance.new("Frame", ScreenGui)
    f.AnchorPoint = Vector2.new(1, 1)
    f.Position = UDim2.new(1, -16, 1, -16)
    f.Size = UDim2.new(0, 280, 0, 38)
    f.BackgroundColor3 = C.Panel
    f.BorderSizePixel = 0
    corner(f, 8)
    local s = stroke(f, kind == "err" and C.Err or kind == "warn" and C.Warn or C.Accent)
    local bar = Instance.new("Frame", f)
    bar.Size = UDim2.new(0, 3, 1, 0); bar.BackgroundColor3 = s.Color; bar.BorderSizePixel = 0
    local lbl = Instance.new("TextLabel", f)
    lbl.Size = UDim2.new(1, -20, 1, 0)
    lbl.Position = UDim2.new(0, 14, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = msg
    lbl.TextColor3 = C.Text
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 11
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextWrapped = true
    CurrentToast = f
    task.delay(2.5, function()
        if f and f.Parent then
            tw(f, 0.2, {BackgroundTransparency = 1})
            tw(s, 0.2, {Transparency = 1})
            tw(lbl, 0.2, {TextTransparency = 1})
            task.delay(0.25, function() pcall(function() f:Destroy() end) end)
        end
    end)
end

local function setStatus(msg, kind)
    StatusLabel.Text = msg
    StatusLabel.TextColor3 = kind == "err" and C.Err or kind == "warn" and C.Warn or kind == "ok" and C.Ok or C.TextDim
    task.delay(3, function()
        if StatusLabel.Text == msg then
            StatusLabel.Text = "ready"
            StatusLabel.TextColor3 = C.TextDim
        end
    end)
end

-- THUMBNAILS
local thumbCache = {}
local function GetThumb(name)
    if thumbCache[name] ~= nil then return thumbCache[name] end
    local result = ""
    pcall(function()
        local function pickFrom(d)
            if type(d) ~= "table" then return nil end
            return d.ImageHighResolution or d.Image or d.Thumbnail or d.Icon or d.IconImage or d.Preview
        end
        if ItemLibrary and ItemLibrary.ViewModels and ItemLibrary.ViewModels[name] then
            result = pickFrom(ItemLibrary.ViewModels[name]) or result
            if result ~= "" then return end
        end
        if CosmeticLibrary then
            if CosmeticLibrary.Cosmetics and CosmeticLibrary.Cosmetics[name] then
                result = pickFrom(CosmeticLibrary.Cosmetics[name]) or result
                if result ~= "" then return end
            end
            if CosmeticLibrary.Skins then
                for _, tbl in pairs(CosmeticLibrary.Skins) do
                    if tbl[name] then
                        result = pickFrom(tbl[name]) or result
                        if result ~= "" then return end
                    end
                end
            end
            if CosmeticLibrary.Wraps and CosmeticLibrary.Wraps[name] then
                result = pickFrom(CosmeticLibrary.Wraps[name]) or result
                if result ~= "" then return end
            end
        end
    end)
    thumbCache[name] = result or ""
    return thumbCache[name]
end

local PALETTE_SEED = {
    Color3.fromRGB(70, 90, 120), Color3.fromRGB(95, 75, 110), Color3.fromRGB(70, 105, 95),
    Color3.fromRGB(120, 90, 75), Color3.fromRGB(90, 95, 120), Color3.fromRGB(110, 100, 80),
}
local function colorFor(name)
    local n = 0
    for i = 1, #name do n = (n + string.byte(name, i)) % 997 end
    return PALETTE_SEED[(n % #PALETTE_SEED) + 1]
end


local function buildPreview(parent, name, square)
    local wrap = Instance.new("Frame", parent)
    wrap.BackgroundColor3 = C.Bg
    wrap.BorderSizePixel = 0
    if square then
        wrap.Size = UDim2.new(1, -16, 0, 110)
        wrap.Position = UDim2.new(0, 8, 0, 8)
    else
        wrap.Size = UDim2.new(0, 36, 0, 36)
        wrap.Position = UDim2.new(0, 6, 0.5, -18)
    end
    corner(wrap, 6)

    local thumb = Instance.new("ImageLabel", wrap)
    thumb.Size = UDim2.new(1, -6, 1, -6)
    thumb.Position = UDim2.new(0, 3, 0, 3)
    thumb.BackgroundTransparency = 1
    thumb.ScaleType = Enum.ScaleType.Fit
    thumb.Image = GetThumb(name)

    if thumb.Image == "" then

        local fb = Instance.new("Frame", wrap)
        fb.Size = UDim2.new(1, -6, 1, -6)
        fb.Position = UDim2.new(0, 3, 0, 3)
        fb.BackgroundColor3 = colorFor(name)
        fb.BorderSizePixel = 0
        corner(fb, 4)
        local tl = Instance.new("TextLabel", fb)
        tl.Size = UDim2.new(1, 0, 1, 0)
        tl.BackgroundTransparency = 1
        tl.Text = name:sub(1, 1):upper()
        tl.TextColor3 = C.Text
        tl.Font = Enum.Font.GothamBold
        tl.TextSize = square and 36 or 14
    end
    return wrap, thumb
end

-- WEAPON LIST
local CurrentWeapon = nil
local WeaponBtnRefreshers = {}
local RefreshSkinGrid
local RefreshAllWeaponBtns

local function CountModified()
    local n, total = 0, 0
    for _, info in pairs(_G.EquippedData) do
        total += 1
        if (info.Skin and info.Skin ~= "Default") or (info.Wrap and info.Wrap ~= "None") then
            n += 1
        end
    end
    return n, total
end

local function UpdateLeftCount()
    local mod, total = CountModified()
    LeftCount.Text = mod .. " mod / " .. total
end

local function MakeWeaponBtn(weapon)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 44)
    btn.BackgroundColor3 = C.Card
    btn.AutoButtonColor = false
    btn.BorderSizePixel = 0
    btn.Text = ""
    btn.Parent = WeaponScroll
    corner(btn, 6)
    local bs = stroke(btn, C.BorderSub)
    btn:SetAttribute("WeaponName", weapon)


    local strip = Instance.new("Frame", btn)
    strip.Size = UDim2.new(0, 2, 1, -8)
    strip.Position = UDim2.new(0, 0, 0, 4)
    strip.BackgroundColor3 = C.Accent
    strip.BorderSizePixel = 0
    strip.Visible = false

    buildPreview(btn, weapon, false)

    local nameLbl = Instance.new("TextLabel", btn)
    nameLbl.Size = UDim2.new(1, -56, 0, 16)
    nameLbl.Position = UDim2.new(0, 50, 0, 6)
    nameLbl.BackgroundTransparency = 1
    nameLbl.Text = weapon
    nameLbl.TextColor3 = C.Text
    nameLbl.Font = Enum.Font.GothamMedium
    nameLbl.TextSize = 12
    nameLbl.TextXAlignment = Enum.TextXAlignment.Left
    nameLbl.TextTruncate = Enum.TextTruncate.AtEnd

    local subLbl = Instance.new("TextLabel", btn)
    subLbl.Size = UDim2.new(1, -56, 0, 14)
    subLbl.Position = UDim2.new(0, 50, 0, 22)
    subLbl.BackgroundTransparency = 1
    subLbl.Text = "default"
    subLbl.TextColor3 = C.TextMute
    subLbl.Font = Enum.Font.Code
    subLbl.TextSize = 10
    subLbl.TextXAlignment = Enum.TextXAlignment.Left
    subLbl.TextTruncate = Enum.TextTruncate.AtEnd

    local function fmtVal(v, def)
        if v == RANDOM_SKIN or v == RANDOM_WRAP then return "random" end
        return v or def
    end

    local function Refresh()
        local d = _G.EquippedData[weapon]
        local s = d and d.Skin or "Default"
        local w = d and d.Wrap or "None"
        local parts = {}
        if s ~= "Default" then table.insert(parts, fmtVal(s, "default")) end
        if w ~= "None" then table.insert(parts, "wrap:" .. fmtVal(w, "none")) end
        if #parts > 0 then
            subLbl.Text = table.concat(parts, " · ")
            subLbl.TextColor3 = C.Accent
            strip.Visible = true
        else
            subLbl.Text = "default"
            subLbl.TextColor3 = C.TextMute
            strip.Visible = false
        end
        UpdateLeftCount()
    end
    Refresh()
    WeaponBtnRefreshers[weapon] = Refresh

    btn.MouseEnter:Connect(function()
        if CurrentWeapon ~= weapon then
            tw(btn, 0.1, {BackgroundColor3 = C.CardHov})
            tw(bs, 0.1, {Color = C.Border})
        end
    end)
    btn.MouseLeave:Connect(function()
        if CurrentWeapon ~= weapon then
            tw(btn, 0.1, {BackgroundColor3 = C.Card})
            tw(bs, 0.1, {Color = C.BorderSub})
        end
    end)

    btn.MouseButton1Click:Connect(function()
        local prev = CurrentWeapon
        CurrentWeapon = weapon
        logEvent("DBG", "selected " .. weapon)
        for _, b in pairs(WeaponScroll:GetChildren()) do
            if b:IsA("TextButton") then
                tw(b, 0.1, {BackgroundColor3 = C.Card})
                local s2 = b:FindFirstChildOfClass("UIStroke")
                if s2 then tw(s2, 0.1, {Color = C.BorderSub}) end
            end
        end
        tw(btn, 0.1, {BackgroundColor3 = C.AccentDim})
        tw(bs, 0.1, {Color = C.Accent})
        SelectedLabel.Text = weapon
        EmptyState.Visible = false
        if CurrentTab == "Skin" or CurrentTab == "Wrap" then
            RefreshSkinGrid()
        end
        if _G.TakurinRivalsSettings.Mode == "Mobile" then
            Left.Visible = false
        end
    end)
end

RefreshAllWeaponBtns = function()
    for _, fn in pairs(WeaponBtnRefreshers) do pcall(fn) end
end

-- SKIN/WRAP CARD
local function makeCard(parent, weapon, item, isEquipped, kind, isRandomCard)
    local card = Instance.new("TextButton", parent)
    card.BackgroundColor3 = isEquipped and C.AccentDim or C.Card
    card.AutoButtonColor = false
    card.BorderSizePixel = 0
    card.Text = ""
    corner(card, 8)
    local cs = stroke(card, isEquipped and C.Accent or C.BorderSub)

    local prevWrap = buildPreview(card, isRandomCard and "?" or item, true)

    if isRandomCard then
        for _, ch in pairs(prevWrap:GetChildren()) do
            if ch:IsA("ImageLabel") then ch:Destroy() end
            if ch:IsA("Frame") and ch ~= prevWrap then ch:Destroy() end
        end
        local rb = Instance.new("Frame", prevWrap)
        rb.Size = UDim2.new(1, -6, 1, -6)
        rb.Position = UDim2.new(0, 3, 0, 3)
        rb.BackgroundColor3 = C.Sub
        rb.BorderSizePixel = 0
        corner(rb, 4)
        local rs = stroke(rb, C.Accent, 0.4)
        local q = Instance.new("TextLabel", rb)
        q.Size = UDim2.new(1, 0, 1, 0)
        q.BackgroundTransparency = 1
        q.Text = "?"
        q.TextColor3 = C.Accent
        q.Font = Enum.Font.GothamBold
        q.TextSize = 56
    end


    if isEquipped then
        local tick = Instance.new("Frame", card)
        tick.Size = UDim2.new(0, 6, 0, 6)
        tick.Position = UDim2.new(1, -12, 0, 6)
        tick.BackgroundColor3 = C.Accent
        tick.BorderSizePixel = 0
        corner(tick, 6)
    end


    if not isRandomCard and kind == "Skin" and isBroken(weapon, item) then
        local tag = Instance.new("TextLabel", card)
        tag.Size = UDim2.new(0, 52, 0, 14)
        tag.Position = UDim2.new(0, 6, 0, 6)
        tag.BackgroundColor3 = C.Err
        tag.BorderSizePixel = 0
        tag.Text = "BROKEN"
        tag.TextColor3 = C.Text
        tag.Font = Enum.Font.GothamBold
        tag.TextSize = 9
        corner(tag, 4)
    end

    local nameLbl = Instance.new("TextLabel", card)
    nameLbl.Size = UDim2.new(1, -12, 0, 18)
    nameLbl.Position = UDim2.new(0, 6, 0, 124)
    nameLbl.BackgroundTransparency = 1
    nameLbl.Text = isRandomCard and ("Random " .. kind) or item
    nameLbl.TextColor3 = C.Text
    nameLbl.Font = Enum.Font.GothamMedium
    nameLbl.TextSize = 12
    nameLbl.TextWrapped = false
    nameLbl.TextTruncate = Enum.TextTruncate.AtEnd

    if isRandomCard then
        local subLbl = Instance.new("TextLabel", card)
        subLbl.Size = UDim2.new(1, -12, 0, 14)
        subLbl.Position = UDim2.new(0, 6, 0, 142)
        subLbl.BackgroundTransparency = 1
        subLbl.TextColor3 = C.TextMute
        subLbl.Font = Enum.Font.Code
        subLbl.TextSize = 10
        subLbl.Text = "rerolls on equip"
    end

    card.MouseEnter:Connect(function()
        if not isEquipped then
            tw(card, 0.1, {BackgroundColor3 = C.CardHov})
            tw(cs, 0.1, {Color = C.Border})
        end
    end)
    card.MouseLeave:Connect(function()
        if not isEquipped then
            tw(card, 0.1, {BackgroundColor3 = C.Card})
            tw(cs, 0.1, {Color = C.BorderSub})
        end
    end)

    card.MouseButton1Click:Connect(function()
        if kind == "Skin" then
            local val = isRandomCard and RANDOM_SKIN or item
            _G.EquippedData[weapon].Skin = val
            local liveSkin = isRandomCard and (rollRandomSkin(weapon) or item) or item
            if isBroken(weapon, liveSkin) then
                logEvent("WARN", liveSkin .. " on " .. weapon .. " is broken")
                Toast(liveSkin .. " is broken, skipping", "warn")
            else
                pcall(function() CosmeticLibrary.Equip(weapon, "Skin", liveSkin) end)
                Toast(weapon .. " · " .. (isRandomCard and "Random Skin" or item))
            end
            logEvent("DBG", weapon .. " skin -> " .. tostring(val))
        elseif kind == "Wrap" then
            local val = isRandomCard and RANDOM_WRAP or item
            _G.EquippedData[weapon].Wrap = val
            Toast(weapon .. " · " .. (isRandomCard and "Random Wrap" or item))
            logEvent("DBG", weapon .. " wrap -> " .. tostring(val))
        end

        if WeaponBtnRefreshers[weapon] then WeaponBtnRefreshers[weapon]() end
        RefreshSkinGrid()
    end)

    return card
end

RefreshSkinGrid = function()
    if CurrentTab == "Bulk" then return end
    for _, c in pairs(SkinScroll:GetChildren()) do
        if c:IsA("TextButton") then c:Destroy() end
    end
    if not CurrentWeapon then
        EmptyState.Visible = true; SelectedSub.Text = ""
        return
    end
    EmptyState.Visible = false
    local d = _G.EquippedData[CurrentWeapon]
    local list, equipped, kind, randomSentinel
    if CurrentTab == "Skin" then
        list = SkinLists[CurrentWeapon] or {}
        equipped = d and d.Skin or "Default"
        kind = "Skin"; randomSentinel = RANDOM_SKIN
    else
        list = WrapList
        equipped = d and d.Wrap or "None"
        kind = "Wrap"; randomSentinel = RANDOM_WRAP
    end

    local randCard = makeCard(SkinScroll, CurrentWeapon, "Random", equipped == randomSentinel, kind, true)
    randCard.LayoutOrder = -1

    local filter = SkinSearch.Text:lower()
    for i, item in ipairs(list) do
        if filter == "" or item:lower():find(filter, 1, true) then
            local card = makeCard(SkinScroll, CurrentWeapon, item, item == equipped, kind, false)
            card.LayoutOrder = i
        end
    end
    SelectedSub.Text = ("skin: %s   ·   wrap: %s"):format(
        d and (d.Skin == RANDOM_SKIN and "random" or d.Skin) or "Default",
        d and (d.Wrap == RANDOM_WRAP and "random" or d.Wrap) or "None"
    )
end

-- BULK VIEW
local function makeBulkCard(item)
    local card = Instance.new("TextButton", BulkScroll)
    local isSel = (BulkSelected == item)
    card.BackgroundColor3 = isSel and C.AccentDim or C.Card
    card.AutoButtonColor = false
    card.BorderSizePixel = 0
    card.Text = ""
    corner(card, 8)
    local cs = stroke(card, isSel and C.Accent or C.BorderSub)
    buildPreview(card, item, true)
    local nm = Instance.new("TextLabel", card)
    nm.Size = UDim2.new(1, -12, 0, 18)
    nm.Position = UDim2.new(0, 6, 0, 124)
    nm.BackgroundTransparency = 1
    nm.Text = item
    nm.TextColor3 = C.Text
    nm.Font = Enum.Font.GothamMedium
    nm.TextSize = 12
    nm.TextTruncate = Enum.TextTruncate.AtEnd
    local sub = Instance.new("TextLabel", card)
    sub.Size = UDim2.new(1, -12, 0, 14)
    sub.Position = UDim2.new(0, 6, 0, 142)
    sub.BackgroundTransparency = 1
    sub.Text = "wrap"
    sub.TextColor3 = C.TextMute
    sub.Font = Enum.Font.Code
    sub.TextSize = 10
    card.MouseEnter:Connect(function()
        if BulkSelected ~= item then tw(card, 0.1, {BackgroundColor3 = C.CardHov}); tw(cs, 0.1, {Color = C.Border}) end
    end)
    card.MouseLeave:Connect(function()
        if BulkSelected ~= item then tw(card, 0.1, {BackgroundColor3 = C.Card}); tw(cs, 0.1, {Color = C.BorderSub}) end
    end)
    card.MouseButton1Click:Connect(function()
        BulkSelected = item
        BulkSubtitle.Text = item
        for _, c in pairs(BulkScroll:GetChildren()) do
            if c:IsA("TextButton") then
                local sel = (c.Name == BulkSelected)
                tw(c, 0.1, {BackgroundColor3 = sel and C.AccentDim or C.Card})
                local s2 = c:FindFirstChildOfClass("UIStroke")
                if s2 then tw(s2, 0.1, {Color = sel and C.Accent or C.BorderSub}) end
            end
        end
    end)
    card.Name = item
    return card
end

local function RefreshBulkGrid()
    for _, c in pairs(BulkScroll:GetChildren()) do
        if c:IsA("TextButton") then c:Destroy() end
    end
    local filter = BulkSearch.Text:lower()
    if filter == "" or ("random wrap"):find(filter, 1, true) or filter == "random" then
        local rnd = makeBulkCard(RANDOM_WRAP)
        rnd.Name = RANDOM_WRAP
        rnd.LayoutOrder = -1
        for _, ch in pairs(rnd:GetChildren()) do
            if ch:IsA("TextLabel") and ch.Text == RANDOM_WRAP then ch.Text = "Random Wrap" end
        end
    end
    local shown = 0
    for i, w in ipairs(WrapList) do
        if filter == "" or w:lower():find(filter, 1, true) then
            local c = makeBulkCard(w)
            c.LayoutOrder = i
            shown += 1
        end
    end
    logEvent("DBG", "bulk grid: " .. shown .. " shown")
end

BulkSearch:GetPropertyChangedSignal("Text"):Connect(function()
    if CurrentTab == "Bulk" then RefreshBulkGrid() end
end)

BulkApplyBtn.MouseButton1Click:Connect(function()
    logEvent("DBG", "bulk apply: " .. tostring(BulkSelected))
    if not BulkSelected then
        Toast("Pick a wrap first", "warn")
        logEvent("WARN", "nothing selected")
        return
    end
    local n = BulkApplyWrap(BulkSelected)
    Toast(("Applied wrap to %d weapons"):format(n))
    setStatus(("bulk wrap → %d weapons"):format(n), "ok")
    RefreshAllWeaponBtns()
end)

BulkResetBtn.MouseButton1Click:Connect(function()
    logEvent("DBG", "bulk clear")
    local n = BulkApplyWrap("None")
    Toast(("Cleared wraps on %d weapons"):format(n))
    setStatus("wraps cleared", "ok")
    RefreshAllWeaponBtns()
end)

-- TAB SWITCHING
SwitchTab = function(id)
    local prev = CurrentTab
    CurrentTab = id
    logEvent("DBG", "tab: " .. id)
    for k, b in pairs(TabButtons) do
        local active = (k == id)
        TabUnderlines[k].Visible = active
        tw(b, 0.1, {TextColor3 = active and C.Text or C.TextDim})
    end
    if id == "Bulk" then
        BulkView.Visible = true
        SkinScroll.Visible = false
        EmptyState.Visible = false
        SelectedLabel.Text = "Bulk"
        SelectedSub.Text = ""
        SkinSearchWrap.Visible = false
        RefreshBulkGrid()
    else
        BulkView.Visible = false
        SkinScroll.Visible = true
        SkinSearchWrap.Visible = true
        if CurrentWeapon then
            SelectedLabel.Text = CurrentWeapon
            RefreshSkinGrid()
        else
            SelectedLabel.Text = "Select a weapon"
            SelectedSub.Text = ""
            EmptyState.Visible = true
        end
    end
end
SwitchTab("Skin")

-- HitFX panel
local HitFXPanel = Instance.new("Frame", Right)
HitFXPanel.Size = UDim2.new(1, -24, 1, -50)
HitFXPanel.Position = UDim2.new(0, 12, 0, 44)
HitFXPanel.BackgroundTransparency = 1
HitFXPanel.Visible = false

local function hfxRow(y, h, label)
    local row = Instance.new("Frame", HitFXPanel)
    row.Size = UDim2.new(1, 0, 0, h)
    row.Position = UDim2.new(0, 0, 0, y)
    row.BackgroundColor3 = C.Sub
    row.BorderSizePixel = 0
    corner(row, 6); stroke(row, C.BorderSub)
    if label then
        local lbl = Instance.new("TextLabel", row)
        lbl.Size = UDim2.new(1, -16, 0, 16); lbl.Position = UDim2.new(0, 12, 0, 8)
        lbl.BackgroundTransparency = 1; lbl.Text = label
        lbl.TextColor3 = C.TextDim; lbl.Font = Enum.Font.GothamBold
        lbl.TextSize = 10; lbl.TextXAlignment = Enum.TextXAlignment.Left
    end
    return row
end

local function hfxInput(parent, x, y, w, h, placeholder, value, onChange)
    local box = Instance.new("Frame", parent)
    box.Size = UDim2.new(0, w, 0, h)
    box.Position = UDim2.new(0, x, 0, y)
    box.BackgroundColor3 = C.Card
    box.BorderSizePixel = 0
    corner(box, 6); local s = stroke(box, C.BorderSub)
    local tb = Instance.new("TextBox", box)
    tb.Size = UDim2.new(1, -16, 1, 0); tb.Position = UDim2.new(0, 8, 0, 0)
    tb.BackgroundTransparency = 1; tb.PlaceholderText = placeholder or ""
    tb.PlaceholderColor3 = C.TextMute; tb.TextColor3 = C.Text
    tb.Font = Enum.Font.Code; tb.TextSize = 11
    tb.ClearTextOnFocus = false; tb.Text = value or ""
    tb.TextXAlignment = Enum.TextXAlignment.Left
    tb.Focused:Connect(function() tw(s, 0.1, {Color = C.Accent}) end)
    tb.FocusLost:Connect(function() tw(s, 0.1, {Color = C.BorderSub}) onChange(tb.Text) end)
    return tb
end

local hfxToggle = hfxRow(0, 60, "ENABLE HITFX")
local hfxSeg = Instance.new("Frame", hfxToggle)
hfxSeg.Size = UDim2.new(0, 160, 0, 26)
hfxSeg.Position = UDim2.new(1, -172, 0, 24)
hfxSeg.BackgroundTransparency = 1
local function hfxSegBtn(text, x, isOn)
    local b = Instance.new("TextButton", hfxSeg)
    b.Size = UDim2.new(0, 76, 1, 0); b.Position = UDim2.new(0, x, 0, 0)
    b.BackgroundColor3 = isOn and C.AccentDim or C.Card
    b.AutoButtonColor = false; b.BorderSizePixel = 0
    b.Text = text; b.TextColor3 = isOn and C.Text or C.TextDim
    b.Font = Enum.Font.GothamMedium; b.TextSize = 11
    corner(b, 6); stroke(b, isOn and C.Accent or C.BorderSub)
    return b
end
local onBtn = hfxSegBtn("On", 0, _G.TakurinRivalsSettings.HitFXEnabled)
local offBtn = hfxSegBtn("Off", 84, not _G.TakurinRivalsSettings.HitFXEnabled)
local function refreshOnOff()
    local on = _G.TakurinRivalsSettings.HitFXEnabled
    tw(onBtn, 0.1, {BackgroundColor3 = on and C.AccentDim or C.Card, TextColor3 = on and C.Text or C.TextDim})
    tw(offBtn, 0.1, {BackgroundColor3 = (not on) and C.AccentDim or C.Card, TextColor3 = (not on) and C.Text or C.TextDim})
    local sOn = onBtn:FindFirstChildOfClass("UIStroke")
    local sOff = offBtn:FindFirstChildOfClass("UIStroke")
    if sOn then tw(sOn, 0.1, {Color = on and C.Accent or C.BorderSub}) end
    if sOff then tw(sOff, 0.1, {Color = (not on) and C.Accent or C.BorderSub}) end
end
onBtn.MouseButton1Click:Connect(function() _G.TakurinRivalsSettings.HitFXEnabled = true; saveSettings(); refreshOnOff() end)
offBtn.MouseButton1Click:Connect(function() _G.TakurinRivalsSettings.HitFXEnabled = false; saveSettings(); refreshOnOff() end)

local hitRow = hfxRow(70, 60, "HIT SOUND ID")
hfxInput(hitRow, 12, 26, 360, 26, "Asset ID or file path (.mp3/.wav)", _G.TakurinRivalsSettings.HitSoundId, function(v)
    _G.TakurinRivalsSettings.HitSoundId = v; saveSettings()
end)

local volRow = hfxRow(140, 60, "VOLUME ×")
hfxInput(volRow, 12, 26, 100, 26, "1.0", tostring(_G.TakurinRivalsSettings.HitVolumeMult), function(v)
    local n = tonumber(v); if n and n >= 0 and n <= 10 then _G.TakurinRivalsSettings.HitVolumeMult = n; saveSettings() end
end)

local presetRow = hfxRow(210, 100, "PRESETS")

local LB_DIR = "TakurinFX"
local LB_URL = "https://raw.githubusercontent.com/lowkeymyself/Takujin/main/fx/"
local LB_ITEMS = {
    {name="Bonk",    file="bonk.ogg"},
    {name="Bring",   file="bring.ogg"},
    {name="Magic Squash", file="magic_squash.ogg"},
    {name="Meow",    file="meow.ogg"},
    {name="Nya",     file="nya.ogg"},
    {name="Pop",     file="pop.ogg"},
    {name="Soft",    file="soft.ogg"},
    {name="Squash",  file="squash.ogg"},
    {name="Tung",    file="tung.ogg"},
    {name="Uwu",     file="uwu.ogg"},
    {name="Boykisser", folder="boykisser", files={"boykisser-1.ogg","boykisser-2.ogg","boykisser-3.ogg","boykisser-4.ogg","boykisser-5.ogg","boykisser-6.ogg"}},
    {name="Click",   folder="click", files={"click-1.ogg","click-2.ogg","click-3.ogg"}},
    {name="Glass",   folder="glass", files={"glass-1.ogg","glass-2.ogg","glass-3.ogg"}},
    {name="Moan",    folder="moan",  files={"moan-1.ogg","moan-2.ogg","moan-3.ogg","moan-4.ogg"}},
}

_G.TakurinLBFolderMap = _G.TakurinLBFolderMap or {}
for _, item in ipairs(LB_ITEMS) do
    if item.folder then
        local key = LB_DIR .. "/" .. item.folder .. "/"
        local paths = {}
        for _, f in ipairs(item.files) do table.insert(paths, LB_DIR .. "/" .. item.folder .. "/" .. f) end
        _G.TakurinLBFolderMap[key] = paths
    end
end

local function isLBDownloaded()
    local ok, r = pcall(function() return isfile(LB_DIR .. "/bonk.ogg") end)
    return ok and r
end

local presetNormal = Instance.new("Frame", presetRow)
presetNormal.Size = UDim2.new(1, 0, 0, 56); presetNormal.Position = UDim2.new(0, 0, 0, 32)
presetNormal.BackgroundTransparency = 1
local presetLBView = Instance.new("Frame", presetRow)
presetLBView.Size = UDim2.new(1, 0, 0, 56); presetLBView.Position = UDim2.new(0, 0, 0, 32)
presetLBView.BackgroundTransparency = 1; presetLBView.Visible = false

local presets = {
    {name="Default",       id=""},
    {name="Ding",          id="137874566525685"},
    {name="Minecraft XP",  id="134763632925481"},
    {name="Isle Hitsound", id="130040373561249"},
}
local pScroll = Instance.new("ScrollingFrame", presetNormal)
pScroll.Size = UDim2.new(1, -8, 1, 0); pScroll.Position = UDim2.new(0, 8, 0, 0)
pScroll.BackgroundTransparency = 1; pScroll.BorderSizePixel = 0
pScroll.ScrollBarThickness = 2; pScroll.ScrollBarImageColor3 = C.Border
pScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
pScroll.AutomaticCanvasSize = Enum.AutomaticSize.X
pScroll.ScrollingDirection = Enum.ScrollingDirection.X
local pLayout = Instance.new("UIListLayout", pScroll)
pLayout.FillDirection = Enum.FillDirection.Horizontal
pLayout.Padding = UDim.new(0, 6); pLayout.SortOrder = Enum.SortOrder.LayoutOrder
for i, p in ipairs(presets) do
    local b = Instance.new("TextButton", pScroll)
    b.Size = UDim2.new(0, 110, 0, 50); b.LayoutOrder = i
    b.BackgroundColor3 = C.Card; b.AutoButtonColor = false; b.BorderSizePixel = 0
    b.Text = p.name; b.TextColor3 = C.Text
    b.Font = Enum.Font.GothamMedium; b.TextSize = 11
    corner(b, 6); stroke(b, C.BorderSub)
    b.MouseButton1Click:Connect(function()
        _G.TakurinRivalsSettings.HitSoundId = p.id
        saveSettings()
        Toast("Preset: " .. p.name)
        SwitchSection("HitFX")
    end)
end

local lbBtn = Instance.new("TextButton", pScroll)
lbBtn.Size = UDim2.new(0, 140, 0, 50); lbBtn.LayoutOrder = 99
lbBtn.AutoButtonColor = false; lbBtn.BorderSizePixel = 0
lbBtn.Text = ""; corner(lbBtn, 6)
local lbGrad = Instance.new("UIGradient", lbBtn)
lbGrad.Color = ColorSequence.new(Color3.fromRGB(50, 40, 70), Color3.fromRGB(35, 55, 75))
lbGrad.Rotation = 45
local lbStroke = stroke(lbBtn, Color3.fromRGB(100, 80, 140))
local lbIcon = Instance.new("TextLabel", lbBtn)
lbIcon.Size = UDim2.new(0, 20, 0, 20); lbIcon.Position = UDim2.new(0, 10, 0.5, -10)
lbIcon.BackgroundTransparency = 1; lbIcon.Text = "\240\159\147\129"
lbIcon.Font = Enum.Font.Gotham; lbIcon.TextSize = 14; lbIcon.TextColor3 = Color3.fromRGB(180, 160, 220)
local lbLabel = Instance.new("TextLabel", lbBtn)
lbLabel.Size = UDim2.new(1, -36, 1, 0); lbLabel.Position = UDim2.new(0, 32, 0, 0)
lbLabel.BackgroundTransparency = 1; lbLabel.Text = "LiquidBounce FX"
lbLabel.TextColor3 = Color3.fromRGB(200, 185, 240)
lbLabel.Font = Enum.Font.GothamBold; lbLabel.TextSize = 11
lbLabel.TextXAlignment = Enum.TextXAlignment.Left
lbBtn.MouseEnter:Connect(function() tw(lbStroke, 0.1, {Color = Color3.fromRGB(140, 110, 200)}) end)
lbBtn.MouseLeave:Connect(function() tw(lbStroke, 0.1, {Color = Color3.fromRGB(100, 80, 140)}) end)

local lbBackBtn = Instance.new("TextButton", presetLBView)
lbBackBtn.Size = UDim2.new(0, 60, 0, 24); lbBackBtn.Position = UDim2.new(0, 8, 0, 2)
lbBackBtn.BackgroundColor3 = C.Card; lbBackBtn.AutoButtonColor = false; lbBackBtn.BorderSizePixel = 0
lbBackBtn.Text = "< Back"; lbBackBtn.TextColor3 = C.TextDim
lbBackBtn.Font = Enum.Font.GothamMedium; lbBackBtn.TextSize = 10
corner(lbBackBtn, 4); stroke(lbBackBtn, C.BorderSub)

local lbProgress = Instance.new("Frame", presetLBView)
lbProgress.Size = UDim2.new(1, -16, 0, 50); lbProgress.Position = UDim2.new(0, 8, 0, 0)
lbProgress.BackgroundTransparency = 1; lbProgress.Visible = false
local lbProgBg = Instance.new("Frame", lbProgress)
lbProgBg.Size = UDim2.new(1, 0, 0, 8); lbProgBg.Position = UDim2.new(0, 0, 0, 20)
lbProgBg.BackgroundColor3 = C.Bg; lbProgBg.BorderSizePixel = 0; corner(lbProgBg, 4)
local lbProgFill = Instance.new("Frame", lbProgBg)
lbProgFill.Size = UDim2.new(0, 0, 1, 0); lbProgFill.BackgroundColor3 = Color3.fromRGB(140, 110, 255)
lbProgFill.BorderSizePixel = 0; corner(lbProgFill, 4)
local lbProgLabel = Instance.new("TextLabel", lbProgress)
lbProgLabel.Size = UDim2.new(1, 0, 0, 14); lbProgLabel.Position = UDim2.new(0, 0, 0, 32)
lbProgLabel.BackgroundTransparency = 1; lbProgLabel.Text = "Downloading..."
lbProgLabel.TextColor3 = C.TextMute; lbProgLabel.Font = Enum.Font.Code; lbProgLabel.TextSize = 10

local lbSubScroll = Instance.new("ScrollingFrame", presetLBView)
lbSubScroll.Size = UDim2.new(1, -8, 0, 24); lbSubScroll.Position = UDim2.new(0, 8, 0, 28)
lbSubScroll.BackgroundTransparency = 1; lbSubScroll.BorderSizePixel = 0
lbSubScroll.ScrollBarThickness = 2; lbSubScroll.ScrollBarImageColor3 = C.Border
lbSubScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
lbSubScroll.AutomaticCanvasSize = Enum.AutomaticSize.X
lbSubScroll.ScrollingDirection = Enum.ScrollingDirection.X; lbSubScroll.Visible = false
local lbSubLayout = Instance.new("UIListLayout", lbSubScroll)
lbSubLayout.FillDirection = Enum.FillDirection.Horizontal
lbSubLayout.Padding = UDim.new(0, 4); lbSubLayout.SortOrder = Enum.SortOrder.LayoutOrder

local function buildLBSubPresets()
    for _, ch in ipairs(lbSubScroll:GetChildren()) do if ch:IsA("TextButton") then ch:Destroy() end end
    for i, item in ipairs(LB_ITEMS) do
        local b = Instance.new("TextButton", lbSubScroll)
        b.Size = UDim2.new(0, 90, 0, 22); b.LayoutOrder = i
        b.BackgroundColor3 = C.Card; b.AutoButtonColor = false; b.BorderSizePixel = 0
        b.Text = item.name; b.TextColor3 = Color3.fromRGB(200, 185, 240)
        b.Font = Enum.Font.GothamMedium; b.TextSize = 10
        corner(b, 4); stroke(b, Color3.fromRGB(80, 65, 110))
        b.MouseEnter:Connect(function() tw(b, 0.08, {BackgroundColor3 = C.CardHov}) end)
        b.MouseLeave:Connect(function() tw(b, 0.08, {BackgroundColor3 = C.Card}) end)
        b.MouseButton1Click:Connect(function()
            local id
            if item.folder then
                id = LB_DIR .. "/" .. item.folder .. "/"
            else
                id = LB_DIR .. "/" .. item.file
            end
            _G.TakurinRivalsSettings.HitSoundId = id
            saveSettings()
            Toast("LB FX: " .. item.name)
            for _, ch2 in ipairs(lbSubScroll:GetChildren()) do
                if ch2:IsA("TextButton") then
                    tw(ch2, 0.1, {BackgroundColor3 = C.Card})
                    local s2 = ch2:FindFirstChildOfClass("UIStroke")
                    if s2 then tw(s2, 0.1, {Color = Color3.fromRGB(80, 65, 110)}) end
                end
            end
            tw(b, 0.1, {BackgroundColor3 = C.AccentDim})
            local bs = b:FindFirstChildOfClass("UIStroke")
            if bs then tw(bs, 0.1, {Color = C.Accent}) end
        end)
    end
end

local function showLBView()
    presetNormal.Visible = false
    presetLBView.Visible = true
    if isLBDownloaded() then
        lbProgress.Visible = false
        lbBackBtn.Visible = true
        lbSubScroll.Visible = true
        buildLBSubPresets()
    else
        lbProgress.Visible = true
        lbBackBtn.Visible = true
        lbSubScroll.Visible = false
        lbProgFill.Size = UDim2.new(0, 0, 1, 0)
        lbProgLabel.Text = "Downloading..."
        local downloads = {}
        for _, item in ipairs(LB_ITEMS) do
            if item.folder then
                for _, f in ipairs(item.files) do
                    table.insert(downloads, {url = LB_URL .. item.folder .. "/" .. f, path = LB_DIR .. "/" .. item.folder .. "/" .. f})
                end
            else
                table.insert(downloads, {url = LB_URL .. item.file, path = LB_DIR .. "/" .. item.file})
            end
        end
        task.spawn(function()
            pcall(function() makefolder(LB_DIR) end)
            pcall(function() makefolder(LB_DIR .. "/boykisser") end)
            pcall(function() makefolder(LB_DIR .. "/click") end)
            pcall(function() makefolder(LB_DIR .. "/glass") end)
            pcall(function() makefolder(LB_DIR .. "/moan") end)
            local total = #downloads
            local done = 0
            for _, dl in ipairs(downloads) do
                pcall(function()
                    local data = game:HttpGet(dl.url, true)
                    writefile(dl.path, data)
                end)
                done += 1
                pcall(function()
                    tw(lbProgFill, 0.08, {Size = UDim2.new(done / total, 0, 1, 0)})
                    lbProgLabel.Text = done .. "/" .. total
                end)
                task.wait(0.05)
            end
            pcall(function()
                lbProgLabel.Text = "Done"
                task.wait(0.4)
                lbProgress.Visible = false
                lbSubScroll.Visible = true
                buildLBSubPresets()
            end)
        end)
    end
end

lbBtn.MouseButton1Click:Connect(showLBView)
lbBackBtn.MouseButton1Click:Connect(function()
    presetLBView.Visible = false
    presetNormal.Visible = true
end)

local testBtn = Instance.new("TextButton", HitFXPanel)
testBtn.Size = UDim2.new(0, 100, 0, 26)
testBtn.Position = UDim2.new(1, -100, 0, 326)
testBtn.BackgroundColor3 = C.AccentDim
testBtn.AutoButtonColor = false; testBtn.BorderSizePixel = 0
testBtn.Text = "Test"; testBtn.TextColor3 = C.Text
testBtn.Font = Enum.Font.GothamMedium; testBtn.TextSize = 11
corner(testBtn, 6); stroke(testBtn, C.Accent)
testBtn.MouseButton1Click:Connect(function()
    local id = _G.TakurinRivalsSettings.HitSoundId
    if id == "" then Toast("No hit sound set"); return end
    id = id:match("^%s*(.-)%s*$") or id
    if id:sub(-1) == "/" then
        local files = _G.TakurinLBFolderMap and _G.TakurinLBFolderMap[id]
        if not files or #files == 0 then Toast("No files in pack", "err"); return end
        id = files[math.random(1, #files)]
    end
    local lower = id:lower()
    if lower:match("%.mp3") or lower:match("%.wav") or lower:match("%.ogg") then
        local toAsset = getsynasset or getcustomasset
        if toAsset then
            local ok, asset = pcall(toAsset, id)
            if ok and asset then id = asset else Toast("File not found", "err"); return end
        else
            Toast("Executor doesn't support file audio", "err"); return
        end
    else
        if not id:find("rbxassetid://") then id = "rbxassetid://" .. id:gsub("%D", "") end
    end
    local s = Instance.new("Sound")
    s.SoundId = id
    s.Volume = 1.5 * (tonumber(_G.TakurinRivalsSettings.HitVolumeMult) or 1)
    s.Parent = workspace
    s:Play()
    s.Ended:Connect(function() s:Destroy() end)
    task.delay(3, function() if s.Parent then s:Destroy() end end)
end)

SwitchSection = function(id)
    CurrentSection = id
    for k, b in pairs(SectionButtons) do
        local active = (k == id)
        SectionUnderlines[k].Visible = active
        tw(b, 0.1, {TextColor3 = active and C.Text or C.TextDim})
    end
    local skins = (id == "Skins")
    local hitfx = (id == "HitFX")
    TabBar.Visible = skins
    Head.Visible = skins
    Content.Visible = skins
    HitFXPanel.Visible = hitfx
    SectionPlaceholder.Visible = (not skins) and (not hitfx)
    if SectionPlaceholder.Visible then
        SectionPlaceholder.Text = "Being worked on."
    end
end
SwitchSection("Skins")

SkinSearch:GetPropertyChangedSignal("Text"):Connect(function()

    if CurrentTab ~= "Bulk" and CurrentWeapon then RefreshSkinGrid() end
end)


local sortedWeapons = {}
for w in pairs(SkinLists) do table.insert(sortedWeapons, w) end
table.sort(sortedWeapons)
for _, w in ipairs(sortedWeapons) do MakeWeaponBtn(w) end
UpdateLeftCount()


WeaponSearch:GetPropertyChangedSignal("Text"):Connect(function()
    local txt = WeaponSearch.Text:lower()
    local shown = 0
    for _, btn in pairs(WeaponScroll:GetChildren()) do
        if btn:IsA("TextButton") then
            local n = btn:GetAttribute("WeaponName") or ""
            btn.Visible = txt == "" or n:lower():find(txt, 1, true) ~= nil
            if btn.Visible then shown += 1 end
        end
    end

end)


SaveBtn.MouseButton1Click:Connect(function()

    if SaveConfig() then
        setStatus("config saved", "ok"); Toast("Configuration saved")

    else
        setStatus("save failed", "err"); Toast("Save failed", "err")

    end
end)
LoadBtn.MouseButton1Click:Connect(function()

    if LoadConfig() then
        setStatus("config loaded", "ok"); Toast("Configuration loaded")

        ApplyAllSkins()
        RefreshAllWeaponBtns()
        if CurrentWeapon and CurrentTab ~= "Bulk" then RefreshSkinGrid() end
    else
        setStatus("no config found", "warn"); Toast("No saved config", "warn")

    end
end)
ApplyBtn.MouseButton1Click:Connect(function()

    ApplyAllSkins()
    setStatus("re-applied to live items", "ok")
end)


_G.TakurinRivalsOnLog = function(level, msg)
    if level == "ERR" then
        Toast(msg:sub(1, 200), "err")
        setStatus("error: see F9 console", "err")
    elseif level == "WARN" then
        setStatus(msg:sub(1, 80), "warn")
    end
end


_G.TakurinRivalsOnAutoRevert = function(weapon, skin)
    Toast(("Auto-reverted %s — %s is broken"):format(weapon, skin), "warn")
    if WeaponBtnRefreshers[weapon] then pcall(WeaponBtnRefreshers[weapon]) end
    if CurrentWeapon == weapon and CurrentTab ~= "Bulk" then RefreshSkinGrid() end
end


_G.TakurinRivalsDumpLogs = function()
    print("───── Takurin log dump (" .. #_G.TakurinRivalsLog .. " entries) ─────")
    for _, e in ipairs(_G.TakurinRivalsLog) do print(e) end
    print("───── end ─────")
end


-- DRAG / WINDOW
do
    local dragging, dragStart, startPos
    TitleBar.Active = true
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true; dragStart = input.Position; startPos = Main.Position
        end
    end)
    TitleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local d = input.Position - dragStart
            Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
        end
    end)
end

local minimized = false
local restoreSize = Main.Size
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized

    if minimized then
        restoreSize = Main.Size
        Body.Visible = false; Footer.Visible = false
        tw(Main, 0.15, {Size = UDim2.new(0, restoreSize.X.Offset, 0, 38)})
    else
        tw(Main, 0.15, {Size = restoreSize})
        task.delay(0.13, function() Body.Visible = true; Footer.Visible = true end)
    end
end)
CloseBtn.MouseButton1Click:Connect(function()

    Main.Visible = false
end)

UserInputService.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.K then
        Main.Visible = not Main.Visible

        if not Main.Visible then
            pcall(function() WeaponSearch:ReleaseFocus() end)
            pcall(function() SkinSearch:ReleaseFocus() end)
            pcall(function() BulkSearch:ReleaseFocus() end)
            pcall(function() UserInputService.MouseBehavior = Enum.MouseBehavior.Default end)
        end
    end
end)

-- RESIZE GRIP
local ResizeGrip = Instance.new("TextButton", Main)
ResizeGrip.AnchorPoint = Vector2.new(1, 1)
ResizeGrip.Position = UDim2.new(1, -2, 1, -2)
ResizeGrip.Size = UDim2.new(0, 14, 0, 14)
ResizeGrip.BackgroundTransparency = 1
ResizeGrip.AutoButtonColor = false
ResizeGrip.Text = "⌟"
ResizeGrip.TextColor3 = C.TextMute
ResizeGrip.Font = Enum.Font.GothamBold
ResizeGrip.TextSize = 16
ResizeGrip.ZIndex = 5
do
    local resizing, startInput, startSize
    ResizeGrip.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            resizing = true; startInput = input.Position; startSize = Main.AbsoluteSize
        end
    end)
    ResizeGrip.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then resizing = false end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
            local d = input.Position - startInput
            local m = Modes[_G.TakurinRivalsSettings.Mode] or Modes.Computer
            local newW = math.max(m.MinW, startSize.X + d.X)
            local newH = math.max(m.MinH, startSize.Y + d.Y)
            Main.Size = UDim2.new(0, newW, 0, newH)
        end
    end)
end

-- APPLIERS
local function applyThemeLive(name)
    local oldC = {}
    for k, v in pairs(C) do oldC[k] = v end
    applyThemeToC(name)
    local invOld = {}
    for k, v in pairs(oldC) do invOld[tostring(v)] = k end
    local function swap(c)
        local k = invOld[tostring(c)]
        return k and C[k] or c
    end
    for _, d in ipairs(ScreenGui:GetDescendants()) do
        for _, prop in ipairs({"BackgroundColor3", "TextColor3", "ImageColor3", "PlaceholderColor3", "ScrollBarImageColor3"}) do
            local ok, v = pcall(function() return d[prop] end)
            if ok and typeof(v) == "Color3" then
                local nv = swap(v)
                if nv ~= v then pcall(function() d[prop] = nv end) end
            end
        end
        if d:IsA("UIStroke") then
            local nv = swap(d.Color)
            if nv ~= d.Color then pcall(function() d.Color = nv end) end
        end
    end
    _G.TakurinRivalsSettings.Theme = name
    saveSettings()
end

local function applyFontLive(name)
    local from = FontPresets[CurrentFont] or FontPresets.Gotham
    local to = FontPresets[name] or FontPresets.Gotham
    local m = {[from.Reg]=to.Reg, [from.Med]=to.Med, [from.Semi]=to.Semi, [from.Bold]=to.Bold, [from.Mono]=to.Mono}
    for _, d in ipairs(ScreenGui:GetDescendants()) do
        local ok, f = pcall(function() return d.Font end)
        if ok and m[f] then pcall(function() d.Font = m[f] end) end
    end
    CurrentFont = name
    _G.TakurinRivalsSettings.FontPreset = name
    saveSettings()
end

local MobileMenuBtn = Instance.new("TextButton", Right)
MobileMenuBtn.Size = UDim2.new(0, 32, 0, 24)
MobileMenuBtn.Position = UDim2.new(1, -42, 0, 12)
MobileMenuBtn.BackgroundColor3 = C.Sub
MobileMenuBtn.AutoButtonColor = false
MobileMenuBtn.BorderSizePixel = 0
MobileMenuBtn.Text = "≡"
MobileMenuBtn.TextColor3 = C.TextDim
MobileMenuBtn.Font = Enum.Font.GothamBold
MobileMenuBtn.TextSize = 16
MobileMenuBtn.Visible = false
MobileMenuBtn.ZIndex = 20
corner(MobileMenuBtn, 6)
MobileMenuBtn.MouseButton1Click:Connect(function()
    Left.Visible = not Left.Visible
end)

local function applyModeLive(name)
    local m = Modes[name] or Modes.Computer
    tw(Main, 0.18, {Size = UDim2.new(0, m.W, 0, m.H), Position = UDim2.new(0.5, -m.W/2, 0.5, -m.H/2)})
    if name == "Mobile" then
        Left.Size = UDim2.new(1, 0, 1, 0)
        Left.Position = UDim2.new(0, 0, 0, 0)
        Left.ZIndex = 30
        Left.Visible = false
        Right.Position = UDim2.new(0, 0, 0, 0)
        Right.Size = UDim2.new(1, 0, 1, 0)
        MobileMenuBtn.Visible = true
        SkinGrid.CellSize = UDim2.new(0, 132, 0, 158)
        BulkGrid.CellSize = UDim2.new(0, 132, 0, 158)
    else
        Left.ZIndex = 1
        Left.Size = UDim2.new(0, 280, 1, 0)
        Left.Position = UDim2.new(0, 0, 0, 0)
        Left.Visible = true
        Right.Position = UDim2.new(0, 290, 0, 0)
        Right.Size = UDim2.new(1, -290, 1, 0)
        MobileMenuBtn.Visible = false
        SkinGrid.CellSize = UDim2.new(0, 150, 0, 180)
        BulkGrid.CellSize = UDim2.new(0, 150, 0, 180)
    end
    _G.TakurinRivalsSettings.Mode = name
    saveSettings()
end
applyModeLive(_G.TakurinRivalsSettings.Mode)

-- SETTINGS OVERLAY
local SettingsBackdrop = Instance.new("TextButton", ScreenGui)
SettingsBackdrop.Size = UDim2.new(1, 0, 1, 0)
SettingsBackdrop.BackgroundColor3 = Color3.new(0, 0, 0)
SettingsBackdrop.BackgroundTransparency = 0.4
SettingsBackdrop.AutoButtonColor = false
SettingsBackdrop.Text = ""
SettingsBackdrop.BorderSizePixel = 0
SettingsBackdrop.Visible = false
SettingsBackdrop.ZIndex = 50

local SettingsPanel = Instance.new("TextButton", ScreenGui)
SettingsPanel.AutoButtonColor = false
SettingsPanel.Text = ""
SettingsPanel.AnchorPoint = Vector2.new(0.5, 0.5)
SettingsPanel.Position = UDim2.new(0.5, 0, 0.5, 0)
SettingsPanel.Size = UDim2.new(0, 380, 0, 420)
SettingsPanel.BackgroundColor3 = C.Panel
SettingsPanel.BorderSizePixel = 0
SettingsPanel.Visible = false
SettingsPanel.ZIndex = 51
corner(SettingsPanel, 10)
stroke(SettingsPanel, C.Border)

local sTitle = Instance.new("TextLabel", SettingsPanel)
sTitle.Size = UDim2.new(1, -20, 0, 30)
sTitle.Position = UDim2.new(0, 14, 0, 10)
sTitle.BackgroundTransparency = 1
sTitle.Text = "Settings"
sTitle.TextColor3 = C.Text
sTitle.Font = Enum.Font.GothamSemibold
sTitle.TextSize = 14
sTitle.TextXAlignment = Enum.TextXAlignment.Left
sTitle.ZIndex = 52

local sClose = Instance.new("TextButton", SettingsPanel)
sClose.Size = UDim2.new(0, 24, 0, 24)
sClose.Position = UDim2.new(1, -32, 0, 12)
sClose.BackgroundColor3 = C.Sub
sClose.AutoButtonColor = false
sClose.BorderSizePixel = 0
sClose.Text = "×"
sClose.TextColor3 = C.TextDim
sClose.Font = Enum.Font.GothamBold
sClose.TextSize = 14
sClose.ZIndex = 52
corner(sClose, 6)

local function makeRow(parent, y, label)
    local row = Instance.new("Frame", parent)
    row.Size = UDim2.new(1, -28, 0, 60)
    row.Position = UDim2.new(0, 14, 0, y)
    row.BackgroundColor3 = C.Sub
    row.BorderSizePixel = 0
    row.ZIndex = 52
    corner(row, 6); stroke(row, C.BorderSub)
    local lbl = Instance.new("TextLabel", row)
    lbl.Size = UDim2.new(1, -16, 0, 16)
    lbl.Position = UDim2.new(0, 12, 0, 8)
    lbl.BackgroundTransparency = 1
    lbl.Text = label
    lbl.TextColor3 = C.TextDim
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 10
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 53
    return row
end

local function makeSegmented(row, options, current, onPick)
    local container = Instance.new("Frame", row)
    container.Size = UDim2.new(1, -16, 0, 28)
    container.Position = UDim2.new(0, 8, 0, 26)
    container.BackgroundTransparency = 1
    container.ZIndex = 53
    local layout = Instance.new("UIListLayout", container)
    layout.FillDirection = Enum.FillDirection.Horizontal
    layout.Padding = UDim.new(0, 6)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    local btns = {}
    local function refresh(active)
        for opt, b in pairs(btns) do
            local sel = (opt == active)
            tw(b, 0.1, {BackgroundColor3 = sel and C.AccentDim or C.Card, TextColor3 = sel and C.Text or C.TextDim})
            local s = b:FindFirstChildOfClass("UIStroke")
            if s then tw(s, 0.1, {Color = sel and C.Accent or C.BorderSub}) end
        end
    end
    for i, opt in ipairs(options) do
        local b = Instance.new("TextButton", container)
        b.Size = UDim2.new(0, math.max(60, math.floor((340 - 16 - (#options - 1) * 6) / #options)), 1, 0)
        b.LayoutOrder = i
        b.BackgroundColor3 = (opt == current) and C.AccentDim or C.Card
        b.AutoButtonColor = false
        b.BorderSizePixel = 0
        b.Text = opt
        b.TextColor3 = (opt == current) and C.Text or C.TextDim
        b.Font = Enum.Font.GothamMedium
        b.TextSize = 11
        b.ZIndex = 53
        corner(b, 6); stroke(b, (opt == current) and C.Accent or C.BorderSub)
        b.MouseButton1Click:Connect(function()
            refresh(opt)
            onPick(opt)
        end)
        btns[opt] = b
    end
    return refresh
end

local themeRow = makeRow(SettingsPanel, 50, "THEME")
makeSegmented(themeRow, {"macOS Dark", "macOS Light", "Midnight", "Sunset"}, _G.TakurinRivalsSettings.Theme, function(opt)
    applyThemeLive(opt)
    Toast("Theme: " .. opt)
end)

local fontNames = {}
for k in pairs(FontPresets) do table.insert(fontNames, k) end
table.sort(fontNames)

local fontRow = Instance.new("Frame", SettingsPanel)
fontRow.Size = UDim2.new(1, -28, 0, 96)
fontRow.Position = UDim2.new(0, 14, 0, 120)
fontRow.BackgroundColor3 = C.Sub
fontRow.BorderSizePixel = 0
fontRow.ZIndex = 52
corner(fontRow, 6); stroke(fontRow, C.BorderSub)
local fLbl = Instance.new("TextLabel", fontRow)
fLbl.Size = UDim2.new(1, -16, 0, 16); fLbl.Position = UDim2.new(0, 12, 0, 8)
fLbl.BackgroundTransparency = 1; fLbl.Text = "FONT"; fLbl.TextColor3 = C.TextDim
fLbl.Font = Enum.Font.GothamBold; fLbl.TextSize = 10
fLbl.TextXAlignment = Enum.TextXAlignment.Left; fLbl.ZIndex = 53
local fScroll = Instance.new("ScrollingFrame", fontRow)
fScroll.Size = UDim2.new(1, -16, 0, 64); fScroll.Position = UDim2.new(0, 8, 0, 26)
fScroll.BackgroundTransparency = 1; fScroll.BorderSizePixel = 0
fScroll.ScrollBarThickness = 2; fScroll.ScrollBarImageColor3 = C.Border
fScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
fScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
fScroll.ZIndex = 53
local fGrid = Instance.new("UIGridLayout", fScroll)
fGrid.CellSize = UDim2.new(0, 78, 0, 24); fGrid.CellPadding = UDim2.new(0, 4, 0, 4)
local fontBtns = {}
for _, name in ipairs(fontNames) do
    local b = Instance.new("TextButton", fScroll)
    local sel = (name == _G.TakurinRivalsSettings.FontPreset)
    b.BackgroundColor3 = sel and C.AccentDim or C.Card
    b.AutoButtonColor = false; b.BorderSizePixel = 0
    b.Text = name; b.TextColor3 = sel and C.Text or C.TextDim
    b.Font = FontPresets[name].Med; b.TextSize = 11; b.ZIndex = 54
    corner(b, 6); stroke(b, sel and C.Accent or C.BorderSub)
    b.MouseButton1Click:Connect(function()
        for n, btn in pairs(fontBtns) do
            local s = (n == name)
            tw(btn, 0.1, {BackgroundColor3 = s and C.AccentDim or C.Card, TextColor3 = s and C.Text or C.TextDim})
            local st = btn:FindFirstChildOfClass("UIStroke")
            if st then tw(st, 0.1, {Color = s and C.Accent or C.BorderSub}) end
        end
        applyFontLive(name)
    end)
    fontBtns[name] = b
end

local modeRow = makeRow(SettingsPanel, 226, "LAYOUT")
makeSegmented(modeRow, {"Computer", "Mobile"}, _G.TakurinRivalsSettings.Mode, function(opt)
    applyModeLive(opt)
end)


local sFooter = Instance.new("TextLabel", SettingsPanel)
sFooter.Size = UDim2.new(1, -28, 0, 36)
sFooter.Position = UDim2.new(0, 14, 1, -46)
sFooter.BackgroundTransparency = 1
sFooter.Text = ""
sFooter.TextColor3 = C.TextMute
sFooter.Font = Enum.Font.Code
sFooter.TextSize = 10
sFooter.TextXAlignment = Enum.TextXAlignment.Left
sFooter.ZIndex = 52

local function toggleSettings(show)
    local v = (show ~= nil) and show or (not SettingsBackdrop.Visible)
    SettingsBackdrop.Visible = v
    SettingsPanel.Visible = v
end
GearBtn.MouseButton1Click:Connect(function() toggleSettings(true) end)
sClose.MouseButton1Click:Connect(function() toggleSettings(false) end)
SettingsBackdrop.MouseButton1Click:Connect(function() toggleSettings(false) end)

if CurrentFont ~= "Gotham" then
    local saved = CurrentFont
    CurrentFont = "Gotham"
    applyFontLive(saved)
end

logEvent("INF", "loaded")
end)


-- ═══════════════════════════════════════════════
-- Takurin Global Mesh Healer (Smart Namecall)
-- ═══════════════════════════════════════════════

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TempVMs
pcall(function()
    TempVMs = ReplicatedStorage:WaitForChild("Assets", 10)
        :WaitForChild("Temp", 10):WaitForChild("ViewModels", 10)
end)

_G.AnihaHealerEnabled = (_G.AnihaHealerEnabled ~= false)
_G.AnihaHealCount = _G.AnihaHealCount or 0
_G.AnihaRecentHeals = _G.AnihaRecentHeals or {}
local consumedByParent = setmetatable({}, {__mode = "k"})

local function isInTempVMs(inst)
    if not TempVMs or not inst then return false end
    local cur = inst
    for _ = 1, 32 do
        if cur == TempVMs then return true end
        cur = cur.Parent
        if not cur then return false end
    end
    return false
end

local function attribByAsset(node)
    local cur = node
    while cur and cur ~= TempVMs do
        local n = cur.Name
        if type(n) == "string" then
            local _, _, weapon, skin = n:find("^[%w_]+ %- (.-) %- (.+)$")
            if weapon and skin then return weapon, skin end
        end
        cur = cur.Parent
    end
end

local function fuzzyResolve(parent, requested, skipSet)
    if type(requested) ~= "string" then return nil end
    skipSet = skipSet or {}
    local children = parent:GetChildren()
    local lower = requested:lower()
    local function ok(c) return not skipSet[c] end
    
    for _, c in ipairs(children) do
        if ok(c) and c.Name:lower() == lower then return c, "case" end
    end
    
    local stripped = requested:gsub("%d+$", "")
    if stripped ~= "" and stripped ~= requested then
        for _, c in ipairs(children) do
            if ok(c) and c.Name == stripped then return c, "stripDigits" end
        end
        for _, c in ipairs(children) do
            if ok(c) and c.Name:lower() == stripped:lower() then return c, "stripDigitsCase" end
        end
    end
    
    for _, suf in ipairs({"1", "_1", "01"}) do
        local probe = (requested .. suf):lower()
        for _, c in ipairs(children) do
            if ok(c) and c.Name:lower() == probe then return c, "addSuffix" end
        end
    end
    
    if requested:lower():find("mesh") then
        local meshes = {}
        for _, c in ipairs(children) do
            if ok(c) and (c:IsA("MeshPart") or c:IsA("BasePart") or c:IsA("SpecialMesh")) then
                table.insert(meshes, c)
            end
        end
        if #meshes == 1 then return meshes[1], "soleMesh" end
    end
    return nil
end

local function createSmartDummy(name, parent)
    local dummy
    local n = name:lower()
    
    if n:find("motor") or n:find("joint") then
        dummy = Instance.new("Motor6D")
    elseif n:find("attach") or n:find("muzzle") or n:find("sight") or n:find("grip") then
        dummy = Instance.new("Attachment")
    elseif n:find("sound") or n:find("audio") then
        dummy = Instance.new("Sound")
    else
        dummy = Instance.new("Part")
        dummy.Transparency = 1
        dummy.CanCollide = false
        dummy.Massless = true
        dummy.Size = Vector3.new(0.01, 0.01, 0.01)
    end
    
    dummy.Name = name
    dummy.Parent = parent
    return dummy
end

local function install()
    if not getrawmetatable then return false end
    local mt = getrawmetatable(game)
    local setRO = setreadonly or make_writeable or (function() end)
    local oldNamecall = mt.__namecall
    if not oldNamecall then return false end
    
    pcall(setRO, mt, false)
    local closure = newcclosure or function(f) return f end

    mt.__namecall = closure(function(self, ...)
        local method = getnamecallmethod and getnamecallmethod() or ""
        if _G.AnihaHealerEnabled and method == "WaitForChild" and typeof(self) == "Instance" then
            local args = {...}
            if args[1] ~= nil then
                local name = tostring(args[1])
                
                if isInTempVMs(self) then
                    if not self:FindFirstChild(name) then
                        local consumed = consumedByParent[self] or {}
                        consumedByParent[self] = consumed

                        local cand, how = fuzzyResolve(self, name, consumed)
                        if cand then
                            consumed[cand] = true
                            _G.AnihaHealCount += 1
                            return cand
                        end

                        local source, how2 = fuzzyResolve(self, name)
                        if source then
                            local okClone, clone = pcall(function() return source:Clone() end)
                            if okClone and clone then
                                clone.Name = name
                                for _, desc in ipairs(clone:GetDescendants()) do
                                    if desc:IsA("WeldConstraint") or desc:IsA("Weld") or desc:IsA("ManualWeld") then
                                        desc:Destroy()
                                    end
                                end
                                clone.Parent = self
                                consumed[clone] = true
                                _G.AnihaHealCount += 1
                                print(("[Takurin Healer] Cloned %s for missing part %s"):format(source.Name, name))
                                return clone
                            end
                        end
                        
                        -- Global Bug-Free Fallback: 
                        -- Generate a smart dummy part based on the expected name so game scripts NEVER crash or hang.
                        local dummy = createSmartDummy(name, self)
                        consumed[dummy] = true
                        print(("[Takurin Healer] Generated SMART dummy '%s' (%s)"):format(name, dummy.ClassName))
                        return dummy
                    end
                end
            end
        end
        return oldNamecall(self, ...)
    end)
    pcall(setRO, mt, true)
    print("[Takurin Healer] Smart hook installed globally.")
    return true
end

install()
