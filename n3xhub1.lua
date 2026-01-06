--[[
  © 2026 Sentinel
  MIT License
  Use at your own risk
  The author is not responsible for bans or damages
]]

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local _vhpjj6ecd = function()
    --[[
  © 2026 Sentinel
  MIT License
  Use at your own risk
  The author is not responsible for bans or damages
]]

local Players = game:GetService((function()
        local a={1077,1441,1298,1610,1350,1519,1532};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
local StarterGui = game:GetService((function()
        local a={1116,1545,1298,1519,1545,1350,1519,960,1558,1402};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
local RunService = game:GetService((function()
        local a={1103,1558,1467,1116,1350,1519,1571,1402,1324,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
local UserInputService = game:GetService((function()
        local a={1142,1532,1350,1519,986,1467,1493,1558,1545,1116,1350,1519,1571,1402,1324,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Rayfield GUI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = (function()
        local a={1051,700,1181,453,973,1558,1311,453,1155,687};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
   LoadingTitle = (function()
        local a={1025,1480,1298,1337,1402,1467,1376,635,635,635};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
   LoadingSubtitle = (function()
        local a={1311,1610,453,713,713,713,1272,1480,1363,1363};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
   ShowText = (function()
        local a={1077,1441,1350,1298,1532,1350,453,1584,1298,1402,1545,635,635};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), -- for mobile users to unhide rayfield, change if you'd like
   Theme = (function()
        local a={1116,1350,1519,1350,1467,1402,1545,1610};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), -- Check https://docs.sirius.menu/rayfield/configuration/themes

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = (function()
        local a={726,960,700,1194,1493,1519,1610,1194,1337,765};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },        
})

-- Movement & Fly
local Flying = false
local FlySpeed = 50
local NoclipEnabled = false
local ClickTPEnabled = false
local BodyGyro, BodyVelocity

-- Aimbot & FOV
local AimbotEnabled = false
local AimPart = (function()
        local a={973,1350,1298,1337};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()
local UseRandomPart = false
local Smoothness = 0.1
local TeamCheck = false
local FOVVisible = true
local FOVColor = Color3.fromRGB(255, 255, 255)
local FOVRadius = 100

-- ESP
local ESPEnabled = false

local FOVCircle = Drawing.new((function()
        local a={908,1402,1519,1324,1441,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
FOVCircle.Thickness = 2
FOVCircle.NumSides = 60
FOVCircle.Filled = false
FOVCircle.Transparency = 1

-- Find closest player to mouse within FOV
local function GetClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = FOVRadius
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild((function()
        local a={973,1558,1454,1298,1467,1480,1402,1337,1103,1480,1480,1545,1077,1298,1519,1545};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()) and player.Character.Humanoid.Health > 0 then
            if TeamCheck and player.Team == LocalPlayer.Team then continue end
            local partName = UseRandomPart and ((math.random(1,2)==1) and (function()
        local a={973,1350,1298,1337};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)() or (function()
        local a={973,1558,1454,1298,1467,1480,1402,1337,1103,1480,1480,1545,1077,1298,1519,1545};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()) or AimPart
            if player.Character:FindFirstChild(partName) then
                local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(player.Character[partName].Position)
                if onScreen then
                    local distance = (Vector2.new(pos.X, pos.Y) - UserInputService:GetMouseLocation()).Magnitude
                    if distance < shortestDistance then
                        closestPlayer = player
                        shortestDistance = distance
                    end
                end
            end
        end
    end
    return closestPlayer
end

-- Fly toggle function
local function ToggleFly()
    if Flying then
        local root = LocalPlayer.Character:WaitForChild((function()
        local a={973,1558,1454,1298,1467,1480,1402,1337,1103,1480,1480,1545,1077,1298,1519,1545};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
        BodyGyro = Instance.new((function()
        local a={895,1480,1337,1610,960,1610,1519,1480};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), root)
        BodyVelocity = Instance.new((function()
        local a={895,1480,1337,1610,1155,1350,1441,1480,1324,1402,1545,1610};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), root)
        BodyGyro.P = 9e4
        BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        BodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)
        task.spawn(function()
            while Flying do
                local moveDir = Vector3.new(0,0,0)
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir += workspace.CurrentCamera.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir -= workspace.CurrentCamera.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir -= workspace.CurrentCamera.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir += workspace.CurrentCamera.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir += Vector3.new(0,1,0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir -= Vector3.new(0,1,0) end
                BodyVelocity.Velocity = moveDir * FlySpeed
                BodyGyro.CFrame = workspace.CurrentCamera.CFrame
                task.wait()
            end
        end)
    else
        if BodyGyro then BodyGyro:Destroy() end
        if BodyVelocity then BodyVelocity:Destroy() end
    end
end

-- GUI Tabs
local PlayerTab = Window:CreateTab((function()
        local a={1077,1441,1298,1610,1350,1519};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), nil)
local CombatTab = Window:CreateTab((function()
        local a={908,1480,1454,1311,1298,1545};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), nil)
local VisualsTab = Window:CreateTab((function()
        local a={1155,1402,1532,1558,1298,1441,1532};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), nil)

-- Player tab controls
PlayerTab:CreateSection((function()
        local a={1038,1480,1571,1350,1454,1350,1467,1545,453,1116,1350,1545,1545,1402,1467,1376,1532};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
PlayerTab:CreateSlider({
    Name = (function()
        local a={1168,1298,1441,1428,1116,1493,1350,1350,1337};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Range = {16, 500},
    Increment = 1,
    CurrentValue = 16,
    Flag = (function()
        local a={1168,1298,1441,1428,1116,1493,1350,1350,1337};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Callback = function(value)
        if LocalPlayer.Character:FindFirstChild((function()
        local a={973,1558,1454,1298,1467,1480,1402,1337};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()) then
            LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    end,
})
PlayerTab:CreateSlider({
    Name = (function()
        local a={999,1558,1454,1493,1077,1480,1584,1350,1519};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Range = {50, 500},
    Increment = 1,
    CurrentValue = 50,
    Flag = (function()
        local a={999,1558,1454,1493,1077,1480,1584,1350,1519};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Callback = function(value)
        if LocalPlayer.Character:FindFirstChild((function()
        local a={973,1558,1454,1298,1467,1480,1402,1337};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()) then
            LocalPlayer.Character.Humanoid.UseJumpPower = true
            LocalPlayer.Character.Humanoid.JumpPower = value
        end
    end,
})
PlayerTab:CreateToggle({
    Name = (function()
        local a={947,1441,1610};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    CurrentValue = false,
    Flag = (function()
        local a={947,1441,1610};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Callback = function(value)
        Flying = value
        ToggleFly()
    end,
})
PlayerTab:CreateSlider({
    Name = (function()
        local a={947,1441,1610,1116,1493,1350,1350,1337};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Range = {10, 500},
    Increment = 5,
    CurrentValue = 50,
    Flag = (function()
        local a={947,1441,1610,1116,1493,1350,1350,1337};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Callback = function(value) FlySpeed = value end,
})
PlayerTab:CreateToggle({
    Name = (function()
        local a={908,1441,1402,1324,1428,453,1129,1350,1441,1350,1493,1480,1519,1545};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    CurrentValue = false,
    Flag = (function()
        local a={908,1441,1402,1324,1428,1129,1077};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Callback = function(value) ClickTPEnabled = value end,
})
PlayerTab:CreateToggle({
    Name = (function()
        local a={1051,1480,1324,1441,1402,1493};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    CurrentValue = false,
    Flag = (function()
        local a={1051,1480,1324,1441,1402,1493};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Callback = function(value) NoclipEnabled = value end,
})

-- Combat tab controls
CombatTab:CreateToggle({
    Name = (function()
        local a={882,1402,1454,1311,1480,1545};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    CurrentValue = false,
    Flag = (function()
        local a={882,1402,1454,1311,1480,1545};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Callback = function(value) AimbotEnabled = value end,
})
CombatTab:CreateDropdown({
    Name = (function()
        local a={882,1402,1454,453,1077,1298,1519,1545};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Options = {(function()
        local a={973,1350,1298,1337};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), (function()
        local a={973,1558,1454,1298,1467,1480,1402,1337,1103,1480,1480,1545,1077,1298,1519,1545};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), (function()
        local a={1129,1480,1519,1532,1480};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()},
    CurrentOption = (function()
        local a={973,1350,1298,1337};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Flag = (function()
        local a={882,1402,1454,1077,1298,1519,1545};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Callback = function(option)
        if option == (function()
        local a={1129,1480,1519,1532,1480};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)() then
            UseRandomPart = true
        else
            UseRandomPart = false
            AimPart = option
        end
    end,
})
CombatTab:CreateSlider({
    Name = (function()
        local a={882,1402,1454,1311,1480,1545,453,1116,1454,1480,1480,1545,1389,1467,1350,1532,1532};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Range = {0.05, 1},
    Increment = 0.05,
    CurrentValue = 0.1,
    Flag = (function()
        local a={1116,1454,1480,1480,1545,1389,1467,1350,1532,1532};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Callback = function(value) Smoothness = value end,
})
CombatTab:CreateToggle({
    Name = (function()
        local a={1129,1350,1298,1454,453,908,1389,1350,1324,1428};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    CurrentValue = false,
    Flag = (function()
        local a={1129,1350,1298,1454,908,1389,1350,1324,1428};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Callback = function(value) TeamCheck = value end,
})
CombatTab:CreateToggle({
    Name = (function()
        local a={1116,1389,1480,1584,453,947,1064,1155};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    CurrentValue = true,
    Flag = (function()
        local a={947,1064,1155,1155,1402,1532,1402,1311,1441,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Callback = function(value) FOVVisible = value end,
})
CombatTab:CreateSlider({
    Name = (function()
        local a={947,1064,1155,453,1103,1298,1337,1402,1558,1532};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Range = {30, 800},
    Increment = 10,
    CurrentValue = 100,
    Flag = (function()
        local a={947,1064,1155,1103,1298,1337,1402,1558,1532};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Callback = function(value) FOVRadius = value end,
})
CombatTab:CreateColorPicker({
    Name = (function()
        local a={947,1064,1155,453,908,1480,1441,1480,1519};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Color = Color3.fromRGB(255,255,255),
    Flag = (function()
        local a={947,1064,1155,908,1480,1441,1480,1519};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Callback = function(value) FOVColor = value end,
})

-- Visuals tab controls
VisualsTab:CreateToggle({
    Name = (function()
        local a={934,1116,1077};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    CurrentValue = false,
    Flag = (function()
        local a={934,1116,1077};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Callback = function(value)
        ESPEnabled = value
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                if ESPEnabled then
                    local box = Instance.new((function()
        local a={895,1480,1597,973,1298,1467,1337,1441,1350,882,1337,1480,1519,1467,1454,1350,1467,1545};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), player.Character)
                    box.Name = (function()
        local a={1103,1480,1441,1480,934,1116,1077};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()
                    box.FillColor = Color3.fromRGB(255, 0, 0)
                    box.Adornee = player.Character:FindFirstChild((function()
        local a={973,1558,1454,1298,1467,1480,1402,1337,1103,1480,1480,1545,1077,1298,1519,1545};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
                    box.AlwaysOnTop = true
                    box.Size = Vector3.new(2, 5, 1)
                    box.ZIndex = 1
                elseif player.Character:FindFirstChild((function()
        local a={1103,1480,1441,1480,934,1116,1077};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()) then
                    player.Character.RoloESP:Destroy()
                end
            end
        end
    end,
})

-- Click TP
UserInputService.InputBegan:Connect(function(input, processed)
    if not processed and ClickTPEnabled and input.UserInputType == Enum.UserInputType.MouseButton1 and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
        if Mouse.Target and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild((function()
        local a={973,1558,1454,1298,1467,1480,1402,1337,1103,1480,1480,1545,1077,1298,1519,1545};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()) then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Mouse.Hit.p + Vector3.new(0,3,0))
        end
    end
end)

-- Main loop
RunService.RenderStepped:Connect(function()
    FOVCircle.Visible = FOVVisible
    FOVCircle.Radius = FOVRadius
    FOVCircle.Color = FOVColor
    FOVCircle.Position = UserInputService:GetMouseLocation()

    if AimbotEnabled then
        local target = GetClosestPlayer()
        if target and target.Character then
            local part = UseRandomPart and (target.Character:FindFirstChild((function()
        local a={973,1350,1298,1337};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()) or target.Character:FindFirstChild((function()
        local a={973,1558,1454,1298,1467,1480,1402,1337,1103,1480,1480,1545,1077,1298,1519,1545};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())) or target.Character:FindFirstChild(AimPart)
            if part then
                workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(
                    CFrame.new(workspace.CurrentCamera.CFrame.Position, part.Position),
                    Smoothness
                )
            end
        end
    end
end)

RunService.Stepped:Connect(function()
    if NoclipEnabled and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA((function()
        local a={895,1298,1532,1350,1077,1298,1519,1545};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()) then part.CanCollide = false end
        end
    end
end)

Rayfield:Notify({
    Title = (function()
        local a={1051,700,1181,453,973,1558,1311};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Content = (function()
        local a={1051,700,1181,453,973,1558,1311,453,1532,1324,1519,1402,1493,1545,453,1441,1480,1298,1337,1350,1337,453,1532,1558,1324,1324,1350,1532,1532,1363,1558,1441,1441,1610,466};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    Duration = 3
})
end;
_vhpjj6ecd();