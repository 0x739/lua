local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Script anti afk
Players.LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end) 
print("Anti-AFK script activated")

-- Script for setting Transparency to 1
local function setTransparency()
    for _, v in next, workspace:GetDescendants() do
        pcall(function()
            v.Transparency = 1
        end)
    end
    for _, v in next, getnilinstances() do
        pcall(function()
            v.Transparency = 1
            for _, v1 in next, v:GetDescendants() do
                v1.Transparency = 1
            end
        end)
    end
    workspace.DescendantAdded:Connect(function(v)
        pcall(function()
            v.Transparency = 1
        end)
    end)
end

-- Initial Transparency setting
setTransparency()

-- Variable to track if teleportation is enabled
local teleportEnabled = true

-- Function to find the CoinContainer
local function findCoinContainer()
    for _, child in pairs(workspace:GetChildren()) do
        local coinContainer = child:FindFirstChild("CoinContainer")
        if coinContainer then
            return coinContainer
        end
    end
    return nil
end

-- Function to count the number of CoinContainers
local function countCoinContainers()
    local count = 0
    for _, child in pairs(workspace:GetChildren()) do
        if child:IsA("Model") and child:FindFirstChild("CoinContainer") then
            count = count + #child.CoinContainer:GetChildren()
        end
    end
    return count
end

-- Function to create GUI
local function createGUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "MM2CandyAutoFarmGUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = player.PlayerGui

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 300, 0, 100)
    Frame.Position = UDim2.new(0.5, -150, 0.5, -50)
    Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black background
    Frame.BorderSizePixel = 0
    Frame.Parent = ScreenGui

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.BackgroundTransparency = 1
    Title.Text = "MM2 Candy Auto Farm"
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.TextSize = 18
    Title.Font = Enum.Font.SourceSansBold
    Title.Parent = Frame

    local CandyLabel = Instance.new("TextLabel")
    CandyLabel.Size = UDim2.new(1, 0, 0, 30)
    CandyLabel.Position = UDim2.new(0, 0, 0.5, 0)
    CandyLabel.BackgroundTransparency = 1
    CandyLabel.TextColor3 = Color3.new(1, 1, 1)
    CandyLabel.TextSize = 16
    CandyLabel.Font = Enum.Font.SourceSans
    CandyLabel.Parent = Frame

    -- Update CandyLabel text with the number of CoinContainers
    local function updateCandyCount()
        local count = countCoinContainers()
        CandyLabel.Text = "You have: " .. count .. " Candies"
    end

    -- Update CandyLabel initially
    updateCandyCount()

    -- Variable to track if a teleport is in progress
    local isTeleporting = false

    -- Function to find the nearest coin within a certain radius
    local function findNearestCoin(radius)
        local coinContainer = findCoinContainer()
        if not coinContainer then
            print("CoinContainer not found")
            return nil
        end
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local nearestCoin = nil
        local nearestDistance = radius
        for _, coin in pairs(coinContainer:GetChildren()) do
            local distance = (coin.Position - humanoidRootPart.Position).Magnitude
            if distance < nearestDistance then
                nearestCoin = coin
                nearestDistance = distance
            end
        end
        return nearestCoin
    end

    -- Function to teleport to a coin
    local function teleportToCoin(coin)
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(humanoidRootPart, tweenInfo, {CFrame = coin.CFrame})
        tween:Play()
        return tween
    end

    -- Function to teleport to a nearby coin or a random coin
    local function teleportToNearbyOrRandomCoin()
        if not teleportEnabled or isTeleporting then return end
        local nearbyRadius = 50 -- Adjust this value to change the "nearby" distance
        local nearbyCoin = findNearestCoin(nearbyRadius)
        if nearbyCoin then
            print("Teleporting to nearby coin")
            isTeleporting = true
            local tween = teleportToCoin(nearbyCoin)
            tween.Completed:Wait()
            isTeleporting = false
        else
            local coinContainer = findCoinContainer()
            if not coinContainer then
                print("CoinContainer not found")
                return
            end
            local coins = coinContainer:GetChildren()
            if #coins == 0 then
                print("No coins found")
                return
            end
            local randomCoin = coins[math.random(1, #coins)]
            print("Teleporting to random coin")
            isTeleporting = true
            local tween = teleportToCoin(randomCoin)
            tween.Completed:Wait()
            isTeleporting = false
        end
    end

    -- Function to handle character spawning
    local function onCharacterAdded(newCharacter)
        character = newCharacter
        updateCandyCount() -- Update count when character spawns
    end

    -- Connect to current and future characters
    player.CharacterAdded:Connect(onCharacterAdded)

    -- Start the continuous teleportation loop
    RunService.Heartbeat:Connect(function()
        if teleportEnabled and character and character:FindFirstChild("HumanoidRootPart") then
            teleportToNearbyOrRandomCoin()
            updateCandyCount() -- Update the candy count
        end
    end)
end 

-- Create initial GUI
createGUI()

print("MM2 Candy Auto Farm script with persistent GUI, fixed toggle, and transparency setting loaded.")
