if game:GetService("CoreGui"):FindFirstChild("LoadingScreen") then return end

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Create loading screen with maximum priority
local LoadingGUI = Instance.new("ScreenGui")
LoadingGUI.Name = "LoadingScreen"
LoadingGUI.ZIndexBehavior = Enum.ZIndexBehavior.Global
LoadingGUI.DisplayOrder = 2147483647
LoadingGUI.IgnoreGuiInset = true
LoadingGUI.Parent = game:GetService("CoreGui")

-- Modern glass-morphism container
local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, 0, 1, 0)
Container.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
Container.BackgroundTransparency = 0.3
Container.BorderSizePixel = 0
Container.Parent = LoadingGUI

-- Add blur effect
local blur = Instance.new("BlurEffect")
blur.Size = 10
blur.Parent = game:GetService("Lighting")

-- Glass panel
local LoadingContent = Instance.new("Frame")
LoadingContent.Size = UDim2.new(0, 450, 0, 350)
LoadingContent.Position = UDim2.new(0.5, -225, 0.5, -175)
LoadingContent.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
LoadingContent.BackgroundTransparency = 0.2
LoadingContent.BorderSizePixel = 0
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = LoadingContent

-- Add subtle drop shadow
local shadow = Instance.new("ImageLabel")
shadow.Size = UDim2.new(1, 10, 1, 10)
shadow.Position = UDim2.new(0, -5, 0, -5)
shadow.Image = "rbxassetid://5554236805"
shadow.ImageTransparency = 0.8
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.BackgroundTransparency = 1
shadow.Parent = LoadingContent
LoadingContent.Parent = Container

-- Player avatar display
local AvatarFrame = Instance.new("Frame")
AvatarFrame.Size = UDim2.new(0, 80, 0, 80)
AvatarFrame.Position = UDim2.new(0.5, -40, 0.15, -40)
AvatarFrame.BackgroundTransparency = 1
AvatarFrame.Parent = LoadingContent

local Avatar = Instance.new("ImageLabel")
Avatar.Size = UDim2.new(1, 0, 1, 0)
Avatar.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
Avatar.BackgroundTransparency = 1
Avatar.Parent = AvatarFrame

-- Add circular mask
local mask = Instance.new("UICorner")
mask.CornerRadius = UDim.new(1, 0)
mask.Parent = Avatar

-- Add glowing outline to avatar
local glow = Instance.new("ImageLabel")
glow.Size = UDim2.new(1.2, 0, 1.2, 0)
glow.Position = UDim2.new(-0.1, 0, -0.1, 0)
glow.Image = "rbxassetid://5028857084"
glow.ImageColor3 = Color3.fromRGB(155, 89, 182)
glow.ScaleType = Enum.ScaleType.Slice
glow.SliceCenter = Rect.new(24, 24, 24, 24)
glow.BackgroundTransparency = 1
glow.Parent = AvatarFrame

-- Animated Logo with pulse effect
local Logo = Instance.new("ImageLabel")
Logo.Size = UDim2.new(0, 60, 0, 60)
Logo.Position = UDim2.new(0.5, -34, 0.35, 7)
Logo.Image = "rbxassetid://17091459839"
Logo.BackgroundTransparency = 1
Logo.Parent = LoadingContent

-- Pulse animation
game:GetService("TweenService"):Create(
    Logo,
    TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true),
    {Size = UDim2.new(0, 70, 0, 70)}
):Play()

-- Modern progress bar with gradient
local ProgressBar = Instance.new("Frame")
ProgressBar.Size = UDim2.new(0.8, 0, 0, 6)
ProgressBar.Position = UDim2.new(0.1, 0, 0.7, 0)
ProgressBar.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
ProgressBar.BorderSizePixel = 0
ProgressBar.ClipsDescendants = true
local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(1, 0)
barCorner.Parent = ProgressBar
ProgressBar.Parent = LoadingContent

local ProgressFill = Instance.new("Frame")
ProgressFill.Size = UDim2.new(0, 0, 1, 0)
ProgressFill.BackgroundColor3 = Color3.fromRGB(155, 89, 182)
ProgressFill.BorderSizePixel = 0
ProgressFill.Parent = ProgressBar
barCorner:Clone().Parent = ProgressFill

-- Add gradient to progress bar
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(155, 89, 182)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 50, 200))
}
gradient.Rotation = 90
gradient.Parent = ProgressFill

-- Loading text with better typography
local LoadingText = Instance.new("TextLabel")
LoadingText.Size = UDim2.new(1, -40, 0, 30)
LoadingText.Position = UDim2.new(0, 20, 0.8, 0)
LoadingText.BackgroundTransparency = 1
LoadingText.Text = "LOADING HALLOW HUB"
LoadingText.Font = Enum.Font.GothamBlack
LoadingText.TextColor3 = Color3.fromRGB(220, 220, 220)
LoadingText.TextSize = 18
LoadingText.TextXAlignment = Enum.TextXAlignment.Left
LoadingText.Parent = LoadingContent

-- Progress percentage with modern design
local ProgressText = Instance.new("TextLabel")
ProgressText.Size = UDim2.new(0, 60, 0, 20)
ProgressText.Position = UDim2.new(0.9, -60, 0.8, 0)
ProgressText.BackgroundTransparency = 1
ProgressText.Text = "0%"
ProgressText.Font = Enum.Font.GothamBold
ProgressText.TextColor3 = Color3.fromRGB(155, 89, 182)
ProgressText.TextSize = 16
ProgressText.TextXAlignment = Enum.TextXAlignment.Right
ProgressText.Parent = LoadingContent

-- Status message with typewriter effect
local LoadingSubtext = Instance.new("TextLabel")
LoadingSubtext.Size = UDim2.new(1, -40, 0, 20)
LoadingSubtext.Position = UDim2.new(0, 20, 0.9, 0)
LoadingSubtext.BackgroundTransparency = 1
LoadingSubtext.Text = ""
LoadingSubtext.Font = Enum.Font.GothamMedium
LoadingSubtext.TextColor3 = Color3.fromRGB(180, 180, 180)
LoadingSubtext.TextSize = 14
LoadingSubtext.TextXAlignment = Enum.TextXAlignment.Left
LoadingSubtext.Parent = LoadingContent

-- Animate Progress
local loadDuration = 3.5
local progress = 0

-- Smooth progress animation
local progressTween = game:GetService("TweenService"):Create(
    ProgressFill,
    TweenInfo.new(loadDuration, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    {Size = UDim2.new(1, 0, 1, 0)}
)
progressTween:Play()

-- Update progress text with smooth transitions
local connection
connection = game:GetService("RunService").Heartbeat:Connect(function()
    local currentWidth = ProgressFill.AbsoluteSize.X
    local totalWidth = ProgressBar.AbsoluteSize.X
    progress = math.floor((currentWidth / totalWidth) * 100)
    ProgressText.Text = progress .. "%"
    
    if progress >= 100 then
        connection:Disconnect()
    end
end)

-- Professional loading messages with typewriter effect
local messages = {
    "Initializing core modules...",
    "Loading game assets...",
    "Verifying security protocols...",
    "Optimizing performance...",
    "Finalizing setup..."
}

local function typeWriter(text, label)
    label.Text = ""
    for i = 1, #text do
        label.Text = string.sub(text, 1, i)
        task.wait(0.03)
    end
end

for i, msg in ipairs(messages) do
    task.spawn(typeWriter, msg, LoadingSubtext)
    task.wait(loadDuration/#messages)
end

-- Elegant fade out with blur reduction
local fadeTween = game:GetService("TweenService"):Create(
    Container,
    TweenInfo.new(0.7, Enum.EasingStyle.Quad),
    {BackgroundTransparency = 1}
)
fadeTween:Play()

game:GetService("TweenService"):Create(
    blur,
    TweenInfo.new(0.7),
    {Size = 0}
):Play()

-- Cleanup
fadeTween.Completed:Connect(function()
    pcall(function()
        LoadingGUI:Destroy()
        blur:Destroy()
        -- Show your UI here
    end)
end)
