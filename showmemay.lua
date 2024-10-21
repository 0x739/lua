Player = game.Players.LocalPlayer
Gui = Player.PlayerGui
repeat wait() until Gui:FindFirstChild("CrossPlatform") and Gui.CrossPlatform:FindFirstChild("Halloween2024") and Gui.CrossPlatform.Halloween2024:FindFirstChild("Container") and Gui.CrossPlatform.Halloween2024.Container:FindFirstChild("EventFrames") and Gui.CrossPlatform.Halloween2024.Container.EventFrames:FindFirstChild("BattlePass")
print("Found") 
Candies = Gui.CrossPlatform.Halloween2024.Container.EventFrames.BattlePass.Info.Tokens.Container.TextLabel 
print("Candies: ", Candies.Text)

function RefreshCandy() 
    NameHub.Text = tostring(game.Players.LocalPlayer.PlayerGui.CrossPlatform.Halloween2024.Container.EventFrames.BattlePass.Info.Tokens.Container.TextLabel.Text)
end 
Candies:GetPropertyChangedSignal("Text"):Connect(RefreshCandy)

local HopGui = Instance.new("ScreenGui")
local HopFrame = Instance.new("Frame")
local NameHub = Instance.new("TextLabel")
local UIStroke = Instance.new("UIStroke")
local HopIn = Instance.new("TextLabel")
local DropShadowHolder = Instance.new("Frame")
local DropShadow = Instance.new("ImageLabel")
local Reason = Instance.new("TextLabel")
local ClickTo = Instance.new("TextLabel")
local ButtonCall = Instance.new("TextButton")

HopGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
HopGui.Name = "HopGui"
HopGui.Parent = game:GetService("CoreGui")
HopGui.Enabled = true

HopFrame.AnchorPoint = Vector2.new(0.5, 0.5)
HopFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Nền đen
HopFrame.BackgroundTransparency = 0.9990000128746033
HopFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
HopFrame.BorderSizePixel = 0
HopFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
HopFrame.Size = UDim2.new(1, 0, 1, 0)
HopFrame.Name = "HopFrame"
HopFrame.Parent = HopGui

NameHub.Font = Enum.Font.Gotham
spawn(function()
    while wait() do 
        NameHub.Text = tostring(Candies.Text)
    end 
end) 

NameHub.TextColor3 = Color3.fromRGB(255, 255, 255) -- Chữ trắng
NameHub.TextSize = 85 * 2
NameHub.AnchorPoint = Vector2.new(0.5, 0.5)
NameHub.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Nền đen
NameHub.BackgroundTransparency = 0.9990000128746033
NameHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
NameHub.BorderSizePixel = 0
NameHub.Position = UDim2.new(0.5, 0, 0.5, -45)
NameHub.Size = UDim2.new(0, 400, 0, 160)
NameHub.Name = "NameHub"
NameHub.Parent = HopFrame

UIStroke.Color = Color3.fromRGB(255, 255, 255) -- Đường viền trắng
UIStroke.Thickness = 1.5
UIStroke.Parent = NameHub

HopIn.Font = Enum.Font.Gotham
HopIn.Text = "Candies"
HopIn.TextColor3 = Color3.fromRGB(255, 255, 255) -- Chữ trắng
HopIn.TextSize = 40
HopIn.AnchorPoint = Vector2.new(0.5, 0.5)
HopIn.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Nền đen
HopIn.BackgroundTransparency = 0.9990000128746033
HopIn.BorderColor3 = Color3.fromRGB(0, 0, 0)
HopIn.BorderSizePixel = 0
HopIn.Position = UDim2.new(0.5, 0, 0.5, 0)
HopIn.Size = UDim2.new(0, 200, 0, 30)
HopIn.Name = "HopIn"
HopIn.Parent = HopFrame

DropShadowHolder.BackgroundTransparency = 1
DropShadowHolder.BorderSizePixel = 0
DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
DropShadowHolder.ZIndex = 0
DropShadowHolder.Name = "DropShadowHolder"
DropShadowHolder.Parent = HopFrame

DropShadow.Image = "rbxassetid://6015897843"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.999
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.BackgroundTransparency = 0
DropShadow.BorderSizePixel = 0
DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
DropShadow.Size = UDim2.new(1, 47, 1, 47)
DropShadow.ZIndex = 0
DropShadow.Name = "DropShadow"
DropShadow.Parent = DropShadowHolder

local Blur = Instance.new("BlurEffect")
Blur.Size = 100
Blur.Parent = game.Lighting
Blur.Enabled = true
