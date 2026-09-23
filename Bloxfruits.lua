do
    local KEY_LINK = "https://sub2unlock.io/i5fUQ"
    local VALID_KEY = "bankai-key"
    local keyEntered = false

    task.spawn(function()
        local plr = game:GetService("Players").LocalPlayer
        local sg = Instance.new("ScreenGui")
        sg.Name = "BankaiHubKey"
        sg.ResetOnSpawn = false
        sg.Parent = plr:WaitForChild("PlayerGui")

        local bg = Instance.new("Frame")
        bg.Size = UDim2.new(0, 360, 0, 210)
        bg.Position = UDim2.new(0.5, -180, 0.5, -105)
        bg.BackgroundColor3 = Color3.fromRGB(23, 10, 10)
        bg.BorderSizePixel = 0
        bg.Parent = sg

        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, 0, 0, 42)
        title.BackgroundTransparency = 1
        title.Text = "Bankai Hub - Key Required"
        title.TextColor3 = Color3.fromRGB(220, 38, 38)
        title.TextScaled = true
        title.Font = Enum.Font.GothamBold
        title.Parent = bg

        local info = Instance.new("TextLabel")
        info.Position = UDim2.new(0, 10, 0, 46)
        info.Size = UDim2.new(1, -20, 0, 38)
        info.BackgroundTransparency = 1
        info.Text = "Get your key at: " .. KEY_LINK
        info.TextColor3 = Color3.fromRGB(255, 255, 255)
        info.TextScaled = true
        info.Font = Enum.Font.Gotham
        info.TextWrapped = true
        info.Parent = bg

        local box = Instance.new("TextBox")
        box.Position = UDim2.new(0, 40, 0, 92)
        box.Size = UDim2.new(1, -80, 0, 36)
        box.BackgroundColor3 = Color3.fromRGB(45, 20, 20)
        box.BorderSizePixel = 0
        box.PlaceholderText = "Enter your key here..."
        box.PlaceholderColor3 = Color3.fromRGB(128, 90, 90)
        box.TextColor3 = Color3.fromRGB(255, 255, 255)
        box.Font = Enum.Font.Gotham
        box.TextSize = 16
        box.TextXAlignment = Enum.TextXAlignment.Center
        box.Parent = bg

        local check = Instance.new("TextButton")
        check.Position = UDim2.new(0, 40, 0, 140)
        check.Size = UDim2.new(1, -80, 0, 38)
        check.BackgroundColor3 = Color3.fromRGB(220, 38, 38)
        check.BorderSizePixel = 0
        check.Text = "UNLOCK"
        check.TextColor3 = Color3.fromRGB(255, 255, 255)
        check.Font = Enum.Font.GothamBold
        check.TextSize = 18
        check.Parent = bg

        local function tryUnlock()
            local v = tostring(box.Text or ""):gsub("%s", "")
            if v == VALID_KEY then
                keyEntered = true
                sg:Destroy()
            else
                pcall(function() setclipboard(KEY_LINK) end)
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Wrong key",
                    Text = "Link copied! Get the key at " .. KEY_LINK,
                    Duration = 6,
                })
                box.Text = ""
            end
        end

        check.MouseButton1Click:Connect(tryUnlock)
        box.FocusLost:Connect(function(enterPressed)
            if enterPressed then tryUnlock() end
        end)
    end)

    while not keyEntered do task.wait(0.2) end
    print("[BankaiHub] Key verified - loading...")
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")
local CollectionService = game:GetService("CollectionService")

local plr = Players.LocalPlayer
local CommF = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")

local World1 = game.PlaceId == 2753915549
local World2 = game.PlaceId == 4442272183
local World3 = game.PlaceId == 7449423635

_G.AutoFarm = false
_G.AutoNear = false
_G.AutoBoss = false
_G.AutoChest = false
_G.SelectWeapon = "Melee"
_G.SelectBoss = "The Gorilla King"
_G.BringMob = true
_G.AutoHaki = true
_G.TeleportIsland = false
_G.SelectIsland = "WindMill"

local Mon = ""
local NameMon = ""
local NameQuest = ""
local LevelQuest = 1
local CFrameQuest = CFrame.new(0, 0, 0)
local CFrameMon = CFrame.new(0, 0, 0)
local StartBring = false
local PosMon = nil
local MonFarm = ""

local function EquipWeapon(toolName)
    local char = plr.Character
    if not char then return end
    local tool = char:FindFirstChild(toolName) or plr.Backpack:FindFirstChild(toolName)
    if tool and char:FindFirstChildOfClass("Humanoid") then
        char.Humanoid:EquipTool(tool)
    end
end

local function AutoHaki()
    local char = plr.Character
    if char and not char:FindFirstChild("HasBuso") then
        pcall(function() CommF:InvokeServer("Buso") end)
    end
end

local function topos(pos)
    local char = plr.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    if not pos then return end
    local dist = (pos.Position - char.HumanoidRootPart.Position).Magnitude
    if dist > 2000 then
        pcall(function()
            CommF:InvokeServer("requestEntrance", pos.Position)
        end)
    end
    char.HumanoidRootPart.CFrame = pos
end

local function Click()
    VirtualUser:CaptureController()
    VirtualUser:Button1Down(Vector2.new(1280, 672))
end

local function CheckQuest()
    local lvl = plr.Data.Level.Value
    if World1 then
        if lvl <= 9 then
            Mon, NameMon, NameQuest, LevelQuest = "Bandit", "Bandit", "BanditQuest1", 1
            CFrameQuest = CFrame.new(1059.37, 15.45, 1550.42)
            CFrameMon = CFrame.new(1045.96, 27.00, 1560.82)
        elseif lvl <= 14 then
            Mon, NameMon, NameQuest, LevelQuest = "Monkey", "Monkey", "JungleQuest", 1
            CFrameQuest = CFrame.new(-1598.09, 35.55, 153.38)
            CFrameMon = CFrame.new(-1448.52, 67.85, 11.47)
        elseif lvl <= 29 then
            Mon, NameMon, NameQuest, LevelQuest = "Gorilla", "Gorilla", "JungleQuest", 2
            CFrameQuest = CFrame.new(-1598.09, 35.55, 153.38)
            CFrameMon = CFrame.new(-1129.88, 40.46, -525.42)
        elseif lvl <= 39 then
            Mon, NameMon, NameQuest, LevelQuest = "Pirate", "Pirate", "BuggyQuest1", 1
            CFrameQuest = CFrame.new(-1141.07, 4.10, 3831.55)
            CFrameMon = CFrame.new(-1103.51, 13.75, 3896.09)
        elseif lvl <= 59 then
            Mon, NameMon, NameQuest, LevelQuest = "Brute", "Brute", "BuggyQuest1", 2
            CFrameQuest = CFrame.new(-1141.07, 4.10, 3831.55)
            CFrameMon = CFrame.new(-1140.08, 14.81, 4322.92)
        elseif lvl <= 74 then
            Mon, NameMon, NameQuest, LevelQuest = "Desert Bandit", "Desert Bandit", "DesertQuest", 1
            CFrameQuest = CFrame.new(894.49, 5.14, 4392.43)
            CFrameMon = CFrame.new(924.80, 6.45, 4481.59)
        elseif lvl <= 89 then
            Mon, NameMon, NameQuest, LevelQuest = "Desert Officer", "Desert Officer", "DesertQuest", 2
            CFrameQuest = CFrame.new(894.49, 5.14, 4392.43)
            CFrameMon = CFrame.new(1608.28, 8.61, 4371.01)
        elseif lvl <= 99 then
            Mon, NameMon, NameQuest, LevelQuest = "Snow Bandit", "Snow Bandit", "SnowQuest", 1
            CFrameQuest = CFrame.new(1389.74, 88.15, -1298.91)
            CFrameMon = CFrame.new(1354.35, 87.27, -1393.95)
        elseif lvl <= 119 then
            Mon, NameMon, NameQuest, LevelQuest = "Snowman", "Snowman", "SnowQuest", 2
            CFrameQuest = CFrame.new(1389.74, 88.15, -1298.91)
            CFrameMon = CFrame.new(1201.64, 144.58, -1550.07)
        elseif lvl <= 149 then
            Mon, NameMon, NameQuest, LevelQuest = "Chief Petty Officer", "Chief Petty Officer", "MarineQuest2", 1
            CFrameQuest = CFrame.new(-5039.59, 27.35, 4324.68)
            CFrameMon = CFrame.new(-4881.23, 22.65, 4273.75)
        elseif lvl <= 174 then
            Mon, NameMon, NameQuest, LevelQuest = "Sky Bandit", "Sky Bandit", "SkyQuest", 1
            CFrameQuest = CFrame.new(-4839.53, 716.37, -2619.44)
            CFrameMon = CFrame.new(-4953.21, 295.74, -2899.23)
        elseif lvl <= 189 then
            Mon, NameMon, NameQuest, LevelQuest = "Dark Master", "Dark Master", "SkyQuest", 2
            CFrameQuest = CFrame.new(-4839.53, 716.37, -2619.44)
            CFrameMon = CFrame.new(-5259.84, 391.40, -2229.04)
        elseif lvl <= 209 then
            Mon, NameMon, NameQuest, LevelQuest = "Prisoner", "Prisoner", "PrisonerQuest", 1
            CFrameQuest = CFrame.new(5308.93, 1.66, 475.12)
            CFrameMon = CFrame.new(5098.97, -0.32, 474.24)
        elseif lvl <= 249 then
            Mon, NameMon, NameQuest, LevelQuest = "Dangerous Prisoner", "Dangerous Prisoner", "PrisonerQuest", 2
            CFrameQuest = CFrame.new(5308.93, 1.66, 475.12)
            CFrameMon = CFrame.new(5654.56, 15.63, 866.30)
        elseif lvl <= 274 then
            Mon, NameMon, NameQuest, LevelQuest = "Toga Warrior", "Toga Warrior", "ColosseumQuest", 1
            CFrameQuest = CFrame.new(-1580.05, 6.35, -2986.48)
            CFrameMon = CFrame.new(-1820.21, 51.68, -2740.67)
        elseif lvl <= 299 then
            Mon, NameMon, NameQuest, LevelQuest = "Gladiator", "Gladiator", "ColosseumQuest", 2
            CFrameQuest = CFrame.new(-1580.05, 6.35, -2986.48)
            CFrameMon = CFrame.new(-1292.84, 56.38, -3339.03)
        elseif lvl <= 324 then
            Mon, NameMon, NameQuest, LevelQuest = "Military Soldier", "Military Soldier", "MagmaQuest", 1
            CFrameQuest = CFrame.new(-5313.37, 10.95, 8515.29)
            CFrameMon = CFrame.new(-5411.16, 11.08, 8454.29)
        elseif lvl <= 374 then
            Mon, NameMon, NameQuest, LevelQuest = "Military Spy", "Military Spy", "MagmaQuest", 2
            CFrameQuest = CFrame.new(-5313.37, 10.95, 8515.29)
            CFrameMon = CFrame.new(-5802.87, 86.26, 8828.86)
        elseif lvl <= 399 then
            Mon, NameMon, NameQuest, LevelQuest = "Fishman Warrior", "Fishman Warrior", "FishmanQuest", 1
            CFrameQuest = CFrame.new(61122.65, 18.50, 1569.40)
            CFrameMon = CFrame.new(60878.30, 18.48, 1543.76)
        elseif lvl <= 449 then
            Mon, NameMon, NameQuest, LevelQuest = "Fishman Commando", "Fishman Commando", "FishmanQuest", 2
            CFrameQuest = CFrame.new(61122.65, 18.50, 1569.40)
            CFrameMon = CFrame.new(61922.63, 18.48, 1493.93)
        elseif lvl <= 474 then
            Mon, NameMon, NameQuest, LevelQuest = "God's Guard", "God's Guard", "SkyExp1Quest", 1
            CFrameQuest = CFrame.new(-4721.89, 843.87, -1949.97)
            CFrameMon = CFrame.new(-4710.04, 845.28, -1927.31)
        elseif lvl <= 524 then
            Mon, NameMon, NameQuest, LevelQuest = "Shanda", "Shanda", "SkyExp1Quest", 2
            CFrameQuest = CFrame.new(-7859.10, 5544.19, -381.48)
            CFrameMon = CFrame.new(-7678.49, 5566.40, -497.22)
        elseif lvl <= 549 then
            Mon, NameMon, NameQuest, LevelQuest = "Royal Squad", "Royal Squad", "SkyExp2Quest", 1
            CFrameQuest = CFrame.new(-7906.82, 5634.66, -1411.99)
            CFrameMon = CFrame.new(-7624.25, 5658.13, -1467.35)
        elseif lvl <= 624 then
            Mon, NameMon, NameQuest, LevelQuest = "Royal Soldier", "Royal Soldier", "SkyExp2Quest", 2
            CFrameQuest = CFrame.new(-7906.82, 5634.66, -1411.99)
            CFrameMon = CFrame.new(-7836.75, 5645.66, -1790.62)
        elseif lvl <= 649 then
            Mon, NameMon, NameQuest, LevelQuest = "Galley Pirate", "Galley Pirate", "FountainQuest", 1
            CFrameQuest = CFrame.new(5259.82, 37.35, 4050.03)
            CFrameMon = CFrame.new(5551.02, 78.90, 3930.41)
        else
            Mon, NameMon, NameQuest, LevelQuest = "Galley Captain", "Galley Captain", "FountainQuest", 2
            CFrameQuest = CFrame.new(5259.82, 37.35, 4050.03)
            CFrameMon = CFrame.new(5441.95, 42.50, 4950.09)
        end
    elseif World2 then
        if lvl <= 724 then
            Mon, NameMon, NameQuest, LevelQuest = "Raider", "Raider", "Area1Quest", 1
            CFrameQuest = CFrame.new(-429.54, 71.77, 1836.18)
            CFrameMon = CFrame.new(-728.33, 52.78, 2345.77)
        elseif lvl <= 774 then
            Mon, NameMon, NameQuest, LevelQuest = "Mercenary", "Mercenary", "Area1Quest", 2
            CFrameQuest = CFrame.new(-429.54, 71.77, 1836.18)
            CFrameMon = CFrame.new(-1004.32, 80.16, 1424.62)
        elseif lvl <= 799 then
            Mon, NameMon, NameQuest, LevelQuest = "Swan Pirate", "Swan Pirate", "Area2Quest", 1
            CFrameQuest = CFrame.new(638.44, 71.77, 918.28)
            CFrameMon = CFrame.new(1068.66, 137.61, 1322.11)
        elseif lvl <= 874 then
            Mon, NameMon, NameQuest, LevelQuest = "Factory Staff", "Factory Staff", "Area2Quest", 2
            CFrameQuest = CFrame.new(632.70, 73.11, 918.67)
            CFrameMon = CFrame.new(73.08, 81.86, -27.47)
        elseif lvl <= 899 then
            Mon, NameMon, NameQuest, LevelQuest = "Marine Lieutenant", "Marine Lieutenant", "MarineQuest3", 1
            CFrameQuest = CFrame.new(-2440.80, 71.71, -3216.07)
            CFrameMon = CFrame.new(-2821.37, 75.90, -3070.09)
        elseif lvl <= 949 then
            Mon, NameMon, NameQuest, LevelQuest = "Marine Captain", "Marine Captain", "MarineQuest3", 2
            CFrameQuest = CFrame.new(-2440.80, 71.71, -3216.07)
            CFrameMon = CFrame.new(-1861.23, 80.18, -3254.70)
        elseif lvl <= 974 then
            Mon, NameMon, NameQuest, LevelQuest = "Zombie", "Zombie", "ZombieQuest", 1
            CFrameQuest = CFrame.new(-5497.06, 47.59, -795.24)
            CFrameMon = CFrame.new(-5657.78, 78.97, -928.69)
        elseif lvl <= 999 then
            Mon, NameMon, NameQuest, LevelQuest = "Vampire", "Vampire", "ZombieQuest", 2
            CFrameQuest = CFrame.new(-5497.06, 47.59, -795.24)
            CFrameMon = CFrame.new(-6037.67, 32.18, -1340.66)
        elseif lvl <= 1049 then
            Mon, NameMon, NameQuest, LevelQuest = "Snow Trooper", "Snow Trooper", "SnowMountainQuest", 1
            CFrameQuest = CFrame.new(609.86, 400.12, -5372.26)
            CFrameMon = CFrame.new(549.15, 427.39, -5563.70)
        elseif lvl <= 1099 then
            Mon, NameMon, NameQuest, LevelQuest = "Winter Warrior", "Winter Warrior", "SnowMountainQuest", 2
            CFrameQuest = CFrame.new(609.86, 400.12, -5372.26)
            CFrameMon = CFrame.new(1142.75, 475.64, -5199.42)
        elseif lvl <= 1124 then
            Mon, NameMon, NameQuest, LevelQuest = "Lab Subordinate", "Lab Subordinate", "IceSideQuest", 1
            CFrameQuest = CFrame.new(-6064.07, 15.24, -4902.98)
            CFrameMon = CFrame.new(-5707.47, 15.95, -4513.39)
        elseif lvl <= 1174 then
            Mon, NameMon, NameQuest, LevelQuest = "Horned Warrior", "Horned Warrior", "IceSideQuest", 2
            CFrameQuest = CFrame.new(-6064.07, 15.24, -4902.98)
            CFrameMon = CFrame.new(-6341.37, 15.95, -5723.16)
        elseif lvl <= 1199 then
            Mon, NameMon, NameQuest, LevelQuest = "Magma Ninja", "Magma Ninja", "FireSideQuest", 1
            CFrameQuest = CFrame.new(-5428.03, 15.06, -5299.43)
            CFrameMon = CFrame.new(-5449.67, 76.66, -5808.20)
        elseif lvl <= 1249 then
            Mon, NameMon, NameQuest, LevelQuest = "Lava Pirate", "Lava Pirate", "FireSideQuest", 2
            CFrameQuest = CFrame.new(-5428.03, 15.06, -5299.43)
            CFrameMon = CFrame.new(-5213.33, 49.74, -4701.45)
        elseif lvl <= 1274 then
            Mon, NameMon, NameQuest, LevelQuest = "Ship Deckhand", "Ship Deckhand", "ShipQuest1", 1
            CFrameQuest = CFrame.new(1037.80, 125.09, 32911.60)
            CFrameMon = CFrame.new(1212.01, 150.79, 33059.25)
        elseif lvl <= 1299 then
            Mon, NameMon, NameQuest, LevelQuest = "Ship Engineer", "Ship Engineer", "ShipQuest1", 2
            CFrameQuest = CFrame.new(1037.80, 125.09, 32911.60)
            CFrameMon = CFrame.new(919.48, 43.54, 32779.97)
        elseif lvl <= 1324 then
            Mon, NameMon, NameQuest, LevelQuest = "Ship Steward", "Ship Steward", "ShipQuest2", 1
            CFrameQuest = CFrame.new(968.81, 125.09, 33244.13)
            CFrameMon = CFrame.new(919.44, 129.56, 33436.04)
        elseif lvl <= 1349 then
            Mon, NameMon, NameQuest, LevelQuest = "Ship Officer", "Ship Officer", "ShipQuest2", 2
            CFrameQuest = CFrame.new(968.81, 125.09, 33244.13)
            CFrameMon = CFrame.new(1036.02, 181.44, 33315.73)
        elseif lvl <= 1374 then
            Mon, NameMon, NameQuest, LevelQuest = "Arctic Warrior", "Arctic Warrior", "FrostQuest", 1
            CFrameQuest = CFrame.new(5667.66, 26.80, -6486.09)
            CFrameMon = CFrame.new(5966.25, 62.97, -6179.38)
        elseif lvl <= 1424 then
            Mon, NameMon, NameQuest, LevelQuest = "Snow Lurker", "Snow Lurker", "FrostQuest", 2
            CFrameQuest = CFrame.new(5667.66, 26.80, -6486.09)
            CFrameMon = CFrame.new(5407.07, 69.19, -6880.88)
        elseif lvl <= 1449 then
            Mon, NameMon, NameQuest, LevelQuest = "Sea Soldier", "Sea Soldier", "ForgottenQuest", 1
            CFrameQuest = CFrame.new(-3054.44, 235.54, -10142.82)
            CFrameMon = CFrame.new(-3028.22, 64.67, -9775.43)
        else
            Mon, NameMon, NameQuest, LevelQuest = "Water Fighter", "Water Fighter", "ForgottenQuest", 2
            CFrameQuest = CFrame.new(-3054.44, 235.54, -10142.82)
            CFrameMon = CFrame.new(-3352.90, 285.02, -10534.84)
        end
    elseif World3 then
        if lvl <= 1524 then
            Mon, NameMon, NameQuest, LevelQuest = "Pirate Millionaire", "Pirate Millionaire", "PiratePortQuest", 1
            CFrameQuest = CFrame.new(-450.10, 107.68, 5950.73)
            CFrameMon = CFrame.new(-245.99, 47.31, 5584.10)
        elseif lvl <= 1574 then
            Mon, NameMon, NameQuest, LevelQuest = "Pistol Billionaire", "Pistol Billionaire", "PiratePortQuest", 2
            CFrameQuest = CFrame.new(-450.10, 107.68, 5950.73)
            CFrameMon = CFrame.new(-54.81, 83.77, 5947.84)
        elseif lvl <= 1599 then
            Mon, NameMon, NameQuest, LevelQuest = "Dragon Crew Warrior", "Dragon Crew Warrior", "DragonCrewQuest", 1
            CFrameQuest = CFrame.new(6750.49, 127.45, -711.03)
            CFrameMon = CFrame.new(6709.76, 52.34, -1139.03)
        elseif lvl <= 1624 then
            Mon, NameMon, NameQuest, LevelQuest = "Dragon Crew Archer", "Dragon Crew Archer", "DragonCrewQuest", 2
            CFrameQuest = CFrame.new(6750.49, 127.45, -711.03)
            CFrameMon = CFrame.new(6668.76, 481.38, 329.12)
        elseif lvl <= 1649 then
            Mon, NameMon, NameQuest, LevelQuest = "Hydra Enforcer", "Hydra Enforcer", "VenomCrewQuest", 1
            CFrameQuest = CFrame.new(5206.40, 1004.10, 748.35)
            CFrameMon = CFrame.new(4547.11, 1003.10, 334.19)
        elseif lvl <= 1699 then
            Mon, NameMon, NameQuest, LevelQuest = "Venomous Assailant", "Venomous Assailant", "VenomCrewQuest", 2
            CFrameQuest = CFrame.new(5206.40, 1004.10, 748.35)
            CFrameMon = CFrame.new(4674.93, 1134.83, 996.31)
        elseif lvl <= 1724 then
            Mon, NameMon, NameQuest, LevelQuest = "Marine Commodore", "Marine Commodore", "MarineTreeIsland", 1
            CFrameQuest = CFrame.new(2481.09, 74.27, -6779.64)
            CFrameMon = CFrame.new(2577.25, 75.61, -7739.87)
        elseif lvl <= 1774 then
            Mon, NameMon, NameQuest, LevelQuest = "Marine Rear Admiral", "Marine Rear Admiral", "MarineTreeIsland", 2
            CFrameQuest = CFrame.new(2481.09, 74.27, -6779.64)
            CFrameMon = CFrame.new(3761.81, 123.91, -6823.52)
        elseif lvl <= 1799 then
            Mon, NameMon, NameQuest, LevelQuest = "Fishman Raider", "Fishman Raider", "DeepForestIsland3", 1
            CFrameQuest = CFrame.new(-10581.66, 330.87, -8761.19)
            CFrameMon = CFrame.new(-10407.53, 331.76, -8368.52)
        elseif lvl <= 1824 then
            Mon, NameMon, NameQuest, LevelQuest = "Fishman Captain", "Fishman Captain", "DeepForestIsland3", 2
            CFrameQuest = CFrame.new(-10581.66, 330.87, -8761.19)
            CFrameMon = CFrame.new(-10994.70, 352.38, -9002.11)
        elseif lvl <= 1849 then
            Mon, NameMon, NameQuest, LevelQuest = "Forest Pirate", "Forest Pirate", "DeepForestIsland", 1
            CFrameQuest = CFrame.new(-13234.04, 331.49, -7625.40)
            CFrameMon = CFrame.new(-13274.48, 332.38, -7769.58)
        elseif lvl <= 1899 then
            Mon, NameMon, NameQuest, LevelQuest = "Mythological Pirate", "Mythological Pirate", "DeepForestIsland", 2
            CFrameQuest = CFrame.new(-13234.04, 331.49, -7625.40)
            CFrameMon = CFrame.new(-13680.61, 501.08, -6991.19)
        elseif lvl <= 1924 then
            Mon, NameMon, NameQuest, LevelQuest = "Jungle Pirate", "Jungle Pirate", "DeepForestIsland2", 1
            CFrameQuest = CFrame.new(-12680.38, 389.97, -9902.02)
            CFrameMon = CFrame.new(-12256.16, 331.74, -10485.84)
        elseif lvl <= 1974 then
            Mon, NameMon, NameQuest, LevelQuest = "Musketeer Pirate", "Musketeer Pirate", "DeepForestIsland2", 2
            CFrameQuest = CFrame.new(-12680.38, 389.97, -9902.02)
            CFrameMon = CFrame.new(-13457.90, 391.55, -9859.18)
        elseif lvl <= 1999 then
            Mon, NameMon, NameQuest, LevelQuest = "Reborn Skeleton", "Reborn Skeleton", "HauntedQuest1", 1
            CFrameQuest = CFrame.new(-9479.22, 141.22, 5566.09)
            CFrameMon = CFrame.new(-8763.72, 165.72, 6159.86)
        elseif lvl <= 2024 then
            Mon, NameMon, NameQuest, LevelQuest = "Living Zombie", "Living Zombie", "HauntedQuest1", 2
            CFrameQuest = CFrame.new(-9479.22, 141.22, 5566.09)
            CFrameMon = CFrame.new(-10144.13, 138.63, 5838.09)
        elseif lvl <= 2049 then
            Mon, NameMon, NameQuest, LevelQuest = "Demonic Soul", "Demonic Soul", "HauntedQuest2", 1
            CFrameQuest = CFrame.new(-9516.99, 172.02, 6078.47)
            CFrameMon = CFrame.new(-9505.87, 172.10, 6158.99)
        elseif lvl <= 2074 then
            Mon, NameMon, NameQuest, LevelQuest = "Posessed Mummy", "Posessed Mummy", "HauntedQuest2", 2
            CFrameQuest = CFrame.new(-9516.99, 172.02, 6078.47)
            CFrameMon = CFrame.new(-9582.02, 6.25, 6205.48)
        elseif lvl <= 2099 then
            Mon, NameMon, NameQuest, LevelQuest = "Peanut Scout", "Peanut Scout", "NutsIslandQuest", 1
            CFrameQuest = CFrame.new(-2104.39, 38.10, -10194.22)
            CFrameMon = CFrame.new(-2143.24, 47.72, -10029.99)
        elseif lvl <= 2124 then
            Mon, NameMon, NameQuest, LevelQuest = "Peanut President", "Peanut President", "NutsIslandQuest", 2
            CFrameQuest = CFrame.new(-2104.39, 38.10, -10194.22)
            CFrameMon = CFrame.new(-1859.35, 38.10, -10422.43)
        elseif lvl <= 2149 then
            Mon, NameMon, NameQuest, LevelQuest = "Ice Cream Chef", "Ice Cream Chef", "IceCreamIslandQuest", 1
            CFrameQuest = CFrame.new(-820.65, 65.82, -10965.80)
            CFrameMon = CFrame.new(-872.25, 65.82, -10919.96)
        elseif lvl <= 2199 then
            Mon, NameMon, NameQuest, LevelQuest = "Ice Cream Commander", "Ice Cream Commander", "IceCreamIslandQuest", 2
            CFrameQuest = CFrame.new(-820.65, 65.82, -10965.80)
            CFrameMon = CFrame.new(-558.06, 112.05, -11290.77)
        elseif lvl <= 2224 then
            Mon, NameMon, NameQuest, LevelQuest = "Cookie Crafter", "Cookie Crafter", "CakeQuest1", 1
            CFrameQuest = CFrame.new(-2021.32, 37.80, -12028.73)
            CFrameMon = CFrame.new(-2374.14, 37.80, -12125.31)
        elseif lvl <= 2249 then
            Mon, NameMon, NameQuest, LevelQuest = "Cake Guard", "Cake Guard", "CakeQuest1", 2
            CFrameQuest = CFrame.new(-2021.32, 37.80, -12028.73)
            CFrameMon = CFrame.new(-1598.31, 43.77, -12244.58)
        elseif lvl <= 2274 then
            Mon, NameMon, NameQuest, LevelQuest = "Baking Staff", "Baking Staff", "CakeQuest2", 1
            CFrameQuest = CFrame.new(-1927.92, 37.80, -12842.54)
            CFrameMon = CFrame.new(-1887.81, 77.62, -12998.35)
        elseif lvl <= 2299 then
            Mon, NameMon, NameQuest, LevelQuest = "Head Baker", "Head Baker", "CakeQuest2", 2            CFrameQuest = CFrame.new(-1927.92, 37.80, -12842.54)
            CFrameMon = CFrame.new(-2216.19, 82.88, -12869.29)
        elseif lvl <= 2324 then
            Mon, NameMon, NameQuest, LevelQuest = "Cocoa Warrior", "Cocoa Warrior", "ChocQuest1", 1
            CFrameQuest = CFrame.new(233.23, 29.88, -12201.23)
            CFrameMon = CFrame.new(-21.55, 80.57, -12352.39)
        elseif lvl <= 2349 then
            Mon, NameMon, NameQuest, LevelQuest = "Chocolate Bar Battler", "Chocolate Bar Battler", "ChocQuest1", 2
            CFrameQuest = CFrame.new(233.23, 29.88, -12201.23)
            CFrameMon = CFrame.new(582.59, 77.19, -12463.16)
        elseif lvl <= 2374 then
            Mon, NameMon, NameQuest, LevelQuest = "Sweet Thief", "Sweet Thief", "ChocQuest2", 1
            CFrameQuest = CFrame.new(150.51, 30.69, -12774.50)
            CFrameMon = CFrame.new(165.19, 76.06, -12600.84)
        else
            Mon, NameMon, NameQuest, LevelQuest = "Candy Rebel", "Candy Rebel", "ChocQuest2", 2
            CFrameQuest = CFrame.new(150.51, 30.69, -12774.50)
            CFrameMon = CFrame.new(134.87, 77.25, -12876.55)
        end
    end
end

local function CheckBoss()
    local lvl = plr.Data.Level.Value
    if _G.SelectBoss == "" then
        if World1 then _G.SelectBoss = "The Gorilla King"
        elseif World2 then _G.SelectBoss = "Diamond"
        elseif World3 then _G.SelectBoss = "Stone" end
    end
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/arthurkaza-real/skjlnrwejklnrjklwe3njklwer/refs/heads/main/jewa.lua"))()

local MainWindow = Library:Window({
    Name = "Bankai Hub",
    Logo = "rbxassetid://133425623304338"
})

local MainPage = MainWindow:Page({
    Name = "Main",
    Description = "auto farm features",
    Icon = "lucide:anchor",
    Search = false
})

local PlayerPage = MainWindow:Page({
    Name = "Player",
    Description = "player options",
    Icon = "lucide:user",
    Search = false
})

local TeleportPage = MainWindow:Page({
    Name = "Teleport",
    Description = "teleport options",
    Icon = "lucide:map-pin",
    Search = false
})

local MiscPage = MainWindow:Page({
    Name = "Misc",
    Description = "misc features",
    Icon = "lucide:settings",
    Search = false
})

local MainSub = MainPage:SubPage({Icon = "rbxassetid://134546249616852", Name = "Main SubPage"})
local MainLeft = MainSub:Section({Name = "Auto Farm", Side = 1})
local MainRight = MainSub:Section({Name = "Combat", Side = 2})

local PlayerSub = PlayerPage:SubPage({Icon = "rbxassetid://134546249616852", Name = "Player SubPage"})
local PlayerLeft = PlayerSub:Section({Name = "Player Stats", Side = 1})
local PlayerRight = PlayerSub:Section({Name = "Player Combat", Side = 2})

local TeleSub = TeleportPage:SubPage({Icon = "rbxassetid://134546249616852", Name = "Teleport SubPage"})
local TeleLeft = TeleSub:Section({Name = "Islands", Side = 1})
local TeleRight = TeleSub:Section({Name = "Servers", Side = 2})

local MiscSub = MiscPage:SubPage({Icon = "rbxassetid://134546249616852", Name = "Misc SubPage"})
local MiscLeft = MiscSub:Section({Name = "Visual", Side = 1})
local MiscRight = MiscSub:Section({Name = "Utility", Side = 2})

MainLeft:Dropdown({
    Name = "Select Weapon",
    Items = {"Melee", "Sword", "Gun", "Blox Fruit"},
    Default = "Melee",
    Callback = function(v) _G.SelectWeapon = v end
})

MainLeft:Toggle({
    Name = "Auto Farm Level",
    Default = false,
    Callback = function(v)
        _G.AutoFarm = v
    end
})

MainLeft:Toggle({
    Name = "Auto Kill Near",
    Default = false,
    Callback = function(v)
        _G.AutoNear = v
    end
})

MainLeft:Toggle({
    Name = "Auto Farm Chest",
    Default = false,
    Callback = function(v)
        _G.AutoChest = v
    end
})

local bossList = {}
if World1 then
    bossList = {"The Gorilla King", "Bobby", "Yeti", "Mob Leader", "Vice Admiral", "Warden", "Chief Warden", "Swan", "Magma Admiral", "Fishman Lord", "Wysper", "Thunder God", "Cyborg"}
elseif World2 then
    bossList = {"Diamond", "Jeremy", "Fajita", "Don Swan", "Smoke Admiral", "Cursed Captain", "Order", "Awakened Ice Admiral", "Tide Keeper"}
elseif World3 then
    bossList = {"Stone", "Island Empress", "Rocket Admiral", "Captain Elephant", "Beautiful Pirate", "Longma", "Cake Queen", "Dough King"}
end

MainLeft:Dropdown({
    Name = "Select Boss",
    Items = bossList,
    Default = bossList[1] or "Stone",
    Callback = function(v) _G.SelectBoss = v end
})

MainLeft:Toggle({
    Name = "Auto Farm Boss",
    Default = false,
    Callback = function(v)
        _G.AutoBoss = v
    end
})

MainRight:Toggle({
    Name = "Auto Haki",
    Default = true,
    Callback = function(v) _G.AutoHaki = v end
})

MainRight:Toggle({
    Name = "Auto Bring Mob",
    Default = true,
    Callback = function(v) _G.BringMob = v end
})

PlayerLeft:Button({
    Name = "Reset Stats",
    Callback = function()
        CommF:InvokeServer("BlackbeardReward", "Refund", "1")
        CommF:InvokeServer("BlackbeardReward", "Refund", "2")
    end
})

PlayerLeft:Button({
    Name = "Random Race",
    Callback = function()
        CommF:InvokeServer("BlackbeardReward", "Reroll", "1")
        CommF:InvokeServer("BlackbeardReward", "Reroll", "2")
    end
})

PlayerLeft:Button({
    Name = "Join Pirates",
    Callback = function() CommF:InvokeServer("SetTeam", "Pirates") end
})

PlayerLeft:Button({
    Name = "Join Marines",
    Callback = function() CommF:InvokeServer("SetTeam", "Marines") end
})

PlayerRight:Button({
    Name = "Buy Buso Haki",
    Callback = function() CommF:InvokeServer("BuyHaki", "Buso") end
})

PlayerRight:Button({
    Name = "Buy Geppo",
    Callback = function() CommF:InvokeServer("BuyHaki", "Geppo") end
})

PlayerRight:Button({
    Name = "Buy Soru",
    Callback = function() CommF:InvokeServer("BuyHaki", "Soru") end
})

PlayerRight:Button({
    Name = "Buy Observation Haki",
    Callback = function() CommF:InvokeServer("KenTalk", "Buy") end
})

local islandList = {}
if World1 then
    islandList = {"WindMill", "Marine", "Middle Town", "Jungle", "Pirate Village", "Desert", "Snow Island", "MarineFord", "Colosseum", "Sky Island 1", "Sky Island 2", "Sky Island 3", "Prison", "Magma Village", "Under Water Island", "Fountain City", "Shank Room", "Mob Island"}
elseif World2 then
    islandList = {"The Cafe", "Frist Spot", "Dark Area", "Flamingo Mansion", "Flamingo Room", "Green Zone", "Factory", "Colossuim", "Zombie Island", "Two Snow Mountain", "Punk Hazard", "Cursed Ship", "Ice Castle", "Forgotten Island", "Ussop Island", "Mini Sky Island"}
elseif World3 then
    islandList = {"Mansion", "Port Town", "Great Tree", "Castle On The Sea", "MiniSky", "Hydra Island", "Floating Turtle", "Haunted Castle", "Ice Cream Island", "Peanut Island", "Cake Island", "Cocoa Island", "Candy Island", "Tiki Outpost"}
end

TeleLeft:Dropdown({
    Name = "Select Island",
    Items = islandList,
    Default = islandList[1] or "WindMill",
    Callback = function(v) _G.SelectIsland = v end
})

TeleLeft:Toggle({
    Name = "Tween To Island",
    Default = false,
    Callback = function(v) _G.TeleportIsland = v end
})

TeleRight:Button({
    Name = "First Sea",
    Callback = function() CommF:InvokeServer("TravelMain") end
})

TeleRight:Button({
    Name = "Second Sea",
    Callback = function() CommF:InvokeServer("TravelDressrosa") end
})

TeleRight:Button({
    Name = "Third Sea",
    Callback = function() CommF:InvokeServer("TravelZou") end
})

TeleRight:Button({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, plr)
    end
})

MiscLeft:Toggle({
    Name = "Hide Chat",
    Default = false,
    Callback = function(v)
        game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, not v)
    end
})

MiscLeft:Toggle({
    Name = "Hide Leaderboard",
    Default = false,
    Callback = function(v)
        game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, not v)
    end
})

MiscRight:Button({
    Name = "Redeem All Codes",
    Callback = function()
        local codes = {"KITTGAMING", "ENYU_IS_PRO", "FUDD10", "BIGNEWS", "THEGREATACE", "SUB2GAMERROBOT_EXP1", "STRAWHATMAINE", "SUB2OFFICIALNOOBIE", "SUB2NOOBMASTER123", "SUB2DAIGROCK", "AXIORE", "TANTAIGAMIMG", "JCWK", "FUDD10_V2", "SUB2FER999", "MAGICBIS", "TY_FOR_WATCHING", "STARCODEHEO"}
        for _, code in ipairs(codes) do
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(code)
            end)
        end
    end
})

MiscRight:Button({
    Name = "Remove Fog",
    Callback = function()
        game:GetService("Lighting").FogEnd = 9e9
        game:GetService("Lighting").Brightness = 2
    end
})

MiscRight:Button({
    Name = "FPS Boost",
    Callback = function()
        settings().Rendering.QualityLevel = "Level01"
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
                v.Material = "Plastic"
                v.Reflectance = 0
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Lifetime = NumberRange.new(0)
            end
        end
    end
})

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.SelectWeapon == "Melee" then
                for _, v in ipairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Melee" then _G.SelectWeapon = v.Name end
                end
            elseif _G.SelectWeapon == "Sword" then
                for _, v in ipairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Sword" then _G.SelectWeapon = v.Name end
                end
            elseif _G.SelectWeapon == "Gun" then
                for _, v in ipairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Gun" then _G.SelectWeapon = v.Name end
                end
            elseif _G.SelectWeapon == "Blox Fruit" then
                for _, v in ipairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Blox Fruit" then _G.SelectWeapon = v.Name end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFarm then
                CheckQuest()
                local questTitle = plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                if not string.find(questTitle, NameMon) then
                    StartBring = false
                    CommF:InvokeServer("AbandonQuest")
                end
                if plr.PlayerGui.Main.Quest.Visible == false then
                    StartBring = false
                    topos(CFrameQuest)
                    if (plr.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 20 then
                        CommF:InvokeServer("StartQuest", NameQuest, LevelQuest)
                    end
                elseif plr.PlayerGui.Main.Quest.Visible == true then
                    local found = false
                    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == Mon and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            found = true
                            if string.find(questTitle, NameMon) then
                                repeat
                                    task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    PosMon = v.HumanoidRootPart.CFrame
                                    MonFarm = v.Name
                                    StartBring = true
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    Click()
                                until not _G.AutoFarm or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
                                StartBring = false
                            else
                                StartBring = false
                                CommF:InvokeServer("AbandonQuest")
                            end
                        end
                    end
                    if not found then
                        StartBring = false
                        topos(CFrameMon)
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoNear then
                for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        if (v.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 4000 then
                            repeat
                                task.wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                Click()
                            until not _G.AutoNear or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoBoss then
                CheckBoss()
                local boss = _G.SelectBoss
                if game:GetService("Workspace").Enemies:FindFirstChild(boss) then
                    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == boss and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat
                                task.wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                Click()
                            until not _G.AutoBoss or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild(boss) then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild(boss).HumanoidRootPart.CFrame * CFrame.new(5, 10, 5))
                    else
                        local spawns = {
                            ["The Gorilla King"] = CFrame.new(-1223, 6, -502),
                            ["Bobby"] = CFrame.new(-1147, 32, 4350),
                            ["Yeti"] = CFrame.new(1221, 138, -1488),
                            ["Stone"] = CFrame.new(-1049, 40, 6791),
                            ["Island Empress"] = CFrame.new(5713, 602, 202),
                            ["Dough King"] = CFrame.new(-2151, 88, -12404),
                            ["Diamond"] = CFrame.new(-1579, 8, -1914),
                        }
                        if spawns[boss] then topos(spawns[boss]) end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoChest then
                local pos = plr.Character and plr.Character:GetPivot().Position
                if not pos then return end
                local nearest, minDist = nil, math.huge
                for _, chest in ipairs(CollectionService:GetTagged("_ChestTagged")) do
                    if not chest:GetAttribute("IsDisabled") then
                        local d = (chest:GetPivot().Position - pos).Magnitude
                        if d < minDist then minDist = d; nearest = chest end
                    end
                end
                if nearest then topos(CFrame.new(nearest:GetPivot().Position)) end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.TeleportIsland then
                local island = _G.SelectIsland
                local coords = {
                    ["WindMill"] = CFrame.new(979.80, 16.52, 1429.05),
                    ["Marine"] = CFrame.new(-2566.43, 6.86, 2045.26),
                    ["Middle Town"] = CFrame.new(-690.33, 15.09, 1582.24),
                    ["Jungle"] = CFrame.new(-1612.80, 36.85, 149.13),
                    ["Pirate Village"] = CFrame.new(-1181.31, 4.75, 3803.55),
                    ["Desert"] = CFrame.new(944.16, 20.92, 4373.30),
                    ["Snow Island"] = CFrame.new(1347.81, 104.67, -1319.74),
                    ["MarineFord"] = CFrame.new(-4914.82, 50.96, 4281.03),
                    ["Colosseum"] = CFrame.new(-1427.62, 7.29, -2792.77),
                    ["Sky Island 1"] = CFrame.new(-4869.10, 733.46, -2667.02),
                    ["Prison"] = CFrame.new(4875.33, 5.65, 734.85),
                    ["Magma Village"] = CFrame.new(-5247.72, 12.88, 8504.97),
                    ["Fountain City"] = CFrame.new(5127.13, 59.50, 4105.45),
                    ["Shank Room"] = CFrame.new(-1442.17, 29.88, -28.35),
                    ["Mob Island"] = CFrame.new(-2850.20, 7.39, 5354.99),
                    ["The Cafe"] = CFrame.new(-380.48, 77.22, 255.83),
                    ["Frist Spot"] = CFrame.new(-11.31, 29.28, 2771.52),
                    ["Dark Area"] = CFrame.new(3780.03, 22.65, -3498.59),
                    ["Flamingo Mansion"] = CFrame.new(-483.73, 332.04, 595.33),
                    ["Flamingo Room"] = CFrame.new(2284.41, 15.15, 875.73),
                    ["Green Zone"] = CFrame.new(-2448.53, 73.02, -3210.63),
                    ["Factory"] = CFrame.new(424.13, 211.16, -427.54),
                    ["Colossuim"] = CFrame.new(-1503.62, 219.80, 1369.31),
                    ["Zombie Island"] = CFrame.new(-5622.03, 492.20, -781.79),
                    ["Two Snow Mountain"] = CFrame.new(753.14, 408.24, -5274.61),
                    ["Punk Hazard"] = CFrame.new(-6127.65, 15.95, -5040.29),
                    ["Cursed Ship"] = CFrame.new(923.40, 125.06, 32885.88),
                    ["Ice Castle"] = CFrame.new(6148.41, 294.39, -6741.12),
                    ["Forgotten Island"] = CFrame.new(-3032.76, 317.90, -10075.37),
                    ["Ussop Island"] = CFrame.new(4816.86, 8.46, 2863.82),
                    ["Mini Sky Island"] = CFrame.new(-288.74, 49326.32, -35248.59),
                    ["Great Tree"] = CFrame.new(2681.27, 1682.81, -7190.99),
                    ["Castle On The Sea"] = CFrame.new(-5074.46, 314.52, -2991.05),
                    ["MiniSky"] = CFrame.new(-260.66, 49325.80, -35253.57),
                    ["Port Town"] = CFrame.new(-290.74, 6.73, 5343.55),
                    ["Hydra Island"] = CFrame.new(5255.10, 1004.19, 344.77),
                    ["Floating Turtle"] = CFrame.new(-13274.53, 531.82, -7579.22),
                    ["Haunted Castle"] = CFrame.new(-9515.37, 164.01, 5786.06),
                    ["Ice Cream Island"] = CFrame.new(-902.57, 79.93, -10988.85),
                    ["Peanut Island"] = CFrame.new(-2062.75, 50.47, -10232.57),
                    ["Cake Island"] = CFrame.new(-1884.77, 19.33, -11666.90),
                    ["Cocoa Island"] = CFrame.new(87.94, 73.55, -12319.46),
                    ["Candy Island"] = CFrame.new(-1014.42, 149.11, -14555.96),
                    ["Tiki Outpost"] = CFrame.new(-16218.68, 9.09, 445.62),
                }
                if coords[island] then
                    topos(coords[island])
                elseif island == "Sky Island 2" then
                    CommF:InvokeServer("requestEntrance", Vector3.new(-4607.82, 872.54, -1667.56))
                elseif island == "Sky Island 3" then
                    CommF:InvokeServer("requestEntrance", Vector3.new(-7894.62, 5547.14, -380.29))
                elseif island == "Under Water Island" then
                    CommF:InvokeServer("requestEntrance", Vector3.new(61163.85, 11.68, 1819.78))
                elseif island == "Mansion" then
                    CommF:InvokeServer("requestEntrance", Vector3.new(-12471.17, 374.94, -7551.68))
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.BringMob and StartBring and PosMon then
                for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == MonFarm and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        if (v.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 150 then
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v.HumanoidRootPart.CFrame = PosMon
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if _G.AutoHaki and (_G.AutoFarm or _G.AutoBoss or _G.AutoNear) then
                AutoHaki()
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFarm or _G.AutoNear or _G.AutoBoss or _G.AutoChest then
                for _, v in pairs(plr.Character:GetDescendants()) do
                    if v:IsA("BasePart") then v.CanCollide = false end
                end
                if not plr.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local noclip = Instance.new("BodyVelocity")
                    noclip.Name = "BodyClip"
                    noclip.Parent = plr.Character.HumanoidRootPart
                    noclip.MaxForce = Vector3.new(100000, 100000, 100000)
                    noclip.Velocity = Vector3.new(0, 0, 0)
                end
            end
        end)
    end
end)

Players.LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

local SettingsPage = MainWindow:CreateSettingsPage()
SettingsPage:CreateConfigsSection()
SettingsPage:CreateThemingSection()

getgenv().Library = Library
Library:CheckForAutoLoad()

Library:Notify({
    Name = "Bankai Hub",
    Content = "Loaded successfully!",
    Duration = 5
})
