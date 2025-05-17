local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- Create premium loading screen
local LoadingGUI = Instance.new("ScreenGui")
LoadingGUI.Name = "PremiumLoadingScreen"
LoadingGUI.ZIndexBehavior = Enum.ZIndexBehavior.Global
LoadingGUI.DisplayOrder = 2147483647
LoadingGUI.IgnoreGuiInset = true
LoadingGUI.Parent = game:GetService("CoreGui")

-- Fullscreen cinematic background
local Background = Instance.new("Frame")
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.fromRGB(5, 5, 10)
Background.BorderSizePixel = 0
Background.Parent = LoadingGUI

-- Add subtle animated gradient overlay
local Gradient = Instance.new("ImageLabel")
Gradient.Size = UDim2.new(1, 0, 1, 0)
Gradient.Image = "rbxassetid://8992230432"
Gradient.ImageColor3 = Color3.fromRGB(30, 10, 50)
Gradient.ScaleType = Enum.ScaleType.Tile
Gradient.TileSize = UDim2.new(0, 400, 0, 400)
Gradient.BackgroundTransparency = 1
Gradient.Parent = Background

-- Animate gradient movement
TweenService:Create(
    Gradient,
    TweenInfo.new(30, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1),
    {ImageRectOffset = Vector2.new(400, 400)}
):Play()

-- Main content container (40% larger than before)
local Container = Instance.new("Frame")
Container.Size = UDim2.new(0, 600, 0, 450)
Container.Position = UDim2.new(0.5, -300, 0.5, -225)
Container.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
Container.BackgroundTransparency = 0.15
Container.BorderSizePixel = 0

-- Add premium glass effect
local glassCorner = Instance.new("UICorner")
glassCorner.CornerRadius = UDim.new(0, 16)
glassCorner.Parent = Container

local glassStroke = Instance.new("UIStroke")
glassStroke.Color = Color3.fromRGB(100, 100, 150)
glassStroke.Transparency = 0.7
glassStroke.Thickness = 2
glassStroke.Parent = Container

-- Add premium drop shadow
local Shadow = Instance.new("ImageLabel")
Shadow.Size = UDim2.new(1, 20, 1, 20)
Shadow.Position = UDim2.new(0, -10, 0, -10)
Shadow.Image = "rbxassetid://5554236805"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.8
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
Shadow.BackgroundTransparency = 1
Shadow.Parent = Container

Container.Parent = LoadingGUI

-- Player avatar with premium frame
local AvatarFrame = Instance.new("Frame")
AvatarFrame.Size = UDim2.new(0, 100, 0, 100)
AvatarFrame.Position = UDim2.new(0.5, -50, 0.2, -50)
AvatarFrame.BackgroundTransparency = 1
AvatarFrame.Parent = Container

-- Premium avatar container
local AvatarContainer = Instance.new("Frame")
AvatarContainer.Size = UDim2.new(1, 0, 1, 0)
AvatarContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
AvatarContainer.Parent = AvatarFrame

local avatarCorner = Instance.new("UICorner")
avatarCorner.CornerRadius = UDim.new(1, 0)
avatarCorner.Parent = AvatarContainer

local avatarStroke = Instance.new("UIStroke")
avatarStroke.Color = Color3.fromRGB(155, 89, 182)
avatarStroke.Thickness = 3
avatarStroke.Parent = AvatarContainer

-- Actual player avatar
local Avatar = Instance.new("ImageLabel")
Avatar.Size = UDim2.new(1, -10, 1, -10)
Avatar.Position = UDim2.new(0, 5, 0, 5)
Avatar.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
Avatar.BackgroundTransparency = 1
Avatar.Parent = AvatarContainer
avatarCorner:Clone().Parent = Avatar

-- Add pulsating glow effect
local Glow = Instance.new("ImageLabel")
Glow.Size = UDim2.new(1.4, 0, 1.4, 0)
Glow.Position = UDim2.new(-0.2, 0, -0.2, 0)
Glow.Image = "rbxassetid://5028857084"
Glow.ImageColor3 = Color3.fromRGB(155, 89, 182)
Glow.ScaleType = Enum.ScaleType.Slice
Glow.SliceCenter = Rect.new(24, 24, 24, 24)
Glow.BackgroundTransparency = 1
Glow.Parent = AvatarFrame

TweenService:Create(
    Glow,
    TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true),
    {ImageTransparency = 0.3}
):Play()

-- Premium animated logo
local Logo = Instance.new("ImageLabel")
Logo.Size = UDim2.new(0, 80, 0, 80)
Logo.Position = UDim2.new(0.5, -40, 0.4, -40)
Logo.Image = "rbxassetid://17091459839"
Logo.BackgroundTransparency = 1
Logo.Parent = Container

-- Logo animation (scale and rotation)
TweenService:Create(
    Logo,
    TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true),
    {Rotation = 10}
):Play()

TweenService:Create(
    Logo,
    TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true),
    {Size = UDim2.new(0, 90, 0, 90)}
):Play()

-- Premium progress bar container
local ProgressContainer = Instance.new("Frame")
ProgressContainer.Size = UDim2.new(0.8, 0, 0, 8)
ProgressContainer.Position = UDim2.new(0.1, 0, 0.7, 0)
ProgressContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
ProgressContainer.BorderSizePixel = 0
ProgressContainer.ClipsDescendants = true

local progressContainerCorner = Instance.new("UICorner")
progressContainerCorner.CornerRadius = UDim.new(1, 0)
progressContainerCorner.Parent = ProgressContainer

local progressContainerStroke = Instance.new("UIStroke")
progressContainerStroke.Color = Color3.fromRGB(60, 60, 80)
progressContainerStroke.Thickness = 1
progressContainerStroke.Parent = ProgressContainer

ProgressContainer.Parent = Container

-- Animated progress bar with gradient
local ProgressFill = Instance.new("Frame")
ProgressFill.Size = UDim2.new(0, 0, 1, 0)
ProgressFill.BackgroundColor3 = Color3.fromRGB(155, 89, 182)
ProgressFill.BorderSizePixel = 0
ProgressFill.Parent = ProgressContainer
progressContainerCorner:Clone().Parent = ProgressFill

-- Premium gradient effect
local progressGradient = Instance.new("UIGradient")
progressGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 100, 220)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 50, 200))
}
progressGradient.Rotation = 90
progressGradient.Parent = ProgressFill

-- Loading text with premium styling
local LoadingText = Instance.new("TextLabel")
LoadingText.Size = UDim2.new(1, -40, 0, 40)
LoadingText.Position = UDim2.new(0, 20, 0.8, 0)
LoadingText.BackgroundTransparency = 1
LoadingText.Text = "INITIALIZING HALLOW HUB"
LoadingText.Font = Enum.Font.GothamBlack
LoadingText.TextColor3 = Color3.fromRGB(220, 220, 220)
LoadingText.TextSize = 20
LoadingText.TextXAlignment = Enum.TextXAlignment.Left
LoadingText.TextTransparency = 0.1
LoadingText.Parent = Container

-- Animated percentage counter
local ProgressText = Instance.new("TextLabel")
ProgressText.Size = UDim2.new(0, 80, 0, 30)
ProgressText.Position = UDim2.new(0.9, -80, 0.8, 0)
ProgressText.BackgroundTransparency = 1
ProgressText.Text = "0%"
ProgressText.Font = Enum.Font.GothamBold
ProgressText.TextColor3 = Color3.fromRGB(155, 89, 182)
ProgressText.TextSize = 20
ProgressText.TextXAlignment = Enum.TextXAlignment.Right
ProgressText.Parent = Container

-- Premium status message with typing animation
local LoadingSubtext = Instance.new("TextLabel")
LoadingSubtext.Size = UDim2.new(1, -40, 0, 24)
LoadingSubtext.Position = UDim2.new(0, 20, 0.9, 0)
LoadingSubtext.BackgroundTransparency = 1
LoadingSubtext.Text = ""
LoadingSubtext.Font = Enum.Font.GothamMedium
LoadingSubtext.TextColor3 = Color3.fromRGB(180, 180, 200)
LoadingSubtext.TextSize = 16
LoadingSubtext.TextXAlignment = Enum.TextXAlignment.Left
LoadingSubtext.Parent = Container

-- Smooth loading animation
local loadDuration = 4.5
local progress = 0

-- Premium progress animation with easing
local progressTween = TweenService:Create(
    ProgressFill,
    TweenInfo.new(loadDuration, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    {Size = UDim2.new(1, 0, 1, 0)}
)
progressTween:Play()

-- Ultra-smooth progress counter
local connection
connection = RunService.Heartbeat:Connect(function(delta)
    local currentWidth = ProgressFill.AbsoluteSize.X
    local totalWidth = ProgressContainer.AbsoluteSize.X
    progress = math.floor((currentWidth / totalWidth) * 100)
    
    -- Smooth number transition
    local currentText = tonumber(ProgressText.Text:gsub("%%", "")) or 0
    if math.abs(currentText - progress) > 1 then
        ProgressText.Text = string.format("%d%%", math.min(currentText + 2, progress))
    else
        ProgressText.Text = string.format("%d%%", progress)
    end
    
    if progress >= 100 then
        connection:Disconnect()
    end
end)

-- Premium loading messages with typing effect
local messages = {
    "Initializing core framework modules...",
    "Loading game assets and resources...",
    "Establishing secure connections...",
    "Optimizing performance parameters...",
    "Finalizing user interface components..."
}

local function typeWriter(text, label)
    label.Text = ""
    for i = 1, #text do
        label.Text = string.sub(text, 1, i)
        local rnd = math.random()
        task.wait(rnd < 0.3 and 0.03 or (rnd < 0.7 and 0.05 or 0.01))
    end
end

for i, msg in ipairs(messages) do
    task.spawn(typeWriter, msg, LoadingSubtext)
    task.wait(loadDuration/#messages + math.random() * 0.2)
end

-- Cinematic fade out with multiple effects
local fadeTween = TweenService:Create(
    Container,
    TweenInfo.new(1.2, Enum.EasingStyle.Quint),
    {BackgroundTransparency = 1}
)

local textFade = TweenService:Create(
    LoadingText,
    TweenInfo.new(0.8, Enum.EasingStyle.Quad),
    {TextTransparency = 1}
)

local subtextFade = TweenService:Create(
    LoadingSubtext,
    TweenInfo.new(0.8, Enum.EasingStyle.Quad),
    {TextTransparency = 1}
)

local progressFade = TweenService:Create(
    ProgressContainer,
    TweenInfo.new(0.8, Enum.EasingStyle.Quad),
    {BackgroundTransparency = 1}
)

local avatarFade = TweenService:Create(
    AvatarFrame,
    TweenInfo.new(0.8, Enum.EasingStyle.Quad),
    {BackgroundTransparency = 1}
)

-- Start all fade animations
fadeTween:Play()
textFade:Play()
subtextFade:Play()
progressFade:Play()
avatarFade:Play()

-- Clean up after animation
fadeTween.Completed:Connect(function()
    task.wait(0.5) -- Additional delay for smoothness
    LoadingGUI:Destroy()
    -- Your UI activation code here
end)
