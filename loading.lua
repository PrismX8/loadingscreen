
local LoadingGUI = Instance.new("ScreenGui")
LoadingGUI.Name = "LoadingScreen"
LoadingGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LoadingGUI.DisplayOrder = 2147483647 -- Maximum possible value
LoadingGUI.IgnoreGuiInset = true
LoadingGUI.Parent = game:GetService("CoreGui")


-- Loading screen container
local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, 0, 1, 0)
Container.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Container.BorderSizePixel = 0
Container.Parent = LoadingGUI
Container.BackgroundTransparency = 0.8

-- Loading content frame
local LoadingContent = Instance.new("Frame")
LoadingContent.Size = UDim2.new(0, 400, 0, 300)
LoadingContent.Position = UDim2.new(0.5, -200, 0.5, -150)
LoadingContent.BackgroundTransparency = 1
LoadingContent.Parent = Container

-- Animated Logo
local Logo = Instance.new("ImageLabel")
Logo.Size = UDim2.new(0, 120, 0, 120)
Logo.Position = UDim2.new(0.5, -60, 0.3, -60)
Logo.Image = "rbxassetid://17091459839"
Logo.BackgroundTransparency = 1
Logo.Parent = LoadingContent

-- Rotate Animation
local rotationTween = game:GetService("TweenService"):Create(
    Logo,
    TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1),
    {Rotation = 360}
)
rotationTween:Play()

-- Progress Bar
local ProgressBar = Instance.new("Frame")
ProgressBar.Size = UDim2.new(0.8, 0, 0, 8)
ProgressBar.Position = UDim2.new(0.1, 0, 0.7, 0)
ProgressBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ProgressBar.BorderSizePixel = 0
ProgressBar.ClipsDescendants = true
ProgressBar.Parent = LoadingContent

local ProgressFill = Instance.new("Frame")
ProgressFill.Size = UDim2.new(0, 0, 1, 0)
ProgressFill.BackgroundColor3 = Color3.fromRGB(155, 89, 182)
ProgressFill.BorderSizePixel = 0
ProgressFill.Parent = ProgressBar

-- Loading Text
local LoadingText = Instance.new("TextLabel")
LoadingText.Size = UDim2.new(1, 0, 0, 30)
LoadingText.Position = UDim2.new(0, 0, 0.8, 0)
LoadingText.BackgroundTransparency = 1
LoadingText.Text = "Loading Hallow Hub..."
LoadingText.Font = Enum.Font.GothamSemibold
LoadingText.TextColor3 = Color3.fromRGB(200, 200, 200)
LoadingText.TextSize = 18
LoadingText.Parent = LoadingContent

local LoadingSubtext = Instance.new("TextLabel")
LoadingSubtext.Size = UDim2.new(1, 0, 0, 20)
LoadingSubtext.Position = UDim2.new(0, 0, 0.9, 0)
LoadingSubtext.BackgroundTransparency = 1
LoadingSubtext.Text = "Initializing modules"
LoadingSubtext.Font = Enum.Font.Gotham
LoadingSubtext.TextColor3 = Color3.fromRGB(150, 150, 150)
LoadingSubtext.TextSize = 14
LoadingSubtext.Parent = LoadingContent

-- Progress Counter
local ProgressText = Instance.new("TextLabel")
ProgressText.Size = UDim2.new(1, 0, 0, 20)
ProgressText.Position = UDim2.new(0, 0, 0.75, 0)
ProgressText.BackgroundTransparency = 1
ProgressText.Text = "0%"
ProgressText.Font = Enum.Font.GothamBold
ProgressText.TextColor3 = Color3.fromRGB(200, 200, 200)
ProgressText.TextSize = 16
ProgressText.Parent = LoadingContent

-- Animate Progress
local loadDuration = 3
local progress = 0

local tweenInfo = TweenInfo.new(
    loadDuration,
    Enum.EasingStyle.Quint,
    Enum.EasingDirection.Out
)

local progressTween = game:GetService("TweenService"):Create(
    ProgressFill,
    tweenInfo,
    {Size = UDim2.new(1, 0, 1, 0)}
)
progressTween:Play()

-- Update Progress Text
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

-- Loading Messages
local messages = {
    "Optimizing performance",
    "Loading assets",
    "Initializing security",
    "Preparing UI components",
    "Almost there..."
}

for i, msg in ipairs(messages) do
    task.wait(loadDuration/#messages)
    LoadingSubtext.Text = msg
end

-- Fade Out Animation
local fadeTween = game:GetService("TweenService"):Create(
    Container,
    TweenInfo.new(0.5),
    {BackgroundTransparency = 1}
)
fadeTween:Play()

-- Cleanup
fadeTween.Completed:Connect(function()
    pcall(function()
        rotationTween:Cancel()
        LoadingGUI:Destroy()
        Rayfield:ToggleVisibility(true) -- Ensure window is visible
    end)
end)
