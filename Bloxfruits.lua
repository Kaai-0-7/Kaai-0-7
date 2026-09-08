
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Workspace = game:GetService("Workspace")


local plr = Players.LocalPlayer
local WS = Workspace


_G.SelectWeapon = "Melee"
_G.AutoFarm = false
_G.AutoNear = false
_G.AutoFarmFruits = false
_G.selectFruitFarm = "Farm Level Mastery No Quest"
_G.FarmBone = false
_G.AutoFarmMaterial = false
_G.AutoChestFarm = false
_G.AutoCollectBerry = false
_G.AutoBossFarm = false
_G.SelectBoss = ""
_G.SelectMaterial = ""
_G.BringMonster = true
_G.BringMob = true
_G.WalkWater = true
_G.CheckPoint = false
_G.AutoHaki = true
_G.AutoActiveRaceV3 = false
_G.AutoActiveRaceV4 = false
_G.InfiniteSoru = false
_G.SpinPosition = false
_G.DodgeNoCD = false
_G.InfiniteGeppo = false
_G.InfiniteJump = false
_G.StopTween = false
_G.FastAttack = true

_G.AutoItemsQuest = false
_G.AutoQuestSea = false
_G.AutoSecondSea = false
_G.AutoBossRaid = false
_G.AutoKillGreybeard = false
_G.AutoBuyHakiColors = false
_G.AutoHakiColors = false
_G.AutoGetArticless = false


AutoSaber = false
_G.Autopole = false
_G.Autosaw = false
_G.ChiefWarden = false
_G.Trident = false


_G.CheckQuestDragon = false
_G.SelectMobQuest = "Venomous Assailant"
_G.AutoDragonQuest = false
_G.AutoFarmMobQuest = false
_G.AutoTreeDestroyer = false


function UpdatePositions()
    if _G.BringMonster or _G.BringMob then
        if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            BringPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0)
        end
    end
    if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        MPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0)
        CFrameMon = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0)
        PosMon = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0)
    end
end


MMon = ""
Mon = ""
LevelQuest = 1
NameQuest = ""
NameMon = ""
CFrameQuest = CFrame.new(0, 0, 0)

StartBring = false
MonFarm = ""
MyLevel = 0




_G.KillShark = false
_G.KillPiranha = false
_G.KillFishCrew = false
_G.AutoMysticIsland = false
_G.TweenMGear = false
_G.AutoDooHee = false
MirageIslandESP = false
_G.MirageIslandESP = false


_G.SelectChip = "Flame"
_G.AutoBuyChip = false
_G.AutoStartRaid = false
_G.AutoFarmRaidNextIsland = false
_G.AutoGetFruitLowBeli = false


_G.AutoRandomFruit = false
_G.AutoStoreFruit = false
_G.AutoEatFruit = false
_G.SelectFruitEat = "Flame"
_G.AutoDropFruit = false
_G.SelectFruitDrop = "Flame"


World1 = game.PlaceId == 2753915549
World2 = game.PlaceId == 4442272183  
World3 = game.PlaceId == 7449423635


SkillZ = true
SkillX = false
SkillC = false
SkillV = false
SkillF = false
KillPercent = "25"


if game.PlaceId == 2753915549 then
    World1 = true
elseif game.PlaceId == 4442272183 then
    World2 = true
elseif game.PlaceId == 7449423635 then
    World3 = true
end

function AutoHaki()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    if character and not character:FindFirstChild("HasBuso") then
        local remote = game:GetService("ReplicatedStorage").Remotes.CommF_
        if remote then
            remote:InvokeServer("Buso") 
        end
    end
end

function EquipWeapon(ToolSe)
    if not _G.NotAutoEquip then
        if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
            Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
            wait(.1)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
        end
    end
end

function Click()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
end

function StopTween(target)
    local plyr = game:GetService("Players").LocalPlayer
    local char = plyr.Character

    if not target then
        _G.StopTween = true
        wait(0.2)
        topos(char.HumanoidRootPart.CFrame)
        wait(0.2)
        if char.HumanoidRootPart:FindFirstChild("BodyClip") then
            char.HumanoidRootPart.BodyClip:Destroy()
        end
        if char:FindFirstChild("Block") then
            char.Block:Destroy()
        end
        _G.StopTween = false
        _G.Clip = false
    end

    if char:FindFirstChild("Highlight") then
        char.Highlight:Destroy()
    end
end

local isTeleporting = false

function WaitHRP(q0)
    if not q0 then return end
    return q0.Character:WaitForChild("HumanoidRootPart", 9)
end

function CheckNearestTeleporter(aI)
    local vcspos = aI.Position
    local minDist = math.huge
    local chosenTeleport = nil
    local y = game.PlaceId

    local TableLocations = {}

    if y == 2753915549 then
        TableLocations = {
            ["Sky3"] = Vector3.new(-7894, 5547, -380),
            ["Sky3Exit"] = Vector3.new(-4607, 874, -1667),
            ["UnderWater"] = Vector3.new(61163, 11, 1819),
            ["Underwater City"] = Vector3.new(61165.19140625, 0.18704631924629211, 1897.379150390625),
            ["Pirate Village"] = Vector3.new(-1242.4625244140625, 4.787059783935547, 3901.282958984375),
            ["UnderwaterExit"] = Vector3.new(4050, -1, -1814)
        }
    elseif y == 4442272183 then
        TableLocations = {
            ["Swan Mansion"] = Vector3.new(-390, 332, 673),
            ["Swan Room"] = Vector3.new(2285, 15, 905),
            ["Cursed Ship"] = Vector3.new(923, 126, 32852),
            ["Zombie Island"] = Vector3.new(-6509, 83, -133)
        }
    elseif y == 7449423635 then
        TableLocations = {
            ["Floating Turtle"] = Vector3.new(-12462, 375, -7552),
            ["Hydra Island"] = Vector3.new(5657.88623046875, 1013.0790405273438, -335.4996337890625),
            ["Mansion"] = Vector3.new(-12462, 375, -7552),
            ["Castle"] = Vector3.new(-5036, 315, -3179),
            ["Dimensional Shift"] = Vector3.new(-2097.3447265625, 4776.24462890625, -15013.4990234375),
            ["Beautiful Pirate"] = Vector3.new(5319, 23, -93),
            ["Beautiful Room"] = Vector3.new(5314.58203, 22.5364361, -125.942276, 1, 2.14762768e-08, -1.99111154e-13, -2.14762768e-08, 1, -3.0510602e-08, 1.98455903e-13, 3.0510602e-08, 1),
            ["Temple of Time"] = Vector3.new(28286, 14897, 103)
        }
    end

    for _, v in pairs(TableLocations) do
        local dist = (v - vcspos).Magnitude
        if dist < minDist then
            minDist = dist
            chosenTeleport = v
        end
    end

    local playerPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    if minDist <= (vcspos - playerPos).Magnitude then
        return chosenTeleport
    end
end

function requestEntrance(teleportPos)
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", teleportPos)
    local char = game.Players.LocalPlayer.Character.HumanoidRootPart
    char.CFrame = char.CFrame + Vector3.new(0, 50, 0)
    task.wait(0.5)
end

function topos(Pos)
    local plr = game.Players.LocalPlayer
    if plr.Character and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("HumanoidRootPart") then
        local Distance = (Pos.Position - plr.Character.HumanoidRootPart.Position).Magnitude
        if not Pos then 
            return 
        end
        local nearestTeleport = CheckNearestTeleporter(Pos)
        if nearestTeleport then
            requestEntrance(nearestTeleport)
        end
        if not plr.Character:FindFirstChild("PartTele") then
            local PartTele = Instance.new("Part", plr.Character)
            PartTele.Size = Vector3.new(10,1,10)
            PartTele.Name = "PartTele"
            PartTele.Anchored = true
            PartTele.Transparency = 1
            PartTele.CanCollide = true
            PartTele.CFrame = WaitHRP(plr).CFrame 
            PartTele:GetPropertyChangedSignal("CFrame"):Connect(function()
                if not isTeleporting then return end
                task.wait()
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    WaitHRP(plr).CFrame = PartTele.CFrame
                end
            end)
        end
        isTeleporting = true
        local Tween = game:GetService("TweenService"):Create(plr.Character.PartTele, TweenInfo.new(Distance / 360, Enum.EasingStyle.Linear), {CFrame = Pos})
        Tween:Play()
        Tween.Completed:Connect(function(status)
            if status == Enum.PlaybackState.Completed then
                if plr.Character:FindFirstChild("PartTele") then
                    plr.Character.PartTele:Destroy()
                end
                isTeleporting = false
            end
        end)
    end
end

function stopTeleport()
    isTeleporting = false
    local plr = game.Players.LocalPlayer
    if plr.Character:FindFirstChild("PartTele") then
        plr.Character.PartTele:Destroy()
    end
end

function TelePPlayer(P)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
end

function TPB(CFgo)
    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame.Position - CFgo.Position).Magnitude/300, Enum.EasingStyle.Linear)
    tween = tween_s:Create(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat, info, {CFrame = CFgo})
    tween:Play()

    local tweenfunc = {}

    function tweenfunc:Stop()
        tween:Cancel()
    end

    return tweenfunc
end

function TPP(CFgo)
    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 or not game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then tween:Cancel() repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") and game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 wait(7) return end
    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/325, Enum.EasingStyle.Linear)
    tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = CFgo})
    tween:Play()

    local tweenfunc = {}

    function tweenfunc:Stop()
        tween:Cancel()
    end

    return tweenfunc
end

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFindPrehistoric or _G.AutoFindZonePrehistoric or _G.TweenToPrehistoric or _G.AutoDefendPrehistoric or _G.AutoKillGolem or _G.AutoKillAuraGolem or _G.CollectBone or _G.CollectEgg or _G.TweenToKitsune or _G.AutoAzuerEmber or _G.SailBoat or _G.Autoterrorshark then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            else
                if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
                end
            end
        end)
    end
end)

spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.AutoFindPrehistoric or _G.AutoFindZonePrehistoric or _G.TweenToPrehistoric or _G.AutoDefendPrehistoric or _G.AutoKillGolem or _G.AutoKillAuraGolem or _G.CollectBone or _G.CollectEgg or _G.TweenToKitsune or _G.AutoAzuerEmber or _G.SailBoat or _G.Autoterrorshark then
                for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end)
end)


function round(num)
    return math.floor(num + 0.5)
end

function UpdateIslandKisuneESP()
    for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if _G.KitsuneIslandEsp then
                if v.Name == "Kitsune Island" then
                    if not v:FindFirstChild("NameEsp") then
                        local bill = Instance.new("BillboardGui", v)
                        bill.Name = "NameEsp"
                        bill.ExtentsOffset = Vector3.new(0, 2.5, 0)
                        bill.Size = UDim2.new(0, 230, 0, 60)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        bill.LightInfluence = 0
                        bill.MaxDistance = 3000
                        local name = Instance.new("TextLabel", bill)
                        name.Font = Enum.Font.FredokaOne
                        name.TextSize = 22
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = Enum.TextYAlignment.Center
                        name.BackgroundTransparency = 0.15
                        name.BackgroundColor3 = Color3.fromRGB(18, 26, 31)
                        name.BorderSizePixel = 0
                        name.TextStrokeTransparency = 0.18
                        name.TextStrokeColor3 = Color3.fromRGB(12, 203, 214)
                        name.TextColor3 = Color3.fromRGB(80, 245, 245)
                        name.Text = v.Name .. "\n–"
                    end
                    local distance = round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Position).Magnitude / 3)
                    v["NameEsp"].TextLabel.Text = string.format("🦊 %s\n%.0f M", v.Name, distance)
                end
            else
                if v:FindFirstChild("NameEsp") then
                    v:FindFirstChild("NameEsp"):Destroy()
                end
            end
        end)
    end
end

function UpdateIslandMirageESP()
    for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if _G.MirageIslandESP then
                if v.Name == "Mirage Island" then
                    if not v:FindFirstChild("NameEsp") then
                        local bill = Instance.new("BillboardGui", v)
                        bill.Name = "NameEsp"
                        bill.ExtentsOffset = Vector3.new(0, 2.5, 0)
                        bill.Size = UDim2.new(0, 235, 0, 62)
                        bill.AlwaysOnTop = true
                        bill.LightInfluence = 0
                        bill.MaxDistance = 3000
                        bill.Adornee = v
                        local name = Instance.new("TextLabel", bill)
                        name.Font = Enum.Font.FredokaOne
                        name.TextSize = 22
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = Enum.TextYAlignment.Center
                        name.BackgroundTransparency = 0.1
                        name.BackgroundColor3 = Color3.fromRGB(24, 18, 26)
                        name.BorderSizePixel = 0
                        name.TextStrokeTransparency = 0.15
                        name.TextStrokeColor3 = Color3.fromRGB(120, 100, 245)
                        name.TextColor3 = Color3.fromRGB(160, 160, 245)
                        name.Text = v.Name .. "\n–"
                    end
                    local distance = round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Position).Magnitude / 3)
                    v["NameEsp"].TextLabel.Text = string.format("🔮 %s\n%.0f M", v.Name, distance)
                end
            else
                if v:FindFirstChild("NameEsp") then
                    v:FindFirstChild("NameEsp"):Destroy()
                end
            end
        end)
    end
end

function isnil(x)
    return x == nil
end

Number = math.random(1, 1000000)

function UpdateIslandESP()
    for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if IslandESP then
                if v.Name ~= "Sea" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new("BillboardGui", v)
                        bill.Name = "NameEsp"
                        bill.ExtentsOffset = Vector3.new(0, 2.3, 0)
                        bill.Size = UDim2.new(0, 225, 0, 56)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        bill.MaxDistance = 2200
                        bill.LightInfluence = 0
                        local name = Instance.new("TextLabel", bill)
                        name.Font = Enum.Font.FredokaOne
                        name.TextSize = 21
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = Enum.TextYAlignment.Center
                        name.BackgroundTransparency = 0.16
                        name.BackgroundColor3 = Color3.fromRGB(10, 20, 55)
                        name.BorderSizePixel = 0
                        name.TextStrokeTransparency = 0.17
                        name.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
                        name.TextColor3 = Color3.fromRGB(234, 238, 241)
                        name.Text = v.Name .. "\n–"
                    end
                    local distance = round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Position).Magnitude / 3)
                    v["NameEsp"].TextLabel.Text = string.format("🏝 %s\n%.0f M", v.Name, distance)
                end
            else
                if v:FindFirstChild("NameEsp") then
                    v:FindFirstChild("NameEsp"):Destroy()
                end
            end
        end)
    end
end

function UpdatePlayerChams()
    for _, v in pairs(game:GetService("Players"):GetPlayers()) do
        pcall(function()
            if not isnil(v.Character) then
                if ESPPlayer then
                    if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
                        local bill = Instance.new("BillboardGui", v.Character.Head)
                        bill.Name = "NameEsp"..Number
                        bill.ExtentsOffset = Vector3.new(0, 2, 0)
                        bill.Size = UDim2.new(0, 170, 0, 45)
                        bill.Adornee = v.Character.Head
                        bill.AlwaysOnTop = true
                        bill.MaxDistance = 2200
                        bill.LightInfluence = 0
                        local name = Instance.new("TextLabel", bill)
                        name.Font = Enum.Font.FredokaOne
                        name.TextSize = 16
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = Enum.TextYAlignment.Center
                        name.BackgroundTransparency = 0.13
                        name.BackgroundColor3 = Color3.fromRGB(37, 37, 62)
                        name.BorderSizePixel = 0
                        name.TextStrokeTransparency = 0.1
                        if v.Team == game.Players.LocalPlayer.Team then
                            name.TextStrokeColor3 = Color3.fromRGB(27, 221, 79)
                            name.TextColor3 = Color3.fromRGB(60, 255, 140)
                        else
                            name.TextStrokeColor3 = Color3.fromRGB(251, 65, 65)
                            name.TextColor3 = Color3.fromRGB(235, 86, 89)
                        end
                        name.Text = v.Name
                    end
                    if not isnil(v.Character.Head['NameEsp'..Number]) then
                        local dist = (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude / 3
                        local health = v.Character.Humanoid.Health
                        local maxHealth = v.Character.Humanoid.MaxHealth
                        local ratio = maxHealth > 0 and ((health / maxHealth) * 100) or 0
                        v.Character.Head['NameEsp'..Number].TextLabel.Text = string.format("%s\n%.0fM | 🩸%.0f%%", v.Name, round(dist), round(ratio))
                    end
                else
                    if not isnil(v.Character.Head) and v.Character.Head:FindFirstChild('NameEsp'..Number) then
                        v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
                    end
                end
            end
        end)
    end
end

function UpdateChestESP()
    for _, chest in pairs(game:GetService("CollectionService"):GetTagged("_ChestTagged")) do
        pcall(function()
            if _G.ChestESP then
                if not chest:GetAttribute("IsDisabled") then
                    if not chest:FindFirstChild("ChestEsp") then
                        local bill = Instance.new("BillboardGui", chest)
                        bill.Name = "ChestEsp"
                        bill.ExtentsOffset = Vector3.new(0, 2, 0)
                        bill.Size = UDim2.new(0, 128, 0, 35)
                        bill.Adornee = chest
                        bill.AlwaysOnTop = true
                        bill.LightInfluence = 0
                        bill.MaxDistance = 1600
                        local name = Instance.new("TextLabel", bill)
                        name.Font = Enum.Font.FredokaOne
                        name.TextSize = 15
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = Enum.TextYAlignment.Center
                        name.BackgroundTransparency = 0.1
                        name.BackgroundColor3 = Color3.fromRGB(28, 21, 3)
                        name.BorderSizePixel = 0
                        name.TextStrokeTransparency = 0.13
                        name.TextStrokeColor3 = Color3.fromRGB(225, 206, 55)
                        name.TextColor3 = Color3.fromRGB(252, 206, 51)
                        name.Text = "Chest"
                    end
                    local distance = round((game:GetService("Players").LocalPlayer.Character.Head.Position - chest:GetPivot().Position).Magnitude / 3)
                    chest["ChestEsp"].TextLabel.Text = string.format("💰 Chest\n%.0f M", distance)
                end
            else
                if chest:FindFirstChild("ChestEsp") then
                    chest:FindFirstChild("ChestEsp"):Destroy()
                end
            end
        end)
    end
end

function UpdateDevilChams()
    for _, v in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if DevilFruitESP then
                if string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") then
                    if not v.Handle:FindFirstChild("NameEsp"..Number) then
                        local bill = Instance.new("BillboardGui", v.Handle)
                        bill.Name = "NameEsp"..Number
                        bill.ExtentsOffset = Vector3.new(0, 2.5, 0)
                        bill.Size = UDim2.new(0, 170, 0, 45)
                        bill.Adornee = v.Handle
                        bill.AlwaysOnTop = true
                        bill.MaxDistance = 1700
                        bill.LightInfluence = 0
                        local name = Instance.new("TextLabel", bill)
                        name.Font = Enum.Font.FredokaOne
                        name.TextSize = 18
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = Enum.TextYAlignment.Center
                        name.BackgroundTransparency = 0.23
                        name.BackgroundColor3 = Color3.fromRGB(37, 62, 92)
                        name.BorderSizePixel = 0
                        name.TextStrokeTransparency = 0.1
                        name.TextStrokeColor3 = Color3.fromRGB(18, 241, 207)
                        name.TextColor3 = Color3.fromRGB(57, 236, 241)
                        name.Text = v.Name
                    end
                    local distance = round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude / 3)
                    v.Handle['NameEsp'..Number].TextLabel.Text = string.format("🍈 %s\n%.0f M", v.Name, distance)
                end
            else
                if v:FindFirstChild("Handle") and v.Handle:FindFirstChild("NameEsp"..Number) then
                    v.Handle:FindFirstChild("NameEsp"..Number):Destroy()
                end
            end
        end)
    end
end

function UpdateFlowerChams()
    for _, v in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if v.Name == "Flower2" or v.Name == "Flower1" then
                if FlowerESP then
                    if not v:FindFirstChild("NameEsp"..Number) then
                        local bill = Instance.new("BillboardGui", v)
                        bill.Name = "NameEsp"..Number
                        bill.ExtentsOffset = Vector3.new(0, 1.8, 0)
                        bill.Size = UDim2.new(0, 128, 0, 38)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        bill.LightInfluence = 0
                        bill.MaxDistance = 1000
                        local name = Instance.new("TextLabel", bill)
                        name.Font = Enum.Font.FredokaOne
                        name.TextSize = 16
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = Enum.TextYAlignment.Center
                        name.BackgroundTransparency = 0.09
                        name.BackgroundColor3 = Color3.fromRGB(32, 31, 37)
                        name.BorderSizePixel = 0
                        name.TextStrokeTransparency = 0.11
                        if v.Name == "Flower1" then
                            name.TextColor3 = Color3.fromRGB(0, 123, 255)
                            name.TextStrokeColor3 = Color3.fromRGB(0, 39, 255)
                            name.Text = "💠 Blue Flower"
                        else
                            name.TextColor3 = Color3.fromRGB(240, 85, 110)
                            name.TextStrokeColor3 = Color3.fromRGB(227, 10, 55)
                            name.Text = "💮 Red Flower"
                        end
                    end
                    local distance = round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Position).Magnitude / 3)
                    if v:FindFirstChild("NameEsp"..Number) then
                        if v.Name == "Flower1" then
                            v["NameEsp"..Number].TextLabel.Text = string.format("💠 Blue Flower\n%.0f M", distance)
                        else
                            v["NameEsp"..Number].TextLabel.Text = string.format("💮 Red Flower\n%.0f M", distance)
                        end
                    end
                else
                    if v:FindFirstChild("NameEsp"..Number) then
                        v:FindFirstChild("NameEsp"..Number):Destroy()
                    end
                end
            end
        end)
    end
end

function UpdateRealFruitChams()
    for _, v in pairs(game.Workspace.AppleSpawner:GetChildren()) do
        if v:IsA("Tool") then
            if RealFruitESP then
                if not v.Handle:FindFirstChild("NameEsp"..Number) then
                    local bill = Instance.new("BillboardGui", v.Handle)
                    bill.Name = "NameEsp"..Number
                    bill.ExtentsOffset = Vector3.new(0, 2, 0)
                    bill.Size = UDim2.new(0, 128, 0, 30)
                    bill.Adornee = v.Handle
                    bill.AlwaysOnTop = true
                    bill.MaxDistance = 900
                    bill.LightInfluence = 0
                    local name = Instance.new("TextLabel", bill)
                    name.Font = Enum.Font.FredokaOne
                    name.TextSize = 14
                    name.TextWrapped = true
                    name.Size = UDim2.new(1, 0, 1, 0)
                    name.TextYAlignment = Enum.TextYAlignment.Center
                    name.BackgroundTransparency = 0.23
                    name.BackgroundColor3 = Color3.fromRGB(80, 26, 26)
                    name.BorderSizePixel = 0
                    name.TextStrokeTransparency = 0.11
                    name.TextStrokeColor3 = Color3.fromRGB(255, 9, 37)
                    name.TextColor3 = Color3.fromRGB(255, 0, 0)
                    name.Text = v.Name
                end
                local distance = round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude / 3)
                v.Handle["NameEsp"..Number].TextLabel.Text = string.format("🍎 %s\n%.0f M", v.Name, distance)
            else
                if v.Handle:FindFirstChild("NameEsp"..Number) then
                    v.Handle:FindFirstChild("NameEsp"..Number):Destroy()
                end
            end
        end
    end
    for _, v in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
        if v:IsA("Tool") then
            if RealFruitESP then
                if not v.Handle:FindFirstChild("NameEsp"..Number) then
                    local bill = Instance.new("BillboardGui", v.Handle)
                    bill.Name = "NameEsp"..Number
                    bill.ExtentsOffset = Vector3.new(0, 2, 0)
                    bill.Size = UDim2.new(0, 128, 0, 30)
                    bill.Adornee = v.Handle
                    bill.AlwaysOnTop = true
                    bill.MaxDistance = 900
                    bill.LightInfluence = 0
                    local name = Instance.new("TextLabel", bill)
                    name.Font = Enum.Font.FredokaOne
                    name.TextSize = 14
                    name.TextWrapped = true
                    name.Size = UDim2.new(1, 0, 1, 0)
                    name.TextYAlignment = Enum.TextYAlignment.Center
                    name.BackgroundTransparency = 0.23
                    name.BackgroundColor3 = Color3.fromRGB(199, 151, 41)
                    name.BorderSizePixel = 0
                    name.TextStrokeTransparency = 0.11
                    name.TextStrokeColor3 = Color3.fromRGB(255, 194, 39)
                    name.TextColor3 = Color3.fromRGB(255, 174, 0)
                    name.Text = v.Name
                end
                local distance = round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude / 3)
                v.Handle["NameEsp"..Number].TextLabel.Text = string.format("🍍 %s\n%.0f M", v.Name, distance)
            else
                if v.Handle:FindFirstChild("NameEsp"..Number) then
                    v.Handle:FindFirstChild("NameEsp"..Number):Destroy()
                end
            end
        end
    end
    for _, v in pairs(game.Workspace.BananaSpawner:GetChildren()) do
        if v:IsA("Tool") then
            if RealFruitESP then
                if not v.Handle:FindFirstChild("NameEsp"..Number) then
                    local bill = Instance.new("BillboardGui", v.Handle)
                    bill.Name = "NameEsp"..Number
                    bill.ExtentsOffset = Vector3.new(0, 2, 0)
                    bill.Size = UDim2.new(0, 128, 0, 30)
                    bill.Adornee = v.Handle
                    bill.AlwaysOnTop = true
                    bill.MaxDistance = 900
                    bill.LightInfluence = 0
                    local name = Instance.new("TextLabel", bill)
                    name.Font = Enum.Font.FredokaOne
                    name.TextSize = 14
                    name.TextWrapped = true
                    name.Size = UDim2.new(1, 0, 1, 0)
                    name.TextYAlignment = Enum.TextYAlignment.Center
                    name.BackgroundTransparency = 0.23
                    name.BackgroundColor3 = Color3.fromRGB(235, 214, 33)
                    name.BorderSizePixel = 0
                    name.TextStrokeTransparency = 0.11
                    name.TextStrokeColor3 = Color3.fromRGB(255, 255, 44)
                    name.TextColor3 = Color3.fromRGB(255, 255, 0)
                    name.Text = v.Name
                end
                local distance = round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude / 3)
                v.Handle["NameEsp"..Number].TextLabel.Text = string.format("🍌 %s\n%.0f M", v.Name, distance)
            else
                if v.Handle:FindFirstChild("NameEsp"..Number) then
                    v.Handle:FindFirstChild("NameEsp"..Number):Destroy()
                end
            end
        end
    end
end

function UpdateGeaESP()
    for _, v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
        pcall(function()
            if GearESP then
                if v.Name == "MeshPart" then
                    if not v:FindFirstChild("NameEsp") then
                        local bill = Instance.new("BillboardGui", v)
                        bill.Name = "NameEsp"
                        bill.ExtentsOffset = Vector3.new(0, 2.2, 0)
                        bill.Size = UDim2.new(0, 148, 0, 36)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        bill.MaxDistance = 1400
                        bill.LightInfluence = 0
                        local name = Instance.new("TextLabel", bill)
                        name.Font = Enum.Font.FredokaOne
                        name.TextSize = 15
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = Enum.TextYAlignment.Center
                        name.BackgroundTransparency = 0.26
                        name.BackgroundColor3 = Color3.fromRGB(80, 245, 245)
                        name.BorderSizePixel = 0
                        name.TextStrokeTransparency = 0.08
                        name.TextStrokeColor3 = Color3.fromRGB(43, 67, 105)
                        name.TextColor3 = Color3.fromRGB(12, 203, 214)
                        name.Text = v.Name
                    end
                    local distance = round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Position).Magnitude / 3)
                    v["NameEsp"].TextLabel.Text = string.format("⚙️ %s\n%.0f M", v.Name, distance)
                end
            else
                if v:FindFirstChild("NameEsp") then
                    v:FindFirstChild("NameEsp"):Destroy()
                end
            end
        end)
    end
end

function UpdateBerriesESP()
    local CollectionService = game:GetService("CollectionService")
    local BerryBushes = CollectionService:GetTagged("BerryBush")
    for _, Bush in pairs(BerryBushes) do
        pcall(function()
            for AttributeName, Berry in pairs(Bush:GetAttributes()) do
                if Berry then
                    if not Bush.Parent:FindFirstChild("BerryESP") then
                        local bill = Instance.new("BillboardGui", Bush.Parent)
                        bill.Name = "BerryESP"
                        bill.ExtentsOffset = Vector3.new(0, 2.1, 0)
                        bill.Size = UDim2.new(0, 110, 0, 27)
                        bill.Adornee = Bush.Parent
                        bill.AlwaysOnTop = true
                        bill.MaxDistance = 880
                        bill.LightInfluence = 0
                        local name = Instance.new("TextLabel", bill)
                        name.Font = Enum.Font.FredokaOne
                        name.TextSize = 13
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = Enum.TextYAlignment.Center
                        name.BackgroundTransparency = 0.23
                        name.BackgroundColor3 = Color3.fromRGB(23, 23, 3)
                        name.BorderSizePixel = 0
                        name.TextStrokeTransparency = 0.12
                        name.TextStrokeColor3 = Color3.fromRGB(218, 255, 86)
                        name.TextColor3 = Color3.fromRGB(226, 255, 97)
                        name.Text = Berry
                    end
                    local Player = game:GetService("Players").LocalPlayer
                    if Player and Player.Character and Player.Character:FindFirstChild("Head") then
                        local Position = Player.Character.Head.Position
                        local Magnitude = (Bush.Parent:GetPivot().Position - Position).Magnitude
                        Bush.Parent.BerryESP.TextLabel.Text = string.format("🍇 %s\n%.0fm", Berry, math.floor(Magnitude / 3))
                    end
                else
                    if Bush.Parent:FindFirstChild("NameEsp") then
                        Bush.Parent:FindFirstChild("NameEsp"):Destroy()
                    end
                end
            end
        end)
    end
end

function UpdatePrehistoricIslandESP()
    for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if PrehistoricIslandESP then
                if v.Name == "PrehistoricIsland" then
                    if not v:FindFirstChild("NameEsp") then
                        local bill = Instance.new("BillboardGui", v)
                        bill.Name = "NameEsp"
                        bill.ExtentsOffset = Vector3.new(0, 2.2, 0)
                        bill.Size = UDim2.new(0, 163, 0, 40)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        bill.MaxDistance = 2100
                        bill.LightInfluence = 0
                        local name = Instance.new("TextLabel", bill)
                        name.Font = Enum.Font.FredokaOne
                        name.TextSize = 16
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = Enum.TextYAlignment.Center
                        name.BackgroundTransparency = 0.15
                        name.BackgroundColor3 = Color3.fromRGB(80, 245, 245)
                        name.BorderSizePixel = 0
                        name.TextStrokeTransparency = 0.07
                        name.TextStrokeColor3 = Color3.fromRGB(46, 71, 107)
                        name.TextColor3 = Color3.fromRGB(10, 145, 170)
                        name.Text = v.Name
                    end
                    local distance = round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Position).Magnitude / 3)
                    v["NameEsp"].TextLabel.Text = string.format("🦖 %s\n%.0f M", v.Name, distance)
                end
            else
                if v:FindFirstChild("NameEsp") then
                    v:FindFirstChild("NameEsp"):Destroy()
                end
            end
        end)
    end
end


function BTP(p)
    pcall(function()
        if (p.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 1500 and not Auto_Raid and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
            repeat wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
                wait(.05)
                game.Players.LocalPlayer.Character.Head:Destroy()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
            until (p.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 1500 and game.Players.LocalPlayer.Character.Humanoid.Health > 0
        end
    end)
end

function TP1(Pos)
    topos(Pos)
end

function BringMob(huh)
    if _G.BringMonster or _G.BringMob then
        if plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            BringPos = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0)
        end
    end
    if plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        MPos = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0)
        CFrameMon = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0)
        PosMon = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0)
    end

    for i, v in pairs(WS.Enemies:GetChildren()) do
        if v.Name == huh 
        and v.Parent 
        and v:FindFirstChild("HumanoidRootPart") 
        and v:FindFirstChild("Humanoid") 
        and v.Humanoid.Health > 0 
        and (v.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 350 
        then
            v.HumanoidRootPart.CFrame = BringPos
            v.Humanoid.JumpPower = 0
            v.Humanoid.WalkSpeed = 0
            v.HumanoidRootPart.Transparency = 1
            v.HumanoidRootPart.CanCollide = false
            if v:FindFirstChild("Head") then
                v.Head.CanCollide = false
            end
            if v.Humanoid:FindFirstChild("Animator") then
                v.Humanoid.Animator:Destroy()
            end
            if not v.HumanoidRootPart:FindFirstChild("Lock") then
                local lock = Instance.new("BodyVelocity")
                lock.Parent = v.HumanoidRootPart
                lock.Name = "Lock"
                lock.MaxForce = Vector3.new(100000, 100000, 100000)
                lock.Velocity = Vector3.new(0, 0, 0)
            end
            sethiddenproperty(plr, "SimulationRadius", math.huge)
            v.Humanoid:ChangeState(11)
        end
    end
end

function MaterialMon()
    if _G.SelectMaterial == "Farm Leather + Scrap Metal" then
        MMon = "Brute"
        MPos = CFrame.new(-1145, 15, 4350)
    elseif  _G.SelectMaterial == "Radiactive Material" then
        MMon = "Factory Staff"
        MPos = CFrame.new(-105.889565, 72.8076935, -670.247986, -0.965929747, 0, -0.258804798, 0, 1, 0, 0.258804798, 0, -0.965929747)
        SP = "Bar"
    elseif _G.SelectMaterial == "Farm Fish Tail" then
        if World1 then
            MMon = "Fishman Warrior"
            MPos = CFrame.new(61123, 19, 1569)
        elseif World3 then
            MMon = "Fishman Raider"
            MPos = CFrame.new(-10407, 332, -8757)
        end
    elseif _G.SelectMaterial == "Farm Magma Ore" then
        if World1 then
            MMon = "Military Spy"
            MPos = CFrame.new(-5815, 84, 8820)
        elseif World2 then
            MMon = "Magma Ninja"
            MPos = CFrame.new(-5428, 78, -5959)
        end
        
    elseif _G.SelectMaterial == "Farm Angel Wings" then
        MMon = "God's Guard"
        MPos = CFrame.new(-4698, 845, -1912)
    elseif _G.SelectMaterial == "Farm Radiactive Material" then
        MMon = "Factory Staff"
        MPos = CFrame.new(295, 73, -56)
    elseif _G.SelectMaterial == "Farm Vampire Fang" then
        MMon = "Vampire"
        MPos = CFrame.new(-6033, 7, -1317)
    elseif _G.SelectMaterial == "Farm Mystic Droplet" then
        MMon = "Water Fighter"
        MPos = CFrame.new(-3385, 239, -10542)
    elseif _G.SelectMaterial == "Farm Ectoplasm" then
        MMon = "Ship Deckhand"
        MPos = CFrame.new(1198, 126, 33031)
    elseif _G.SelectMaterial == "Farm Mini Tusk" then
        MMon = "Mythological Pirate"
        MPos = CFrame.new(-13545, 470, -6917)
    elseif _G.SelectMaterial == "Farm Dragon Scale" then
        MMon = "Dragon Crew Archer"
        MPos = CFrame.new(6594, 383, 139)
    elseif _G.SelectMaterial == "Farm Conjured Cocoa" then
        MMon = "Chocolate Bar Battler"
        MPos = CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625)
    end
end

do
    local Modules = ReplicatedStorage:WaitForChild("Modules")
    local Net = Modules:WaitForChild("Net")
    local RegisterAttack = Net:WaitForChild("RE/RegisterAttack")
    local RegisterHit = Net:WaitForChild("RE/RegisterHit")

    local combatThread = false
    pcall(function()
        combatThread = require(Modules.Flags).COMBAT_REMOTE_THREAD or false
    end)

    local SendHitsToServer = nil
    task.defer(function()
        local playerScripts = plr:WaitForChild("PlayerScripts")
        local localScript = playerScripts:FindFirstChildOfClass("LocalScript")
        while not localScript do
            playerScripts.ChildAdded:Wait()
            localScript = playerScripts:FindFirstChildOfClass("LocalScript")
        end
        if getsenv then
            local ok, env = pcall(getsenv, localScript)
            if ok and env then
                SendHitsToServer = (env._G and env._G.SendHitsToServer) or env.SendHitsToServer
            end
        end
    end)

    local HitboxLimbs = {"RightLowerArm", "RightUpperArm", "LeftLowerArm", "LeftUpperArm", "RightHand", "LeftHand"}
    local lastAttackTick = 0
    local comboDebounce = 0
    local m1Combo = 0

    local function IsAlive(character)
        if not character then return false end
        local hum = character:FindFirstChild("Humanoid")
        return hum and hum.Health > 0
    end

    local function IsStunned(humanoid)
        for _, name in ipairs({"Stun", "Stun Value", "StunValue"}) do
            local val = humanoid:FindFirstChild(name)
            if val and val.Value > 0 then return true end
        end
        return false
    end

    local function GetCombo()
        local combo = (tick() - comboDebounce <= 0.4) and m1Combo or 0
        combo = combo >= 4 and 1 or combo + 1
        comboDebounce = tick()
        m1Combo = combo
        return combo
    end

    local function ProcessEnemies(folder, originPos, distance, isPlayerFolder)
        local enemyRootPart = nil
        local others = {}
        for _, enemy in folder:GetChildren() do
            local hitPart = enemy:FindFirstChild(HitboxLimbs[math.random(#HitboxLimbs)])
                or enemy:FindFirstChild("HumanoidRootPart")
                or enemy.PrimaryPart
            if hitPart and enemy ~= plr.Character and IsAlive(enemy) then
                if isPlayerFolder then
                    local p = Players:GetPlayerFromCharacter(enemy)
                    if p and p == plr then continue end
                end
                if (originPos - hitPart.Position).Magnitude <= distance then
                    if enemyRootPart then
                        table.insert(others, {enemy, hitPart})
                    else
                        enemyRootPart = hitPart
                    end
                end
            end
        end
        return enemyRootPart, others
    end

    local function UseFruitM1(character, tool)
        local pos = character:GetPivot().Position
        local closestPart, closestChar = nil, nil

        for _, enemy in WS.Enemies:GetChildren() do
            local hrp = enemy:FindFirstChild("HumanoidRootPart")
            if hrp and IsAlive(enemy) and (pos - hrp.Position).Magnitude < 60 then
                closestPart = hrp
                closestChar = enemy
            end
        end

        if WS:FindFirstChild("intRaid") then
            for _, enemy in WS.intRaid:GetChildren() do
                local hrp = enemy:FindFirstChild("HumanoidRootPart")
                if hrp and (pos - hrp.Position).Magnitude < 120 then
                    closestPart = hrp
                    closestChar = enemy
                end
            end
        end

        for _, boat in WS.intBoats:GetChildren() do
            if boat:FindFirstChild("Engine") and boat:FindFirstChild("Health") and boat.Health.Value > 0 then
                if (pos - boat.Engine.Position).Magnitude < 200 then
                    closestPart = boat.Engine
                    closestChar = boat
                end
            end
        end

        if closestChar and closestPart then
            local direction = (closestPart.Position - pos).Unit
            pcall(function()
                tool.LeftClickRemote:FireServer(direction, 1)
            end)
        end
    end

    local function UseNormalClick(character, debounceVal)
        local pos = character:GetPivot().Position
        local enemyRootPart1, others1 = ProcessEnemies(WS.Enemies, pos, 100, false)
        local enemyRootPart2, others2 = ProcessEnemies(WS.Characters, pos, 100, true)

        local mainTarget = enemyRootPart1 or enemyRootPart2
        local allHits = {}
        for _, v in others1 do table.insert(allHits, v) end
        for _, v in others2 do table.insert(allHits, v) end

        if mainTarget then
            if not combatThread or not SendHitsToServer then
                if not combatThread then
                    pcall(function()
                        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                        task.wait(0.05)
                        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
                    end)
                else
                    pcall(function() RegisterAttack:FireServer(debounceVal) end)
                    pcall(function() RegisterHit:FireServer(mainTarget, allHits) end)
                end
            else
                pcall(function() RegisterAttack:FireServer(debounceVal) end)
                pcall(function() SendHitsToServer(mainTarget, allHits) end)
            end
        end
    end

    local function Attack()
        if not _G.FastAttack then return end
        local character = plr.Character
        if not IsAlive(character) then return end

        local humanoid = character.Humanoid
        local tool = character:FindFirstChildOfClass("Tool")
        if not tool then return end

        local tooltip = tool.ToolTip
        local toolName = tool.Name

        if tooltip ~= "Melee" and tooltip ~= "Sword" and tooltip ~= "Blox Fruit" then return end

        if tick() - lastAttackTick < 0.4 then return end
        if IsStunned(humanoid) then return end

        lastAttackTick = tick()
        local combo = GetCombo()
        local debounceVal = 0.4 + (combo >= 4 and 0.05 or 0)

        if tooltip ~= "Blox Fruit" then
            UseNormalClick(character, debounceVal)
            return
        end

        if toolName == "Ice-Ice" or toolName == "Light-Light" then
            UseNormalClick(character, debounceVal)
            return
        end

        if toolName == "Pain-Pain" then
            local closestEnemy = nil
            local closestDist = math.huge
            for _, enemy in WS.Enemies:GetChildren() do
                local hum = enemy:FindFirstChild("Humanoid")
                local hrp = enemy:FindFirstChild("HumanoidRootPart")
                if hum and hum.Health > 0 and hrp then
                    local dist = (character.HumanoidRootPart.Position - hrp.Position).Magnitude
                    if dist < closestDist then
                        closestDist = dist
                        closestEnemy = enemy
                    end
                end
            end
            if closestEnemy and closestEnemy:FindFirstChild("HumanoidRootPart") then
                local targetPos = closestEnemy.HumanoidRootPart.Position
                pcall(function() tool.LeftClickRemote:FireServer(targetPos, 1, true) end)
                pcall(function() tool.LeftClickRemote:FireServer(targetPos, 2, true) end)
                pcall(function() tool.LeftClickRemote:FireServer(targetPos, 3, true) end)
                pcall(function() tool.LeftClickRemote:FireServer(targetPos, 4, false) end)
                task.wait(0.4)
            end
            return
        end

        if tool:FindFirstChild("LeftClickRemote") then
            UseFruitM1(character, tool)
        end
    end

    task.spawn(function()
        while task.wait(0.1) do
            if _G.FastAttack then
                Attack()
            end
        end
    end)

    RunService.RenderStepped:Connect(function()
        if _G.FastAttack then
            Attack()
        end
    end)

    local currentChar = plr.Character or plr.CharacterAdded:Wait()
    local function ResetState()
        m1Combo = 0
        lastAttackTick = 0
        comboDebounce = 0
    end
    currentChar.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then ResetState() end
    end)
    plr.CharacterAdded:Connect(function(char)
        char.ChildAdded:Connect(function(child)
            if child:IsA("Tool") then ResetState() end
        end)
        ResetState()
    end)
end

function MaterialMon()
    if _G.SelectMaterial == "Radiactive Material" then
        MMon = "Factory Staff"
        MPos = CFrame.new(-105.889565, 72.8076935, -670.247986, -0.965929747, 0, -0.258804798, 0, 1, 0, 0.258804798, 0, -0.965929747)
        SP = "Bar"
    elseif _G.SelectMaterial == "Leather + Scrap Metal" then
        if game.PlaceId == 2753915549 then
            MMon = "Pirate"
            MPos = CFrame.new(-967.433105, 13.5999937, 4034.24707, -0.258864403, 0, -0.965913713, 0, 1, 0, 0.965913713, 0, -0.258864403)
            SP = "Pirate"
        elseif game.PlaceId == 4442272183 then
            MMon = "Mercenary"
            MPos = CFrame.new(-986.774475, 72.8755951, 1088.44653, -0.656062722, 0, 0.754706323, 0, 1, 0, -0.754706323, 0, -0.656062722)
            SP = "DressTown"
        elseif game.PlaceId == 7449423635 then
            MMon = "Pirate Millionaire"
            MPos = CFrame.new(-118.809372, 55.4874573, 5649.17041, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
            SP = "Default"
        end
    elseif _G.SelectMaterial == "Magma Ore" then
        if game.PlaceId == 2753915549 then
            MMon = "Military Soldier"
            MPos = CFrame.new(-5565.60156, 9.10001755, 8327.56934, -0.838688731, 0, -0.544611216, 0, 1, 0, 0.544611216, 0, -0.838688731)
            SP = "Magma"
        elseif game.PlaceId == 4442272183 then
            MMon = "Lava Pirate"
            MPos = CFrame.new(-5158.77051, 14.4791956, -4654.2627, -0.848060489, 0, -0.529899538, 0, 1, 0, 0.529899538, 0, -0.848060489)
            SP = "CircleIslandFire"
        end
    elseif _G.SelectMaterial == "Fish Tail" then
        if game.PlaceId == 2753915549 then
            MMon = "Fishman Warrior"
            MPos = CFrame.new(60943.9023, 17.9492188, 1744.11133, 0.826706648, -0, -0.562633216, 0, 1, -0, 0.562633216, 0, 0.826706648)
            SP = "Underwater City"
        elseif game.PlaceId == 7449423635 then
            MMon = "Fishman Captain"
            MPos = CFrame.new(-10828.1064, 331.825989, -9049.14648, -0.0912091732, 0, 0.995831788, 0, 1, 0, -0.995831788, 0, -0.0912091732)
            SP = "PineappleTown"
        end
    elseif _G.SelectMaterial == "Angel Wings" then
        MMon = "Royal Soldier"
        MPos = CFrame.new(-7759.45898, 5606.93652, -1862.70276, -0.866007447, 0, -0.500031412, 0, 1, 0, 0.500031412, 0, -0.866007447)
        SP = "SkyArea2"
    elseif _G.SelectMaterial == "Mystic Droplet" then
        MMon = "Water Fighter"
        MPos = CFrame.new(-3331.70459, 239.138336, -10553.3564, -0.29242146, 0, 0.95628953, 0, 1, 0, -0.95628953, 0, -0.29242146)
        SP = "ForgottenIsland"
    elseif _G.SelectMaterial == "Vampire Fang" then
        MMon = "Vampire"
        MPos = CFrame.new(-6132.39453, 9.00769424, -1466.16919, -0.927179813, 0, -0.374617696, 0, 1, 0, 0.374617696, 0, -0.927179813)
        SP = "Graveyard"
    elseif _G.SelectMaterial == "Mini Tusk" then
        MMon = "Mythological Pirate"
        MPos = CFrame.new(-13456.0498, 469.433228, -7039.96436, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        SP = "BigMansion"
    elseif _G.SelectMaterial == "Conjured Cocoa" then
        MMon = "Chocolate Bar Battler"
        MPos = CFrame.new(582.828674, 25.5824986, -12550.7041, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
        SP = "Chocolate"
    end
end

function CheckQuest() 
    MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
    if World1 then
        if (MyLevel >= 1 and MyLevel <= 9) or SelectMonster == "Bandit" then
            Mon = "Bandit"
            LevelQuest = 1
            NameQuest = "BanditQuest1"
            NameMon = "Bandit"
            CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
            CFrameMon = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)              
        elseif (MyLevel >= 10 and MyLevel <= 14) or SelectMonster == "Monkey" then
            Mon = "Monkey"
            LevelQuest = 1
            NameQuest = "JungleQuest"
            NameMon = "Monkey"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209)                
        elseif (MyLevel >= 15 and MyLevel <= 29) or SelectMonster == "Gorilla" then
            Mon = "Gorilla"
            LevelQuest = 2
            NameQuest = "JungleQuest"
            NameMon = "Gorilla"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-1129.8836669921875, 40.46354675292969, -525.4237060546875)
        elseif (MyLevel >= 30 and MyLevel <= 39) or SelectMonster == "Pirate" then
            Mon = "Pirate"
            LevelQuest = 1
            NameQuest = "BuggyQuest1"
            NameMon = "Pirate"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125)                
        elseif (MyLevel >= 40 and MyLevel <= 59) or SelectMonster == "Brute" then
            Mon = "Brute"
            LevelQuest = 2
            NameQuest = "BuggyQuest1"
            NameMon = "Brute"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875)
        elseif (MyLevel >= 60 and MyLevel <= 74) or SelectMonster == "Desert Bandit" then
            Mon = "Desert Bandit"
            LevelQuest = 1
            NameQuest = "DesertQuest"
            NameMon = "Desert Bandit"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
            CFrameMon = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375)            
        elseif (MyLevel >= 75 and MyLevel <= 89) or SelectMonster == "Desert Officer" then
            Mon = "Desert Officer"
            LevelQuest = 2
            NameQuest = "DesertQuest"
            NameMon = "Desert Officer"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
            CFrameMon = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875)               
        elseif (MyLevel >= 90 and MyLevel <= 99) or SelectMonster == "Snow Bandit" then
            Mon = "Snow Bandit"
            LevelQuest = 1
            NameQuest = "SnowQuest"
            NameMon = "Snow Bandit"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
            CFrameMon = CFrame.new(1354.347900390625, 87.27277374267578, -1393.946533203125)
            
        elseif (MyLevel >= 100 and MyLevel <= 119) or SelectMonster == "Snowman" then
            Mon = "Snowman"
            LevelQuest = 2
            NameQuest = "SnowQuest"
            NameMon = "Snowman"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
            CFrameMon = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625)
        elseif (MyLevel >= 120 and MyLevel <= 149) or SelectMonster == "Chief Petty Officer" then
            Mon = "Chief Petty Officer"
            LevelQuest = 1
            NameQuest = "MarineQuest2"
            NameMon = "Chief Petty Officer"
            CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-4881.23095703125, 22.65204429626465, 4273.75244140625)
        elseif (MyLevel >= 150 and MyLevel <= 174) or SelectMonster == "Sky Bandit" then
            Mon = "Sky Bandit"
            LevelQuest = 1
            NameQuest = "SkyQuest"
            NameMon = "Sky Bandit"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625)
            
        elseif (MyLevel >= 175 and MyLevel <= 189) or SelectMonster == "Dark Master" then
            Mon = "Dark Master"
            LevelQuest = 2
            NameQuest = "SkyQuest"
            NameMon = "Dark Master"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-5259.8447265625, 391.3976745605469, -2229.035400390625)
        elseif (MyLevel >= 190 and MyLevel <= 209) or SelectMonster == "Prisoner" then
            Mon = "Prisoner"
            LevelQuest = 1
            NameQuest = "PrisonerQuest"
            NameMon = "Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
            CFrameMon = CFrame.new(5098.9736328125, -0.3204058110713959, 474.2373352050781)
        elseif (MyLevel >= 210 and MyLevel <= 249) or SelectMonster == "Dangerous Prisone" then
            Mon = "Dangerous Prisoner"
            LevelQuest = 2
            NameQuest = "PrisonerQuest"
            NameMon = "Dangerous Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
            CFrameMon = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375)
        elseif (MyLevel >= 250 and MyLevel <= 274) or SelectMonster == "Toga Warrior" then
            Mon = "Toga Warrior"
            LevelQuest = 1
            NameQuest = "ColosseumQuest"
            NameMon = "Toga Warrior"
            CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
            CFrameMon = CFrame.new(-1820.21484375, 51.68385696411133, -2740.6650390625)
        elseif (MyLevel >= 275 and MyLevel <= 299) or SelectMonster == "Gladiator" then
            Mon = "Gladiator"
            LevelQuest = 2
            NameQuest = "ColosseumQuest"
            NameMon = "Gladiator"
            CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
            CFrameMon = CFrame.new(-1292.838134765625, 56.380882263183594, -3339.031494140625)
        elseif (MyLevel >= 300 and MyLevel <= 324) or SelectMonster == "Military Soldier" then
            Mon = "Military Soldier"
            LevelQuest = 1
            NameQuest = "MagmaQuest"
            NameMon = "Military Soldier"
            CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
            CFrameMon = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875)
        elseif (MyLevel >= 325 and MyLevel <= 374) or SelectMonster == "Military Spy" then
            Mon = "Military Spy"
            LevelQuest = 2
            NameQuest = "MagmaQuest"
            NameMon = "Military Spy"
            CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
            CFrameMon = CFrame.new(-5802.8681640625, 86.26241302490234, 8828.859375)
        elseif (MyLevel >= 375 and MyLevel <= 399) or SelectMonster == "Fishman Warrior" then
            Mon = "Fishman Warrior"
            LevelQuest = 1
            NameQuest = "FishmanQuest"
            NameMon = "Fishman Warrior"
            CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625)
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif (MyLevel >= 400 and MyLevel <= 449) or SelectMonster == "Fishman Commando" then
            Mon = "Fishman Commando"
            LevelQuest = 2
            NameQuest = "FishmanQuest"
            NameMon = "Fishman Commando"
            CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif (MyLevel >= 450 and MyLevel <= 474) or SelectMonster == "God's Guard" then
            Mon = "God's Guard"
            LevelQuest = 1
            NameQuest = "SkyExp1Quest"
            NameMon = "God's Guard"
            CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
            CFrameMon = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375)
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
            end
        elseif (MyLevel >= 475 and MyLevel <= 524) or SelectMonster == "Shanda" then
            Mon = "Shanda"
            LevelQuest = 2
            NameQuest = "SkyExp1Quest"
            NameMon = "Shanda"
            CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
            CFrameMon = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531)
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            end
        elseif (MyLevel >= 525 and MyLevel <= 549) or SelectMonster == "Royal Squad" then
            Mon = "Royal Squad"
            LevelQuest = 1
            NameQuest = "SkyExp2Quest"
            NameMon = "Royal Squad"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-7624.25244140625, 5658.13330078125, -1467.354248046875)
        elseif (MyLevel >= 550 and MyLevel <= 624) or SelectMonster == "Royal Soldier" then
            Mon = "Royal Soldier"
            LevelQuest = 2
            NameQuest = "SkyExp2Quest"
            NameMon = "Royal Soldier"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-7836.75341796875, 5645.6640625, -1790.6236572265625)
        elseif (MyLevel >= 625 and MyLevel <= 649) or SelectMonster == "Galley Pirate" then
            Mon = "Galley Pirate"
            LevelQuest = 1
            NameQuest = "FountainQuest"
            NameMon = "Galley Pirate"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
            CFrameMon = CFrame.new(5551.02197265625, 78.90135192871094, 3930.412841796875)
        elseif MyLevel >= 650 or SelectMonster == "Galley Captain" then
            Mon = "Galley Captain"
            LevelQuest = 2
            NameQuest = "FountainQuest"
            NameMon = "Galley Captain"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
            CFrameMon = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375)
        end
       elseif World2 then
        if (MyLevel >= 700 and MyLevel <= 724) or SelectMonster == "Raider" then
            Mon = "Raider"
            LevelQuest = 1
            NameQuest = "Area1Quest"
            NameMon = "Raider"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
            CFrameMon = CFrame.new(-728.3267211914062, 52.779319763183594, 2345.7705078125)
        elseif (MyLevel >= 725 and MyLevel <= 774) or SelectMonster == "Mercenary" then
            Mon = "Mercenary"
            LevelQuest = 2
            NameQuest = "Area1Quest"
            NameMon = "Mercenary"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
            CFrameMon = CFrame.new(-1004.3244018554688, 80.15886688232422, 1424.619384765625)
        elseif (MyLevel >= 775 and MyLevel <= 799) or SelectMonster == "Swan Pirate" then
            Mon = "Swan Pirate"
            LevelQuest = 1
            NameQuest = "Area2Quest"
            NameMon = "Swan Pirate"
            CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
            CFrameMon = CFrame.new(1068.664306640625, 137.61428833007812, 1322.1060791015625)
        elseif (MyLevel >= 800 and MyLevel <= 874) or SelectMonster == "Factory Staff" then
            Mon = "Factory Staff"
            NameQuest = "Area2Quest"
            LevelQuest = 2
            NameMon = "Factory Staff"
            CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
            CFrameMon = CFrame.new(73.078, 67431640625, 81.86344146728516, -27.470672607421875)
        elseif (MyLevel >= 875 and MyLevel <= 899) or SelectMonster == "Marine Lieutenant" then           
            Mon = "Marine Lieutenant"
            LevelQuest = 1
            NameQuest = "MarineQuest3"
            NameMon = "Marine Lieutenant"
            CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-2821.372314453125, 75.89727783203125, -3070.089111328125)
        elseif (MyLevel >= 900 and MyLevel <= 949) or SelectMonster == "Marine Captain" then
            Mon = "Marine Captain"
            LevelQuest = 2
            NameQuest = "MarineQuest3"
            NameMon = "Marine Captain"
            CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-1861.2310791015625, 80.17658233642578, -3254.697509765625)
        elseif (MyLevel >= 950 and MyLevel <= 974) or SelectMonster == "Zombie" then
            Mon = "Zombie"
            LevelQuest = 1
            NameQuest = "ZombieQuest"
            NameMon = "Zombie"
            CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
            CFrameMon = CFrame.new(-5657.77685546875, 78.96973419189453, -928.68701171875)
        elseif (MyLevel >= 975 and MyLevel <= 999) or SelectMonster == "Vampire" then
            Mon = "Vampire"
            LevelQuest = 2
            NameQuest = "ZombieQuest"
            NameMon = "Vampire"
            CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
            CFrameMon = CFrame.new(-6037.66796875, 32.18463897705078, -1340.6597900390625)
        elseif (MyLevel >= 1000 and MyLevel <= 1049) or SelectMonster == "Snow Trooper" then
            Mon = "Snow Trooper"
            LevelQuest = 1
            NameQuest = "SnowMountainQuest"
            NameMon = "Snow Trooper"
            CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
            CFrameMon = CFrame.new(549.1473388671875, 427.3870544433594, -5563.69873046875)
        elseif (MyLevel >= 1050 and MyLevel <= 1099) or SelectMonster == "Winter Warrior" then
            Mon = "Winter Warrior"
            LevelQuest = 2
            NameQuest = "SnowMountainQuest"
            NameMon = "Winter Warrior"
            CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
            CFrameMon = CFrame.new(1142.7451171875, 475.6398010253906, -5199.41650390625)
        elseif (MyLevel >= 1100 and MyLevel <= 1124) or SelectMonster == "Lab Subordinate" then
            Mon = "Lab Subordinate"
            LevelQuest = 1
            NameQuest = "IceSideQuest"
            NameMon = "Lab Subordinate"
            CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
            CFrameMon = CFrame.new(-5707.4716796875, 15.951709747314453, -4513.39208984375)
        elseif (MyLevel >= 1125 and MyLevel <= 1174) or SelectMonster == "Horned Warrior" then
            Mon = "Horned Warrior"
            LevelQuest = 2
            NameQuest = "IceSideQuest"
            NameMon = "Horned Warrior"
            CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
            CFrameMon = CFrame.new(-6341.36669921875, 15.951770782470703, -5723.162109375)
        elseif (MyLevel >= 1175 and MyLevel <= 1199) or SelectMonster == "Magma Ninja" then
            Mon = "Magma Ninja"
            LevelQuest = 1
            NameQuest = "FireSideQuest"
            NameMon = "Magma Ninja"
            CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
            CFrameMon = CFrame.new(-5449.6728515625, 76.65874481201172, -5808.20068359375)
        elseif (MyLevel >= 1200 and MyLevel <= 1249) or SelectMonster == "Lava Pirate" then
            Mon = "Lava Pirate"
            LevelQuest = 2
            NameQuest = "FireSideQuest"
            NameMon = "Lava Pirate"
            CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
            CFrameMon = CFrame.new(-5213.33154296875, 49.73788070678711, -4701.451171875)
        elseif (MyLevel >= 1250 and MyLevel <= 1274) or SelectMonster == "Ship Deckhand" then
            Mon = "Ship Deckhand"
            LevelQuest = 1
            NameQuest = "ShipQuest1"
            NameMon = "Ship Deckhand"
            CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)         
            CFrameMon = CFrame.new(1212.0111083984375, 150.79205322265625, 33059.24609375)    
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif (MyLevel >= 1275 and MyLevel <= 1299) or SelectMonster == "Ship Engineer" then
            Mon = "Ship Engineer"
            LevelQuest = 2
            NameQuest = "ShipQuest1"
            NameMon = "Ship Engineer"
            CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)   
            CFrameMon = CFrame.new(919.4786376953125, 43.54401397705078, 32779.96875)   
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end             
        elseif (MyLevel >= 1300 and MyLevel <= 1324) or SelectMonster == "Ship Steward" then
            Mon = "Ship Steward"
            LevelQuest = 1
            NameQuest = "ShipQuest2"
            NameMon = "Ship Steward"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)         
            CFrameMon = CFrame.new(919.4385375976562, 129.55599975585938, 33436.03515625)      
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif (MyLevel >= 1325 and MyLevel <= 1349) or SelectMonster == "Ship Officer" then
            Mon = "Ship Officer"
            LevelQuest = 2
            NameQuest = "ShipQuest2"
            NameMon = "Ship Officer"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
            CFrameMon = CFrame.new(1036.0179443359375, 181.4390411376953, 33315.7265625)
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif (MyLevel >= 1350 and MyLevel <= 1374) or SelectMonster == "Arctic Warrior" then
            Mon = "Arctic Warrior"
            LevelQuest = 1
            NameQuest = "FrostQuest"
            NameMon = "Arctic Warrior"
            CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
            CFrameMon = CFrame.new(5966.24609375, 62.97002029418945, -6179.3828125)
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 5000.034996032715, -132.83953857422))
            end
        elseif (MyLevel >= 1375 and MyLevel <= 1424) or SelectMonster == "Snow Lurker" then
            Mon = "Snow Lurker"
            LevelQuest = 2
            NameQuest = "FrostQuest"
            NameMon = "Snow Lurker"
            CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
            CFrameMon = CFrame.new(5407.07373046875, 69.19437408447266, -6880.88037109375)
        elseif (MyLevel >= 1425 and MyLevel <= 1449) or SelectMonster == "Sea Soldier" then
            Mon = "Sea Soldier"
            LevelQuest = 1
            NameQuest = "ForgottenQuest"
            NameMon = "Sea Soldier"
            CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
            CFrameMon = CFrame.new(-3028.2236328125, 64.67451477050781, -9775.4267578125)
        elseif MyLevel >= 1450 or SelectMonster == "Water Fighter" then
            Mon = "Water Fighter"
            LevelQuest = 2
            NameQuest = "ForgottenQuest"
            NameMon = "Water Fighter"
            CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
            CFrameMon = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875)
        end
            elseif World3 then
       if (MyLevel >= 1500 and MyLevel <= 1524) or SelectMonster == "Pirate Millionaire" then
            Mon = "Pirate Millionaire"
            LevelQuest = 1
            NameQuest = "PiratePortQuest"
            NameMon = "Pirate Millionaire"
            CFrameQuest = CFrame.new(-450.104645, 107.681458, 5950.72607, 0.957107544, -0, -0.289732844, 0, 1, -0, 0.289732844, 0, 0.957107544)
            CFrameMon = CFrame.new(-245.9963836669922, 47.30615234375, 5584.1005859375)
        elseif (MyLevel >= 1525 and MyLevel <= 1574) or SelectMonster == "Pistol Billionaire" then
            Mon = "Pistol Billionaire"
            LevelQuest = 2
            NameQuest = "PiratePortQuest"
            NameMon = "Pistol Billionaire"
            CFrameQuest = CFrame.new(-450.104645, 107.681458, 5950.72607, 0.957107544, -0, -0.289732844, 0, 1, -0, 0.289732844, 0, 0.957107544)
            CFrameMon = CFrame.new(-54.8110352, 83.7698746, 5947.84082, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
        elseif (MyLevel >= 1575 and MyLevel <= 1599) or SelectMonster == "Dragon Crew Warrior" then
            Mon = "Dragon Crew Warrior"
            LevelQuest = 1
            NameQuest = "DragonCrewQuest"
            NameMon = "Dragon Crew Warrior"
            CFrameQuest = CFrame.new(6750.4931640625, 127.44916534423828, -711.0308837890625)
            CFrameMon = CFrame.new(6709.76367, 52.3442993, -1139.02966, -0.763515472, 0, 0.645789504, 0, 1, 0, -0.645789504, 0, -0.763515472)          
        elseif (MyLevel >= 1600 and MyLevel <= 1624) or SelectMonster == "Dragon Crew Archer" then
            Mon = "Dragon Crew Archer"
            NameQuest = "DragonCrewQuest"
            LevelQuest = 2
            NameMon = "Dragon Crew Archer"
            CFrameQuest = CFrame.new(6750.4931640625, 127.44916534423828, -711.0308837890625)
            CFrameMon = CFrame.new(6668.76172, 481.376923, 329.12207, -0.121787429, 0, -0.992556155, 0, 1, 0, 0.992556155, 0, -0.121787429)
        elseif (MyLevel >= 1625 and MyLevel <= 1649) or SelectMonster == "Hydra Enforcer" then
            Mon = "Hydra Enforcer"
            NameQuest = "VenomCrewQuest"
            LevelQuest = 1
            NameMon = "Hydra Enforcer"
            CFrameQuest = CFrame.new(5206.40185546875, 1004.10498046875, 748.3504638671875)
            CFrameMon = CFrame.new(4547.11523, 1003.10217, 334.194824, 0.388810456, -0, -0.921317935, 0, 1, -0, 0.921317935, 0, 0.388810456)
        elseif (MyLevel >= 1650 and MyLevel <= 1699) or SelectMonster == "Venomous Assailant" then
            Mon = "Venomous Assailant"
            NameQuest = "VenomCrewQuest"
            LevelQuest = 2
            NameMon = "Venomous Assailant"
            CFrameQuest = CFrame.new(5206.40185546875, 1004.10498046875, 748.3504638671875)
            CFrameMon = CFrame.new(4674.92676, 1134.82654, 996.308838, 0.731321394, -0, -0.682033002, 0, 1, -0, 0.682033002, 0, 0.731321394)
        elseif (MyLevel >= 1700 and MyLevel <= 1724) or SelectMonster == "Marine Commodore" then
            Mon = "Marine Commodore"
            LevelQuest = 1
            NameQuest = "MarineTreeIsland"
            NameMon = "Marine Commodore"
            CFrameQuest = CFrame.new(2481.09228515625, 74.27049255371094, -6779.640625)
            CFrameMon = CFrame.new(2577.25391, 75.6100006, -7739.87207, 0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, 0.499959469)
        elseif (MyLevel >= 1725 and MyLevel <= 1774) or SelectMonster == "Marine Rear Admiral" then
            Mon = "Marine Rear Admiral"
            LevelQuest = 2
            NameQuest = "MarineTreeIsland"
            NameMon = "Marine Rear Admiral"
            CFrameQuest = CFrame.new(2481.09228515625, 74.27049255371094, -6779.640625)
            CFrameMon = CFrame.new(3761.81006, 123.912003, -6823.52197, 0.961273968, 0, 0.275594592, 0, 1, 0, -0.275594592, 0, 0.961273968)
        elseif (MyLevel >= 1775 and MyLevel <= 1799) or SelectMonster == "Fishman Raider" then
            Mon = "Fishman Raider"
            LevelQuest = 1
            NameQuest = "DeepForestIsland3"
            NameMon = "Fishman Raider"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
            CFrameMon = CFrame.new(-10407.5263671875, 331.76263427734375, -8368.5166015625)
        elseif (MyLevel >= 1800 and MyLevel <= 1824) or SelectMonster == "Fishman Captain" then
            Mon = "Fishman Captain"
            LevelQuest = 2
            NameQuest = "DeepForestIsland3"
            NameMon = "Fishman Captain"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
            CFrameMon = CFrame.new(-10994.701171875, 352.38140869140625, -9002.1103515625) 
        elseif (MyLevel >= 1825 and MyLevel <= 1849) or SelectMonster == "Forest Pirate" then
            Mon = "Forest Pirate"
            LevelQuest = 1
            NameQuest = "DeepForestIsland"
            NameMon = "Forest Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
            CFrameMon = CFrame.new(-13274.478515625, 332.3781433105469, -7769.58056640625)
        elseif (MyLevel >= 1850 and MyLevel <= 1899) or SelectMonster == "Mythological Pirate" then
            Mon = "Mythological Pirate"
            LevelQuest = 2
            NameQuest = "DeepForestIsland"
            NameMon = "Mythological Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)   
            CFrameMon = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125)
        elseif (MyLevel >= 1900 and MyLevel <= 1924) or SelectMonster == "Jungle Pirate" then
            Mon = "Jungle Pirate"
            LevelQuest = 1
            NameQuest = "DeepForestIsland2"
            NameMon = "Jungle Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
            CFrameMon = CFrame.new(-12256.16015625, 331.73828125, -10485.8369140625)
        elseif (MyLevel >= 1925 and MyLevel <= 1974) or SelectMonster == "Musketeer Pirate" then
            Mon = "Musketeer Pirate"
            LevelQuest = 2
            NameQuest = "DeepForestIsland2"
            NameMon = "Musketeer Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
            CFrameMon = CFrame.new(-13457.904296875, 391.545654296875, -9859.177734375)
        elseif (MyLevel >= 1975 and MyLevel <= 1999) or SelectMonster == "Reborn Skeleton" then
            Mon = "Reborn Skeleton"
            LevelQuest = 1
            NameQuest = "HauntedQuest1"
            NameMon = "Reborn Skeleton"
            CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-8763.7236328125, 165.72299194335938, 6159.86181640625)
        elseif (MyLevel >= 2000 and MyLevel <= 2024) or SelectMonster == "Living Zombie" then
            Mon = "Living Zombie"
            LevelQuest = 2
            NameQuest = "HauntedQuest1"
            NameMon = "Living Zombie"
            CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-10144.1318359375, 138.62667846679688, 5838.0888671875)
        elseif (MyLevel >= 2025 and MyLevel <= 2049) or SelectMonster == "Demonic Soul" then
            Mon = "Demonic Soul"
            LevelQuest = 1
            NameQuest = "HauntedQuest2"
            NameMon = "Demonic Soul"
            CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0) 
            CFrameMon = CFrame.new(-9505.8720703125, 172.10482788085938, 6158.9931640625)
        elseif (MyLevel >= 2050 and MyLevel <= 2074) or SelectMonster == "Posessed Mummy" then
            Mon = "Posessed Mummy"
            LevelQuest = 2
            NameQuest = "HauntedQuest2"
            NameMon = "Posessed Mummy"
            CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-9582.0224609375, 6.251527309417725, 6205.478515625)
        elseif (MyLevel >= 2075 and MyLevel <= 2099) or SelectMonster == "Peanut Scout" then
            Mon = "Peanut Scout"
            LevelQuest = 1
            NameQuest = "NutsIslandQuest"
            NameMon = "Peanut Scout"
            CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-2143.241943359375, 47.72198486328125, -10029.9951171875)
        elseif (MyLevel >= 2100 and MyLevel <= 2124) or SelectMonster == "Peanut President" then
            Mon = "Peanut President"
            LevelQuest = 2
            NameQuest = "NutsIslandQuest"
            NameMon = "Peanut President"
            CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-1859.35400390625, 38.10316848754883, -10422.4296875)
        elseif (MyLevel >= 2125 and MyLevel <= 2149) or SelectMonster == "Ice Cream Chef" then
            Mon = "Ice Cream Chef"
            LevelQuest = 1
            NameQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Chef"
            CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-872.24658203125, 65.81957244873047, -10919.95703125)
        elseif (MyLevel >= 2150 and MyLevel <= 2199) or SelectMonster == "Ice Cream Commander" then
            Mon = "Ice Cream Commander"
            LevelQuest = 2
            NameQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Commander"
            CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-558.06103515625, 112.04895782470703, -11290.7744140625)
        elseif (MyLevel >= 2200 and MyLevel <= 2224) or SelectMonster == "Cookie Crafter" then
            Mon = "Cookie Crafter"
            LevelQuest = 1
            NameQuest = "CakeQuest1"
            NameMon = "Cookie Crafter"
            CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
            CFrameMon = CFrame.new(-2374.13671875, 37.79826354980469, -12125.30859375)
        elseif (MyLevel >= 2225 and MyLevel <= 2249) or SelectMonster == "Cake Guard" then
            Mon = "Cake Guard"
            LevelQuest = 2
            NameQuest = "CakeQuest1"
            NameMon = "Cake Guard"
            CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
            CFrameMon = CFrame.new(-1598.3070068359375, 43.773197174072266, -12244.5810546875)
        elseif (MyLevel >= 2250 and MyLevel <= 2274) or SelectMonster == "Baking Staff" then
            Mon = "Baking Staff"
            LevelQuest = 1
            NameQuest = "CakeQuest2"
            NameMon = "Baking Staff"
            CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
            CFrameMon = CFrame.new(-1887.8099365234375, 77.6185073852539, -12998.3505859375)
        elseif (MyLevel >= 2275 and MyLevel <= 2299) or SelectMonster == "Head Baker" then
            Mon = "Head Baker"
            LevelQuest = 2
            NameQuest = "CakeQuest2"
            NameMon = "Head Baker"
            CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
            CFrameMon = CFrame.new(-2216.188232421875, 82.884521484375, -12869.2939453125)
        elseif (MyLevel >= 2300 and MyLevel <= 2324) or SelectMonster == "Cocoa Warrior" then
            Mon = "Cocoa Warrior"
            LevelQuest = 1
            NameQuest = "ChocQuest1"
            NameMon = "Cocoa Warrior"
            CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
            CFrameMon = CFrame.new(-21.55328369140625, 80.57499694824219, -12352.3876953125)
        elseif (MyLevel >= 2325 and MyLevel <= 2349) or SelectMonster == "Chocolate Bar Battler" then
            Mon = "Chocolate Bar Battler"
            LevelQuest = 2
            NameQuest = "ChocQuest1"
            NameMon = "Chocolate Bar Battler"
            CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
            CFrameMon = CFrame.new(582.590576171875, 77.18809509277344, -12463.162109375)
        elseif (MyLevel >= 2350 and MyLevel <= 2374) or SelectMonster == "Sweet Thief" then
            Mon = "Sweet Thief"
            LevelQuest = 1
            NameQuest = "ChocQuest2"
            NameMon = "Sweet Thief"
            CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
            CFrameMon = CFrame.new(165.1884765625, 76.05885314941406, -12600.8369140625)
        elseif (MyLevel >= 2375 and MyLevel <= 2399) or SelectMonster == "Candy Rebel" then
            Mon = "Candy Rebel"
            LevelQuest = 2
            NameQuest = "ChocQuest2"
            NameMon = "Candy Rebel"
            CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
            CFrameMon = CFrame.new(134.86563110351562, 77.2476806640625, -12876.5478515625)
        elseif (MyLevel >= 2400 and MyLevel <= 2424) or SelectMonster == "Candy Pirate" then
            Mon = "Candy Pirate"
            LevelQuest = 1
            NameQuest = "CandyQuest1"
            NameMon = "Candy Pirate"
            CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
            CFrameMon = CFrame.new(-1310.5003662109375, 26.016523361206055, -14562.404296875)
        elseif (MyLevel >= 2425 and MyLevel <= 2449) or SelectMonster == "Snow Demon" then
            Mon = "Snow Demon"
            LevelQuest = 2
            NameQuest = "CandyQuest1"
            NameMon = "Snow Demon"
            CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
            CFrameMon = CFrame.new(-880.2006225585938, 71.24776458740234, -14538.609375)
        elseif (MyLevel >= 2450 and MyLevel <= 2474) or SelectMonster == "Isle Outlaw" then
            Mon = "Isle Outlaw"
            LevelQuest = 1
            NameQuest = "TikiQuest1"
            NameMon = "Isle Outlaw"
            CFrameQuest = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812)
            CFrameMon = CFrame.new(-16442.814453125, 116.13899993896484, -264.4637756347656)
        elseif (MyLevel >= 2475 and MyLevel <= 2524) or SelectMonster == "Island Boy" then
            Mon = "Island Boy"
            LevelQuest = 2
            NameQuest = "TikiQuest1"
            NameMon = "Island Boy"
            CFrameQuest = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812)
            CFrameMon = CFrame.new(-16901.26171875, 84.06756591796875, -192.88906860351562)
        elseif (MyLevel >= 2525 and MyLevel <= 2550) or SelectMonster == "Isle Champion" then
            Mon = "Isle Champion"
            LevelQuest = 2
            NameQuest = "TikiQuest2"
            NameMon = "Isle Champion"
            CFrameQuest = CFrame.new(-16539.078125, 55.68632888793945, 1051.5738525390625)
            CFrameMon = CFrame.new(-16641.6796875, 235.7825469970703, 1031.282958984375)
            elseif (MyLevel >= 2550 and MyLevel <= 2574) or SelectMonster == "Serpent Hunter" then
            Mon = "Serpent Hunter"
            LevelQuest = 1
            NameQuest = "TikiQuest3"
            NameMon = "Serpent Hunter"
            CFrameQuest = CFrame.new(-16665.1914, 104.596405, 1579.69434, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401)
            CFrameMon = CFrame.new(-16521.0625, 106.09285, 1488.78467, 0.469467044, 0, 0.882950008, 0, 1, 0, -0.882950008, 0, 0.469467044)
           elseif MyLevel >= 2575 or SelectMonster == "Skull Slayer" then
            Mon = "Skull Slayer"
            LevelQuest = 2
            NameQuest = "TikiQuest3"
            NameMon = "Skull Slayer"
            CFrameQuest = CFrame.new(-16665.1914, 104.596405, 1579.69434, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401)
            CFrameMon = CFrame.new(-16855.043, 122.457253, 1478.15308, -0.999392271, 0, -0.0348687991, 0, 1, 0, 0.0348687991, 0, -0.999392271)

        end
    end
end

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFarm or _G.AutoNear or _G.AutoFarmFruits or _G.FarmBone or _G.AutoFarmMaterial then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            else
                if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
                end
            end
        end)
    end
end)

spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.AutoFarm or _G.AutoNear or _G.AutoFarmFruits or _G.FarmBone or _G.AutoFarmMaterial then
                for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end)
end)


-- ===== Zero Hub Key System =====
local RivoKey = "Zero-Key"
local RivoUnlocked = false
local RivoExited = false

local RivoKeyGui = Instance.new("ScreenGui")
RivoKeyGui.Name = "RivoKeyGui"
RivoKeyGui.ResetOnSpawn = false
RivoKeyGui.IgnoreGuiInset = true
RivoKeyGui.Parent = game:GetService("CoreGui")

local function RivoNotify(msg)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Zero Hub",
            Text = msg,
            Duration = 4
        })
    end)
end

local Background = Instance.new("Frame", RivoKeyGui)
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Background.BackgroundTransparency = 0.4

local MainFrame = Instance.new("Frame", Background)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 400, 0, 285)
MainFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
MainFrame.BorderSizePixel = 0
local FCorner = Instance.new("UICorner", MainFrame)
FCorner.CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel", MainFrame)
Title.AnchorPoint = Vector2.new(0.5, 0)
Title.Position = UDim2.new(0.5, 0, 0, 14)
Title.Size = UDim2.new(0, 300, 0, 42)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 28
Title.TextColor3 = Color3.fromRGB(255, 215, 120)
Title.Text = "Zero Hub"
Title.TextScaled = true

local Subtitle = Instance.new("TextLabel", MainFrame)
Subtitle.AnchorPoint = Vector2.new(0.5, 0)
Subtitle.Position = UDim2.new(0.5, 0, 0, 56)
Subtitle.Size = UDim2.new(0, 300, 0, 24)
Subtitle.BackgroundTransparency = 1
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextSize = 14
Subtitle.TextColor3 = Color3.fromRGB(180, 180, 180)
Subtitle.Text = "Enter your key to unlock"

local InputFrame = Instance.new("Frame", MainFrame)
InputFrame.AnchorPoint = Vector2.new(0.5, 0)
InputFrame.Position = UDim2.new(0.5, 0, 0, 92)
InputFrame.Size = UDim2.new(0, 300, 0, 42)
InputFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
InputFrame.BorderSizePixel = 0
local ICorner = Instance.new("UICorner", InputFrame)
ICorner.CornerRadius = UDim.new(0, 8)

local KeyBox = Instance.new("TextBox", InputFrame)
KeyBox.Size = UDim2.new(1, 0, 1, 0)
KeyBox.BackgroundTransparency = 1
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 16
KeyBox.TextColor3 = Color3.fromRGB(235, 235, 235)
KeyBox.PlaceholderText = "Key..."
KeyBox.PlaceholderColor3 = Color3.fromRGB(130, 130, 135)
KeyBox.Text = ""

local ErrorLabel = Instance.new("TextLabel", MainFrame)
ErrorLabel.AnchorPoint = Vector2.new(0.5, 0)
ErrorLabel.Position = UDim2.new(0.5, 0, 0, 138)
ErrorLabel.Size = UDim2.new(0, 300, 0, 22)
ErrorLabel.BackgroundTransparency = 1
ErrorLabel.Font = Enum.Font.Gotham
ErrorLabel.TextSize = 13
ErrorLabel.TextColor3 = Color3.fromRGB(255, 90, 90)
ErrorLabel.Text = ""

local UnlockBtn = Instance.new("TextButton", MainFrame)
UnlockBtn.AnchorPoint = Vector2.new(0.5, 0)
UnlockBtn.Position = UDim2.new(0.5, -75, 0, 168)
UnlockBtn.Size = UDim2.new(0, 150, 0, 42)
UnlockBtn.BackgroundColor3 = Color3.fromRGB(70, 160, 90)
UnlockBtn.BorderSizePixel = 0
UnlockBtn.Font = Enum.Font.GothamBold
UnlockBtn.TextSize = 16
UnlockBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
UnlockBtn.Text = "Unlock"
local UCorner = Instance.new("UICorner", UnlockBtn)
UCorner.CornerRadius = UDim.new(0, 8)

local ExitBtn = Instance.new("TextButton", MainFrame)
ExitBtn.AnchorPoint = Vector2.new(0.5, 0)
ExitBtn.Position = UDim2.new(0.5, 75, 0, 168)
ExitBtn.Size = UDim2.new(0, 150, 0, 42)
ExitBtn.BackgroundColor3 = Color3.fromRGB(150, 60, 60)
ExitBtn.BorderSizePixel = 0
ExitBtn.Font = Enum.Font.GothamBold
ExitBtn.TextSize = 16
ExitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExitBtn.Text = "Exit"
local ECorner = Instance.new("UICorner", ExitBtn)
ECorner.CornerRadius = UDim.new(0, 8)

local KeyLink = "https://work.ink/2eP0/zero-hub-first-step"

local LinkBtn = Instance.new("TextButton", MainFrame)
LinkBtn.AnchorPoint = Vector2.new(0.5, 0)
LinkBtn.Position = UDim2.new(0.5, 0, 0, 216)
LinkBtn.Size = UDim2.new(0, 320, 0, 40)
LinkBtn.BackgroundColor3 = Color3.fromRGB(40, 110, 205)
LinkBtn.BorderSizePixel = 0
LinkBtn.Font = Enum.Font.GothamBold
LinkBtn.TextSize = 15
LinkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LinkBtn.Text = "Get Key: work.ink/2eP0/zero-hub-first-step"
local LCorner = Instance.new("UICorner", LinkBtn)
LCorner.CornerRadius = UDim.new(0, 8)
LinkBtn.MouseButton1Click:Connect(function()
    pcall(function()
        setclipboard(KeyLink)
    end)
    local opened = pcall(function()
        if request then
            request({ Url = KeyLink })
            return true
        end
        return false
    end)
    if opened then
        RivoNotify("Opening key link...")
    else
        RivoNotify("Key link copied! Paste it in your browser")
    end
end)

local verifying = false
local function TryUnlock()
    if verifying then return end
    local entered = KeyBox.Text
    if entered and entered == RivoKey then
        verifying = true
        UnlockBtn.Text = "Unlocked!"
        wait(0.3)
        RivoKeyGui:Destroy()
        RivoUnlocked = true
    else
        ErrorLabel.Text = "Invalid key."
        KeyBox.Text = ""
        RivoNotify("Invalid key!")
    end
end

UnlockBtn.MouseButton1Click:Connect(TryUnlock)
KeyBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then TryUnlock() end
end)
ExitBtn.MouseButton1Click:Connect(function()
    verifying = true
    RivoNotify("Exiting Zero Hub...")
    wait(0.3)
    RivoKeyGui:Destroy()
    RivoExited = true
end)

repeat task.wait() until RivoUnlocked or RivoExited

if not RivoUnlocked then
    return
end


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/arthurkaza-real/skjlnrwejklnrjklwe3njklwer/refs/heads/main/jewa.lua"))()

local MainWindow = Library:Window({
    Name = 'Zero Hub',
    Logo = "rbxassetid://133425623304338"
})

local MainPage = MainWindow:Page({
    Name = "Main",
    Description = "main features",
    Icon = "lucide:anchor",
    Search = false
})
local ValentinesPage = MainWindow:Page({
    Name = "Valentines",
    Description = "Special Features",
    Icon = "lucide:heart", 
    Search = false
})




local PlayerPage = MainWindow:Page({
    Name = "Player",
    Description = "player options",
    Icon = "lucide:user",
    Search = false
})
local QuestPage = MainWindow:Page({
    Name = "Quest",
    Description = "quest automation",
    Icon = "lucide:target",
    Search = false
})

local ValentinesSections = ValentinesPage:SubPage({
    Icon = "rbxassetid://134546249616852",
    Name = "Shop SubPage"
})

local VSTIME = ValentinesSections:Section({
    Name = "Valentines Specials",
    Side = 1
})
local VSTIME2 = ValentinesSections:Section({
    Name = "Valentines Farms",
    Side = 2
})
VSTIME:Button({
    Name = "Buy 30minDouble",
    Callback = function()
        local args = {
            "Purchase",
            "30minDouble"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Celebration"):InvokeServer(unpack(args))
    end
})

VSTIME:Button({
    Name = "Buy RaceReroll",
    Callback = function()
        local args = {
            "Purchase",
            "RaceReroll"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Celebration"):InvokeServer(unpack(args))
    end
})

VSTIME:Button({
    Name = "Buy SmallMoney",
    Callback = function()
        local args = {
            "Purchase",
            "SmallMoney"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Celebration"):InvokeServer(unpack(args))
    end
})

VSTIME:Button({
    Name = "Buy Flame-Flame",
    Callback = function()
        local args = {
            "Purchase",
            "Flame-Flame"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Celebration"):InvokeServer(unpack(args))
    end
})

VSTIME:Button({
    Name = "Buy Dark-Dark",
    Callback = function()
        local args = {
            "Purchase",
            "Dark-Dark"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Celebration"):InvokeServer(unpack(args))
    end
})

VSTIME:Button({
    Name = "Buy Light-Light",
    Callback = function()
        local args = {
            "Purchase",
            "Light-Light"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Celebration"):InvokeServer(unpack(args))
    end
})

local player = game.Players.LocalPlayer
local SEA_POSITIONS = {
    [2753915549] = CFrame.new(-791.815979, 7.00299978, 1566.56799, 0.761823773, 0, -0.647784352, 0, 1, 0, 0.647784352, 0, 0.761823773),
    [4442272183] = CFrame.new(-298.03299, 72.3720016, 299.462006, 0.695097327, 0, 0.718915641, 0, 1, 0, -0.718915641, 0, 0.695097327),
    [7449423635] = CFrame.new(-12602.6953, 331.729675, -7713.47803, -0.998744845, 0, 0.0500874408, 0, 1, 0, -0.0500874408, 0, -0.998744845)
}

local FARM_POSITIONS = {
    [2753915549] = CFrame.new(-1129.8836669921875, 40.46354675292969, -525.4237060546875), -- Sea1
}

local function tpToValentineFarmPos()
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local pos = FARM_POSITIONS[game.PlaceId] or SEA_POSITIONS[game.PlaceId]
        if not pos then return false end
        TP1(pos)
        return true
    end
    return false
end

local function tweenToSea()
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local targetCFrame = SEA_POSITIONS[game.PlaceId]
        if not targetCFrame then return false end
        local TweenService = game:GetService("TweenService")
        local distance = (targetCFrame.Position - character.HumanoidRootPart.Position).Magnitude
        if not character:FindFirstChild("PartTele") then
            local part = Instance.new("Part", character)
            part.Size = Vector3.new(10,1,10)
            part.Name = "PartTele"
            part.Anchored = true
            part.Transparency = 1
            part.CanCollide = true
            part.CFrame = character.HumanoidRootPart.CFrame
            part:GetPropertyChangedSignal("CFrame"):Connect(function()
                if character and character:FindFirstChild("HumanoidRootPart") then
                    character.HumanoidRootPart.CFrame = part.CFrame
                end
            end)
        end
        local tween = TweenService:Create(character.PartTele, TweenInfo.new(distance / 360, Enum.EasingStyle.Linear), {CFrame = targetCFrame})
        tween:Play()
        local finished = false
        tween.Completed:Connect(function(status)
            if status == Enum.PlaybackState.Completed then
                if character:FindFirstChild("PartTele") then
                    character.PartTele:Destroy()
                end
                finished = true
            end
        end)
        while not finished do task.wait() end
        return true
    end
    return false
end

local function fireValentineQuest()
    local sea
    if game.PlaceId == 2753915549 then
        sea = "Sea1"
    elseif game.PlaceId == 4442272183 then
        sea = "Sea2"
    elseif game.PlaceId == 7449423635 then
        sea = "Sea3"
    else
        sea = ""
    end
    return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartNextValentineQuest", sea, 1)
end

local function getQuestTaskType()
    local QuestFrame = player.PlayerGui.Main.Quest
    if not QuestFrame.Visible then return nil end
    local questText = QuestFrame.Container.QuestTitle.Title.Text
    if string.find(questText:lower(), "defeat 5 enemies") then
        return "enemy"
    elseif string.find(questText:lower(), "defeat any 1 boss") then
        return "boss"
    elseif string.find(questText:lower(), "defeat 10 enemies") then
        return "enemy"
    end
    return nil
end

local BOSS_ORDER = {
    [2753915549] = { -- Sea1, World 1
        "The Gorilla King", "Bobby", "Yeti", "Mob Leader", "Vice Admiral", "Warden", "Chief Warden", "Swan", "Magma Admiral", "Fishman Lord", "Wysper", "Thunder God", "Cyborg"
    },
    [4442272183] = { -- Sea2, World 2
        "Diamond", "Jeremy", "Fajita", "Don Swan", "Smoke Admiral", "Cursed Captain", "Order", "Awakened Ice Admiral", "Tide Keeper"
    },
    [7449423635] = { -- Sea3, World 3
        "Stone", "Island Empress", "Rocket Admiral", "Captain Elephant", "Beautiful Pirate", "Longma", "Cake Queen"
    }
}

local LEGENDARY_BOSSES = { 
    ["dough king"] = true,
    ["soul reaper"] = true,
    ["cake prince"] = true,
    ["rip_indra true form"] = true,
    ["darkbeard"] = true,
    ["dark beard"] = true,
    ["rip indra"] = true
}

local BOSS_CFRAMES = {
    -- World 1
    ["The Gorilla King"] = CFrame.new(-1223, 6, -502),
    ["Bobby"] = CFrame.new(-1147, 32, 4350),
    ["Yeti"] = CFrame.new(1221, 138, -1488),
    ["Island Empress"] = CFrame.new(5713, 602, 202),
    ["Dough King"] = CFrame.new(-2151, 88, -12404),
}

local function getLowestAvailableBoss()
    local seaBossList = BOSS_ORDER[game.PlaceId]
    local foundBoss, foundCFrame

    if seaBossList then
        for i, bossName in ipairs(seaBossList) do
            for _, mob in ipairs(game.Workspace.Enemies:GetChildren()) do
                if mob.Name == bossName and mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart")
                and mob.Humanoid.Health > 0 and mob.Name ~= "Saber Expert" then
                    return mob, mob.HumanoidRootPart.CFrame
                end
            end
        end
    end

    for _, mob in ipairs(game.Workspace.Enemies:GetChildren()) do
        local mobNameLower = mob.Name:lower()
        if LEGENDARY_BOSSES[mobNameLower] and mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart")
        and mob.Humanoid.Health > 0 and mob.Name ~= "Saber Expert" then
            return mob, mob.HumanoidRootPart.CFrame
        end
    end

    if seaBossList then
        for i, bossName in ipairs(seaBossList) do
            if BOSS_CFRAMES[bossName] then
                return nil, BOSS_CFRAMES[bossName]
            end
        end
    end
    return nil, nil
end


local function killEnemies(amount)
    tpToValentineFarmPos()
    local killed = 0
    for _,v in pairs(game.Workspace.Enemies:GetChildren()) do
        if _G.AutoValentineQuestFarm 
            and v.Name ~= "Saber Expert"
            and v.Name ~= "The Saw"
            and v:FindFirstChild("Humanoid") 
            and v:FindFirstChild("HumanoidRootPart") 
            and v.Humanoid.Health > 0 
        then
            repeat
                AutoHaki()
                EquipWeapon(_G.SelectWeapon)
                v.HumanoidRootPart.CanCollide = false
                v.Humanoid.WalkSpeed = 0
                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                game:GetService("VirtualUser"):CaptureController()
                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                task.wait()
            until not _G.AutoValentineQuestFarm or not v.Parent or v.Humanoid.Health <= 0
            killed = killed + 1
            if amount and killed >= amount then break end
        end
    end
end

local function killLowestToHighestBoss()
    local boss, bossCFrame = getLowestAvailableBoss()
    if boss and bossCFrame then
        if tween and typeof(tween) == "function" then
            pcall(function()
                tween(bossCFrame * CFrame.new(0,20,0))
            end)
        else
            topos(bossCFrame * CFrame.new(0,20,0))
        end
        repeat
            AutoHaki()
            EquipWeapon(_G.SelectWeapon)
            boss.HumanoidRootPart.CanCollide = false
            boss.Humanoid.WalkSpeed = 0
            boss.HumanoidRootPart.Size = Vector3.new(80,80,80)
            topos(boss.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
            game:GetService("VirtualUser"):CaptureController()
            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
            task.wait()
        until not _G.AutoValentineQuestFarm or not boss.Parent or boss.Humanoid.Health <= 0
    elseif bossCFrame then
        if tween and typeof(tween) == "function" then
            pcall(function()
                tween(bossCFrame * CFrame.new(0, 20, 0))
            end)
        else
            topos(bossCFrame * CFrame.new(0, 20, 0))
        end
        local waited = 0
        while _G.AutoValentineQuestFarm and waited < 20 do
            local potentialBoss = nil
            for _, mob in ipairs(game.Workspace.Enemies:GetChildren()) do
                if bossCFrame and mob:FindFirstChild("HumanoidRootPart") and ((mob.HumanoidRootPart.Position - bossCFrame.Position).Magnitude < 50) and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                    potentialBoss = mob
                    break
                end
            end
            if potentialBoss then
                repeat
                    AutoHaki()
                    EquipWeapon(_G.SelectWeapon)
                    potentialBoss.HumanoidRootPart.CanCollide = false
                    potentialBoss.Humanoid.WalkSpeed = 0
                    potentialBoss.HumanoidRootPart.Size = Vector3.new(80,80,80)
                    topos(potentialBoss.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                    game:GetService("VirtualUser"):CaptureController()
                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                    task.wait()
                until not _G.AutoValentineQuestFarm or not potentialBoss.Parent or potentialBoss.Humanoid.Health <= 0
                break
            end
            task.wait(1)
            waited = waited + 1
        end
    end
end

VSTIME2:Toggle({
    Name = "Auto Valentine Quest Farm",
    Default = false,
    Callback = function(val)
        _G.AutoValentineQuestFarm = val
        if val then
            spawn(function()
                while _G.AutoValentineQuestFarm do
                    pcall(function()
                        if not player.PlayerGui.Main.Quest.Visible then
                            if tweenToSea() then
                                fireValentineQuest()
                                task.wait(1.5)
                            else
                                task.wait(.5)
                            end
                        else
                            local questType = getQuestTaskType()
                            if questType == "enemy" then
                                killEnemies()
                            elseif questType == "boss" then
                                killLowestToHighestBoss()
                            else
                                task.wait(1)
                            end
                        end
                    end)
                    task.wait(.15)
                end
            end)
        end
    end
})



local VisualPage = MainWindow:Page({
    Name = "Visual",
    Description = "visual/esp options",
    Icon = "rbxassetid://111233133354469",
    Search = false
})
local TeleportPage = MainWindow:Page({
    Name = "Teleport",
    Description = "teleport options",
    Icon = "lucide:map-pin",
    Search = false
})
local ShopPage = MainWindow:Page({
    Name = "Shop",
    Description = "shop options",
    Icon = "lucide:shopping-cart",
    Search = false
})

local ShopSubPage = ShopPage:SubPage({
    Icon = "rbxassetid://134546249616852",
    Name = "Shop SubPage"
})


local TeleportSubPage = TeleportPage:SubPage({Icon = "rbxassetid://134546249616852", Name = "Teleport SubPage"})
local Teleport1 = TeleportSubPage:Section({
    Name = "Teleport Section Left",
    Side = 1
})
local Teleportt = TeleportSubPage:Section({
    Name = "Teleport Section Right",
    Side = 2
})

local MiscPage = MainWindow:Page({
    Name = "Misc",
    Description = "miscellaneous",
    Icon = "rbxassetid://111233133354469",
    Search = false
})


local MainSubPage = MainPage:SubPage({Icon = "rbxassetid://134546249616852", Name = "Main SubPage"})
local MainSectionLeft = MainSubPage:Section({
    Name = "Main Section Left",
    Side = 1
})
local MainSectionRight = MainSubPage:Section({
    Name = "Main Section Right",
    Side = 2
})

local PlayerSubPage = PlayerPage:SubPage({Icon = "rbxassetid://134546249616852", Name = "Player SubPage"})
local PlayerSectionLeft = PlayerSubPage:Section({
    Name = "Player Section Left",
    Side = 1
})
local PlayerSectionRight = PlayerSubPage:Section({
    Name = "Player Section Right",
    Side = 2
})
local PlayerSectionLeft3 = PlayerSubPage:Section({
    Name = "Player Section Left 2",
    Side = 1
})

local QuestSubPage = QuestPage:SubPage({Icon = "rbxassetid://134546249616852", Name = "Quest SubPage"})


local QuestSectionLeft = QuestSubPage:Section({
    Name = "Quest Section",
    Side = 1
})
local QuestSectionRight = QuestSubPage:Section({
    Name = "Quest Section",
    Side = 2
})
local VisualSubPage = VisualPage:SubPage({Icon = "rbxassetid://134546249616852", Name = "Visual SubPage"})
local VisualSectionLeft = VisualSubPage:Section({
    Name = "Visual Section Left",
    Side = 1
})
local VisualSectionRight = VisualSubPage:Section({
    Name = "Visual & Stats Right",
    Side = 2
})
local Statss = VisualSubPage:Section({
    Name = "Stats Right",
    Side = 2
})

local MiscSubPage = MiscPage:SubPage({Icon = "rbxassetid://134546249616852", Name = "Misc SubPage"})
local ShopLeft = ShopSubPage:Section({
    Name = "Shop Section Left",
    Side = 1
})

local ShopRight = ShopSubPage:Section({
    Name = "Shop Section Right",
    Side = 2
})

local MiscSectionLefts = MiscSubPage:Section({
    Name = "Misc Section Left",
    Side = 1
})
local MiscSectionRights = MiscSubPage:Section({
    Name = "Misc Section Right",
    Side = 2
})

Teleportt:Button({
    Name = "First Sea",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
    end
})

Teleportt:Button({
    Name = "Second Sea",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
})

Teleportt:Button({
    Name = "Third Sea",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end
})

local islandsByWorld = {
    World1 = {
        "WindMill","Marine","Middle Town","Jungle","Pirate Village","Desert","Snow Island","MarineFord",
        "Colosseum","Sky Island 1","Sky Island 2","Sky Island 3","Prison","Magma Village",
        "Under Water Island","Fountain City","Shank Room","Mob Island"
    },
    World2 = {
        "The Cafe","Frist Spot","Dark Area","Flamingo Mansion","Flamingo Room","Green Zone",
        "Factory","Colossuim","Zombie Island","Two Snow Mountain","Punk Hazard","Cursed Ship",
        "Ice Castle","Forgotten Island","Ussop Island","Mini Sky Island"
    },
    World3 = {
        "Mansion","Port Town","Great Tree","Castle On The Sea","MiniSky","Hydra Island",
        "Floating Turtle","Haunted Castle","Ice Cream Island","Peanut Island","Cake Island",
        "Cocoa Island","Candy Island","Tiki Outpost"
    }
}

local selectedWorld
if World1 then selectedWorld = "World1"
elseif World2 then selectedWorld = "World2"
elseif World3 then selectedWorld = "World3"
end

if selectedWorld and islandsByWorld[selectedWorld] then
    Teleportt:Dropdown({
        Name = "Select Island",
        Flag = "SelectIsland",
        Items = islandsByWorld[selectedWorld],
        Default = islandsByWorld[selectedWorld][1],
        Callback = function(Value)
            _G.SelectIsland = Value
        end
    })
end


Teleportt:Toggle({
    Name = "Tween To Island",
    Flag = "Tween",
    Default = false,
    Callback = function(Value)
        _G.TeleportIsland = Value
        if _G.TeleportIsland == true then
            repeat wait()
                if _G.SelectIsland == "WindMill" then
                    topos(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
                elseif _G.SelectIsland == "Marine" then
                    topos(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
                elseif _G.SelectIsland == "Middle Town" then
                    topos(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
                elseif _G.SelectIsland == "Jungle" then
                    topos(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
                elseif _G.SelectIsland == "Pirate Village" then
                    topos(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
                elseif _G.SelectIsland == "Desert" then
                    topos(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
                elseif _G.SelectIsland == "Snow Island" then
                    topos(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
                elseif _G.SelectIsland == "MarineFord" then
                    topos(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
                elseif _G.SelectIsland == "Colosseum" then
                    topos( CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
                elseif _G.SelectIsland == "Sky Island 1" then
                    topos(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
                elseif _G.SelectIsland == "Sky Island 2" then  
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
                elseif _G.SelectIsland == "Sky Island 3" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                elseif _G.SelectIsland == "Prison" then
                    topos( CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
                elseif _G.SelectIsland == "Magma Village" then
                    topos(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
                elseif _G.SelectIsland == "Under Water Island" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                elseif _G.SelectIsland == "Fountain City" then
                    topos(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
                elseif _G.SelectIsland == "Shank Room" then
                    topos(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
                elseif _G.SelectIsland == "Mob Island" then
                    topos(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
                elseif _G.SelectIsland == "The Cafe" then
                    topos(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
                elseif _G.SelectIsland == "Frist Spot" then
                    topos(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
                elseif _G.SelectIsland == "Dark Area" then
                    topos(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
                elseif _G.SelectIsland == "Flamingo Mansion" then
                    topos(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234))
                elseif _G.SelectIsland == "Flamingo Room" then
                    topos(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
                elseif _G.SelectIsland == "Green Zone" then
                    topos( CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
                elseif _G.SelectIsland == "Factory" then
                    topos(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
                elseif _G.SelectIsland == "Colossuim" then
                    topos( CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
                elseif _G.SelectIsland == "Zombie Island" then
                    topos(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
                elseif _G.SelectIsland == "Two Snow Mountain" then
                    topos(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
                elseif _G.SelectIsland == "Punk Hazard" then
                    topos(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
                elseif _G.SelectIsland == "Cursed Ship" then
                    topos(CFrame.new(923.40197753906, 125.05712890625, 32885.875))
                elseif _G.SelectIsland == "Ice Castle" then
                    topos(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
                elseif _G.SelectIsland == "Forgotten Island" then
                    topos(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
                elseif _G.SelectIsland == "Ussop Island" then
                    topos(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
                elseif _G.SelectIsland == "Mini Sky Island" then
                    topos(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
                elseif _G.SelectIsland == "Great Tree" then
                    topos(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
                elseif _G.SelectIsland == "Castle On The Sea" then
                    topos(CFrame.new(-5074.45556640625, 314.5155334472656, -2991.054443359375))
                elseif _G.SelectIsland == "MiniSky" then
                    topos(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
                elseif _G.SelectIsland == "Port Town" then
                    topos(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
                elseif _G.SelectIsland == "Hydra Island" then
                    topos(CFrame.new(5255.1049, 1004.1949, 344.7700))
                elseif _G.SelectIsland == "Floating Turtle" then
                    topos(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
                elseif _G.SelectIsland == "Mansion" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
                elseif _G.SelectIsland == "Haunted Castle" then
                    topos(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
                elseif _G.SelectIsland == "Ice Cream Island" then
                    topos(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
                elseif _G.SelectIsland == "Peanut Island" then
                    topos(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
                elseif _G.SelectIsland == "Cake Island" then
                    topos(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
                elseif _G.SelectIsland == "Cocoa Island" then
                    topos(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375))
                elseif _G.SelectIsland == "Candy Island" then
                    topos(CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625))
                elseif _G.SelectIsland == "Tiki Outpost" then
                    topos(CFrame.new(-16218.6826, 9.08636189, 445.618408, -0.0610186495, 1.10512588e-09, -0.99813664, -1.83458475e-08, 1, 2.22871765e-09, 0.99813664, 1.84476558e-08, -0.0610186495))
                end
            until not _G.TeleportIsland
        end
        StopTween(_G.TeleportIsland)
    end
})


if World1 then
    Teleport1:Dropdown({
        Name = "Select NPC",
        Flag = "Dropdown",
        Items = {"Random Devil Fruit","Blox Fruits Dealer","Remove Devil Fruit","Ability Teacher","Dark Step","Electro","Fishman Karate"},
        Default = 1,
        Callback = function(Value)
            _G.SelectNPC = Value
        end
    })
elseif World2 then
    Teleport1:Dropdown({
        Name = "Select NPC",
        Items = {"Dargon Berath","Mtsterious Man","Mysterious Scientist","Awakening Expert","Nerd","Bar Manager","Blox Fruits Dealer","Trevor","Enhancement Editor","Pirate Recruiter","Marines Recruiter","Chemist","Cyborg","Ghoul Mark","Guashiem","El Admin","El Rodolfo","Arowe"},
        Default = 1,
        Callback = function(Value)
            _G.SelectNPC = Value
        end
    })
elseif World3 then
    Teleport1:Dropdown({
        Name = "Select NPC",
        Items = {"Blox Fruits Dealer","Remove Devil Fruit","Horned Man","Hungey Man","Previous Hero","Butler","Lunoven","Trevor","Elite Hunter","Player Hunter","Uzoth"},
        Default = 1,
        Callback = function(Value)
            _G.SelectNPC = Value
        end
    })
end

Teleport1:Toggle({
    Name = "Auto Teleporter Npc",
    Flag = "Toggle",
    Default = false,
    Callback = function(Value)
        _G.TeleportNPC = Value
        if _G.TeleportNPC == true then
            repeat wait()
                if _G.SelectNPC == "Dargon Berath" then
                    topos(CFrame.new(703.372986, 186.985519, 654.522034, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Mtsterious Man" then
                    topos(CFrame.new(-2574.43335, 1627.92371, -3739.35767, 0.378697902, -9.06400288e-09, 0.92552036, -8.95582009e-09, 1, 1.34578926e-08, -0.92552036, -1.33852689e-08, 0.378697902))
                elseif _G.SelectNPC == "Mysterious Scientist" then
                    topos(CFrame.new(-6437.87793, 250.645355, -4498.92773, 0.502376854, -1.01223634e-08, -0.864648759, 2.34106086e-08, 1, 1.89508653e-09, 0.864648759, -2.11940012e-08, 0.502376854))
                elseif _G.SelectNPC == "Awakening Expert" then
                    topos(CFrame.new(-408.098846, 16.0459061, 247.432846, 0.028394036, 6.17599138e-10, 0.999596894, -5.57905944e-09, 1, -4.59372484e-10, -0.999596894, -5.56376767e-09, 0.028394036))
                elseif _G.SelectNPC == "Nerd" then
                    topos(CFrame.new(-401.783722, 73.0859299, 262.306702, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Bar Manager" then
                    topos(CFrame.new(-385.84726, 73.0458984, 316.088806, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Blox Fruits Dealer" then
                    topos(CFrame.new(-450.725464, 73.0458984, 355.636902, -0.780352175, -2.7266168e-08, 0.625340283, 9.78516468e-09, 1, 5.58128797e-08, -0.625340283, 4.96727601e-08, -0.780352175))
                elseif _G.SelectNPC == "Trevor" then
                    topos(CFrame.new(-341.498322, 331.886444, 643.024963, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Plokster" then
                    topos( CFrame.new(-1885.16016, 88.3838196, -1912.28723, -0.513468027, 0, 0.858108759, 0, 1, 0, -0.858108759, 0, -0.513468027))
                elseif _G.SelectNPC == "Enhancement Editor" then
                    topos(CFrame.new(-346.820221, 72.9856339, 1194.36218, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Pirate Recruiter" then  
                    topos(CFrame.new(-428.072998, 72.9495239, 1445.32422, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Marines Recruiter" then
                    topos(CFrame.new(-1349.77295, 72.9853363, -1045.12964, 0.866493046, 0, -0.499189168, 0, 1, 0, 0.499189168, 0, 0.866493046))
                elseif _G.SelectNPC == "Chemist" then
                    topos( CFrame.new(-2777.45288, 72.9919434, -3572.25732, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Ghoul Mark" then
                    topos(CFrame.new(635.172546, 125.976357, 33219.832, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Cyborg" then
                    topos(CFrame.new(629.146851, 312.307373, -531.624146, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Guashiem" then
                    topos(CFrame.new(937.953003, 181.083359, 33277.9297, 1, -8.60126406e-08, 3.81773896e-17, 8.60126406e-08, 1, -1.89969598e-16, -3.8177373e-17, 1.89969598e-16, 1))
                elseif _G.SelectNPC == "El Admin" then
                    topos(CFrame.new(1322.80835, 126.345039, 33135.8789, 0.988783717, -8.69797603e-08, -0.149354503, 8.62223786e-08, 1, -1.15461916e-08, 0.149354503, -1.46101409e-09, 0.988783717))
                elseif _G.SelectNPC == "El Rodolfo" then
                    topos(CFrame.new(941.228699, 40.4686775, 32778.9922, -0.818029106, -1.19524382e-08, 0.575176775, -1.28741648e-08, 1, 2.47053866e-09, -0.575176775, -5.38394795e-09, -0.818029106))
                elseif _G.SelectNPC == "Arowe" then
                    topos(CFrame.new(-1994.51038, 125.519142, -72.2622986, -0.16715166, -6.55417338e-08, -0.985931218, -7.13315558e-08, 1, -5.43836585e-08, 0.985931218, 6.12376851e-08, -0.16715166))
                elseif _G.SelectNPC == "Random Devil Fruit" then
                    if World1 then
                        topos(CFrame.new(-1436.19727, 61.8777695, 4.75247526, -0.557794094, 2.74216543e-08, 0.829979479, 5.83273234e-08, 1, 6.16037932e-09, -0.829979479, 5.18467118e-08, -0.557794094))
                    elseif World3 then
                        topos(CFrame.new(-12491, 337, -7449))
                    end
                elseif _G.SelectNPC == "Blox Fruits Dealer" then
                    if World1 then
                        topos(CFrame.new(-923.255066, 7.67800522, 1608.61011, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                    elseif World3 then
                        topos(CFrame.new(-12511, 337, -7448))
                    end
                elseif _G.SelectNPC == "Remove Devil Fruit" then
                    if World1 then
                        topos(CFrame.new(5664.80469, 64.677681, 867.85907, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                    elseif World3 then
                        topos(CFrame.new(-5571, 1089, -2661))
                    end
                elseif _G.SelectNPC == "Ability Teacher" then
                    topos(CFrame.new(-1057.67822, 9.65220833, 1799.49146, -0.865874112, -9.26330159e-08, 0.500262439, -7.33759435e-08, 1, 5.816689e-08, -0.500262439, 1.36579752e-08, -0.865874112))
                elseif _G.SelectNPC == "Dark Step" then
                    topos( CFrame.new(-987.873047, 13.7778397, 3989.4978, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Electro" then
                    topos(CFrame.new(-5389.49561, 13.283, -2149.80151, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Fishman Karate" then
                    topos( CFrame.new(61581.8047, 18.8965912, 987.832703, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Horned Man" then
                    topos(CFrame.new(-11890, 931, -8760))
                elseif _G.SelectNPC == "Hungey Man" then
                    topos(CFrame.new(-10919, 624, -10268))
                elseif _G.SelectNPC == "Previous Hero" then
                    topos(CFrame.new(-10368, 332, -10128))
                elseif _G.SelectNPC == "Butler" then
                    topos(CFrame.new(-5125, 316, -3130))
                elseif _G.SelectNPC == "Lunoven" then
                    topos(CFrame.new(-5117, 316, -3093))
                elseif _G.SelectNPC == "Elite Hunter" then
                    topos(CFrame.new(-5420, 314, -2828))
                elseif _G.SelectNPC == "Player Hunter" then
                    topos(CFrame.new(-5559, 314, -2840))
                elseif _G.SelectNPC == "Uzoth" then
                    topos(CFrame.new(-9785, 852, 6667))
                end
            until not _G.TeleportNPC
        end
        StopTween(_G.TeleportNPC)
    end
})

local PlayerList = {}
for i,v in pairs(game:GetService("Players"):GetChildren()) do  
    table.insert(PlayerList, v.Name)
end

PlayerSectionLeft:Dropdown({
    Name = "Select Player",
    Items = PlayerList,
    Default = 1,
    Callback = function(value)
        _G.SelectPly = value
    end
})

PlayerSectionLeft:Button({
    Name = "Refresh Player List",
    Callback = function()
        PlayerList = {}
        for i,v in pairs(game:GetService("Players"):GetChildren()) do  
            table.insert(PlayerList, v.Name)
        end
    end
})

PlayerSectionLeft:Toggle({
    Name = "Spectate Player",
    Default = false,
    Callback = function(value)
        SpectatePlys = value
        local plr1 = game:GetService("Players").LocalPlayer.Character.Humanoid
        local plr2 = game:GetService("Players"):FindFirstChild(_G.SelectPly)
        if value then
            spawn(function()
                repeat wait(.1)
                    if game:GetService("Players"):FindFirstChild(_G.SelectPly) then
                        game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.Humanoid
                    end
                until SpectatePlys == false 
                game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
            end)
        end
    end
})

PlayerSectionLeft:Toggle({
    Name = "Teleport To Player",
    Default = false,
    Callback = function(value)
        _G.TeleportPly = value
        pcall(function()
            if _G.TeleportPly then
                spawn(function()
                    repeat 
                        if game:GetService("Players"):FindFirstChild(_G.SelectPly) then
                            topos(game:GetService("Players")[_G.SelectPly].Character.HumanoidRootPart.CFrame) 
                        end
                        wait() 
                    until _G.TeleportPly == false
                end)
            end
            StopTween(_G.TeleportPly)
        end)
    end
})

PlayerSectionLeft:Toggle({
    Name = "Auto Kill Players",
    Default = false,
    Callback = function(value)
        _G.AutoKillPlayer = value
        StopTween(_G.AutoKillPlayer)
    end
})
-- ass



spawn(function()
    while wait() do
        if _G.AutoKillPlayer then
            pcall(function()
                if _G.SelectPly ~= nil then 
                    if game.Players:FindFirstChild(_G.SelectPly) then
                        if game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health > 0 then
                            repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                AutoHaki()
                                game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CanCollide = false
                                topos(game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CFrame * CFrame.new(0,5,0))
                                spawn(function()
                                    pcall(function()
                                        if _G.SelectWeapon == SelectWeaponGun then
                                            local args = {
                                                [1] = game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position,
                                                [2] = game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart
                                            }
                                            game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
                                        else
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                        end
                                    end)
                                end)
                            until game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health <= 0 or not game.Players:FindFirstChild(_G.SelectPly) or not _G.AutoKillPlayer
                        end
                    end
                end
            end)
        end
    end
end)

PlayerSectionRight:Button({
    Name = "Get Quest for Elite Players",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
    end
})

PlayerSectionRight:Toggle({
    Name = "Auto Player Hunter",
    Default = false,
    Callback = function(value)
        _G.AutoPlayerHunter = value
        StopTween(_G.AutoPlayerHunter)
    end
})

spawn(function()
    game:GetService("RunService").Heartbeat:connect(function()
        pcall(function()
            if _G.AutoPlayerHunter then
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
                    game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
                end
            end
        end)
    end)
end)

spawn(function()
    pcall(function()
        while wait(.1) do
            if _G.AutoPlayerHunter then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                end
            end
        end
    end)
end)

spawn(function()
    while wait() do
        if _G.AutoPlayerHunter then
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                wait(.5)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
            else
                for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Name.Text,v.Name) then
                        repeat wait()
                            AutoHaki()
                            EquipWeapon(_G.SelectWeapon)
                            Useskill = true
                            topos(v.HumanoidRootPart.CFrame * CFrame.new(1,7,3))								
                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                            game:GetService'VirtualUser':CaptureController()
                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                        until _G.AutoPlayerHunter == false or v.Humanoid.Health <= 0
                        Useskill = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                end
            end
        end
    end
end)


local PlayerSelectAimbot = nil
local TargetPlayerAim = nil

spawn(function()
    while task.wait(0.2) do
        local closestDist = math.huge
        local closestPlayer = nil
        local myChar = game.Players.LocalPlayer.Character
        local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
        if myHRP then
            for _,plr in ipairs(game.Players:GetPlayers()) do
                if plr ~= game.Players.LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
                    local dist = (plr.Character.HumanoidRootPart.Position - myHRP.Position).magnitude
                    if dist < closestDist then
                        closestDist = dist
                        closestPlayer = plr
                    end
                end
            end
        end
        PlayerSelectAimbot = closestPlayer and closestPlayer.Name or nil
    end
end)

PlayerSectionRight:Toggle({
    Name = "Aimbot Gun",
    Default = false,
    Callback = function(v)
        _G.Aimbot_Gun = v
    end
})

spawn(function()
    while task.wait(0.05) do
        if _G.Aimbot_Gun and SelectWeaponGun and PlayerSelectAimbot then
            local myChar = game.Players.LocalPlayer.Character
            local tool = myChar and myChar:FindFirstChild(SelectWeaponGun)
            local target = game.Players:FindFirstChild(PlayerSelectAimbot)
            local targetChar = target and target.Character
            local targetHRP = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
            if tool and tool:FindFirstChild("Cooldown") and tool:FindFirstChild("RemoteFunctionShoot") and targetHRP then
                pcall(function()
                    tool.Cooldown.Value = 0
                    tool.RemoteFunctionShoot:InvokeServer(targetHRP.Position, targetHRP)
                    game:GetService'VirtualUser':CaptureController()
                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280,672))
                end)
            end
        end
    end
end)

PlayerSectionRight:Toggle({
    Name = "Aimbot Skill Nearest",
    Default = false,
    Callback = function(v)
        AimSkillNearest = v
    end
})

spawn(function()
    while task.wait(0.2) do
        local closestDist = math.huge
        local closestPlayer = nil
        local myChar = game.Players.LocalPlayer.Character
        local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
        if myHRP then
            for _,plr in ipairs(game.Players:GetPlayers()) do
                if plr ~= game.Players.LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
                    local dist = (plr.Character.HumanoidRootPart.Position - myHRP.Position).magnitude
                    if dist < closestDist then
                        closestDist = dist
                        closestPlayer = plr
                    end
                end
            end
        end
        TargetPlayerAim = closestPlayer and closestPlayer.Name or nil
    end
end)

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if AimSkillNearest and TargetPlayerAim then
            local myChar = game.Players.LocalPlayer.Character
            local tool = myChar and myChar:FindFirstChildOfClass("Tool")
            local target = game.Players:FindFirstChild(TargetPlayerAim)
            local targetChar = target and target.Character
            local targetHRP = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
            if tool and myChar[tool.Name]:FindFirstChild("MousePos") and targetHRP then
                myChar[tool.Name].RemoteEvent:FireServer(targetHRP.Position)
            end
        end
    end)
end)

PlayerSectionRight:Toggle({
    Name = "Aimbot Skill",
    Default = false,
    Callback = function(v)
        _G.Aimbot_Skill = v
    end
})

spawn(function()
    while task.wait(0.05) do
        if _G.Aimbot_Skill and PlayerSelectAimbot then
            local myChar = game.Players.LocalPlayer.Character
            local tool = myChar and myChar:FindFirstChildOfClass("Tool")
            local target = game.Players:FindFirstChild(PlayerSelectAimbot)
            local targetChar = target and target.Character
            local targetHRP = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
            if tool and myChar[tool.Name]:FindFirstChild("MousePos") and targetHRP then
                myChar[tool.Name].RemoteEvent:FireServer(targetHRP.Position)
            end
        end
    end
end)

PlayerSectionLeft3:Toggle({
    Name = "Enable PvP",
    Default = false,
    Callback = function(value)
        _G.EnabledPvP = value
    end
})

spawn(function()
    pcall(function()
        while wait(.1) do
            if _G.EnabledPvP then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                end
            end
        end
    end)
end)

PlayerSectionLeft3:Toggle({
    Name = "Safe Mode",
    Default = false,
    Callback = function(value)
        _G.SafeMode = value
        StopTween(_G.SafeMode)
    end
})

spawn(function()
    pcall(function()
        while wait() do
            if _G.SafeMode then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,200,0)
            end
        end
    end)
end)

PlayerSectionLeft3:Button({
    Name = "Respawn",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Pirates") 
        wait()
    end
})

PlayerSectionRight:Toggle({
    Name = "Auto Use Skill Z",
    Default = true,
    Callback = function(value)
        SkillZ = value
    end
})

PlayerSectionRight:Toggle({
    Name = "Auto Use Skill X",
    Default = false,
    Callback = function(value)
        SkillX = value
    end
})

PlayerSectionRight:Toggle({
    Name = "Auto Use Skill C",
    Default = false,
    Callback = function(value)
        SkillC = value
    end
})

PlayerSectionRight:Toggle({
    Name = "Auto Use Skill V",
    Default = false,
    Callback = function(value)
        SkillV = value
    end
})

PlayerSectionRight:Toggle({
    Name = "Auto Use Skill F",
    Default = false,
    Callback = function(value)
        SkillF = value
    end
})

Abilities = false
SelectBoat = "Pirate Sloop"
_G.SelectBoat = "PirateSloop"

spawn(function()
    while wait() do
        pcall(function()
            if SelectBoat == "Pirate Sloop" then
                _G.SelectBoat = "PirateSloop"
            elseif SelectBoat == "Enforcer" then
                _G.SelectBoat = "Enforcer"
            elseif SelectBoat == "Rocket Boost" then
                _G.SelectBoat = "RocketBoost"
            elseif SelectBoat == "Dinghy" then
                _G.SelectBoat = "Dinghy"
            elseif SelectBoat == "Pirate Basic" then
                _G.SelectBoat = "PirateBasic"
            elseif SelectBoat == "Pirate Brigade" then
                _G.SelectBoat = "PirateBrigade"
            end
        end)
    end
end)

local Statuses = ShopLeft:Status({Name = "Abilities"})


ShopLeft:Button({
    Name = "Buy Geppo $10,000",
    Desc = "Purchase Geppo ability",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
    end
})

ShopLeft:Button({
    Name = "Buy Buso Haki $25,000",
    Desc = "Purchase Buso Haki ability",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
    end
})

ShopLeft:Button({
    Name = "Buy Soru $25,000",
    Desc = "Purchase Soru ability",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
    end
})

ShopLeft:Button({
    Name = "Buy Observation Haki $750,000",
    Desc = "Purchase Observation Haki ability",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
    end
})

ShopLeft:Toggle({
    Name = "Auto Buy Abilities",
    Default = false,
    Callback = function(value)
        Abilities = value
        while Abilities do 
            wait(.1)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
        end
    end
})

local Statuss = ShopRight:Status({Name = "Boats"})


ShopRight:Dropdown({
    Name = "Select Boats",
    Items = {"Pirate Sloop", "Enforcer", "Rocket Boost", "Dinghy", "Pirate Basic", "Pirate Brigade"},
    Default = 1,
    Callback = function(value)
        SelectBoat = value
    end
})

ShopRight:Button({
    Name = "Buy Boat",
    Desc = "Purchase selected boat",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat",_G.SelectBoat)
    end
})

local Status = ShopLeft:Status({Name = "Fighting Styles"})


ShopLeft:Button({
    Name = "Buy Black Leg $150,000",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
    end
})

ShopLeft:Button({
    Name = "Buy Electro $550,000",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
    end
})

ShopLeft:Button({
    Name = "Buy Water Kung Fu $750,000",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    end
})

ShopLeft:Button({
    Name = "Buy Dragon Claw 1,500F",
     Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
    end
})

ShopLeft:Button({
    Name = "Buy Superhuman $3,000,000",
     Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
    end
})

ShopLeft:Button({
    Name = "Buy Death Step $5,000,000 5,000F",
     Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
    end
})

ShopLeft:Button({
    Name = "Buy Sharkman Karate $2,500,000 5,000F",
     Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    end
})

ShopLeft:Button({
    Name = "Buy Electric Claw $3,000,000 5,000F",
     Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
    end
})

ShopLeft:Button({
    Name = "Buy Dragon Talon $3,000,000 5,000F",
     Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
    end
})

ShopLeft:Button({
    Name = "Buy God Human $5,000,000 5,000F",
     Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
    end
})

ShopLeft:Button({
    Name = "Buy Sanguine Art $5,000,000 5,000F",
     Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt", true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")
    end
})

local Status = ShopRight:Status({Name = "Swords"})


ShopRight:Button({
    Name = "Cutlass $1,000",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cutlass")
    end
})

ShopRight:Button({
    Name = "Katana $1,000",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Katana")
    end
})

ShopRight:Button({
    Name = "Iron Mace $25,000",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Iron Mace")
    end
})

ShopRight:Button({
    Name = "Dual Katana $12,000",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Duel Katana")
    end
})

ShopRight:Button({
    Name = "Triple Katana $60,000",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Triple Katana")
    end
})

ShopRight:Button({
    Name = "Pipe $100,000",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Pipe")
    end
})

ShopRight:Button({
    Name = "Dual-Headed Blade $400,000",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Dual-Headed Blade")
    end
})

ShopRight:Button({
    Name = "Bisento $1,200,000",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Bisento")
    end
})

ShopRight:Button({
    Name = "Soul Cane $750,000",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Soul Cane")
    end
})

ShopRight:Button({
    Name = "Pole v.2 5,000F",
    Callback = function()
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ThunderGodTalk")
    end
})

local Statuse = ShopRight:Status({Name = "Guns"})


ShopRight:Button({
    Name = "Slingshot $5,000",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Slingshot")
    end
})

ShopRight:Button({
    Name = "Musket $8,000",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Musket")
    end
})

ShopRight:Button({
    Name = "Flintlock $10,500",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Flintlock")
    end
})

ShopRight:Button({
    Name = "Refined Slingshot $30,000",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Refined Slingshot")
    end
})

ShopRight:Button({
    Name = "Refined Flintlock $65,000",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Refined Flintlock")
    end
})

ShopRight:Button({
    Name = "Cannon $100,000",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cannon")
    end
})

ShopRight:Button({
    Name = "Kabucha 1,500F",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","2")
    end
})

ShopRight:Button({
    Name = "Bizarre Rifle 250 Ectoplasm",
    Callback = function()
        local A_1 = "Ectoplasm"
        local A_2 = "Buy"
        local A_3 = 1
        local Event = game:GetService("ReplicatedStorage").Remotes["CommF_"]
        Event:InvokeServer(A_1, A_2, A_3)
    end
})

local Statuse = ShopLeft:Status({Name = "Stats"})


ShopLeft:Button({
    Name = "Reset Stats 2,500F",
    Desc = "Reset all stats",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
    end
})

ShopLeft:Button({
    Name = "Random Race 3,000F",
    Desc = "Get random race",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
    end
})

ShopLeft:Status({
    Name = "Accessories"
})

ShopLeft:Button({
    Name = "Black Cape $50,000",
    Desc = "Purchase Black Cape accessory",
    Callback = function()
        local args = {
            [1] = "BuyItem",
            [2] = "Black Cape"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})

ShopLeft:Button({
    Name = "Swordsman Hat $150,000",
    Desc = "Purchase Swordsman Hat accessory",
    Callback = function()
        local args = {
            [1] = "BuyItem",
            [2] = "Swordsman Hat"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})

ShopLeft:Button({
    Name = "Tomoe Ring $500,000",
    Desc = "Purchase Tomoe Ring accessory",
    Callback = function()
        local args = {
            [1] = "BuyItem",
            [2] = "Tomoe Ring"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})


ShopLeft:Button({
    Name = "Open Haki Color",
    Desc = "Open Haki Color selection UI",
    Callback = function()
        game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
    end
})

ShopLeft:Button({
    Name = "Open Name Name",
    Desc = "Open Name Name selection UI",
    Callback = function()
        local args = {
            [1] = "getTitles"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
    end
})

ShopLeft:Button({
    Name = "Open Inventory",
    Desc = "Open weapon inventory",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")
        wait(1)
        game:GetService("Players").LocalPlayer.PlayerGui.Main.Inventory.Visible = true
    end
})

ShopLeft:Button({
    Name = "Open Inventory Fruit",
    Desc = "Open fruit inventory",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")
        game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitInventory.Visible = true
    end
})


ShopLeft:Button({
    Name = "Join Pirates Team",
    Desc = "Join the Pirates team",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Pirates")
    end
})

ShopLeft:Button({
    Name = "Join Marines Team",
    Desc = "Join the Marines team",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Marines")
    end
})


MiscSectionLefts:Toggle({
    Name = "Hide Chat",
    Default = false,
    Callback = function(Value)
        _G.chat = Value
        if _G.chat == true then
            local StarterGui = game:GetService('StarterGui')
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)    
        elseif _G.chat == false then
            local StarterGui = game:GetService('StarterGui')
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)    
        end
    end
})

MiscSectionLefts:Toggle({
    Name = "Hide Leaderboard",
    Default = false,
    Callback = function(Value)
        _G.leaderboard = Value
        if _G.leaderboard == true then
            local StarterGui = game:GetService('StarterGui')
            game:GetService('StarterGui'):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)   
        elseif _G.leaderboard == false then
            local StarterGui = game:GetService('StarterGui')
            game:GetService('StarterGui'):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)   
        end
    end
})

MiscSectionLefts:Toggle({
    Name = "Highlight Mode",
    Default = false,
    Callback = function(Value)
        if Value == true then
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Beli.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.HP.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Energy.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.StatsButton.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ShopButton.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Skills.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Level.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.MenuButton.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Code.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Settings.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Mute.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.CrewButton.Visible = false
        else
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Beli.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.HP.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Energy.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.StatsButton.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ShopButton.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Skills.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Level.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.MenuButton.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Code.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Settings.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Mute.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.CrewButton.Visible = true
        end
    end
})


MiscSectionLefts:Button({
    Name = "Redeem All Codes",
    Desc = "Redeem all available codes",
    Callback = function()
        local x2Code = {
            "KITTGAMING",
            "ENYU_IS_PRO",
            "FUDD10",
            "BIGNEWS",
            "THEGREATACE",
            "SUB2GAMERROBOT_EXP1",
            "STRAWHATMAIME",
            "SUB2OFFICIALNOOBIE",
            "SUB2NOOBMASTER123",
            "SUB2DAIGROCK",
            "AXIORE",
            "TANTAIGAMIMG",
            "STRAWHATMAINE",
            "JCWK",
            "FUDD10_V2",
            "SUB2FER999",
            "MAGICBIS",
            "TY_FOR_WATCHING",
            "STARCODEHEO"
        }
        
        function RedeemCode(value)
            game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(value)
        end
        for i,v in pairs(x2Code) do
            RedeemCode(v)
        end
    end
})


MiscSectionRights:Button({
    Name = "Fps Boost",
    Desc = "Boost FPS performance",
    Callback = function()
        local decalsyeeted = true 
        local g = game
        local w = g.Workspace
        local l = g.Lighting
        local t = w.Terrain
        settings().Rendering.QualityLevel = "Level01"
        for i, v in pairs(g:GetDescendants()) do
            if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
                v.Material = "Plastic"
                v.Reflectance = 0
            elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Lifetime = NumberRange.new(0)
            elseif v:IsA("Explosion") then
                v.BlastPressure = 1
                v.Blastradius = 1
            elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
                v.Enabled = false
            end
        end
    end
})

MiscSectionRights:Button({
    Name = "Remove Fog",
    Desc = "Remove fog effects",
    Callback = function()
        game:GetService("Lighting").LightingLayers:Destroy()
        game:GetService("Lighting").Sky:Destroy()
        game.Lighting.FogEnd = 9e9
    end
})

MiscSectionRights:Button({
    Name = "Remove Lava",
    Desc = "Remove lava effects",
    Callback = function()
        for i,v in pairs(game.Workspace:GetDescendants()) do
            if v.Name == "Lava" then   
                v:Destroy()
            end
        end
        for i,v in pairs(game.ReplicatedStorage:GetDescendants()) do
            if v.Name == "Lava" then   
                v:Destroy()
            end
        end
    end
})

MiscSectionRights:Button({
    Name = "Rejoin Server",
    Desc = "Rejoin current server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end
})

MiscSectionRights:Button({
    Name = "Server Hop",
    Desc = "Switch to different server",
    Callback = function()
        while wait() do
            local module = loadstring(game:HttpGet"https://roblox.relzscript.xyz/Hop.lua")()
            module:Teleport(game.PlaceId, "Singapore")
        end
    end
})


IslandESP = false
ESPPlayer = false
DevilFruitESP = false
FlowerESP = false
RealFruitESP = false
GearESP = false
Berry = false
PrehistoricIslandESP = false


VisualSectionRight:Toggle({
    Name = "Esp Island",
    Default = false,
    Callback = function(value)
        IslandESP = value
        spawn(function()
            while IslandESP do 
                wait()
                UpdateIslandESP() 
            end
        end)
    end
})

spawn(function()
    while wait(2) do
        if IslandESP then
            UpdateIslandESP() 
        end
    end
end)

VisualSectionLeft:Toggle({
    Name = "Esp Player",
    Default = false,
    Callback = function(value)
        ESPPlayer = value
        spawn(function()
            while ESPPlayer do 
                wait()
                UpdatePlayerChams()
            end
        end)
    end
})

spawn(function()
    while wait(2) do
        if ESPPlayer then
            UpdatePlayerChams()
        end
    end
end)

VisualSectionLeft:Toggle({
    Name = "Esp Chest",
    Default = false,
    Callback = function(value)
        _G.ChestESP = value
        spawn(function()
            while _G.ChestESP do 
                wait()
                UpdateChestESP()
            end
        end)
    end
})

spawn(function()
    while wait(2) do
        if _G.ChestESP then
            UpdateChestESP()
        end
    end
end)

VisualSectionLeft:Toggle({
    Name = "Esp Fruit",
    Default = false,
    Callback = function(value)
        DevilFruitESP = value
        spawn(function()
            while DevilFruitESP do 
                wait()
                UpdateDevilChams() 
            end
        end)
    end
})

spawn(function()
    while wait(2) do
        if DevilFruitESP then
            UpdateDevilChams() 
        end
    end
end)

VisualSectionLeft:Toggle({
    Name = "Esp Berry",
    Default = false,
    Callback = function(value)
        Berry = value
        spawn(function()
            while Berry do 
                wait()
                UpdateBerriesESP()
            end
        end)
    end
})

spawn(function()
    while wait(2) do
        if Berry then
            UpdateBerriesESP()
        end
    end
end)

VisualSectionLeft:Toggle({
    Name = "Esp Real Fruits",
    Default = false,
    Callback = function(value)
        RealFruitESP = value
        spawn(function()
            while RealFruitESP do 
                wait()
                UpdateRealFruitChams() 
            end
        end)
    end
})

spawn(function()
    while wait(2) do
        if RealFruitESP then
            UpdateRealFruitChams() 
        end
    end
end)

VisualSectionLeft:Toggle({
    Name = "Esp Gear",
    Default = false,
    Callback = function(value)
        GearESP = value
        spawn(function()
            while GearESP do 
                wait()
                UpdateGeaESP() 
            end
        end)
    end
})

spawn(function()
    while wait(2) do
        if GearESP then
            UpdateGeaESP() 
        end
    end
end)

VisualSectionLeft:Toggle({
    Name = "Esp Flower",
    Default = false,
    Callback = function(value)
        FlowerESP = value
        spawn(function()
            while FlowerESP do 
                wait()
                UpdateFlowerChams() 
            end
        end)
    end
})

spawn(function()
    while wait(2) do
        if FlowerESP then
            UpdateFlowerChams() 
        end
    end
end)

VisualSectionRight:Toggle({
    Name = "Esp Mirage Island",
    Default = false,
    Callback = function(value)
        MirageIslandESP = value
        spawn(function()
            while MirageIslandESP do 
                wait()
                UpdateIslandMirageESP() 
            end
        end)
    end
})

spawn(function()
    while wait(2) do
        if MirageIslandESP then
            UpdateIslandMirageESP() 
        end
    end
end)

VisualSectionRight:Toggle({
    Name = "Esp Prehistoric Island",
    Default = false,
    Callback = function(value)
        PrehistoricIslandESP = value
        spawn(function()
            while PrehistoricIslandESP do 
                wait()
                UpdatePrehistoricIslandESP() 
            end
        end)
    end
})

spawn(function()
    while wait(2) do
        if PrehistoricIslandESP then
            UpdatePrehistoricIslandESP() 
        end
    end
end)

VisualSectionRight:Toggle({
    Name = "Esp Kitsune Island",
    Default = false,
    Callback = function(value)
        KitsuneIslandEsp = value
        spawn(function()
            while KitsuneIslandEsp do 
                wait()
                UpdateIslandKisuneESP()   
            end
        end)
    end
})


local autoStatsEnabled = {
    Melee = false,
    Defense = false,
    Sword = false,
    ["Demon Fruit"] = false,
    Gun = false
}

local function addPoint(stat)
    local args = {
        "AddPoint",
        stat,
        1
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
end





Statss:Toggle({
    Name = "Auto Melee",
    Default = false,
    Callback = function(val)
        autoStatsEnabled.Melee = val
    end
})
Statss:Toggle({
    Name = "Auto Defense",
    Default = false,
    Callback = function(val)
        autoStatsEnabled.Defense = val
    end
})
Statss:Toggle({
    Name = "Auto Sword",
    Default = false,
    Callback = function(val)
        autoStatsEnabled.Sword = val
    end
})
Statss:Toggle({
    Name = "Auto Demon Fruit",
    Default = false,
    Callback = function(val)
        autoStatsEnabled["Demon Fruit"] = val
    end
})
Statss:Toggle({
    Name = "Auto Gun",
    Default = false,
    Callback = function(val)
        autoStatsEnabled.Gun = val
    end
})

spawn(function()
    while wait(0.2) do
        pcall(function()
            for stat, enabled in pairs(autoStatsEnabled) do
                if enabled then
                    addPoint(stat)
                end
            end
        end)
    end
end)


spawn(function()
    while wait(2) do
        if KitsuneIslandEsp then
            UpdateIslandKisuneESP()  
        end
    end
end)


MainSectionLeft:Dropdown({
    Name = "Select Weapons",
    Desc = "Choose your weapon type for farming",
    Items = {"Melee", "Sword", "Gun", "Blox Fruit"},
    Default = "Melee",
    Callback = function(Value)
        _G.SelectWeapon = Value
    end
})



spawn(function()
    while wait() do
        pcall(function()
            if _G.SelectWeapon == "Melee" then
                for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Melee" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                            _G.SelectWeapon = v.Name
                        end
                    end
                end
            elseif _G.SelectWeapon == "Sword" then
                for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Sword" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                            _G.SelectWeapon = v.Name
                        end
                    end
                end
            elseif _G.SelectWeapon == "Gun" then
                for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Gun" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                            _G.SelectWeapon = v.Name
                        end
                    end
                end
            elseif _G.SelectWeapon == "Blox Fruit" then
                for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Blox Fruit" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                            _G.SelectWeapon = v.Name
                        end
                    end
                end
            end
        end)
    end
end)


MainSectionLeft:Toggle({
    Name = "Auto Farm Level",
    Desc = "Automatically farm levels by completing quests",
    Default = false,
    Callback = function(Value)
        _G.AutoFarm = Value
        StopTween(_G.AutoFarm)
    end
})

spawn(function()
    while wait() do
        if _G.AutoFarm then
            pcall(function()
                local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                CheckQuest()
                if not string.find(QuestTitle, NameMon) then
                    StartBring = false
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    StartBring = false
                    if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude > 1500 then
                            TP1(CFrameQuest)
                        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude < 1500 then
                            TP1(CFrameQuest)
                        end
                    else
                        TP1(CFrameQuest)
                    end
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 20 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)
                    end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "kissed") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if string.find(v.Name,"kissed Warrior") then
                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                        repeat task.wait()
                                            EquipWeapon(_G.SelectWeapon)
                                            if CFrameMon.Position.Magnitude < 1 then
                                                CFrameMon = v.HumanoidRootPart.CFrame
                                            end
                                            PosMon = v.HumanoidRootPart.CFrame
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.Head.CanCollide = false
                                            MonFarm = v.Name          
                                            v.HumanoidRootPart.Size = Vector3.new(70,70,70)
                                            StartBring = true
                                            game:GetService'VirtualUser':CaptureController()
                                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                        until not _G.AutoFarm or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                    else
                                        StartBring = false
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                    end
                                end
                            elseif string.find(v.Name,"kissed Warrior") == nil then
                                if CFrameMon.Position.Magnitude >= 1 then
                                    TP1(CFrameMon)
                                end
                                StartBring = false
                                if game:GetService("ReplicatedStorage"):FindFirstChild(Mon) and game:GetService("ReplicatedStorage"):FindFirstChild(Mon):FindFirstChild("HumanoidRootPart") then
                                    local actualCFrame = game:GetService("ReplicatedStorage"):FindFirstChild(Mon).HumanoidRootPart.CFrame
                                    if actualCFrame.Position.Magnitude >= 1 then
                                        TP1(actualCFrame * CFrame.new(0,20,0))
                                    end
                                end
                            end
                        end
                    else
                        if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if v.Name == Mon then
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                            repeat task.wait()
                                                EquipWeapon(_G.SelectWeapon)
                                                AutoHaki()
                                                if CFrameMon.Position.Magnitude < 1 then
                                                    CFrameMon = v.HumanoidRootPart.CFrame
                                                end
                                                PosMon = v.HumanoidRootPart.CFrame
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(70,70,70)
                                                StartBring = true
                                                MonFarm = v.Name          
                                                game:GetService'VirtualUser':CaptureController()
                                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                            until not _G.AutoFarm or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        else
                                            StartBring = false
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        end
                                    end
                                end
                            end
                        else
                            if CFrameMon.Position.Magnitude >= 1 then
                                TP1(CFrameMon)
                            end
                            StartBring = false
                            if game:GetService("ReplicatedStorage"):FindFirstChild(Mon) and game:GetService("ReplicatedStorage"):FindFirstChild(Mon):FindFirstChild("HumanoidRootPart") then
                                local actualCFrame = game:GetService("ReplicatedStorage"):FindFirstChild(Mon).HumanoidRootPart.CFrame
                                if actualCFrame.Position.Magnitude >= 1 then
                                    TP1(actualCFrame * CFrame.new(0,20,0))
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

 
MainSectionLeft:Toggle({
    Name = "Auto Kill Near | Mob Aura",
    Desc = "Automatically kill nearby enemies within range",
    Default = false,
    Callback = function(Value)
        _G.AutoNear = Value
        if Value then
            spawn(function()
                while _G.AutoNear do
                    pcall(function()
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                if (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4000 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not _G.AutoNear or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    end)
                    task.wait()
                end
            end)
        end
    end
})




if World1 or World2 then
    MainSectionRight:Dropdown({
        Name = "Select Regime Farm",
        Desc = "Choose farming method for mastery",
        Items = {"Farm Level Mastery", "Farm Level Mastery No Quest"},
        Default = "Farm Level Mastery No Quest",
        Callback = function(Value)
            _G.selectFruitFarm = Value
        end
    })
elseif World3 then
    MainSectionRight:Dropdown({
        Name = "Select Regime Farm",
        Desc = "Choose farming method for mastery",
        Items = {"Farm Level Mastery", "Farm Level Mastery No Quest", "Farm Bone Mastery", "Farm Cake Mastery"},
        Default = "Farm Level Mastery No Quest",
        Callback = function(Value)
            _G.selectFruitFarm = Value
        end
    })
end

MainSectionRight:Toggle({
    Name = "Auto Farm Mastery Fruit",
    Desc = "Automatically farm fruit mastery",
    Default = false,
    Callback = function(Value)
        _G.AutoFarmFruits = Value
        if Value then
            spawn(function()
                while _G.AutoFarmFruits do
                    pcall(function()
                        CheckQuest()
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Devil Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Devil Fruit") then
                            if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == Mon then
                                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                            repeat task.wait()
                                                AutoHaki()
                                                EquipWeapon("Devil Fruit")
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false
                                                BringMob(Mon)
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,5,0))
                                                game:GetService("VirtualUser"):CaptureController()
                                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                            until not _G.AutoFarmFruits or not v.Parent or v.Humanoid.Health <= 0
                                        end
                                    end
                                end
                            else
                                if game:GetService("ReplicatedStorage"):FindFirstChild(Mon) then
                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild(Mon).HumanoidRootPart.CFrame * CFrame.new(5,10,5))
                                end
                            end
                        end
                    end)
                    task.wait()
                end
            end)
        end
    end
})


if World3 then

    MainSectionLeft:Toggle({
        Name = "Auto Farm Bone",
        Desc = "Automatically farm bones in the Haunted Castle",
        Default = false,
        Callback = function(Value)
            _G.FarmBone = Value
            if Value then
                spawn(function()
                    while _G.FarmBone do
                        pcall(function()
                            local boneEnemies = {"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"}
                            local targetFound = false

                            for _, enemy in ipairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if table.find(boneEnemies, enemy.Name)
                                    and enemy:FindFirstChild("Humanoid")
                                    and enemy:FindFirstChild("HumanoidRootPart")
                                    and enemy.Humanoid.Health > 0 then

                                    local function FixedBringMob()
                                        for _, mob in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if mob.Name == enemy.Name and mob ~= enemy and mob:FindFirstChild("HumanoidRootPart") then
                                                mob.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame
                                            end
                                        end
                                    end

                                    StartBring = true
                                    PosMon = enemy.HumanoidRootPart.CFrame

                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        enemy.HumanoidRootPart.CanCollide = false
                                        enemy.Humanoid.WalkSpeed = 0
                                        enemy.Humanoid.JumpPower = 0
                                        if enemy:FindFirstChild("Head") then
                                            enemy.Head.CanCollide = false
                                        end
                                        enemy.HumanoidRootPart.Size = Vector3.new(80,80,80)
                                        enemy.HumanoidRootPart.Transparency = 1
                                        FixedBringMob()
                                        topos(enemy.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not _G.FarmBone or not enemy.Parent or enemy.Humanoid.Health <= 0

                                    StartBring = false
                                    targetFound = true
                                    break
                                end
                            end
                            if not targetFound then
                                StartBring = false
                                topos(CFrame.new(-9506.234375, 172.130615234375, 6117.0771484375))
                            end
                        end)
                        task.wait()
                    end
                end)
            else
                StartBring = false
            end
        end
    })


end


MainSectionLeft:Toggle({
    Name = "Auto Farm Chest",
    Desc = "Automatically farm chests",
    Default = false,
    Callback = function(Value)
        _G.FarmChest = Value
        StopTween(_G.FarmChest)
    end
})

spawn(function()
    while wait() do
        if _G.FarmChest then
            local Players = game:GetService("Players")
            local Player = Players.LocalPlayer
            local Character = Player.Character or Player.CharacterAdded:Wait()
            local Position = Character:GetPivot().Position
            local CollectionService = game:GetService("CollectionService")
            local Chests = CollectionService:GetTagged("_ChestTagged")
            local Distance, Nearest = math.huge
            for i = 1, #Chests do
                local Chest = Chests[i]
                local Magnitude = (Chest:GetPivot().Position - Position).Magnitude
                if (not Chest:GetAttribute("IsDisabled") and (Magnitude < Distance)) then
                    Distance, Nearest = Magnitude, Chest
                end
            end
            if Nearest then
                local ChestPosition = Nearest:GetPivot().Position
                local CFrameTarget = CFrame.new(ChestPosition)
                topos(CFrameTarget)
            end
        end
    end
end)


MainSectionLeft:Toggle({
    Name = "Auto Farm Berries",
    Desc = "Automatically farm berries",
    Default = false,
    Callback = function(Value)
        _G.CollectBerry = Value
        StopTween(_G.CollectBerry)
    end
})

spawn(function()
    while wait() do
        if _G.CollectBerry then
            local Players = game:GetService("Players")
            local Player = Players.LocalPlayer
            local Character = Player.Character or Player.CharacterAdded:Wait()
            local Position = Character:GetPivot().Position
            local CollectionService = game:GetService("CollectionService")
            local BerryBushes = CollectionService:GetTagged("BerryBush")
            local Distance, NearestBush, NearestBerryName = math.huge, nil, nil

            for _, Bush in ipairs(BerryBushes) do
                for AttributeName, _ in pairs(Bush:GetAttributes()) do
                    local Magnitude = (Bush.Parent:GetPivot().Position - Position).Magnitude
                    if Magnitude < Distance then
                        Distance = Magnitude
                        NearestBush = Bush
                        NearestBerryName = AttributeName
                    end
                end
            end

            if NearestBush and NearestBerryName then
                local BushModel = NearestBush.Parent
                local BushCenter = BushModel:GetPivot().Position

                TP1(CFrame.new(BushCenter + Vector3.new(0, 2, 0)))
                task.wait(0.5)

                local BerryPart = BushModel:FindFirstChild(NearestBerryName)
                if BerryPart and BerryPart:IsA("BasePart") then
                    TP1(BerryPart.CFrame + Vector3.new(0, 1, 0)) 
                    task.wait(0.3)

                    local VirtualInput = game:GetService("VirtualInputManager")
                    VirtualInput:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                    task.wait(0.1)
                    VirtualInput:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                end
            end
        end
    end
end)


local bossOptions = {}
if World1 then
    bossOptions = {"The Gorilla King", "Bobby", "Yeti", "Mob Leader", "Vice Admiral", "Warden", "Chief Warden", "Swan", "Magma Admiral", "Fishman Lord", "Wysper", "Thunder God", "Cyborg", "Saber Expert"}
elseif World2 then
    bossOptions = {"Diamond", "Jeremy", "Fajita", "Don Swan", "Smoke Admiral", "Cursed Captain", "Darkbeard", "Order", "Awakened Ice Admiral", "Tide Keeper"}
elseif World3 then
    bossOptions = {"Stone", "Island Empress", "Rocket Admiral", "Captain Elephant", "Beautiful Pirate", "rip_indra True Form", "Longma", "Soul Reaper", "Cake Queen", "Cake Prince", "Dough King"}
end

MainSectionLeft:Dropdown({
    Name = "Auto Select Boss",
    Desc = "Choose boss to farm",
    Items = bossOptions,
    Default = bossOptions[1] or "Stone",
    Callback = function(Value)
        _G.SelectBoss = Value
    end
})


MainSectionLeft:Toggle({
    Name = "Auto Farm Boss",
    Desc = "Automatically farm selected boss",
    Default = false,
    Callback = function(Value)
        _G.AutoBossFarm = Value
        if Value then
            spawn(function()
                while _G.AutoBossFarm do
                    pcall(function()
                        if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == _G.SelectBoss then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.Size = Vector3.new(80,80,80)
                                            BringPos = v.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                        until not _G.AutoBossFarm or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame * CFrame.new(5,10,5))
                            else
                                if _G.SelectBoss == "The Gorilla King" then
                                    topos(CFrame.new(-1223, 6, -502))
                                elseif _G.SelectBoss == "Bobby" then
                                    topos(CFrame.new(-1147, 32, 4350))
                                elseif _G.SelectBoss == "Yeti" then
                                    topos(CFrame.new(1221, 138, -1488))
                                elseif _G.SelectBoss == "Stone" then
                                    topos(CFrame.new(-1049, 40, 6791))
                                elseif _G.SelectBoss == "Island Empress" then
                                    topos(CFrame.new(5713, 602, 202))
                                elseif _G.SelectBoss == "Dough King" then
                                    topos(CFrame.new(-2151, 88, -12404))
                                end
                            end
                        end
                    end)
                    task.wait()
                end
            end)
        end
    end
})


local materialOptions = {}
if World1 then
    materialOptions = {"Farm Leather + Scrap Metal", "Farm Fish Tail", "Farm Magma Ore", "Farm Angel Wings"}
elseif World2 then
    materialOptions = {"Farm Leather + Scrap Metal", "Farm Radiactive Material", "Farm Magma Ore", "Farm Vampire Fang", "Farm Mystic Droplet", "Farm Ectoplasm"}
elseif World3 then
    materialOptions = {"Farm Leather + Scrap Metal", "Farm Fish Tail", "Farm Mini Tusk", "Farm Dragon Scale", "Farm Conjured Cocoa"}
end

MainSectionLeft:Dropdown({
    Name = "Select Material",
    Desc = "Choose material to farm",
    Items = materialOptions,
    Default = materialOptions[1] or "Farm Fish Tail",
    Callback = function(Value)
        _G.SelectMaterial = Value
    end
})

MainSectionLeft:Toggle({
    Name = "Auto Farm Material",
    Desc = "Automatically farm materials",
    Default = false,
    Callback = function(Value)
        _G.AutoFarmMaterial = Value
        if Value then
            spawn(function()
                while _G.AutoFarmMaterial do
                    pcall(function()
                        MaterialMon()
                        if game:GetService("Workspace").Enemies:FindFirstChild(MMon) then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == MMon then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.Head.CanCollide = false
                                            BringPos = v.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
                                            BringMob(MMon)
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                        until not _G.AutoFarmMaterial or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage"):FindFirstChild(MMon) then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild(MMon).HumanoidRootPart.CFrame * CFrame.new(5,10,5))
                            else
                                topos(MPos)
                            end
                        end
                    end)
                    task.wait()
                end
            end)
        end
    end
})

MainSectionLeft:Dropdown({
    Name = "Select Health Mob Farm",
    Desc = "Set health percentage to use skills",
    Items = {"20", "25", "30", "35", "40", "45", "50", "55", "60", "65", "70", "75", "80"},
    Default = "25",
    Callback = function(Value)
        KillPercent = Value
    end
})

MainSectionRight:Toggle({
    Name = "Auto Use Skill Z",
    Desc = "Automatically use Z skill during combat",
    Default = true,
    Callback = function(Value)
        SkillZ = Value
    end
})

MainSectionRight:Toggle({
    Name = "Auto Use Skill X",
    Description = "Automatically use X skill during combat",
    Default = false,
    Callback = function(Value)
        SkillX = Value
    end
})

MainSectionRight:Toggle({
    Name = "Auto Use Skill C",
    Description = "Automatically use C skill during combat",
    Default = false,
    Callback = function(Value)
        SkillC = Value
    end
})

MainSectionRight:Toggle({
    Name = "Auto Use Skill V",
    Description = "Automatically use V skill during combat",
    Default = false,
    Callback = function(Value)
        SkillV = Value
    end
})

MainSectionRight:Toggle({
    Name = "Auto Use Skill F",
    Description = "Automatically use F skill during combat",
    Default = false,
    Callback = function(Value)
        SkillF = Value
    end
})

MainSectionRight:Toggle({
    Name = "Auto Bring Mob",
    Description = "Automatically bring mobs closer for easier farming",
    Default = true,
    Callback = function(Value)
        _G.BringMonster = Value
        _G.BringMob = Value
    end
})

MainSectionRight:Toggle({
    Name = "Auto Walk Water",
    Description = "Walk on water",
    Default = true,
    Callback = function(Value)
        _G.WalkWater = Value
    end
})

MainSectionRight:Toggle({
    Name = "Auto Set Home Point",
    Description = "Automatically set spawn point",
    Default = false,
    Callback = function(Value)
        _G.CheckPoint = Value
    end
})

MainSectionRight:Toggle({
    Name = "Auto Haki Buso",
    Description = "Automatically enable Armament Haki",
    Default = true,
    Callback = function(Value)
        _G.AutoHaki = Value
    end
})

spawn(function()
    while wait(0.1) do
        if _G.AutoHaki and (_G.AutoFarm or _G.AutoBossFarm or _G.AutoFarmMaterial or _G.AutoNear) then
            pcall(function()
                local player = game:GetService("Players").LocalPlayer
                local character = player.Character
                if character and not character:FindFirstChild("HasBuso") then
                    local remote = game:GetService("ReplicatedStorage").Remotes.CommF_
                    if remote then
                        remote:InvokeServer("Buso")
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            CheckQuest()
            if _G.BringMonster and StartBring and PosMon then
                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    local isValid = (v.Name == MonFarm or v.Name == Mon)
                    local hasPart = v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Head")
                    local isAlive = v.Humanoid and v.Humanoid.Health > 0
                    local inRange = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 150

                    if isValid and hasPart and isAlive and inRange then
                        local distToPosMon = (v.HumanoidRootPart.Position - PosMon.Position).Magnitude
                        if distToPosMon <= 150 then
                         
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v.HumanoidRootPart.CFrame = PosMon

                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                        end
                    end
                end

                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
            end
        end)
    end
end)

if not syn then isnetworkowner = function() return true end end
getgenv().BringMobs = function(F, z)
    PosMon = F
    NameMon = z
end

task.spawn(function()
    while task.wait() do
        pcall(function()
            if PosMon then
                CheckQuest() 
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if syn then
                        if v.Name == NameMon and v.Name ~= "Ice Admiral" and v.Name ~= "Don Swan" and v.Name ~= "Saber Expert" and v.Name ~= "Longma" and  v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                            if isnetworkowner(v.HumanoidRootPart) then
                                v.HumanoidRootPart.CFrame = PosMon
                                v.Humanoid.JumpPower = 0
                                v.Humanoid.WalkSpeed = 0
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(2,2,2)
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
                                v.Humanoid:ChangeState(11)
                            end
                        end
                    else
                        if v.Name == NameMon and v.Name ~= "Ice Admiral" and v.Name ~= "Don Swan" and v.Name ~= "Saber Expert" and v.Name ~= "Longma" and  v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                            v.HumanoidRootPart.CFrame = PosMon
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(2,2,2)
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
                            v.Humanoid:ChangeState(11)
                        end
                    end
                end
            end
        end)
    end
end)
PosY = 35            

MainSectionRight:Toggle({
    Name = "Auto Active Race V3",
    Description = "Auto active Race V3",
    Default = false,
    Callback = function(Value)
        _G.AutoActiveRaceV3 = Value
    end
})

MainSectionRight:Toggle({
    Name = "Auto Active Race V4",
    Description = "Auto V4",
    Default = false,
    Callback = function(Value)
        _G.AutoActiveRaceV4 = Value
    end
})

spawn(function()
    while wait() do
        if _G.AutoActiveRaceV3 then
            pcall(function()
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"Y",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Y",false,game)
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoActiveRaceV4 then
            pcall(function()
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"T",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"T",false,game)
            end)
        end
    end
end)

MiscSectionLefts:Toggle({
    Name = "Infinite Soru",
    Description = "Unlimited Soru usage",
    Default = false,
    Callback = function(Value)
        _G.InfiniteSoru = Value

        if Value then
            if not _G.__InfiniteSoruHooked then
                _G.__InfiniteSoruHooked = true
                local oldExploitSoru = getgenv().ExploitSoru
                if oldExploitSoru == nil and typeof(ExploitSoru) == "function" then
                    oldExploitSoru = ExploitSoru
                end
                if oldExploitSoru then
                    getgenv().ExploitSoru = function(...)
                        local SoruVars = getgenv().SoruVars
                        if SoruVars then
                            SoruVars.LastUse = 0
                        end
                        return oldExploitSoru(...)
                    end
                end
            end
        else
            if getgenv().ExploitSoruOriginal then
                getgenv().ExploitSoru = getgenv().ExploitSoruOriginal
            end
        end
    end
})

MiscSectionLefts:Toggle({
    Name = "Dodge No CD",
    Description = "Removes dodge cooldown",
    Default = false,
    Callback = function(Value)
        _G.DodgeNoCD = Value

        if Value then
            if not _G.__DodgeNoCDHooked then
                _G.__DodgeNoCDHooked = true
                local oldCanDodge = getgenv().canDodge
                if oldCanDodge == nil and typeof(canDodge) == "function" then
                    oldCanDodge = canDodge
                end
                if oldCanDodge then
                    getgenv().canDodgeOriginal = oldCanDodge
                    getgenv().canDodge = function(...)
                        local Character = (game.Players.LocalPlayer and game.Players.LocalPlayer.Character) or nil
                        if not Character or not Character:FindFirstChild("Humanoid") or not Character:FindFirstChild("HumanoidRootPart") then
                            return false 
                        end
                        if Character:FindFirstChild("Humanoid") and Character.Humanoid.Health <= 0 then
                            return false
                        end
                        return true
                    end
                end
            end
        else
            if getgenv().canDodgeOriginal then
                getgenv().canDodge = getgenv().canDodgeOriginal
            end
        end
    end
})

MiscSectionLefts:Toggle({
    Name = "Spin Position",
    Description = "Spin ur character",
    Default = false,
    Callback = function(Value)
        _G.SpinPosition = Value
    end
})



MiscSectionLefts:Toggle({
    Name = "Infinite Geppo",
    Description = "Unlimited Geppo ",
    Default = false,
    Callback = function(Value)
        _G.InfiniteGeppo = Value
    end
})

MiscSectionLefts:Toggle({
    Name = "Infinite Jump",
    Description = "jump as much as you like ",
    Default = false,
    Callback = function(Value)
        _G.InfiniteJump = Value
    end
})

spawn(function()
    while wait(1) do
        if _G.WalkWater then
            pcall(function()
                local waterBase = game:GetService("Workspace").Map:FindFirstChild("WaterBase-Plane")
                if waterBase then
                    waterBase.Size = Vector3.new(1000, 112, 1000)
                    waterBase.Transparency = 0.8
                    waterBase.CanCollide = true
                end
            end)
        else
            pcall(function()
                local waterBase = game:GetService("Workspace").Map:FindFirstChild("WaterBase-Plane")
                if waterBase then
                    waterBase.Size = Vector3.new(1000, 80, 1000)
                    waterBase.Transparency = 1
                    waterBase.CanCollide = false
                end
            end)
        end
    end
end)

spawn(function()
    while wait(0.1) do
        if _G.InfiniteSoru then
            pcall(function()
                local player = game:GetService("Players").LocalPlayer
                local character = player.Character
                if character and character:FindFirstChild("Soru") then
                    for i,v in next, getgc() do
                        if typeof(v) == "function" and getfenv(v).script == character.Soru then
                            for i2,v2 in next, getupvalues(v) do
                                if typeof(v2) == "table" and v2.LastUse then
                                    v2.LastUse = 0
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait(0.1) do
        if _G.DodgeNoCD then
            pcall(function()
                local player = game:GetService("Players").LocalPlayer
                local character = player.Character
                if character and character:FindFirstChild("Dodge") then
                    for i,v in next, getgc() do
                        if typeof(v) == "function" and getfenv(v).script == character.Dodge then
                            for i2,v2 in next, getupvalues(v) do
                                if typeof(v2) == "table" and v2.LastUse then
                                    v2.LastUse = 0
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait(0.1) do
        if _G.InfiniteGeppo then
            pcall(function()
                local player = game:GetService("Players").LocalPlayer
                local character = player.Character
                if character and character:FindFirstChild("Geppo") then
                    for i,v in next, getgc() do
                        if typeof(v) == "function" and getfenv(v).script == character.Geppo then
                            for i2,v2 in next, getupvalues(v) do
                                if typeof(v2) == "table" and v2.LastUse then
                                    v2.LastUse = 0
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    local UserInputService = game:GetService("UserInputService")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    
    UserInputService.JumpRequest:Connect(function()
        if _G.InfiniteJump then
            pcall(function()
                local character = player.Character
                if character and character:FindFirstChildOfClass("Humanoid") then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    humanoid:ChangeState("Jumping")
                    
                    if character:FindFirstChild("HumanoidRootPart") then
                        local bodyVelocity = character.HumanoidRootPart:FindFirstChild("JumpBoost")
                        if not bodyVelocity then
                            bodyVelocity = Instance.new("BodyVelocity")
                            bodyVelocity.Name = "JumpBoost"
                            bodyVelocity.Parent = character.HumanoidRootPart
                            bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
                            bodyVelocity.Velocity = Vector3.new(0, 50, 0)
                            
                            game:GetService("Debris"):AddItem(bodyVelocity, 0.2)
                        end
                    end
                end
            end)
        end
    end)
end)

spawn(function()
    while wait(10) do 
        if _G.CheckPoint then
            pcall(function()
                local player = game:GetService("Players").LocalPlayer
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                end
            end)
        end
    end
end)

function UseSkill(skill)
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        game:GetService("VirtualInputManager"):SendKeyEvent(true, skill, false, game)
        wait(0.1)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, skill, false, game)
    end
end

spawn(function()
    while wait(0.1) do
        if _G.AutoFarm or _G.AutoBossFarm or _G.AutoFarmMaterial or _G.AutoNear then
            pcall(function()
                local player = game:GetService("Players").LocalPlayer
                local character = player.Character
                if character and character:FindFirstChild("Humanoid") then
                    local humanoid = character.Humanoid
                    local healthPercent = (humanoid.Health / humanoid.MaxHealth) * 100
                    
                    if healthPercent <= tonumber(KillPercent) then
                        if SkillZ then
                            UseSkill("Z")
                            wait(0.1)
                        end
                        if SkillX then
                            UseSkill("X")
                            wait(0.1)
                        end
                        if SkillC then
                            UseSkill("C")
                            wait(0.1)
                        end
                        if SkillV then
                            UseSkill("V")
                            wait(0.1)
                        end
                        if SkillF then
                            UseSkill("F")
                            wait(0.1)
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoFarm or _G.AutoNear or _G.AutoFarmFruits or _G.FarmBone or _G.AutoFarmMaterial then
            pcall(function()
                local player = game:GetService("Players").LocalPlayer
                local character = player.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    for _, part in pairs(character:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                    
                    if not character.HumanoidRootPart:FindFirstChild("BodyClip") then
                        local noclip = Instance.new("BodyVelocity")
                        noclip.Name = "BodyClip"
                        noclip.Parent = character.HumanoidRootPart
                        noclip.MaxForce = Vector3.new(100000, 100000, 100000)
                        noclip.Velocity = Vector3.new(0, 0, 0)
                    end
                end
            end)
        else
            pcall(function()
                local player = game:GetService("Players").LocalPlayer
                local character = player.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    for _, part in pairs(character:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = true
                        end
                    end
                    
                    if character.HumanoidRootPart:FindFirstChild("BodyClip") then
                        character.HumanoidRootPart.BodyClip:Destroy()
                    end
                end
            end)
        end
    end
end)

spawn(function()
    local spinSpeed = 30 
    local spinDirection = 1 
    
    while wait(0.1) do
        if _G.SpinPosition then
            pcall(function()
                local player = game:GetService("Players").LocalPlayer
                local character = player.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local rootPart = character.HumanoidRootPart
                    
                    rootPart.CFrame = rootPart.CFrame * CFrame.Angles(0, math.rad(spinSpeed * spinDirection), 0)
                    
                    if not rootPart:FindFirstChild("SpinEffect") then
                        local effect = Instance.new("BodyAngularVelocity")
                        effect.Name = "SpinEffect"
                        effect.Parent = rootPart
                        effect.MaxTorque = Vector3.new(0, math.huge, 0)
                        effect.AngularVelocity = Vector3.new(0, math.rad(spinSpeed * 2), 0)
                    end
                end
            end)
        else
            pcall(function()
                local player = game:GetService("Players").LocalPlayer
                local character = player.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local effect = character.HumanoidRootPart:FindFirstChild("SpinEffect")
                    if effect then
                        effect:Destroy()
                    end
                end
            end)
        end
    end
end)

spawn(function()
    local VirtualUser = game:GetService("VirtualUser")
    local Players = game:GetService("Players")
    
    Players.LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
        
        Library:Notify({
            Name = "Anti-AFK",
            Content = "Anti-AFK activated! You won't be kicked for being idle.",
            Duration = 3
        })
    end)
end)

spawn(function()
    while wait(30) do 
        pcall(function()
            local player = game:GetService("Players").LocalPlayer
            local character = player.Character
            
            if character and character:FindFirstChild("Humanoid") then
                local humanoid = character.Humanoid
                local health = humanoid.Health
                local maxHealth = humanoid.MaxHealth
                local healthPercent = (health / maxHealth) * 100
                
                if healthPercent <= 15 and (_G.AutoFarm or _G.AutoBossFarm or _G.AutoFarmMaterial) then
                    Library:Notify({
                        Name = "Health Warning",
                        Content = "Health is critically low! (" .. math.floor(healthPercent) .. "%)",
                        Duration = 3
                    })
                end
            end
        end)
    end
end)

spawn(function()
    while wait(60) do 
        pcall(function()
            local player = game:GetService("Players").LocalPlayer
            local character = player.Character
            
            if character then
                for _, part in pairs(character:GetChildren()) do
                    if part:IsA("BasePart") then
                        for _, child in pairs(part:GetChildren()) do
                            if child:IsA("BodyMover") and child.Name ~= "BodyClip" and child.Name ~= "SpinEffect" and child.Name ~= "JumpBoost" and child.Name ~= "Lock" then
                                if tick() - (child:GetAttribute("CreatedTime") or 0) > 30 then
                                    child:Destroy()
                                end
                            end
                        end
                    end
                end
            end
            
            collectgarbage("collect")
        end)
    end
end)


QuestSectionLeft:Toggle({
    Name = "Auto Second Sea",
    Description = "Automatically progress to second sea",
    Default = false,
    Callback = function(Value)
        _G.AutoSecondSea = Value
    end
})

QuestSectionLeft:Toggle({
    Name = "Auto Boss Raid",
    Description = "Automatically participate in boss raids",
    Default = false,
    Callback = function(Value)
        _G.AutoBossRaid = Value
    end
})

QuestSectionLeft:Toggle({
    Name = "Auto Kill Greybeard",
    Description = "Automatically kill Greybeard boss",
    Default = false,
    Callback = function(Value)
        _G.AutoKillGreybeard = Value
    end
})

QuestSectionLeft:Toggle({
    Name = "Auto Buy Haki Colors",
    Description = "Automatically buy haki colors",
    Default = false,
    Callback = function(Value)
        _G.AutoBuyHakiColors = Value
    end
})

QuestSectionLeft:Toggle({
    Name = "Auto Haki Colors",
    Description = "Automatically use haki colors",
    Default = false,
    Callback = function(Value)
        _G.AutoHakiColors = Value
    end
})

QuestSectionLeft:Toggle({
    Name = "Auto Get Articless",
    Description = "Automatically get Article items",
    Default = false,
    Callback = function(Value)
        _G.AutoGetArticless = Value
    end
})


local BossSaberStatus = QuestSectionLeft:Status({
    Name = "Boss Saber Status",
    Desc = "Not Have Boss Saber ❌"
})

QuestSectionLeft:Toggle({
    Name = "Auto Get Saber",
    Description = "Automatically get the saber",
    Default = false,
    Callback = function(Value)
        AutoSaber = Value
    end
})

local PoleBossStatus = QuestSectionLeft:Status({
    Name = "Pole Boss Status",
    Desc = "Pole Boss Spawning ✅"
})

QuestSectionLeft:Toggle({
    Name = "Auto Get Sword Pole",
    Description = "Automatically get sword pole",
    Default = false,
    Callback = function(Value)
        _G.Autopole = Value
    end
})

QuestSectionLeft:Toggle({
    Name = "Auto Get Sword Saw",
    Description = "Automatically get sword saw",
    Default = false,
    Callback = function(Value)
        _G.Autosaw = Value
    end
})

QuestSectionLeft:Toggle({
    Name = "Auto Get Sword Wardens",
    Description = "Automatically get sword wardens",
    Default = false,
    Callback = function(Value)
        _G.ChiefWarden = Value
    end
})

QuestSectionLeft:Toggle({
    Name = "Auto Get Sword Trident",
    Description = "Automatically get sword trident",
    Default = false,
    Callback = function(Value)
        _G.Trident = Value
    end
})
QuestSectionLeft:Toggle({
    Name = "Auto Get Sword Yama",
    Description = "Automatically get sword trident",
    Default = false,
    Callback = function(Values)
        _G.AutoYama = Values
    end
}) 
QuestSectionLeft:Toggle({
    Name = "Auto Get Sword Tushita",
    Description = "Automatically get sword trident",
    Default = false,
    Callback = function(Values)
        _G.AutoGetTushita = Values
    end
})

QuestSectionLeft:Toggle({
    Name = "Auto Get Sword CURSED DUAL KATANA",
    Description = "Automatically get sword trident",
    Default = false,
    Callback = function(p693)
        _G.Auto_DualKatana = p693
    end
})








spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_DualKatana then
                if game.Players.LocalPlayer.Character:FindFirstChild('Tushita') or (game.Players.LocalPlayer.Backpack:FindFirstChild('Tushita') or (game.Players.LocalPlayer.Character:FindFirstChild('Yama') or game.Players.LocalPlayer.Backpack:FindFirstChild('Yama'))) then
                    if game.Players.LocalPlayer.Character:FindFirstChild('Tushita') or game.Players.LocalPlayer.Backpack:FindFirstChild('Tushita') then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild('Tushita') then
                            EquipTool('Tushita')
                        end
                    elseif (game.Players.LocalPlayer.Character:FindFirstChild('Yama') or game.Players.LocalPlayer.Backpack:FindFirstChild('Yama')) and game.Players.LocalPlayer.Backpack:FindFirstChild('Yama') then
                        EquipTool('Yama')
                    end
                else
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('LoadItem', 'Tushita')
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_DualKatana then
                if GetMaterial('Alucard Fragment') ~= 0 then
                    if GetMaterial('Alucard Fragment') ~= 1 then
                        if GetMaterial('Alucard Fragment') ~= 2 then
                            if GetMaterial('Alucard Fragment') ~= 3 then
                                if GetMaterial('Alucard Fragment') ~= 4 then
                                    if GetMaterial('Alucard Fragment') ~= 5 then
                                        if GetMaterial('Alucard Fragment') == 6 then
                                            if game:GetService('Workspace').Enemies:FindFirstChild('Cursed Skeleton Boss [Lv. 2025] [Boss]') or game:GetService('Workspace').ReplicatedStorage:FindFirstChild('Cursed Skeleton Boss [Lv. 2025] [Boss]') then
                                                Auto_Quest_Yama_1 = false
                                                Auto_Quest_Yama_2 = false
                                                Auto_Quest_Yama_3 = false
                                                Auto_Quest_Tushita_1 = false
                                                Auto_Quest_Tushita_2 = false
                                                Auto_Quest_Tushita_3 = false

                                                if game:GetService('Workspace').Enemies:FindFirstChild('Cursed Skeleton Boss [Lv. 2025] [Boss]') or game:GetService('Workspace').Enemies:FindFirstChild('Cursed Skeleton [Lv. 2200]') then
                                                    local v694, v695, v696 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                                                    while true do
                                                        local v697

                                                        v696, v697 = v694(v695, v696)

                                                        if v696 == nil then
                                                            break
                                                        end
                                                        if (v697.Name == 'Cursed Skeleton Boss' or v697.Name == 'Cursed Skeleton') and v697.Humanoid.Health > 0 then
                                                            EquipTool(Sword)
                                                            TP1(v697.HumanoidRootPart.CFrame * pos)

                                                            v697.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                            v697.HumanoidRootPart.Transparency = 1
                                                            v697.Humanoid.JumpPower = 0
                                                            v697.Humanoid.WalkSpeed = 0
                                                            v697.HumanoidRootPart.CanCollide = false
                                                            bringmob = true
                                                            FarmPos = v697.HumanoidRootPart.CFrame
                                                            MonFarm = v697.Name

                                                            AttackNoCoolDown()
                                                        end
                                                    end
                                                end
                                            elseif (CFrame.new(-12361.7060546875, 603.3547973632813, -6550.5341796875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 100 then
                                                TP1(CFrame.new(-12361.7060546875, 603.3547973632813, -6550.5341796875))
                                            else
                                                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'Progress', 'Good')
                                                wait(1)
                                                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'Progress', 'Evil')
                                                wait(1)
                                                TP1(CFrame.new(-12361.7060546875, 603.3547973632813, -6550.5341796875))
                                                wait(1.5)
                                                game:GetService('VirtualInputManager'):SendKeyEvent(true, 'E', false, game)
                                                wait(1.5)
                                                TP1(CFrame.new(-12253.5419921875, 598.8999633789063, -6546.8388671875))
                                            end
                                        end
                                    else
                                        Auto_Quest_Yama_1 = false
                                        Auto_Quest_Yama_2 = false
                                        Auto_Quest_Yama_3 = false
                                        Auto_Quest_Tushita_1 = false
                                        Auto_Quest_Tushita_2 = false
                                        Auto_Quest_Tushita_3 = true

                                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'Progress', 'Good')
                                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'StartTrial', 'Good')
                                    end
                                else
                                    Auto_Quest_Yama_1 = false
                                    Auto_Quest_Yama_2 = false
                                    Auto_Quest_Yama_3 = false
                                    Auto_Quest_Tushita_1 = false
                                    Auto_Quest_Tushita_2 = true
                                    Auto_Quest_Tushita_3 = false

                                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'Progress', 'Good')
                                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'StartTrial', 'Good')
                                end
                            else
                                Auto_Quest_Yama_1 = false
                                Auto_Quest_Yama_2 = false
                                Auto_Quest_Yama_3 = false
                                Auto_Quest_Tushita_1 = true
                                Auto_Quest_Tushita_2 = false
                                Auto_Quest_Tushita_3 = false

                                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'Progress', 'Good')
                                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'StartTrial', 'Good')
                            end
                        else
                            Auto_Quest_Yama_1 = false
                            Auto_Quest_Yama_2 = false
                            Auto_Quest_Yama_3 = true
                            Auto_Quest_Tushita_1 = false
                            Auto_Quest_Tushita_2 = false
                            Auto_Quest_Tushita_3 = false

                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'Progress', 'Evil')
                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'StartTrial', 'Evil')
                        end
                    else
                        Auto_Quest_Yama_1 = false
                        Auto_Quest_Yama_2 = true
                        Auto_Quest_Yama_3 = false
                        Auto_Quest_Tushita_1 = false
                        Auto_Quest_Tushita_2 = false
                        Auto_Quest_Tushita_3 = false

                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'Progress', 'Evil')
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'StartTrial', 'Evil')
                    end
                else
                    Auto_Quest_Yama_1 = true
                    Auto_Quest_Yama_2 = false
                    Auto_Quest_Yama_3 = false
                    Auto_Quest_Tushita_1 = false
                    Auto_Quest_Tushita_2 = false
                    Auto_Quest_Tushita_3 = false

                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'Progress', 'Evil')
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'StartTrial', 'Evil')
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        if Auto_Quest_Yama_1 then
            pcall(function()
                if game:GetService('Workspace').Enemies:FindFirstChild('Mythological Pirate') then
                    local v698, v699, v700 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                    while true do
                        local v701

                        v700, v701 = v698(v699, v700)

                        if v700 == nil then
                            break
                        end
                        if v701.Name == 'Mythological Pirate' then
                            repeat
                                wait()
                                TP1(v701.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2))
                            until _G.Auto_DualKatana == false or Auto_Quest_Yama_1 == false

                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'StartTrial', 'Evil')
                        end
                    end
                else
                    TP1(CFrame.new(-13451.46484375, 543.712890625, -6961.0029296875))
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if Auto_Quest_Yama_2 then
                local v702, v703, v704 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                while true do
                    local v705

                    v704, v705 = v702(v703, v704)

                    if v704 == nil then
                        break
                    end
                    if v705:FindFirstChild('HazeESP') then
                        v705.HazeESP.Size = UDim2.new(50, 50, 50, 50)
                        v705.HazeESP.MaxDistance = 'inf'
                    end
                end

                local v706, v707, v708 = pairs(game:GetService('ReplicatedStorage'):GetChildren())

                while true do
                    local v709

                    v708, v709 = v706(v707, v708)

                    if v708 == nil then
                        break
                    end
                    if v709:FindFirstChild('HazeESP') then
                        v709.HazeESP.Size = UDim2.new(50, 50, 50, 50)
                        v709.HazeESP.MaxDistance = 'inf'
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            local v710, v711, v712 = pairs(game:GetService('Workspace').Enemies:GetChildren())

            while true do
                local v713

                v712, v713 = v710(v711, v712)

                if v712 == nil then
                    break
                end
                if Auto_Quest_Yama_2 and (v713:FindFirstChild('HazeESP') and (v713.HumanoidRootPart.Position - FarmPossEsp.Position).magnitude <= 300) then
                    v713.HumanoidRootPart.CFrame = FarmPossEsp
                    v713.HumanoidRootPart.CanCollide = false
                    v713.HumanoidRootPart.Size = Vector3.new(50, 50, 50)

                    if not v713.HumanoidRootPart:FindFirstChild('BodyVelocity') then
                        local _BodyVelocity2 = Instance.new('BodyVelocity', v713.HumanoidRootPart)

                        _BodyVelocity2.MaxForce = Vector3.new(1, 1, 1) * math.huge
                        _BodyVelocity2.Velocity = Vector3.new(0, 0, 0)
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        if Auto_Quest_Yama_2 then
            pcall(function()
                local v715, v716, v717 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                while true do
                    while true do
                        local v718

                        v717, v718 = v715(v716, v717)

                        if v717 == nil then
                            return
                        end
                        if v718:FindFirstChild('HazeESP') then
                            break
                        end

                        local v719, v720, v721 = pairs(game:GetService('ReplicatedStorage'):GetChildren())

                        while true do
                            local v722

                            v721, v722 = v719(v720, v721)

                            if v721 == nil then
                                break
                            end
                            if v722:FindFirstChild('HazeESP') then
                                if (v722.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
                                    TP1(v722.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                else
                                    TP1(v722.HumanoidRootPart.CFrameMon * CFrame.new(2, 20, 2))
                                end
                            end
                        end
                    end

                    if true then
                        wait()

                        if (v718.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
                            EquipTool(Sword)
                            TP1(v718.HumanoidRootPart.CFrame * Pos)

                            v718.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v718.HumanoidRootPart.Transparency = 1
                            v718.Humanoid.JumpPower = 0
                            v718.Humanoid.WalkSpeed = 0
                            v718.HumanoidRootPart.CanCollide = false
                            FarmPos = v718.HumanoidRootPart.CFrame
                            MonFarm = v718.Name

                            AttackNoCoolDown()

                            if v718.Humanoid.Health <= 0 and v718.Humanoid:FindFirstChild('Animator') then
                                v718.Humanoid.Animator:Destroy()
                            end
                        else
                            TP1(v718.HumanoidRootPart.CFrame * Pos)
                        end
                    end
                    if _G.Auto_DualKatana ~= false and (Auto_Quest_Yama_2 ~= false and (v718.Parent and (v718.Humanoid.Health > 0 and v718:FindFirstChild('HazeESP')))) then
                        break
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if Auto_Quest_Yama_3 then
            pcall(function()
                if game.Players.LocalPlayer.Backpack:FindFirstChild('Hallow Essence') then
                    TP1(game:GetService('Workspace').Map['Haunted Castle'].Summoner.Detection.CFrame)
                end
                if not game:GetService('Workspace').Map:FindFirstChild('HellDimension') then
                    if game:GetService('Workspace').Enemies:FindFirstChild('Soul Reaper') or game.ReplicatedStorage:FindFirstChild('Soul Reaper [Lv. 2100] [Raid Boss]') then
                        if game:GetService('Workspace').Enemies:FindFirstChild('Soul Reaper') then
                            local v723, v724, v725 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                            while true do
                                local v726

                                v725, v726 = v723(v724, v725)

                                if v725 == nil then
                                    break
                                end
                                if v726.Name == 'Soul Reaper' and v726.Humanoid.Health > 0 then
                                    repeat
                                        wait()
                                        TP1(v726.HumanoidRootPart.CFrame * Pos)
                                    until _G.Auto_DualKatana == false or Auto_Quest_Yama_3 == false or game:GetService('Workspace').Map:FindFirstChild('HellDimension')
                                end
                            end
                        else
                            TP1(CFrame.new(-9570.033203125, 315.9346923828125, 6726.89306640625))
                        end
                    else
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Bones', 'Buy', 1, 1)
                    end

                    return
                end

                wait()

                if not (game:GetService('Workspace').Enemies:FindFirstChild('Cursed Skeleton [Lv. 2200]') or (game:GetService('Workspace').Enemies:FindFirstChild('Cursed Skeleton [Lv. 2200] [Boss]') or game:GetService('Workspace').Enemies:FindFirstChild("Hell's Messenger [Lv. 2200] [Boss]"))) then
                    wait(5)
                    TP1(game:GetService('Workspace').Map.HellDimension.Torch1.CFrame)
                    wait(1.5)
                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 'E', false, game)
                    wait(1.5)
                    Tweem(game:GetService('Workspace').Map.HellDimension.Torch2.CFrame)
                    wait(1.5)
                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 'E', false, game)
                    wait(1.5)
                    TP1(game:GetService('Workspace').Map.HellDimension.Torch3.CFrame)
                    wait(1.5)
                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 'E', false, game)
                    wait(1.5)
                    TP1(game:GetService('Workspace').Map.HellDimension.Exit.CFrame)
                end

                local v727, v728, v729 = pairs(game:GetService('Workspace').Enemies:GetChildren())
                local v730

                v729, v730 = v727(v728, v729)

                if v729 == nil then
                end
                if v730.Name ~= 'Cursed Skeleton' and (v730.Name ~= 'Cursed Skeleton' and v730.Name ~= "Hell's Messenger") or v730.Humanoid.Health <= 0 then
                end

                wait()
                EquipTool(Sword)
                TP1(v730.HumanoidRootPart.CFrame * Pos)

                v730.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                v730.HumanoidRootPart.Transparency = 1
                v730.Humanoid.JumpPower = 0
                v730.Humanoid.WalkSpeed = 0
                v730.HumanoidRootPart.CanCollide = false
                FarmPos = v730.HumanoidRootPart.CFrame
                MonFarm = v730.Name

                AttackNoCoolDown()

                if v730.Humanoid.Health <= 0 and v730.Humanoid:FindFirstChild('Animator') then
                    v730.Humanoid.Animator:Destroy()
                end
                if v730.Humanoid.Health <= 0 or (not v730.Parent or Auto_Quest_Yama_3 == false) then
                else
                end
                if _G.Auto_DualKatana == false or (Auto_Quest_Yama_3 == false or GetMaterial('Alucard Fragment') == 3) then
                end
                if true then
                else
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if Auto_Quest_Tushita_1 then
            TP1(CFrame.new(-9546.990234375, 21.139892578125, 4686.1142578125))
            wait(5)
            TP1(CFrame.new(-6120.0576171875, 16.455780029296875, -2250.697265625))
            wait(5)
            TP1(CFrame.new(-9533.2392578125, 7.254445552825928, -8372.69921875))
        end
    end
end)
spawn(function()
    while wait() do
        if Auto_Quest_Tushita_2 then
            pcall(function()
                if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
                    TP1(CFrame.new(-5545.1240234375, 313.800537109375, -2976.616455078125))

                    return
                end

                local v731, v732, v733 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                wait()
                EquipTool(Sword)
                TP1(v734.HumanoidRootPart.CFrame * Pos)

                v734.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                v734.HumanoidRootPart.Transparency = 1
                v734.Humanoid.JumpPower = 0
                v734.Humanoid.WalkSpeed = 0
                v734.HumanoidRootPart.CanCollide = false
                FarmPos = v734.HumanoidRootPart.CFrame
                MonFarm = v734.Name

                AttackNoCoolDown()

                if v734.Humanoid.Health <= 0 and v734.Humanoid:FindFirstChild('Animator') then
                    v734.Humanoid.Animator:Destroy()
                end
                if v734.Humanoid.Health > 0 and (v734.Parent and Auto_Quest_Tushita_2 ~= false) then
                end

                local v734

                v733, v734 = v731(v732, v733)

                if v733 == nil then
                end
                if Auto_Quest_Tushita_2 and (v734:FindFirstChild('HumanoidRootPart') and (v734:FindFirstChild('Humanoid') and (v734.Humanoid.Health > 0 and (v734.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000))) then
                else
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if Auto_Quest_Tushita_3 then
            pcall(function()
                if not (game:GetService('Workspace').Enemies:FindFirstChild('Cake Queen') or game.ReplicatedStorage:FindFirstChild('Cake Queen [Lv. 2175] [Boss]')) then
                end
                if not game:GetService('Workspace').Enemies:FindFirstChild('Cake Queen') then
                    TP1(CFrame.new(-709.3132934570313, 381.6005859375, -11011.396484375))
                end

                local v735, v736, v737 = pairs(game:GetService('Workspace').Enemies:GetChildren())
                local v738

                v737, v738 = v735(v736, v737)

                if v737 == nil then
                end
                if v738.Name ~= 'Cake Queen' or v738.Humanoid.Health <= 0 then
                end

                while true do
                    wait()
                    EquipTool(Sword)
                    TP1(v738.HumanoidRootPart.CFrame * Pos)

                    v738.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    v738.HumanoidRootPart.Transparency = 1
                    v738.Humanoid.JumpPower = 0
                    v738.Humanoid.WalkSpeed = 0
                    v738.HumanoidRootPart.CanCollide = false
                    FarmPos = v738.HumanoidRootPart.CFrame
                    MonFarm = v738.Name

                    AttackNoCoolDown()

                    if v738.Humanoid.Health <= 0 and v738.Humanoid:FindFirstChild('Animator') then
                        v738.Humanoid.Animator:Destroy()
                    end
                    if _G.Auto_DualKatana == false or Auto_Quest_Tushita_3 == false or game:GetService('Workspace').Map:FindFirstChild('HeavenlyDimension') then
                    end
                end

                local v739, v740 = v741(v742, v739)

                if v739 == nil then
                end
                if v740.Name ~= 'Cursed Skeleton' and (v740.Name ~= 'Cursed Skeleton' and v740.Name ~= "Heaven's Guardian") or v740.Humanoid.Health <= 0 then
                end

                wait()
                EquipTool(Sword)
                TP1(v740.HumanoidRootPart.CFrame * Pos)

                v740.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                v740.HumanoidRootPart.Transparency = 1
                v740.Humanoid.JumpPower = 0
                v740.Humanoid.WalkSpeed = 0
                v740.HumanoidRootPart.CanCollide = false
                FarmPos = v740.HumanoidRootPart.CFrame
                MonFarm = v740.Name

                AttackNoCoolDown()

                if v740.Humanoid.Health <= 0 and v740.Humanoid:FindFirstChild('Animator') then
                    v740.Humanoid.Animator:Destroy()
                end
                if v740.Humanoid.Health <= 0 or (not v740.Parent or Auto_Quest_Tushita_3 == false) then
                else
                end
                if not _G.Auto_DualKatana or (not Auto_Quest_Tushita_3 or GetMaterial('Alucard Fragment') == 6) then
                end
                if true then
                else
                end

                wait()

                if not (game:GetService('Workspace').Enemies:FindFirstChild('Cursed Skeleton [Lv. 2200]') or (game:GetService('Workspace').Enemies:FindFirstChild('Cursed Skeleton [Lv. 2200] [Boss]') or game:GetService('Workspace').Enemies:FindFirstChild("Heaven's Guardian [Lv. 2200] [Boss]"))) then
                    wait(5)
                    TP1(game:GetService('Workspace').Map.HeavenlyDimension.Torch1.CFrame)
                    wait(1.5)
                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 'E', false, game)
                    wait(1.5)
                    TP1(game:GetService('Workspace').Map.HeavenlyDimension.Torch2.CFrame)
                    wait(1.5)
                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 'E', false, game)
                    wait(1.5)
                    TP1(game:GetService('Workspace').Map.HeavenlyDimension.Torch3.CFrame)
                    wait(1.5)
                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 'E', false, game)
                    wait(1.5)
                    TP1(game:GetService('Workspace').Map.HeavenlyDimension.Exit.CFrame)
                end

                local v741, v742

                v741, v742, v739 = pairs(game:GetService('Workspace').Enemies:GetChildren())

                if not game:GetService('Workspace').Map:FindFirstChild('HeavenlyDimension') then
                    return
                end
            end)
        end
    end
end)

local CheckQuestDragonStatus = QuestSectionRight:Status({
    Name = "Check Quest Dragon",
    Desc = "Dragon Quest Status: Not Started"
})

QuestSectionRight:Dropdown({
    Name = "Select Mob Quest",
    Description = "Choose mob for dragon quest",
    Items = {"Venomous Assailant", "Hydra Enforcer"},
    Default = "Venomous Assailant",
    Callback = function(Value)
        _G.SelectMobQuest = Value
    end
})

QuestSectionRight:Toggle({
    Name = "Auto Dragon Quest",
    Description = "Automatically complete dragon quest",
    Default = false,
    Callback = function(Value)
        _G.AutoDragonQuest = Value
        if Value then
            StopTween(_G.AutoDragonQuest)
        end
    end
})

QuestSectionRight:Toggle({
    Name = "Auto Farm Mob Quest",
    Description = "Automatically farm selected mob for quest",
    Default = false,
    Callback = function(Value)
        _G.AutoFarmMobQuest = Value
        if Value then
            StopTween(_G.AutoFarmMobQuest)
        end
    end
})

QuestSectionRight:Toggle({
    Name = "Auto tree destroyer",
    Description = "Automatically destroy trees for quest",
    Default = false,
    Callback = function(Value)
        _G.AutoTreeDestroyer = Value
        if Value then
            StopTween(_G.AutoTreeDestroyer)
        end
    end
})

spawn(function()
    while wait() do
        if _G.AutoItemsQuest then
            pcall(function()
                if World1 then
                    if AutoSaber and game.Players.LocalPlayer.Data.Level.Value >= 200 then
                        if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0 then
                            if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0 then
                                if (CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                                    topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                                    wait(1)
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame
                                    wait(1)
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame
                                    wait(1)
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame
                                    wait(1)
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame
                                    wait(1)
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame
                                    wait(1)
                                else
                                    topos(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279))
                                end
                            else
                                if game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0 then
                                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                                        EquipWeapon("Torch")
                                        topos(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-09, 0.761243105, -5.70652914e-10, 1, 1.20584542e-09, -0.761243105, 3.47544882e-10, -0.648466587))
                                    else
                                        topos(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 3.42372805e-05, -0.258850515, 0.965917408))
                                    end
                                else
                                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","GetCup")
                                        wait(0.5)
                                        EquipWeapon("Cup")
                                        wait(0.5)
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","FillCup",game:GetService("Players").LocalPlayer.Character.Cup)
                                        wait(0)
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan")
                                    else
                                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == nil then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 0 then
                                            if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") or game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
                                                topos(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559)) 
                                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                                    if v.Name == "Mob Leader" then
                                                        if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") then
                                                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                                repeat task.wait()
                                                                    AutoHaki()
                                                                    EquipWeapon(_G.SelectWeapon)
                                                                    v.HumanoidRootPart.CanCollide = false
                                                                    v.Humanoid.WalkSpeed = 0
                                                                    v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                                                    game:GetService("VirtualUser"):CaptureController()
                                                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                                                    sethiddenproperty(game:GetService("Players").LocalPlayer,"Simulationradius",math.huge)
                                                                until v.Humanoid.Health <= 0 or not AutoSaber
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 1 then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                                            wait(0.5)
                                            EquipWeapon("Relic")
                                            wait(0.5)
                                            topos(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-09, 0.481375456, 2.53851997e-08, 1, -5.79995607e-08, -0.481375456, 6.30572643e-08, 0.876514494))
                                        end
                                    end
                                end
                            end
                        else
                            if game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        if v.Name == "Saber Expert" then
                                            repeat task.wait()
                                                EquipWeapon(_G.SelectWeapon)
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                v.HumanoidRootPart.Transparency = 1
                                                v.Humanoid.JumpPower = 0
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.CanCollide = false
                                                FarmPos = v.HumanoidRootPart.CFrame
                                                MonFarm = v.Name
                                                game:GetService'VirtualUser':CaptureController()
                                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672),workspace.CurrentCamera.CFrame)
                                            until v.Humanoid.Health <= 0 or not AutoSaber
                                            if v.Humanoid.Health <= 0 then
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","PlaceRelic")
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    
                    if _G.Autopole then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Thunder God") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Thunder God" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                            sethiddenproperty(game:GetService("Players").LocalPlayer,"Simulationradius",math.huge)
                                        until not _G.Autopole or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God") then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God").HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                            end
                        end
                    end
                    
                    if _G.Autosaw then
                        local SharkPos = CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094)
                        if game:GetService("Workspace").Enemies:FindFirstChild("The Saw") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "The Saw" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                        until not _G.Autosaw or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        else
                            EquipWeapon(_G.SelectWeapon)
                            topos(SharkPos)
                            if game:GetService("ReplicatedStorage"):FindFirstChild("The Saw") then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("The Saw").HumanoidRootPart.CFrame * CFrame.new(2,40,2))
                            end
                        end
                    end
                    
                    if _G.ChiefWarden then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Chief Warden") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Chief Warden" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                            sethiddenproperty(game:GetService("Players").LocalPlayer,"Simulationradius",math.huge)
                                        until not _G.ChiefWarden or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden") then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden").HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                            end
                        end
                    end
                    
                    if _G.Trident then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Fishman Lord") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Fishman Lord" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                            sethiddenproperty(game:GetService("Players").LocalPlayer,"Simulationradius",math.huge)
                                        until not _G.Trident or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Fishman Lord") then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("Fishman Lord").HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                            end
                        end
                    end
                end
                
                if World2 then
                    if _G.Longsword then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Diamond") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Diamond" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                            sethiddenproperty(game:GetService("Players").LocalPlayer,"Simulationradius",math.huge)
                                        until not _G.Longsword or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Diamond") then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("Diamond").HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                            end
                        end
                    end
                    
                    if _G.GravityBlade then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Fajita") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Fajita" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                            sethiddenproperty(game:GetService("Players").LocalPlayer,"Simulationradius",math.huge)
                                        until not _G.GravityBlade or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Fajita") then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("Fajita").HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                            end
                        end
                    end
                    
                    if _G.SwodsFlail then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Smoke Admiral") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Smoke Admiral" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                            sethiddenproperty(game:GetService("Players").LocalPlayer,"Simulationradius",math.huge)
                                        until not _G.SwodsFlail or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Smoke Admiral") then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("Smoke Admiral").HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                            end
                        end
                    end
                    
                    if _G.AutoRengoku then
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") 
                        or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hidden Key") then
                            EquipWeapon("Hidden Key")
                            topos(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
                        elseif game:GetService("Workspace").Enemies:FindFirstChild("Awakened Ice Admiral") then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Awakened Ice Admiral" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") 
                                    and v.Humanoid.Health > 0 then
                                        repeat 
                                            task.wait()
                                            EquipWeapon(_G.SelectWeapon)
                                            AutoHaki()
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                        until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") 
                                        or _G.AutoRengoku == false 
                                        or not v.Parent 
                                        or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        else
                            topos(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
                        end
                    end
                    
                    if _G.SwodsDRTrident then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Tide Keeper") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Tide Keeper" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                            sethiddenproperty(game:GetService("Players").LocalPlayer,"Simulationradius",math.huge)
                                        until not _G.SwodsDRTrident or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper") then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper").HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                            end
                        end
                    end
                    
                    if _G.AutoBuyLegendarySword then
                        local args = {
                            [1] = "LegendarySwordDealer",
                            [2] = "1"
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        local args = {
                            [1] = "LegendarySwordDealer",
                            [2] = "2"
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        local args = {
                            [1] = "LegendarySwordDealer",
                            [2] = "3"
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                end
                
                if World3 then
                    if _G.SwodTwinHooks then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Captain Elephant" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                            sethiddenproperty(game:GetService("Players").LocalPlayer,"Simulationradius",math.huge)
                                        until not _G.SwodTwinHooks or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Captain Elephant") then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("Captain Elephant").HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                            end
                        end
                    end
                    
                    if _G.SwodCanvander then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Beautiful Pirate" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                            sethiddenproperty(game:GetService("Players").LocalPlayer,"Simulationradius",math.huge)
                                        until not _G.SwodCanvander or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate") then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate").HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                            end
                        end
                    end
                    
                    if _G.SwodsBuddy then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Cake Queen" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                            sethiddenproperty(game:GetService("Players").LocalPlayer,"Simulationradius",math.huge)
                                        until not _G.SwodsBuddy or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen") then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen").HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                            end
                        end
                    end
                    
                    if _G.AutoYama then
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress")>=30 then
                            repeat wait()
                                fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
                            until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or not _G.AutoYama
                        end
                    end
                    
                    if _G.AutoHolyTorch then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5657.88623046875, 1013.0790405273438, -335.4996337890625))
                        wait(1)
                        topos(CFrame.new(5711.87451171875, 45.82802963256836, 254.17005920410156))
                        wait(15)
                        EquipWeapon("Holy Torch")
                        repeat topos(CFrame.new(-10752, 417, -9366)) wait() until not _G.AutoHolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-10752, 417, -9366)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-11672, 334, -9474)) wait() until not _G.AutoHolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-11672, 334, -9474)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-12132, 521, -10655)) wait() until not _G.AutoHolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-12132, 521, -10655)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-13336, 486, -6985)) wait() until not _G.AutoHolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-13336, 486, -6985)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-13489, 332, -7925)) wait() until not _G.AutoHolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-13489, 332, -7925)).Magnitude <= 10
                    end
                    
                    if _G.AutoGetTushita then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Longma") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Longma" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                            sethiddenproperty(game:GetService("Players").LocalPlayer,"Simulationradius",math.huge)
                                        until not _G.AutoGetTushita or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Longma") then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("Longma").HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                            end
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoQuestSea then
            pcall(function()
                if World1 then
                    local SeaQuest = game:GetService("Workspace").NPCs:FindFirstChild("Sea Quest Giver")
                    if SeaQuest and SeaQuest:FindFirstChild("HumanoidRootPart") then
                        topos(SeaQuest.HumanoidRootPart.CFrame)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "SeaQuest1", 1)
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoSecondSea then
            pcall(function()
                if World1 then
                    local SecondSeaDoor = game:GetService("Workspace").Map.Ice.Door
                    if SecondSeaDoor then
                        topos(SecondSeaDoor.CFrame)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DoorProgress", "Ice")
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoBossRaid then
            pcall(function()
                local RaidBoss = game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form")
                if not RaidBoss then
                    RaidBoss = game:GetService("Workspace").Enemies:FindFirstChild("Darkbeard")
                end
                if RaidBoss and RaidBoss:FindFirstChild("HumanoidRootPart") and RaidBoss:FindFirstChild("Humanoid") and RaidBoss.Humanoid.Health > 0 then
                    repeat task.wait()
                        EquipWeapon(_G.SelectWeapon)
                        AutoHaki()
                        topos(RaidBoss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                        RaidBoss.HumanoidRootPart.CanCollide = false
                        RaidBoss.Humanoid.WalkSpeed = 0
                        RaidBoss.Head.CanCollide = false
                        RaidBoss.HumanoidRootPart.Size = Vector3.new(70,70,70)
                        game:GetService'VirtualUser':CaptureController()
                        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                    until not _G.AutoBossRaid or RaidBoss.Humanoid.Health <= 0 or not RaidBoss.Parent
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoKillGreybeard then
            pcall(function()
                local Greybeard = game:GetService("Workspace").Enemies:FindFirstChild("Greybeard")
                if Greybeard and Greybeard:FindFirstChild("HumanoidRootPart") and Greybeard:FindFirstChild("Humanoid") and Greybeard.Humanoid.Health > 0 then
                    repeat task.wait()
                        EquipWeapon(_G.SelectWeapon)
                        AutoHaki()
                        topos(Greybeard.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                        Greybeard.HumanoidRootPart.CanCollide = false
                        Greybeard.Humanoid.WalkSpeed = 0
                        Greybeard.Head.CanCollide = false
                        Greybeard.HumanoidRootPart.Size = Vector3.new(70,70,70)
                        game:GetService'VirtualUser':CaptureController()
                        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                    until not _G.AutoKillGreybeard or Greybeard.Humanoid.Health <= 0 or not Greybeard.Parent
                else
                    topos(CFrame.new(-5023.38330078125, 28.65203285217285, 4332.3818359375))
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoBuyHakiColors then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "2")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "3")
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoHakiColors then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1")
                wait(0.5)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "2")
                wait(0.5)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "3")
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoGetSaber then
            pcall(function()
                local hasSaber = false
                
                for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                    if v.Name == "Saber" then
                        hasSaber = true
                        break
                    end
                end
                for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                    if v.Name == "Saber" then
                        hasSaber = true
                        break
                    end
                end
                
                if not hasSaber then
                    local SaberQuest = game:GetService("Workspace").NPCs:FindFirstChild("Saber Expert")
                    if SaberQuest and SaberQuest:FindFirstChild("HumanoidRootPart") then
                        topos(SaberQuest.HumanoidRootPart.CFrame)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "SaberQuest", 1)
                        wait(1)
                    end
                    
                    if game:GetService("Workspace").Map and game:GetService("Workspace").Map:FindFirstChild("Jungle") then
                        local JungleFinal = game:GetService("Workspace").Map.Jungle:FindFirstChild("Final")
                        if JungleFinal and JungleFinal:FindFirstChild("Part") and JungleFinal.Part:FindFirstChild("Attachment") then
                            local ProximityPrompt = JungleFinal.Part.Attachment:FindFirstChild("ProximityPrompt")
                            if ProximityPrompt then
                                topos(CFrame.new(-1405.41956, 29.8519993, 5.62435055))
                                wait(0.5)
                                ProximityPrompt:InputHoldBegin()
                                wait(2)
                                ProximityPrompt:InputHoldEnd()
                            end
                        end
                    end
                    
                    topos(CFrame.new(-1405, 30, 5))
                    wait(0.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Saber", "Buy")
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoGetSwordPole then
            pcall(function()
                local hasPole = false
                
                for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                    if v.Name:lower():find("pole") then
                        hasPole = true
                        break
                    end
                end
                for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                    if v.Name:lower():find("pole") then
                        hasPole = true
                        break
                    end
                end
                
                if not hasPole then
                    local PoleQuest = game:GetService("Workspace").NPCs:FindFirstChild("Pole Quest Giver")
                    if PoleQuest and PoleQuest:FindFirstChild("HumanoidRootPart") then
                        topos(PoleQuest.HumanoidRootPart.CFrame)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "PoleQuest", 1)
                        wait(1)
                    end
                    
                    local PoleEnemy = game:GetService("Workspace").Enemies:FindFirstChild("Thunder God")
                    if not PoleEnemy then
                        PoleEnemy = game:GetService("Workspace").Enemies:FindFirstChild("Cyborg")
                    end
                    
                    if PoleEnemy and PoleEnemy:FindFirstChild("HumanoidRootPart") and PoleEnemy:FindFirstChild("Humanoid") and PoleEnemy.Humanoid.Health > 0 then
                        repeat task.wait()
                            EquipWeapon(_G.SelectWeapon)
                            AutoHaki()
                            topos(PoleEnemy.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                            PoleEnemy.HumanoidRootPart.CanCollide = false
                            PoleEnemy.Humanoid.WalkSpeed = 0
                            PoleEnemy.Head.CanCollide = false
                            PoleEnemy.HumanoidRootPart.Size = Vector3.new(70,70,70)
                            game:GetService'VirtualUser':CaptureController()
                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                        until not _G.AutoGetSwordPole or PoleEnemy.Humanoid.Health <= 0 or not PoleEnemy.Parent
                    else

                        topos(CFrame.new(-7748, 5606, -1421))
                    end
                end
            end)
        end
    end
end)

local function UpdateBossSaberStatus()
    spawn(function()
        while wait(1) do
            pcall(function()
                local hasSaber = false
                for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                    if v.Name == "Saber" then
                        hasSaber = true
                        break
                    end
                end
                for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                    if v.Name == "Saber" then
                        hasSaber = true
                        break
                    end
                end
                
                if hasSaber then
                    BossSaberStatus:Set({
                        Text = "Have Boss Saber ✓"
                    })
                else
                    BossSaberStatus:Set({
                        Text = "Not Have Boss Saber ✗"
                    })
                end
            end)
        end
    end)
end

local function UpdatePoleBossStatus()
    spawn(function()
        while wait(1) do
            pcall(function()
                local poleSpawning = false
                local PoleQuest = game:GetService("Workspace").NPCs:FindFirstChild("Pole Quest Giver")
                if PoleQuest then
                    poleSpawning = true
                end
                
                if poleSpawning then
                    PoleBossStatus:Set({
                        Text = "Pole Boss Spawning ✓"
                    })
                else
                    PoleBossStatus:Set({
                        Text = "Pole Boss Not Spawning ✗"
                    })
                end
            end)
        end
    end)
end


UpdateBossSaberStatus()
UpdatePoleBossStatus()


spawn(function()
    while wait() do
        if _G.AutoGetArticless then
            pcall(function()
                for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v.Name == "Articless" and v:FindFirstChild("Handle") then
                        topos(v.Handle.CFrame)
                        v.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
                        wait(0.1)
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoGetSwordSaw then
            pcall(function()
                local SawQuest = game:GetService("Workspace").NPCs:FindFirstChild("Saw Quest Giver")
                if SawQuest and SawQuest:FindFirstChild("HumanoidRootPart") then
                    topos(SawQuest.HumanoidRootPart.CFrame)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "SawQuest", 1)
                    wait(1)

                    local SawEnemy = game:GetService("Workspace").Enemies:FindFirstChild("Saw Enemy")
                    if SawEnemy and SawEnemy:FindFirstChild("HumanoidRootPart") and SawEnemy:FindFirstChild("Humanoid") and SawEnemy.Humanoid.Health > 0 then
                        repeat task.wait()
                            EquipWeapon(_G.SelectWeapon)
                            AutoHaki()
                            topos(SawEnemy.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                            SawEnemy.HumanoidRootPart.CanCollide = false
                            SawEnemy.Humanoid.WalkSpeed = 0
                            SawEnemy.Head.CanCollide = false
                            SawEnemy.HumanoidRootPart.Size = Vector3.new(70,70,70)
                            game:GetService'VirtualUser':CaptureController()
                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                        until not _G.AutoGetSwordSaw or SawEnemy.Humanoid.Health <= 0 or not SawEnemy.Parent
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoGetSwordWardens then
            pcall(function()

                local WardensQuest = game:GetService("Workspace").NPCs:FindFirstChild("Wardens Quest Giver")
                if WardensQuest and WardensQuest:FindFirstChild("HumanoidRootPart") then
                    topos(WardensQuest.HumanoidRootPart.CFrame)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "WardensQuest", 1)
                    wait(1)

                    local WardensEnemy = game:GetService("Workspace").Enemies:FindFirstChild("Chief Warden")
                    if WardensEnemy and WardensEnemy:FindFirstChild("HumanoidRootPart") and WardensEnemy:FindFirstChild("Humanoid") and WardensEnemy.Humanoid.Health > 0 then
                        repeat task.wait()
                            EquipWeapon(_G.SelectWeapon)
                            AutoHaki()
                            topos(WardensEnemy.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                            WardensEnemy.HumanoidRootPart.CanCollide = false
                            WardensEnemy.Humanoid.WalkSpeed = 0
                            WardensEnemy.Head.CanCollide = false
                            WardensEnemy.HumanoidRootPart.Size = Vector3.new(70,70,70)
                            game:GetService'VirtualUser':CaptureController()
                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                        until not _G.AutoGetSwordWardens or WardensEnemy.Humanoid.Health <= 0 or not WardensEnemy.Parent
                    else
                        topos(CFrame.new(5186, 24, 832))
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoGetSwordTrident then
            pcall(function()

                local TridentQuest = game:GetService("Workspace").NPCs:FindFirstChild("Trident Quest Giver")
                if TridentQuest and TridentQuest:FindFirstChild("HumanoidRootPart") then
                    topos(TridentQuest.HumanoidRootPart.CFrame)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "TridentQuest", 1)
                    wait(1)

                    local TridentEnemy = game:GetService("Workspace").Enemies:FindFirstChild("Fishman Lord")
                    if TridentEnemy and TridentEnemy:FindFirstChild("HumanoidRootPart") and TridentEnemy:FindFirstChild("Humanoid") and TridentEnemy.Humanoid.Health > 0 then
                        repeat task.wait()
                            EquipWeapon(_G.SelectWeapon)
                            AutoHaki()
                            topos(TridentEnemy.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                            TridentEnemy.HumanoidRootPart.CanCollide = false
                            TridentEnemy.Humanoid.WalkSpeed = 0
                            TridentEnemy.Head.CanCollide = false
                            TridentEnemy.HumanoidRootPart.Size = Vector3.new(70,70,70)
                            game:GetService'VirtualUser':CaptureController()
                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                        until not _G.AutoGetSwordTrident or TridentEnemy.Humanoid.Health <= 0 or not TridentEnemy.Parent
                    else
                        topos(CFrame.new(61123, 18, 1569))
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        pcall(function()

            local questStatus = "Not Started"
            local player = game:GetService("Players").LocalPlayer
            
            if player.PlayerGui.Main.Quest.Visible == true then
                local questTitle = player.PlayerGui.Main.Quest.Container.QuestTitle.Name.Text
                if questTitle:find("Dragon") then
                    questStatus = "Dragon Quest Active: " .. questTitle
                else
                    questStatus = "Other Quest Active: " .. questTitle
                end
            else
                questStatus = "No Quest Active"
            end
            
            if CheckQuestDragonStatus then
                CheckQuestDragonStatus:Set({
                    Name = "Check Quest Dragon",
                    Desc = "Dragon Quest Status: " .. questStatus
                })
            end
        end)
    end
end)

spawn(function()
    while wait() do
        if _G.AutoDragonQuest then
            pcall(function()
                local player = game:GetService("Players").LocalPlayer
                local questData = player.PlayerGui.Main.Quest
                
                if not questData.Visible or not questData.Container.QuestTitle.Name.Text:find("Dragon") then

                    local questGiverPos
                    if World1 then
                        questGiverPos = CFrame.new(6594, 383, 139) 
                    elseif World2 then
                        questGiverPos = CFrame.new(-2286, 73, -3015) 
                    elseif World3 then
                        questGiverPos = CFrame.new(-5496, 314, -2841)
                    else
                        questGiverPos = CFrame.new(6594, 383, 139)
                    end
                    
                    topos(questGiverPos)
                    wait(2)
                    
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "DragonQuest", 1)
                    wait(0.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "DragonCrewQuest", 1)
                    wait(0.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "FishmanQuest", 1)
                    wait(1)
                else

                    local questTitle = questData.Container.QuestTitle.Name.Text
                    local questProgress = questData.Container.QuestTitle.Name.Text
                    
                    if questTitle:find("Dragon Crew") or questTitle:find("Defeat") and questTitle:find("Dragon") then
                        local targetMob = _G.SelectMobQuest
                        local enemy = game:GetService("Workspace").Enemies:FindFirstChild(targetMob)
                        
                        if not enemy then
                            enemy = game:GetService("ReplicatedStorage"):FindFirstChild(targetMob)
                            if enemy then
                                topos(enemy.HumanoidRootPart.CFrame * CFrame.new(5, 10, 2))
                                wait(1)
                                enemy = game:GetService("Workspace").Enemies:FindFirstChild(targetMob)
                            end
                        end
                        
                        if enemy and enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                            repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                AutoHaki()
                                
                                local enemyPos = enemy.HumanoidRootPart.CFrame
                                topos(enemyPos * CFrame.new(0, 30, 0))
                                
                                enemy.HumanoidRootPart.CanCollide = false
                                enemy.Humanoid.WalkSpeed = 0
                                enemy.Humanoid.JumpPower = 0
                                enemy.Head.CanCollide = false
                                enemy.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
                                enemy.HumanoidRootPart.Transparency = 1
                                
                                game:GetService'VirtualUser':CaptureController()
                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                sethiddenproperty(player, "Simulationradius", math.huge)
                                
                                if _G.BringMob then
                                    BringMob(targetMob)
                                end
                                
                            until not _G.AutoDragonQuest or enemy.Humanoid.Health <= 0 or not enemy.Parent
                        else
              
                            local spawnPos
                            if targetMob == "Dragon Crew Warrior" then
                                if World1 then
                                    spawnPos = CFrame.new(6594, 383, 139)
                                elseif World2 then
                                    spawnPos = CFrame.new(-2286, 73, -3015)
                                elseif World3 then
                                    spawnPos = CFrame.new(-5496, 314, -2841)
                                end
                            elseif targetMob == "Dragon Crew Archer" then
                                if World1 then
                                    spawnPos = CFrame.new(6594, 383, 139)
                                elseif World2 then
                                    spawnPos = CFrame.new(-2286, 73, -3015)
                                elseif World3 then
                                    spawnPos = CFrame.new(-5496, 314, -2841)
                                end
                            elseif targetMob == "Fishman Raider" then
                                spawnPos = CFrame.new(-10407, 332, -8757)
                            elseif targetMob == "Fishman Captain" then
                                spawnPos = CFrame.new(-10828, 332, -9049)
                            end
                            
                            if spawnPos then
                                topos(spawnPos)
                            end
                        end
                        
                    elseif questTitle:find("Tree") or questTitle:find("Destroy") or questTitle:find("Cut") then
                        local treesDestroyed = false
                        
                       
                        local Trees = game:GetService("Workspace"):FindFirstChild("Trees")
                        if Trees then
                            for i, v in pairs(Trees:GetChildren()) do
                                if v:FindFirstChild("Leaves") or v:FindFirstChild("TreeTrunk") or v:FindFirstChild("Part") then
                                    local targetPart = v:FindFirstChild("Leaves") or v:FindFirstChild("TreeTrunk") or v:FindFirstChild("Part")
                                    if targetPart then
                                        topos(targetPart.CFrame)
                                        wait(0.5)
                                        
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DestroyTree", v)
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TreeDestroy", v)
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CutTree", v)
                                        
                                        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                            player.Character.HumanoidRootPart.CFrame = targetPart.CFrame
                                            
                                            game:GetService'VirtualUser':CaptureController()
                                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                        end
                                        
                                        treesDestroyed = true
                                        wait(0.3)
                                        break
                                    end
                                end
                            end
                        end
                        
                        if not treesDestroyed then
                            for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
                                if v.Name:lower():find("tree") and (v:FindFirstChild("Leaves") or v:FindFirstChild("TreeTrunk") or v:FindFirstChild("Part")) then
                                    local targetPart = v:FindFirstChild("Leaves") or v:FindFirstChild("TreeTrunk") or v:FindFirstChild("Part")
                                    if targetPart then
                                        topos(targetPart.CFrame)
                                        wait(0.5)
                                        
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DestroyTree", v)
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TreeDestroy", v)
                                        
                                        treesDestroyed = true
                                        wait(0.3)
                                        break
                                    end
                                end
                            end
                        end
                        
                        if not treesDestroyed then
                            local treeLocations = {
                                CFrame.new(-2777, 25, 2089),
                                CFrame.new(-2654, 73, 1613), 
                                CFrame.new(-1815, 7, 1750)  
                            }
                            
                            for _, pos in pairs(treeLocations) do
                                topos(pos)
                                wait(1)
                                
                              
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DestroyTree")
                                game:GetService'VirtualUser':CaptureController()
                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                wait(0.5)
                            end
                        end
                        
                    elseif questTitle:find("Boss") or questTitle:find("Elite") or questTitle:find("Captain") then
                        local bossNames = {"Dragon Boss", "Elite Dragon", "Dragon Captain", "Sea Beast", "Kraken"}
                        local bossFound = false
                        
                        for _, bossName in pairs(bossNames) do
                            local boss = game:GetService("Workspace").Enemies:FindFirstChild(bossName)
                            if not boss then
                                boss = game:GetService("ReplicatedStorage"):FindFirstChild(bossName)
                                if boss then
                                    topos(boss.HumanoidRootPart.CFrame * CFrame.new(5, 10, 2))
                                    wait(2)
                                    boss = game:GetService("Workspace").Enemies:FindFirstChild(bossName)
                                end
                            end
                            
                            if boss and boss:FindFirstChild("HumanoidRootPart") and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                                bossFound = true
                                repeat task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    
                                    topos(boss.HumanoidRootPart.CFrame * CFrame.new(0, 35, 0))
                                    
                                    boss.HumanoidRootPart.CanCollide = false
                                    boss.Humanoid.WalkSpeed = 0
                                    boss.Humanoid.JumpPower = 0
                                    boss.Head.CanCollide = false
                                    boss.HumanoidRootPart.Size = Vector3.new(100, 100, 100)
                                    
                                    game:GetService'VirtualUser':CaptureController()
                                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                    sethiddenproperty(player, "Simulationradius", math.huge)
                                    
                                until not _G.AutoDragonQuest or boss.Humanoid.Health <= 0 or not boss.Parent
                                break
                            end
                        end
                        
                        if not bossFound then
                            
                            local bossSpawns = {
                                CFrame.new(6594, 383, 139),  
                                CFrame.new(-2286, 73, -3015), 
                                CFrame.new(-5496, 314, -2841)  
                            }
                            
                            for _, spawn in pairs(bossSpawns) do
                                topos(spawn)
                                wait(3)
                            end
                        end
                        
                    elseif questTitle:find("Collect") or questTitle:find("Gather") or questTitle:find("Find") then
                        local collectibles = game:GetService("Workspace"):FindFirstChild("Collectibles")
                        if collectibles then
                            for i, v in pairs(collectibles:GetChildren()) do
                                if v:FindFirstChild("Handle") or v:FindFirstChild("Part") then
                                    local targetPart = v:FindFirstChild("Handle") or v:FindFirstChild("Part")
                                    topos(targetPart.CFrame)
                                    wait(0.5)
                                    
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CollectItem", v)
                                    wait(0.2)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoFarmMobQuest then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectMobQuest) then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == _G.SelectMobQuest then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    StartBring = true
                                    PosMon = v.HumanoidRootPart.CFrame
                                    v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                until not _G.AutoFarmMobQuest or not v.Parent or v.Humanoid.Health <= 0
                                StartBring = false
                            end
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectMobQuest) then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectMobQuest).HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                    end
                end
            end)
        end
    end
end)

local TweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:FindFirstChildOfClass("Humanoid")

local Positions = {
    CFrame.new(5255.1049, 1004.1949, 344.7700),
    CFrame.new(5340.3584, 1004.1949, 362.6387),
    CFrame.new(5323.6436, 1004.1949, 440.7161),
    CFrame.new(5244.3618, 1004.1949, 422.4569)
}

local function pressKey(key)
    VirtualInputManager:SendKeyEvent(true, key, false, game)
    wait(0.1)
    VirtualInputManager:SendKeyEvent(false, key, false, game)
end

local function useWeapon(weapon)
    if humanoid then
        local tool = player.Backpack:FindFirstChild(weapon)
        if tool then
            humanoid:EquipTool(tool)
            wait(0.2)
            pressKey("E")
        end
    end
end

local function useSkills()
    pressKey("Z")
    wait(0.5)
    pressKey("X")
    wait(0.5)
    pressKey("C")
end

local function TweenToPosition(targetCFrame, duration)
    local character = player.Character or player.CharacterAdded:Wait()
    if character and character:FindFirstChild("HumanoidRootPart") then
        local hrp = character.HumanoidRootPart
        local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
        local goal = {CFrame = targetCFrame}
        local tween = TweenService:Create(hrp, tweenInfo, goal)
        tween:Play()
        tween.Completed:Wait()
    end
end

spawn(function()
    while wait() do
        if _G.AutoTreeDestroyer then
            AutoHaki()
            for _, pos in ipairs(Positions) do
                if not _G.AutoTreeDestroyer then break end
                TweenToPosition(pos, 2)

                local character = player.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local distance = (character.HumanoidRootPart.Position - pos.Position).Magnitude
                    if distance <= 1 then
                        _G.AutoSkill = true
                        wait(3)
                        _G.AutoSkill = false
                    end
                end
            end
        end
    end
end)

spawn(function()
    while wait(1) do
        if _G.AutoSkill then
            useWeapon("Melee")
            useWeapon("Sword")
            useWeapon("Gun")
            useSkills()
        end
    end
end)


_G.AutoFindPrehistoric = false
_G.Nocliprock = false
_G.findVolcanicMagnet = false
_G.TweenVolcano = false
_G.DefendVolcano = false
_G.UseMelee = false
_G.UseSword = false
_G.UseGun = false
_G.KillGolem = false
_G.Kill_Aura = false
_G.AutoCollectBone = false

function GetLocalBoat()
    for i, v in next, game:GetService("Workspace").Boats:GetChildren() do
        if v:IsA("Model") then
            if v:FindFirstChild("Owner") and tostring(v.Owner.Value) == game:GetService("Players").LocalPlayer.Name and v.Humanoid.Value > 0 then
                return v
            end
        end
    end
    return false
end

local boatMovementConnection

function GetPlayerBoat()
    local character = Players.LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local seat = character.Humanoid.SeatPart
        if seat and seat:IsA("VehicleSeat") then
            return seat.Parent
        end
    end
    return nil
end

function MoveBoat(direction, distance, speed)
    local boat = GetPlayerBoat()
    if boat and boat.PrimaryPart then
        local boatPrimaryPart = boat.PrimaryPart
        local targetPosition = boatPrimaryPart.Position + (direction * distance)
        targetPosition = Vector3.new(targetPosition.X, targetPosition.Y + 200, targetPosition.Z)
        local distanceToTarget = (boatPrimaryPart.Position - targetPosition).Magnitude
        local tweenInfo = TweenInfo.new(distanceToTarget / speed, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local targetCFrame = CFrame.new(targetPosition)

        local tween = TweenService:Create(boatPrimaryPart, tweenInfo, {CFrame = targetCFrame})
        tween:Play()
    end
end

function StartBoatMovement()
    if not _G.findVolcanicMagnet then return end
    boatMovementConnection = RunService.Heartbeat:Connect(function()
        local direction = Vector3.new(0, 0, 1000)
        local distance = 500
        local speed = 186
        MoveBoat(direction, distance, speed)
    end)
end

function StopBoatMovement()
    if boatMovementConnection then
        boatMovementConnection:Disconnect()
        boatMovementConnection = nil
    end
end

spawn(function()
    while wait() do
        if _G.Nocliprock then
            if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
                for _, v in pairs(game.Workspace.Boats:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide == true then
                        v.CanCollide = false
                    end
                end
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide == true then
                        v.CanCollide = false
                    end
                end
            elseif game.Players.LocalPlayer.Character.Humanoid.Sit == false then
                for _, v in pairs(game.Workspace.Boats:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide == false then
                        v.CanCollide = true
                    end
                end
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide == false then
                        v.CanCollide = true
                    end
                end
            end
        end
    end
end)





_G.AutoFindPrehistoric = false
_G.AutoFindZonePrehistoric = false
_G.TweenToPrehistoric = false
_G.AutoDefendPrehistoric = false
_G.AutoSkillMelee = false
_G.AutoSkillSword = false
_G.AutoSkillGun = false
_G.AutoKillGolem = false
_G.AutoKillAuraGolem = false
_G.CollectBone = false
_G.CollectEgg = false
_G.DefendVolcano = false
_G.TweenVolcano = false
_G.UseMelee = false
_G.UseSword = false
_G.UseGun = false
_G.Kill_Aura = false
_G.AutoCollectBone = false

_G.KitsuneIslandEsp = false
_G.TweenToKitsune = false
_G.AutoAzuerEmber = false
_G.SailBoat = false
_G.Autoterrorshark = false

local function sendKeyEvent(key)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, key, false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, key, false, game)
end

local function removeLava()
    local interiorLava = game.Workspace.Map.PrehistoricIsland.Core:FindFirstChild("InteriorLava")
    if interiorLava and interiorLava:IsA("Model") then
        interiorLava:Destroy()
    end
    local prehistoricIsland = game.Workspace.Map:FindFirstChild("PrehistoricIsland")
    if prehistoricIsland then
        for _, part in pairs(prehistoricIsland:GetDescendants()) do
            if part:IsA("Part") and part.Name:lower():find("lava") then
                part:Destroy()
            end
        end
        for _, model in pairs(prehistoricIsland:GetDescendants()) do
            if model:IsA("Model") then
                for _, mesh in pairs(model:GetDescendants()) do
                    if mesh:IsA("MeshPart") and mesh.Name:lower():find("lava") then
                        mesh:Destroy()
                    end
                end
            end
        end
    end
end

local function findVolcanoRock()
    local volcanoRocks = game.Workspace.Map.PrehistoricIsland.Core.VolcanoRocks
    for _, rockModel in pairs(volcanoRocks:GetChildren()) do
        if rockModel:IsA("Model") then
            local rock = rockModel:FindFirstChild("volcanorock")
            if rock and rock:IsA("MeshPart") then
                local rockColor = rock.Color
                if (rockColor == Color3.fromRGB(185, 53, 56)) or (rockColor == Color3.fromRGB(185, 53, 57)) then
                    return rock
                end
            end
        end
    end
    return nil
end

local function useWeaponDefend(weaponType)
    local player = game.Players.LocalPlayer
    local backpack = player.Backpack
    for _, tool in pairs(backpack:GetChildren()) do
        if tool:IsA("Tool") and (tool.ToolTip == weaponType) then
            tool.Parent = player.Character
            for _, key in ipairs({"Z", "X", "C", "V", "F"}) do
                wait()
                pcall(function()
                    sendKeyEvent(key)
                end)
            end
            tool.Parent = backpack
            break
        end
    end
end

QuestSectionRight:Status({
    Name = "Check Prehistoric island",
    Desc = "Prehistoric Island didnt Spawn ❌"
})

QuestSectionRight:Button({
    Name = "Remove Lava Prehistoric",
    Desc = "Remove lava from prehistoric island",
    Callback = function()
        pcall(removeLava)
        Library:Notify({
            Name = "Prehistoric",
            Content = "Lava removed from prehistoric island!",
            Duration = 3
        })
    end
})

QuestSectionRight:Toggle({
    Name = "Auto Find Prehistoric",
    Value = false,
    Callback = function(Value)
        _G.AutoFindPrehistoric = Value
    end
})


spawn(function()
    local seatHistory = {}
    local SetSpeedBoat = 350
    local isTeleporting = false
    local notified = false
    
    game:GetService("RunService").RenderStepped:Connect(function()
        for boatName, seat in pairs(seatHistory) do
            if seat and seat.Parent and seat.Name == "VehicleSeat" and not seat.Occupant then
                seatHistory[boatName] = seat
            end
        end
    end)
    
    local function tpToMyBoat()
        if isTeleporting then return end
        isTeleporting = true
        for boatName, seat in pairs(seatHistory) do
            if seat and seat.Parent and seat.Name == "VehicleSeat" and not seat.Occupant then
                topos(seat.CFrame)
                break
            end
        end
        isTeleporting = false
    end
    
    game:GetService("RunService").RenderStepped:Connect(function()
        if not _G.AutoFindPrehistoric then
            notified = false
            return
        end
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("Humanoid") then return end
        
        local humanoid = character.Humanoid
        local boatFound = false
        local currentBoat = nil
        
        for _, b in pairs(game.Workspace.Boats:GetChildren()) do
            local seat = b:FindFirstChild("VehicleSeat")
            if seat and seat.Occupant == humanoid then
                boatFound = true
                currentBoat = seat
                seatHistory[b.Name] = seat
            elseif seat and seat.Occupant == nil then
                tpToMyBoat()
            end
        end

        if not boatFound then return end
        
        currentBoat.MaxSpeed = SetSpeedBoat
        currentBoat.CFrame = CFrame.new(Vector3.new(currentBoat.Position.X, currentBoat.Position.Y, currentBoat.Position.Z)) * currentBoat.CFrame.Rotation
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "W", false, game)

        for _, v in pairs(game.Workspace.Boats:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
        for _, v in pairs(character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end

        local islandsToDelete = { 
            "ShipwreckIsland", "SandIsland", "TreeIsland", "TinyIsland", 
            "MysticIsland", "KitsuneIsland", "FrozenDimension" 
        }
        for _, islandName in ipairs(islandsToDelete) do
            local island = game.Workspace.Map:FindFirstChild(islandName)
            if island and island:IsA("Model") then
                island:Destroy()
            end
        end

        local prehistoricIsland = game.Workspace.Map:FindFirstChild("PrehistoricIsland")
        if prehistoricIsland then
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "W", false, game)
            _G.AutoFindPrehistoric = false
            if not notified then
                notified = true
                Library:Notify({
                    Name = "Prehistoric Found!",
                    Content = "Prehistoric Island has been found!",
                    Duration = 5
                })
            end
            return
        end
    end)
end)

QuestSectionRight:Toggle({
    Name = "Auto Find Zone Prehistoric", 
    Value = false,
    Callback = function(Value)
        _G.AutoFindZonePrehistoric = Value
        _G.Nocliprock = Value
        _G.findVolcanicMagnet = Value
        if _G.findVolcanicMagnet then
            StartBoatMovement()
        else
            StopBoatMovement()
        end
    end
})

QuestSectionRight:Toggle({
    Name = "Auto Tween To Prehistoric",
    Value = false,
    Callback = function(Value)
        _G.TweenToPrehistoric = Value
        _G.TweenVolcano = Value
    end
})


spawn(function()
    local island
    while not island do
        island = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
        wait()
    end
    while wait() do
        if _G.TweenVolcano then
            local prehistoricIslandCore = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
            if prehistoricIslandCore then
                local relic = prehistoricIslandCore:FindFirstChild("Core") and prehistoricIslandCore.Core:FindFirstChild("PrehistoricRelic")
                local skull = relic and relic:FindFirstChild("Skull")
                if skull then
                    TP1(CFrame.new(skull.Position))
                    _G.TweenVolcano = false
                end
            end
        end
    end
end)

QuestSectionRight:Toggle({
    Name = "Auto Defend Prehistoric",
    Value = false,
    Callback = function(Value)
        _G.AutoDefendPrehistoric = Value
        _G.DefendVolcano = Value
    end
})


spawn(function()
    while wait() do
        if _G.DefendVolcano then
            AutoHaki()
            pcall(removeLava)
            local volcanoRock = findVolcanoRock()
            if volcanoRock then
                local targetPosition = CFrame.new(volcanoRock.Position)
                TP1(targetPosition)
                local rockColor = volcanoRock.Color
                if (rockColor ~= Color3.fromRGB(185, 53, 56)) and (rockColor ~= Color3.fromRGB(185, 53, 57)) then
                    volcanoRock = findVolcanoRock()
                else
                    local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    local distance = (playerPosition - volcanoRock.Position).Magnitude
                    if distance <= 1 then
                        if _G.UseMelee then
                            useWeaponDefend("Melee")
                        end
                        if _G.UseSword then
                            useWeaponDefend("Sword")
                        end
                        if _G.UseGun then
                            useWeaponDefend("Gun")
                        end
                    end
                    _G.TpPrehistoric = false
                end
            else
                _G.TpPrehistoric = true
            end
        end
    end
end)

QuestSectionRight:Toggle({
    Name = "Auto Skill Melee",
    Value = false,
    Callback = function(Value)
        _G.AutoSkillMelee = Value
        _G.UseMelee = Value
    end
})

QuestSectionRight:Toggle({
    Name = "Auto Skill Sword",
    Value = false,
    Callback = function(Value)
        _G.AutoSkillSword = Value
        _G.UseSword = Value
    end
})

QuestSectionRight:Toggle({
    Name = "Auto Skill Gun",
    Value = false,
    Callback = function(Value)
        _G.AutoSkillGun = Value
        _G.UseGun = Value
    end
})

QuestSectionRight:Toggle({
    Name = "Auto Kill Golem",
    Value = false,
    Callback = function(Value)
        _G.AutoKillGolem = Value
        _G.KillGolem = Value
        StopTween(_G.KillGolem)
    end
})

spawn(function()
    while wait() do
        if _G.KillGolem and World3 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Lava Golem") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Lava Golem" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    sethiddenproperty(game.Players.LocalPlayer,"Simulationradius",math.huge)
                                until not _G.KillGolem or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Lava Golem") then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Lava Golem").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                    end
                end
            end)
        end
    end
end)

QuestSectionRight:Toggle({
    Name = "Auto Kill Aura Golem",
    Value = false,
    Callback = function(Value)
        _G.AutoKillAuraGolem = Value
        _G.Kill_Aura = Value
    end
})


spawn(function()
    pcall(function()
        while wait() do
            if _G.Kill_Aura then
                local player = game:GetService("Players").LocalPlayer
                local enemies = game:GetService("Workspace").Enemies:GetChildren()
                local playerPos = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position
                if playerPos then
                    for _, enemy in pairs(enemies) do
                        if enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") and enemy.Humanoid.Health > 0 then
                            local distance = (enemy.HumanoidRootPart.Position - playerPos).Magnitude
                            if distance <= 1000 then
                                pcall(function()
                                    repeat wait()
                                        sethiddenproperty(player, "Simulationradius", math.huge)
                                        enemy.Humanoid.Health = 0
                                        enemy.HumanoidRootPart.CanCollide = false
                                    until not _G.Kill_Aura or not enemy.Parent or enemy.Humanoid.Health <= 0
                                end)
                            end
                        end
                    end
                end
            end
        end
    end)
end)

QuestSectionRight:Toggle({
    Name = "Collect Bones",
    Value = false,
    Callback = function(Value)
        _G.CollectBone = Value
        _G.AutoCollectBone = Value
        StopTween(_G.AutoCollectBone)
    end
})


spawn(function()
    while wait() do
        if _G.AutoCollectBone then
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Name == "DinoBone" then
                    topos(obj.CFrame)
                    wait(0.5)
                end
            end
        end
    end
end)

QuestSectionRight:Toggle({
    Name = "Collect Eggs",
    Value = false,
    Callback = function(Value)
        _G.CollectEgg = Value
        StopTween(_G.CollectEgg)
    end
})

spawn(function()
    while wait() do
        if _G.CollectEgg then
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/CollectedDragonEgg"):FireServer()
            end)
        end
    end
end)


local function removeFog()
    local lighting = game:GetService("Lighting")
    lighting.FogEnd = 100000
    lighting.FogStart = 0
    lighting.Brightness = 2
    lighting.ClockTime = 12
    lighting.GlobalShadows = true
    lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    
    for _, effect in pairs(lighting:GetChildren()) do
        if effect:IsA("BloomEffect") or effect:IsA("BlurEffect") or 
           effect:IsA("ColorCorrectionEffect") or effect:IsA("SunRaysEffect") then
            effect.Enabled = false
        end
    end
end

local function findKitsuneIsland()
    local kitsuneIsland = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Kitsune Island")
    return kitsuneIsland
end

local function findAzureEmber()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name == "Azure Ember" then
            return obj
        end
    end
    return nil
end

local function findTerrorShark()
    for _, enemy in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if enemy.Name == "Terror Shark" and enemy:FindFirstChild("HumanoidRootPart") then
            return enemy
        end
    end
    return nil
end

local function driveBoat()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return end
    
    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then return end
    
    for _, boat in pairs(game.Workspace.Boats:GetChildren()) do
        local seat = boat:FindFirstChild("VehicleSeat")
        if seat and seat.Occupant == humanoid then
            seat.MaxSpeed = 350
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
            
            for _, part in pairs(boat:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
            break
        end
    end
end

QuestSectionLeft:Button({
    Name = "Remove Fog",
    Desc = "Remove fog from the game",
    Callback = function()
        game:GetService("Lighting").BaseAtmosphere:Destroy()
        Library:Notify({
            Name = "Auto Events",
            Content = "events",
            Duration = 3
        })
    end
})

QuestSectionRight:Status({""})

local KitsuneStatus = QuestSectionRight:Status({
    Name = "Check Kitsune island",
    Desc = "Kitsune Island didnt Spawn ❌"
})

spawn(function()
    pcall(function()
        while wait() do
            if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
                KitsuneStatus.Desc = "Kitsune Island Spawning ✅"
            else
                KitsuneStatus.Desc = "Kitsune Island didnt Spawn ❌"
            end
        end
    end)
end)

QuestSectionRight:Toggle({
    Name = "Esp Kitsune Island",
    Value = false,
    Callback = function(Value)
        KitsuneIslandEsp = Value
        while KitsuneIslandEsp do wait()
            UpdateIslandKisuneESP()   
        end
    end
})

spawn(function()
    while wait(2) do
        if KitsuneIslandEsp then
            UpdateIslandKisuneESP()  
        end
    end
end)

QuestSectionRight:Toggle({
    Name = "Tween Kitsune Island",
    Value = false,
    Callback = function(Value)
        _G.TweenToKitsune = Value
    end
})

spawn(function()
    local kitsuneIsland
    while not kitsuneIsland do
        kitsuneIsland = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")
        wait(1)
    end
    while wait() do
        if _G.TweenToKitsune then
            local shrineActive = kitsuneIsland:FindFirstChild("ShrineActive")
            if shrineActive then
                for _, v in pairs(shrineActive:GetDescendants()) do
                    if v:IsA("BasePart") and v.Name:find("NeonShrinePart") then
                        Tween(v.CFrame)
                    end
                end
            end
        end
    end
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.TweenToKitsune then
                topos(game.Workspace.Map.KitsuneIsland.ShrineActive.NeonShrinePart.CFrame * CFrame.new(0,0,10))
            end
        end
    end)
end)

QuestSectionRight:Toggle({
    Name = "Auto Azuer Ember",
    Value = false,
    Callback = function(Value)
        _G.AutoAzuerEmber = Value
    end
})

spawn(function()
    while wait() do
        if _G.AutoAzuerEmber then
            pcall(function()
                if game:GetService("Workspace"):FindFirstChild("AttachedAzureEmber") then
                    TP1(game.Workspace.EmberTemplate.Part.CFrame)
                end
            end)
        end
    end
end)

QuestSectionLeft:Status({""})

QuestSectionLeft:Status({
    Name = "Sea",
    Desc = "Sea related features"
})

QuestSectionLeft:Toggle({
    Name = "Auto Drive Boats",
    Value = false,
    Callback = function(Value)
        _G.SailBoat = Value
        _G.Nocliprock = Value
        StopTween(_G.SailBoat)
    end
})

spawn(function()
    while wait() do
        pcall(function()
            if _G.SailBoat then
                if not game:GetService("Workspace").Enemies:FindFirstChild("Shark") or not game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") or not game:GetService("Workspace").Enemies:FindFirstChild("Piranha") or not game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") then
                    if not game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then
                        buyb = TPP(CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781))
                        if (CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                            if buyb then buyb:Stop() end
                            local args = {
                                [1] = "BuyBoat",
                                [2] = "PirateBrigade"
                            }
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        end
                    elseif game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then
                        if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                            TPP(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0,1,0))
                        else
                            for i,v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                                if v.Name == "PirateBrigade" then
                                    repeat wait()
                                        if (CFrame.new(-17013.80078125, 10.962434768676758, 438.0169982910156).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                            TPB(CFrame.new(-37813.6953, -0.3221744, 6105.16895, -0.252362996, 4.13621581e-09, 0.967632651, 2.87320709e-08, 1, 3.21888249e-09, -0.967632651, 2.86144175e-08, -0.252362996))
                                        elseif (CFrame.new(-37813.6953, -0.3221744, 6105.16895, -0.252362996, 4.13621581e-09, 0.967632651, 2.87320709e-08, 1, 3.21888249e-09, -0.967632651, 2.86144175e-08, -0.252362996).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                            TPB(CFrame.new(-42250.2227, -0.3221744, 9247.07715, -0.45916447, 6.39043236e-08, 0.888351262, -3.36711423e-08, 1, -8.93395651e-08, -0.888351262, -7.09333605e-08, -0.45916447))
                                        elseif (CFrame.new(-42250.2227, -0.3221744, 9247.07715, -0.45916447, 6.39043236e-08, 0.888351262, -3.36711423e-08, 1, -8.93395651e-08, -0.888351262, -7.09333605e-08, -0.45916447).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                            TPB(CFrame.new(-37813.6953, -0.3221744, 6105.16895, -0.252362996, 4.13621581e-09, 0.967632651, 2.87320709e-08, 1, 3.21888249e-09, -0.967632651, 2.86144175e-08, -0.252362996))
                                        end 
                                    until game:GetService("Workspace").Enemies:FindFirstChild("Shark") or game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") or game:GetService("Workspace").Enemies:FindFirstChild("Piranha") or game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") or _G.SailBoat == false
                                end
                            end
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
            if _G.SailBoat then
                if game:GetService("Workspace").Enemies:FindFirstChild("Shark")
                or game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark")
                or game:GetService("Workspace").Enemies:FindFirstChild("Piranha")
                or game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") then
                    if game.Players.LocalPlayer and game.Players.LocalPlayer.Character
                    and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                        game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    end
                end
            end
        end)
    end
end)

QuestSectionLeft:Toggle({
    Name = "Auto Kill Terror Shank",
    Value = false,
    Callback = function(Value)
        _G.Autoterrorshark = Value
        getgenv().SafeMode = Value
        StopTween(_G.Autoterrorshark)
    end
})

spawn(function()
    while task.wait() do 
        if _G.Autoterrorshark and World3 then
            pcall(function()                    
                if game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark")
                or game:GetService("Workspace").Enemies:FindFirstChild("Piranha")
                or game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member")
                or game:GetService("Workspace").Enemies:FindFirstChild("Shark")
                or game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1")
                or game:GetService("Workspace").Enemies:FindFirstChild("PirateBrigade")
                or game:GetService("Workspace").Enemies:FindFirstChild("PirateBasic") then
                    for _,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Terrorshark" 
                        and v:FindFirstChild("Humanoid") 
                        and v:FindFirstChild("HumanoidRootPart") 
                        and v.Humanoid.Health > 0 then
                            repeat
                                task.wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Head.CanCollide = false 
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(5,40,10))
                                MonFarm = v.Name                
                                PosMon = v.HumanoidRootPart.CFrame
                                if game.Players.LocalPlayer and game.Players.LocalPlayer.Character
                                and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                end
                                if game:GetService("Workspace")["_WorldOrigin"]:FindFirstChild("Typhoon Splash") then
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 300, 0))
                                else
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 60, 0))
                                end
                            until not _G.Autoterrorshark or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                else 
                    topos(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0, -1, 0))		                       
                    for _,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do                                 
                        if v.Name == "Terrorshark" then
                            topos(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else   
                            game:GetService("Workspace").Boats.VehicleSeat.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do 
        if _G.dao then
            pcall(function()
                if not game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then 
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat","PirateBrigade")
                end
            end)
        end
    end
end)

QuestSectionLeft:Toggle({
    Name = "Auto Kill Shark",
    Value = false,
    Callback = function(Value)
        _G.KillShark = Value
        StopTween(_G.KillShark)
    end
})

spawn(function()
    while task.wait() do 
        if _G.KillShark and World3 and _G.SailBoat then
            pcall(function()                    
                if game:GetService("Workspace").Enemies:FindFirstChild("Shark")
                or game:GetService("Workspace").Enemies:FindFirstChild("Piranha")
                or game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member")
                or game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark")
                or game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1")
                or game:GetService("Workspace").Enemies:FindFirstChild("PirateBrigade")
                or game:GetService("Workspace").Enemies:FindFirstChild("PirateBasic") then
                    for _,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Shark" 
                        and v:FindFirstChild("Humanoid") 
                        and v:FindFirstChild("HumanoidRootPart") 
                        and v.Humanoid.Health > 0 then
                            repeat
                                task.wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Head.CanCollide = false 
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(5,40,10))
                                MonFarm = v.Name                
                                PosMon = v.HumanoidRootPart.CFrame
                                if game.Players.LocalPlayer and game.Players.LocalPlayer.Character
                                and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                end
                            until not _G.KillShark or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                else        
                    topos(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0, -1, 0))		                
                    for _,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
                        if not v.Name == "Shark" then
                            game:GetService("Workspace").Boats.VehicleSeat.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        elseif v.Name == "Shark" then
                            topos(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))                                   
                        end
                    end
                end
            end)
        end
    end
end)

QuestSectionLeft:Toggle({
    Name = "Auto Kill Piranha",
    Value = false,
    Callback = function(Value)
        _G.KillPiranha = Value
        StopTween(_G.KillPiranha)
    end
})

spawn(function()
    while task.wait() do 
        if _G.KillPiranha and World3 then
            pcall(function()                    
                if game:GetService("Workspace").Enemies:FindFirstChild("Piranha")
                or game:GetService("Workspace").Enemies:FindFirstChild("Shark")
                or game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member")
                or game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark")
                or game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1")
                or game:GetService("Workspace").Enemies:FindFirstChild("PirateBrigade")
                or game:GetService("Workspace").Enemies:FindFirstChild("PirateBasic") then
                    for _,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Piranha" 
                        and v:FindFirstChild("Humanoid")
                        and v:FindFirstChild("HumanoidRootPart")
                        and v.Humanoid.Health > 0 then
                            repeat
                                task.wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Head.CanCollide = false 
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(5,40,10))
                                MonFarm = v.Name                
                                PosMon = v.HumanoidRootPart.CFrame
                                if game.Players.LocalPlayer and game.Players.LocalPlayer.Character
                                and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                end
                            until not _G.KillPiranha or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                else
                    topos(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0, -1, 0))		                        
                    for _,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
                        if not v.Name == "Piranha" then
                            game:GetService("Workspace").Boats.VehicleSeat.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        elseif v.Name == "Piranha" then
                            topos(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))   
                        end
                    end
                end
            end)
        end
    end
end)

QuestSectionLeft:Toggle({
    Name = "Auto Kill Fish Crew Member",
    Value = false,
    Callback = function(Value)
        _G.KillFishCrew = Value
        StopTween(_G.KillFishCrew)
    end
})

spawn(function()
    while task.wait() do 
        if _G.KillFishCrew and World3 then
            pcall(function()                    
                if game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member")
                or game:GetService("Workspace").Enemies:FindFirstChild("Piranha")
                or game:GetService("Workspace").Enemies:FindFirstChild("Shark")
                or game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark")
                or game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1")
                or game:GetService("Workspace").Enemies:FindFirstChild("PirateBrigade")
                or game:GetService("Workspace").Enemies:FindFirstChild("PirateBasic") then
                    for _,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Fish Crew Member"
                        and v:FindFirstChild("Humanoid") 
                        and v:FindFirstChild("HumanoidRootPart") 
                        and v.Humanoid.Health > 0 then
                            repeat
                                task.wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Head.CanCollide = false 
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(5,40,10))
                                MonFarm = v.Name                
                                PosMon = v.HumanoidRootPart.CFrame
                                if game.Players.LocalPlayer and game.Players.LocalPlayer.Character
                                and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                end
                            until not _G.KillFishCrew or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                else
                    topos(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0, -1, 0))		
                    for _,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
                        if not v.Name == "Fish Crew Member" then
                            game:GetService("Workspace").Boats.VehicleSeat.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        end
                    end
                end
            end)
        end
    end
end)

QuestSectionRight:Status()

QuestSectionRight:Status({
    Name = "Mirage island",
    Desc = ""
})

local MirageStatus = QuestSectionRight:Status({
    Name = "Mirage Island didnt Spawn ❌",
    Desc = ""
})

spawn(function()
    pcall(function()
        while wait() do
            if game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
                MirageStatus:Set({Name = 'Mirage Island Spawning ✅', Desc = ""})
            else
                MirageStatus:Set({Name = 'Mirage Island didnt Spawn ❌', Desc = ""})
             end
        end
    end)
end)

QuestSectionRight:Toggle({
    Name = "Esp Mirage Island",
    Value = false,
    Callback = function(Value)
        _G.MirageIslandESP = Value
    end
})


spawn(function()
    while wait(2) do
        if _G.MirageIslandESP then
            UpdateIslandMirageESP() 
        end
    end
end)

QuestSectionRight:Toggle({
    Name = "Tween to mirage island",
    Value = false,
    Callback = function(Value)
        _G.AutoMysticIsland = Value
    end
})


spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if _G.AutoMysticIsland then
                for _, cac_329 in pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
                    if cac_329.Name == "Mirage Island" then
                        topos(cac_329.CFrame * CFrame.new(0, 333, 0))
                    end
                end
            end
        end)
    end
end)

QuestSectionLeft:Toggle({
    Name = "Look Moon + Auto V3",
    Value = false,
    Callback = function(Value)
        _G.AutoDooHee = Value
    end
})


spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoDooHee then
                local moonDir = game.Lighting:GetMoonDirection()
                local lookAtPos = game.Workspace.CurrentCamera.CFrame.p + moonDir * 100
                game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, lookAtPos)
                wait(2)
                VirtualInputManager:SendKeyEvent(true, "T", false, game)
                wait(0.1)
                VirtualInputManager:SendKeyEvent(false, "T", false, game)
            end
        end)
    end
end)

QuestSectionLeft:Toggle({
    Name = "Tween to Gear",
    Value = false,
    Callback = function(Value)
        _G.TweenMGear = Value
        StopTween(_G.TweenMGear)
    end
})


spawn(function()
    pcall(function()
        while wait() do
            if _G.TweenMGear then
                if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                    for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do 
                        if v:IsA("MeshPart")then 
                            if v.Material ==  Enum.Material.Neon then  
                                topos(v.CFrame)
                            end
                        end
                    end
                end
            end
        end
    end)
end)

QuestSectionLeft:Button({
    Name = "Tween to Advanced Fruit Dealer",
    Callback = function()
        TweenNpc()
    end
})


function TweenNpc()
    repeat
        wait()
    until game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
        local AllNPCS = {}
        for r, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
            table.insert(AllNPCS, v)
        end
        for r, v in pairs(AllNPCS) do
            if v.Name == "Advanced Fruit Dealer" then
                topos(v.HumanoidRootPart.CFrame)
            end
        end
    end
end




local PullLevelStatus = QuestSectionLeft:Status({
    Name = "Pull Level : ❌",
    Desc = ""
})

local FullMoonStatus = QuestSectionLeft:Status({
    Name = "Full Moon: 0",
    Desc = ""
})


spawn(function()
    while wait() do
        pcall(function()
            if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do 
                    if v:IsA("MeshPart")then 
                        if v.Material ==  Enum.Material.Neon then  
                            PullLevelStatus:SetTitle("Pull Level ✅")
                        else
                            PullLevelStatus:SetTitle("Pull Level: ❌")
                        end
                    end
                end
            else
                PullLevelStatus:SetTitle("Pull Level: ❌")
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            local moonTextureId = game:GetService("Lighting").Sky.MoonTextureId
            local moonPhase = "0"
            if moonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
                moonPhase = "1"
            elseif moonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
                moonPhase = "2"
            elseif moonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
                moonPhase = "3"
            elseif moonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
                moonPhase = "4"
            elseif moonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
                moonPhase = "5"
            end
            FullMoonStatus:SetTitle("Full Moon: " .. moonPhase)
        end)
    end
end)

QuestSectionLeft:Button({
    Name = "Teleport To Top GreatTree",
    Callback = function()
        topos(CFrame.new(3030.39453125, 2280.6171875, -7320.18359375))
    end
})

QuestSectionLeft:Button({
    Name = "Teleport Temple Of Time",
    Callback = function()
        topos(CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875))
    end
})

QuestSectionLeft:Button({
    Name = "Teleport Lever Pull",
    Callback = function()
        topos(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
    end
})

QuestSectionLeft:Button({
    Name = "Teleport To The Clock",
    Callback = function()
        topos(CFrame.new(29551.9765625, 15069.002929687, 45.199447631835938))
    end
})

QuestSectionLeft:Button({
    Name = "Auto Race Door",
    Callback = function()
        if game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
            topos(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
            topos(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
            topos(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
            topos(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
            topos(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
            topos(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))
        end
    end
})

QuestSectionLeft:Button({
    Name = "Buy Ancient One Quest",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeRace","Buy")
    end
})


QuestSectionLeft:Status({
    Name = "Race V4 Trials",
    Desc = ""
})

QuestSectionLeft:Toggle({
    Name = "Auto Trial Human Ghost",
    Value = false,
    Callback = function(Value)
        _G.Kill_Aura = Value
    end
})

spawn(function()
    while wait() do
        if _G.Kill_Aura then
            pcall(function()
                for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude < 1000 then
                            repeat wait(.1)
                                v.Humanoid.Health = 0
                                v.HumanoidRootPart.CanCollide = false
                                sethiddenproperty(game.Players.LocalPlayer, "Simulationradius", math.huge)
                            until not _G.Kill_Aura or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            end)
        end
    end
end)

QuestSectionLeft:Toggle({
    Name = "Auto Trial All Race",
    Value = false,
    Callback = function(Value)
        _G.AutoQuestRace = Value
        StopTween(_G.AutoQuestRace)
    end
})

spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoQuestRace then
                if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
                    for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            pcall(function()
                                repeat wait(.1)
                                    v.Humanoid.Health = 0
                                    v.HumanoidRootPart.CanCollide = false
                                    sethiddenproperty(game.Players.LocalPlayer, "Simulationradius", math.huge)
                                until not _G.AutoQuestRace or not v.Parent or v.Humanoid.Health <= 0
                            end)
                        end
                    end
                elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
                    for i,v in pairs(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants()) do
                        if v.Name ==  "snowisland_Cylinder.081" then
                            topos(v.CFrame* CFrame.new(0,0,0))
                        end
                    end
                elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
                    for i,v in pairs(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants()) do
                        if v.Name ==  "HumanoidRootPart" then
                            topos(v.CFrame* CFrame.new(0,450,0))
                            break
                        end
                    end
                elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
                    topos(CFrame.new(28654, 14898.7832, -30, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
                    for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            pcall(function()
                                repeat wait(.1)
                                    v.Humanoid.Health = 0
                                    v.HumanoidRootPart.CanCollide = false
                                    sethiddenproperty(game.Players.LocalPlayer, "Simulationradius", math.huge)
                                until not _G.AutoQuestRace or not v.Parent or v.Humanoid.Health <= 0
                            end)
                        end
                    end
                elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
                    for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if v.Name == "StartPoint" then
                            topos(v.CFrame* CFrame.new(0,10,0))
                      	end
                   	end
                end
            end
        end
    end)
end)

QuestSectionLeft:Toggle({
    Name = "Auto Kill Player V4",
    Value = false,
    Callback = function(Value)
        ProjectTrialPro = Value
    end
})

spawn(function()
    while wait() do
        if ProjectTrialPro then
            pcall(function()
                for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                    if v.Name ~= game:GetService("Players").LocalPlayer.Name then
                        if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                            if (v.Character.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 450 then
                                repeat wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3))
                                    v.Character.HumanoidRootPart.CanCollide = false
                                    v.Character.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    Click()
                                    ProjectXTrial = true
                                until not ProjectTrialPro or not v.Character:FindFirstChild("HumanoidRootPart") or v.Character.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end)
        end
    end
end)

QuestSectionLeft:Toggle({
    Name = "Skill Z",
    Value = false,
    Callback = function(Value)
        _G.XaiSkillZ = Value
    end
})

spawn(function()
    while wait() do
        if _G.XaiSkillZ and ProjectTrialPro then
            pcall(function()
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
            end)
        end
    end
end)

QuestSectionLeft:Toggle({
    Name = "Skill X",
    Value = false,
    Callback = function(Value)
        _G.XaiSkillX = Value
    end
})

spawn(function()
    while wait() do
        if _G.XaiSkillX and ProjectTrialPro then
            pcall(function()
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
            end)
        end
    end
end)

QuestSectionLeft:Toggle({
    Name = "Skill C",
    Value = false,
    Callback = function(Value)
        _G.XaiSkillC = Value
    end
})

spawn(function()
    while wait() do
        if _G.XaiSkillC and ProjectTrialPro then
            pcall(function()
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
            end)
        end
    end
end)

function GetRaidBoss()
    if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form") then
        return game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form")
    elseif game:GetService("Workspace").Enemies:FindFirstChild("Awakened Ice Admiral") then
        return game:GetService("Workspace").Enemies:FindFirstChild("Awakened Ice Admiral")
    elseif game:GetService("Workspace").Enemies:FindFirstChild("Tide Keeper") then
        return game:GetService("Workspace").Enemies:FindFirstChild("Tide Keeper")
    else
        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                return v
            end
        end
    end
end

function GetNextIsland()
    local NextIslandTable = {
        ["Flame"] = CFrame.new(-5411.22021, 313.843781, -5261.97803, 0.49999994, 0, 0.866025448, 0, 1, 0, -0.866025448, 0, 0.49999994),
        ["Ice"] = CFrame.new(-5411.22021, 313.843781, -5261.97803, 0.49999994, 0, 0.866025448, 0, 1, 0, -0.866025448, 0, 0.49999994),
        ["Quake"] = CFrame.new(-5411.22021, 313.843781, -5261.97803, 0.49999994, 0, 0.866025448, 0, 1, 0, -0.866025448, 0, 0.49999994),
        ["Light"] = CFrame.new(-5411.22021, 313.843781, -5261.97803, 0.49999994, 0, 0.866025448, 0, 1, 0, -0.866025448, 0, 0.49999994),
        ["Dark"] = CFrame.new(-5411.22021, 313.843781, -5261.97803, 0.49999994, 0, 0.866025448, 0, 1, 0, -0.866025448, 0, 0.49999994),
        ["String"] = CFrame.new(-5411.22021, 313.843781, -5261.97803, 0.49999994, 0, 0.866025448, 0, 1, 0, -0.866025448, 0, 0.49999994),
        ["Rumble"] = CFrame.new(-5411.22021, 313.843781, -5261.97803, 0.49999994, 0, 0.866025448, 0, 1, 0, -0.866025448, 0, 0.49999994),
        ["Magma"] = CFrame.new(-5411.22021, 313.843781, -5261.97803, 0.49999994, 0, 0.866025448, 0, 1, 0, -0.866025448, 0, 0.49999994),
        ["Human: Buddha"] = CFrame.new(-5411.22021, 313.843781, -5261.97803, 0.49999994, 0, 0.866025448, 0, 1, 0, -0.866025448, 0, 0.49999994),
        ["Sand"] = CFrame.new(-5411.22021, 313.843781, -5261.97803, 0.49999994, 0, 0.866025448, 0, 1, 0, -0.866025448, 0, 0.49999994),
        ["Bird: Phoenix"] = CFrame.new(-5411.22021, 313.843781, -5261.97803, 0.49999994, 0, 0.866025448, 0, 1, 0, -0.866025448, 0, 0.49999994),
        ["Rubber"] = CFrame.new(-5411.22021, 313.843781, -5261.97803, 0.49999994, 0, 0.866025448, 0, 1, 0, -0.866025448, 0, 0.49999994),
        ["Barrier"] = CFrame.new(-5411.22021, 313.843781, -5261.97803, 0.49999994, 0, 0.866025448, 0, 1, 0, -0.866025448, 0, 0.49999994),
        ["Gravity"] = CFrame.new(-5411.22021, 313.843781, -5261.97803, 0.49999994, 0, 0.866025448, 0, 1, 0, -0.866025448, 0, 0.49999994),
        ["Dough"] = CFrame.new(-5411.22021, 313.843781, -5261.97803, 0.49999994, 0, 0.866025448, 0, 1, 0, -0.866025448, 0, 0.49999994),
        ["Shadow"] = CFrame.new(-5411.22021, 313.843781, -5261.97803, 0.49999994, 0, 0.866025448, 0, 1, 0, -0.866025448, 0, 0.49999994),
        ["Venom"] = CFrame.new(-5411.22021, 313.843781, -5261.97803, 0.49999994, 0, 0.866025448, 0, 1, 0, -0.866025448, 0, 0.49999994),
        ["Control"] = CFrame.new(-5411.22021, 313.843781, -5261.97803, 0.49999994, 0, 0.866025448, 0, 1, 0, -0.866025448, 0, 0.49999994),
        ["Soul"] = CFrame.new(-5411.22021, 313.843781, -5261.97803, 0.49999994, 0, 0.866025448, 0, 1, 0, -0.866025448, 0, 0.49999994),
        ["Dragon"] = CFrame.new(-5411.22021, 313.843781, -5261.97803, 0.49999994, 0, 0.866025448, 0, 1, 0, -0.866025448, 0, 0.49999994)
    }
    return NextIslandTable[_G.SelectChip] or CFrame.new(-5411.22021, 313.843781, -5261.97803, 0.49999994, 0, 0.866025448, 0, 1, 0, -0.866025448, 0, 0.49999994)
end

PlayerSectionLeft3:Status({
    Name = "Auto Raid Fruit",
    Desc = "Auto raid lol"
})

PlayerSectionLeft3:Dropdown({
    Name = "Select Chip Raid:",
    Items = {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Rubber", "Barrier", "Gravity", "Dough", "Shadow", "Venom", "Control", "Soul", "Dragon"},
    Default = "nil",
    Callback = function(Value)
        _G.SelectChip = Value
    end
})

PlayerSectionLeft3:Toggle({
    Name = "Auto Buy Chip",
    Value = false,
    Callback = function(Value)
        _G.AutoBuyChip = Value
    end
})

PlayerSectionLeft3:Toggle({
    Name = "Auto Start Raid",
    Value = false,
    Callback = function(Value)
        _G.AutoStartRaid = Value
    end
})

PlayerSectionLeft3:Toggle({
    Name = "Auto Farm Raid Next Island",
    Value = false,
    Callback = function(Value)
        _G.AutoFarmRaidNextIsland = Value
    end
})


PlayerSectionLeft3:Status({
    Name = "Awakener Fruit",
    Desc = "Fruit awakening"
})

PlayerSectionLeft3:Toggle({
    Name = "Auto Get Fruit Low Beli",
    Value = false,
    Callback = function(Value)
        _G.AutoGetFruitLowBeli = Value
    end
})

PlayerSectionLeft3:Toggle({
    Name = "Awakener Fruit",
    Value = false,
    Callback = function(Value)
        AutoAwakenAbilities = Value
    end
})


spawn(function()
    while task.wait() do
        if AutoAwakenAbilities then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
            end)
        end
    end
end)

MiscSectionRights:Status({
    Name = "Random Fruit",
    Desc = "Get random fruit"
})

local FindFruit = MiscSectionRights:Status({
    Name = "Check Fruit",
    Desc = "No fruits found try it still tho might bug"
})

spawn(function()
    pcall(function()
        while wait() do
            for i, v in pairs(game.Workspace:GetChildren()) do
                if string.find(v.Name, "Fruit") then
                    FindFruit:SetDesc("🍏 Finding " .. v.Name)
                else
                    FindFruit:SetDesc("🍏 no fruits")
                end
            end
        end
    end)
end)

MiscSectionRights:Toggle({
    Name = "Auto Random Fruits",
    Value = false,
    Callback = function(Value)
        _G.RandomAuto = Value
    end
})

spawn(function()
    pcall(function()
        while wait() do
            if _G.RandomAuto then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
            end 
        end
    end)
end)

MiscSectionRights:Button({
    Name = "Random Fruits",
    Desc = "Buy a random fruit",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
    end
})

MiscSectionRights:Toggle({
    Name = "Auto Stores Fruits",
    Value = false,
    Callback = function(Value)
        _G.AutoStoreFruit = Value
    end
})

function CheckFruits()
    ResultStoreFruits = {}
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")) do
        for i1,v1 in pairs(v) do
            if i1 == "Name" then 
                table.insert(ResultStoreFruits,v1)
            end
        end
    end
end

spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoStoreFruit then
                for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                    if string.find(v.Name, "Fruit") then
                        ResultStoreFruits = {}
                        CheckFruits()
                        for z, Res in pairs(ResultStoreFruits) do
                        if v.Name == Res then
                            local NameFruit = v.Name
                            local FirstNameFruit = string.gsub(v.Name, " Fruit", "")
                            if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(NameFruit) then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",FirstNameFruit.."-"..FirstNameFruit,game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(NameFruit))
                            end
                        end
                        end
                    end
                end
            end
        end)
    end
end)

MiscSectionRights:Toggle({
    Name = "Auto Tween Fruits",
    Value = false,
    Callback = function(Value)
        _G.TweenFruit = Value
    end
})

spawn(function()
    while wait(.1) do
        if _G.TweenFruit then
            for i,v in pairs(game.Workspace:GetChildren()) do
                if string.find(v.Name, "Fruit") then
                    topos(v.Handle.CFrame)
                end
            end
        end
    end
end)

MiscSectionRights:Toggle({
    Name = "Auto Grab Fruit",
    Value = false,
    Callback = function(Value)
        _G.Grabfruit = Value
    end
})

spawn(function()
    while wait(.1) do
        if _G.Grabfruit then
            for i,v in pairs(game.Workspace:GetChildren()) do
                if string.find(v.Name, "Fruit") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
                end
            end
        end
   end
end)

MiscSectionRights:Button({
    Name = "Auto Grab All Fruits",
    Desc = "Grab all fruits in the workspace",
    Callback = function()
        for i,v in pairs(game.Workspace:GetChildren()) do
            if v:IsA("Tool") then
                v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end
})

MiscSectionRights:Toggle({
    Name = "Jerk Off Animation",
    Desc = "Loop a Jerk Off animation while toggled",
    Value = false,
    Callback = function(Value)
        _G.JerkOffAnimation = Value
        local animationId = 'rbxassetid://698251653'
        local player = game.Players.LocalPlayer

        if _G.JerkOffAnimation then
            local function playLoop()
                if _G.JerkOffAnimConn then
                    _G.JerkOffAnimConn:Disconnect()
                    _G.JerkOffAnimConn = nil
                end
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoid = character:FindFirstChildOfClass('Humanoid')
                if humanoid then
                    local anim = Instance.new('Animation')
                    anim.AnimationId = animationId
                    local track = humanoid:LoadAnimation(anim)
                    _G.JerkOffTrack = track
                    track.Looped = false
                    track:Play()
                    track.TimePosition = 0.58
                    track:AdjustSpeed(0.4)
                    _G.JerkOffAnimConn = game:GetService("RunService").RenderStepped:Connect(function()
                        if not _G.JerkOffAnimation or not track.IsPlaying then return end
                        if track.TimePosition >= 0.63 then
                            track.TimePosition = 0.58
                        end
                    end)
                end
            end

            playLoop()
            if _G.JerkOffCharConn then _G.JerkOffCharConn:Disconnect() end
            _G.JerkOffCharConn = player.CharacterAdded:Connect(function()
                task.wait(0.5)
                if _G.JerkOffAnimation then
                    playLoop()
                end
            end)
        else
            if _G.JerkOffAnimConn then
                _G.JerkOffAnimConn:Disconnect()
                _G.JerkOffAnimConn = nil
            end
            if _G.JerkOffCharConn then
                _G.JerkOffCharConn:Disconnect()
                _G.JerkOffCharConn = nil
            end
            if _G.JerkOffTrack then
                _G.JerkOffTrack:Stop()
                _G.JerkOffTrack = nil
            end
        end
    end
})

MiscSectionRights:Button({
    Name = "Rain Fruit",
    Desc = "Spawns a rain of fruits at your position",
    Callback = function()
        for i, v in pairs(game:GetObjects("rbxassetid://14759368201")[1]:GetChildren()) do
            v.Parent = game.Workspace.Map
            v:MoveTo(game.Players.LocalPlayer.Character.PrimaryPart.Position + Vector3.new(math.random(-50, 50), 100, math.random(-50, 50)))
            if v.Fruit:FindFirstChild("AnimationController") then
                v.Fruit:FindFirstChild("AnimationController"):LoadAnimation(v.Fruit:FindFirstChild("Idle")):Play()
            end
            v.Handle.Touched:Connect(function(otherPart)
                if otherPart.Parent == game.Players.LocalPlayer.Character then
                    v.Parent = game.Players.LocalPlayer.Backpack
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                end
            end)
        end
    end
})


spawn(function()
    while wait() do
        if _G.AutoBuyChip then
            pcall(function()
                local args = {
                    [1]="RaidsNpc",
                    [2]="Select",
                    [3]=_G.SelectChip
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end)
        end
    end
end)


spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoStartRaid then
                if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible==false then
                    if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and
                        (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or
                         game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip")) then
                        if World2 then
                            topos(CFrame.new(-6438.73535, 250.645355,-4501.50684))
                            local args = {
                                [1]="SetSpawnPoint"
                            }
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                        elseif World3 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5075.50927734375, 314.5155029296875,-3150.0224609375))
                            topos(CFrame.new(-5017.40869, 314.844055,-2823.0127,-0.925743818, 4.48217499e-08,-0.378151238, 4.55503146e-09, 1, 1.07377559e-07, 0.378151238, 9.7681621e-08,-0.925743818))
                            local args = {
                                [1]="SetSpawnPoint"
                            }
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                        end
                    end
                end
            end
        end)
    end
end)

function IsIslandRaid(cu)
    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island " .. cu) then
        min = 4500
        for r, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            if
                v.Name == "Island " .. cu and
                    (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < min
            then
                min = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            end
        end
        for r, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            if
                v.Name == "Island " .. cu and
                    (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= min
            then
                return v
            end
        end
    end
end

function getNextIsland()
    TableIslandsRaid = {5, 4, 3, 2, 1}
    for r, v in pairs(TableIslandsRaid) do
        if IsIslandRaid(v) and (IsIslandRaid(v).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4500 then
            return IsIslandRaid(v)
        end
    end
end

function attackNearbyEnemies()
    local enemies = {}
    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            local distance = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if distance <= 1000 then
                table.insert(enemies, v)
            end
        end
    end

    for _, enemy in pairs(enemies) do
        repeat
            if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                EquipWeapon(_G.SelectWeapon)
                topos(enemy.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                wait(0.1)
            end
        until not enemy:FindFirstChild("Humanoid") or enemy.Humanoid.Health <= 0
    end
end

spawn(function()
    while wait() do
        if _G.AutoFarmRaidNextIsland then
            attackNearbyEnemies()
            if getNextIsland() then
                spawn(topos(getNextIsland().CFrame * CFrame.new(0, 60, 0)), 1)
            end
        end
    end
end)

spawn(function()
    while wait(.1) do
        pcall(function()
            if _G.AutoGetFruitLowBeli then
                local args = {
                    [1] = "LoadFruit",
                    [2] = "Rocket-Rocket"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                local args = {
                    [1] = "LoadFruit",
                    [2] = "Spin-Spin"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                local args = {
                    [1] = "LoadFruit",
                    [2] = "Chop-Chop"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                local args = {
                    [1] = "LoadFruit",
                    [2] = "Spring-Spring"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                local args = {
                    [1] = "LoadFruit",
                    [2] = "Bomb-Bomb"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                local args = {
                    [1] = "LoadFruit",
                    [2] = "Smoke-Smoke"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                local args = {
                    [1] = "LoadFruit",
                    [2] = "Spike-Spike"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                local args = {
                    [1] = "LoadFruit",
                    [2] = "Flame-Flame"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                local args = {
                    [1] = "LoadFruit",
                    [2] = "Falcon-Falcon"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                local args = {
                    [1] = "LoadFruit",
                    [2] = "Ice-Ice"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                local args = {
                    [1] = "LoadFruit",
                    [2] = "Sand-Sand"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                local args = {
                    [1] = "LoadFruit",
                    [2] = "Dark-Dark"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                local args = {
                    [1] = "LoadFruit",
                    [2] = "Ghost-Ghost"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                local args = {
                    [1] = "LoadFruit",
                    [2] = "Diamond-Diamond"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                local args = {
                    [1] = "LoadFruit",
                    [2] = "Light-Light"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                local args = {
                    [1] = "LoadFruit",
                    [2] = "Rubber-Rubber"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                local args = {
                    [1] = "LoadFruit",
                    [2] = "Creation-Creation"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end)
    end
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoRandomFruit then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
            end 
        end
    end)
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoStoreFruit then
                for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                    if string.find(v.Name, "Fruit") then
                        local NameFruit = v.Name
                        local FirstNameFruit = string.gsub(v.Name, " Fruit", "")
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(NameFruit) then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",FirstNameFruit.."-"..FirstNameFruit,game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(NameFruit))
                        end
                    end
                end
            end
        end)
    end
end)



function IsPrehistoricIslandActive()
    for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        if v.Name == "PrehistoricIsland" or v.Name == "Prehistoric Island" then
            return true
        end
    end
    return false
end

function IsMirageIslandActive()
    for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        if v.Name == "Mirage Island" then
            return true
        end
    end
    return false
end

function IsKitsuneIslandActive()
    for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        if v.Name == "Kitsune Island" then
            return true
        end
    end
    return false
end


function UpdateBerriesESPColored()
    local CollectionService = game:GetService("CollectionService")
    local BerryBushes = CollectionService:GetTagged("BerryBush")
    for _, Bush in pairs(BerryBushes) do
        pcall(function()
            for AttributeName, Berry in pairs(Bush:GetAttributes()) do
                if Berry then
                    local berryESP = Bush.Parent:FindFirstChild("BerryESP")
                    if not berryESP then
                        local bill = Instance.new("BillboardGui")
                        bill.Name = "BerryESP"
                        bill.ExtentsOffset = Vector3.new(0, 2.1, 0)
                        bill.Size = UDim2.new(0, 110, 0, 27)
                        bill.Adornee = Bush.Parent
                        bill.AlwaysOnTop = true
                        bill.MaxDistance = 880
                        bill.LightInfluence = 0
                        bill.Parent = Bush.Parent

                        local name = Instance.new("TextLabel")
                        name.Name = "TextLabel"
                        name.Font = Enum.Font.FredokaOne
                        name.TextSize = 13
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = Enum.TextYAlignment.Center
                        name.BackgroundTransparency = 0.23
                        name.BackgroundColor3 = Color3.fromRGB(23, 23, 3)
                        name.BorderSizePixel = 0
                        name.TextStrokeTransparency = 0.12
                        name.TextStrokeColor3 = Color3.fromRGB(218, 255, 86)
                        name.Parent = bill

                        local berryColors = {
                            ["Blue"] = Color3.fromRGB(70, 133, 255),
                            ["Yellow"] = Color3.fromRGB(255, 253, 98),
                            ["Red"] = Color3.fromRGB(255, 97, 101),
                            ["Green"] = Color3.fromRGB(74, 230, 119),
                            ["Pink"] = Color3.fromRGB(255, 138, 243),
                        }
                        local colorFound = nil
                        for k, c in pairs(berryColors) do
                            if string.find(string.lower(Berry), string.lower(k)) then
                                colorFound = c
                                break
                            end
                        end
                        name.TextColor3 = colorFound or Color3.fromRGB(226, 255, 97)
                        name.Text = Berry
                        berryESP = bill
                    end

                    local Player = game:GetService("Players").LocalPlayer
                    if Player and Player.Character and Player.Character:FindFirstChild("Head") then
                        local Position = Player.Character.Head.Position
                        local Magnitude = 0
                        local ok, pv = pcall(function()
                            return Bush.Parent:GetPivot().Position
                        end)
                        if ok and pv then
                            Magnitude = (pv - Position).Magnitude
                        else
                            -- fallback: try using Bush.Parent.Position if exists
                            if Bush.Parent:IsA("BasePart") then
                                Magnitude = (Bush.Parent.Position - Position).Magnitude
                            end
                        end

                        local colorCode = "unknown"
                        local berryColorsList = {
                            ["Blue"] = "Blue",
                            ["Yellow"] = "Yellow",
                            ["Red"] = "Red",
                            ["Green"] = "Green",
                            ["Pink"] = "Pink",
                        }
                        for key, code in pairs(berryColorsList) do
                            if string.find(string.lower(Berry), string.lower(key)) then
                                colorCode = key
                                break
                            end
                        end
                        rconsoleinfo("[RivoHub BerryESP] Found Berry: " .. tostring(Berry) .. " [Color: " .. colorCode .. "]")
                        if Bush.Parent:FindFirstChild("BerryESP") and Bush.Parent.BerryESP:FindFirstChild("TextLabel") then
                            Bush.Parent.BerryESP.TextLabel.Text = string.format("🍇 %s\n%.0fm", Berry, math.floor(Magnitude / 3))
                        end
                    end
                else
                    if Bush.Parent:FindFirstChild("BerryESP") then
                        Bush.Parent:FindFirstChild("BerryESP"):Destroy()
                    end
                end
            end
        end)
    end
end




local SettingsPage = MainWindow:CreateSettingsPage()
SettingsPage:CreateConfigsSection()
SettingsPage:CreateThemingSection()

getgenv().Library = Library
Library:CheckForAutoLoad()


