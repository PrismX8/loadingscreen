local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- Create hacker-style loading screen
local LoadingGUI = Instance.new("ScreenGui")
LoadingGUI.Name = "HackerLoadScreen"
LoadingGUI.ZIndexBehavior = Enum.ZIndexBehavior.Global
LoadingGUI.DisplayOrder = 2147483647
LoadingGUI.IgnoreGuiInset = true
LoadingGUI.Parent = game:GetService("CoreGui")

-- Dark terminal background
local Terminal = Instance.new("Frame")
Terminal.Size = UDim2.new(1, 0, 1, 0)
Terminal.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
Terminal.BorderSizePixel = 0
Terminal.Parent = LoadingGUI

-- Scanline overlay for CRT effect
local Scanlines = Instance.new("ImageLabel")
Scanlines.Size = UDim2.new(1, 0, 1, 0)
Scanlines.Image = "rbxassetid://7254912605"
Scanlines.ImageTransparency = 0.9
Scanlines.ScaleType = Enum.ScaleType.Tile
Scanlines.TileSize = UDim2.new(0, 2, 0, 2)
Scanlines.BackgroundTransparency = 1
Scanlines.Parent = Terminal

-- Main terminal frame
local Console = Instance.new("Frame")
Console.Size = UDim2.new(0.6, 0, 0.7, 0)
Console.Position = UDim2.new(0.2, 0, 0.15, 0)
Console.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Console.BorderColor3 = Color3.fromRGB(0, 150, 0)
Console.BorderSizePixel = 1
Console.Parent = Terminal

-- Terminal header
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 30)
Header.BackgroundColor3 = Color3.fromRGB(0, 30, 0)
Header.BorderSizePixel = 0
Header.Parent = Console

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -10, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "SYSTEM INITIALIZATION"
Title.Font = Enum.Font.Code
Title.TextColor3 = Color3.fromRGB(0, 255, 0)
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

-- Hacker logo (ASCII art)
local AsciiArt = Instance.new("TextLabel")
AsciiArt.Size = UDim2.new(1, -20, 0, 60)
AsciiArt.Position = UDim2.new(0, 10, 0, 40)
AsciiArt.BackgroundTransparency = 1
AsciiArt.Text = [[
  ██░ ██  ▄▄▄     ▄▄▄█████▓ ██▓ ███▄    █ 
 ▓██░ ██▒▒████▄   ▓  ██▒ ▓▒▓██▒ ██ ▀█   █ 
 ▒██▀▀██░▒██  ▀█▄ ▒ ▓██░ ▒░▒██▒▓██  ▀█ ██▒
 ░▓█ ░██ ░██▄▄▄▄██░ ▓██▓ ░ ░██░▓██▒  ▐▌██▒
 ░▓█▒░██▓ ▓█   ▓██▒ ▒██▒ ░ ░██░▒██░   ▓██░
  ▒ ░░▒░▒ ▒▒   ▓▒█░ ▒ ░░   ░▓  ░ ▒░   ▒ ▒ 
  ▒ ░▒░ ░  ▒   ▒▒ ░   ░     ▒ ░░ ░░   ░ ▒░
  ░  ░░ ░  ░   ▒    ░       ▒ ░   ░   ░ ░ 
  ░  ░  ░      ░  ░         ░           ░ 
]]
AsciiArt.Font = Enum.Font.Code
AsciiArt.TextColor3 = Color3.fromRGB(0, 200, 0)
AsciiArt.TextSize = 12
AsciiArt.TextXAlignment = Enum.TextXAlignment.Left
AsciiArt.Parent = Console

-- Status console output
local Output = Instance.new("ScrollingFrame")
Output.Size = UDim2.new(1, -20, 0.6, 0)
Output.Position = UDim2.new(0, 10, 0, 110)
Output.BackgroundTransparency = 1
Output.BorderSizePixel = 0
Output.ScrollBarThickness = 4
Output.ScrollBarImageColor3 = Color3.fromRGB(0, 80, 0)
Output.CanvasSize = UDim2.new(0, 0, 5, 0)
Output.Parent = Console

local OutputLayout = Instance.new("UIListLayout")
OutputLayout.Parent = Output

-- Progress bar (terminal style)
local ProgressContainer = Instance.new("Frame")
ProgressContainer.Size = UDim2.new(1, -20, 0, 10)
ProgressContainer.Position = UDim2.new(0, 10, 0.9, -15)
ProgressContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ProgressContainer.BorderColor3 = Color3.fromRGB(0, 80, 0)
ProgressContainer.BorderSizePixel = 1
ProgressContainer.ClipsDescendants = true
ProgressContainer.Parent = Console

local ProgressBar = Instance.new("Frame")
ProgressBar.Size = UDim2.new(0, 0, 1, 0)
ProgressBar.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
ProgressBar.BorderSizePixel = 0
ProgressBar.Parent = ProgressContainer

-- Progress percentage
local ProgressText = Instance.new("TextLabel")
ProgressText.Size = UDim2.new(1, -20, 0, 20)
ProgressText.Position = UDim2.new(0, 10, 0.85, -15)
ProgressText.BackgroundTransparency = 1
ProgressText.Text = "0% COMPLETE"
ProgressText.Font = Enum.Font.Code
ProgressText.TextColor3 = Color3.fromRGB(0, 200, 0)
ProgressText.TextSize = 14
ProgressText.TextXAlignment = Enum.TextXAlignment.Left
ProgressText.Parent = Console

-- Cursor blink animation
local Cursor = Instance.new("Frame")
Cursor.Size = UDim2.new(0, 8, 0, 16)
Cursor.Position = UDim2.new(0, 10, 0, 130)
Cursor.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
Cursor.BorderSizePixel = 0
Cursor.Parent = Console

TweenService:Create(
    Cursor,
    TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1),
    {BackgroundTransparency = 1}
):Play()

-- System initialization messages
local messages = {
    "[SYSTEM] Booting Hallow Hub v3.1.4",
    "[NETWORK] Establishing secure connection...",
    "[SECURITY] Bypassing anti-cheat...",
    "[MEMORY] Allocating 256MB buffer...",
    "[LOADER] Decrypting modules...",
    "[UI] Initializing interface components...",
    "[INJECTOR] Hooking game functions...",
    "[DEBUG] Verifying integrity...",
    "[READY] System initialized"
}

local function addOutput(text)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 20)
    label.BackgroundTransparency = 1
    label.Text = "> "..text
    label.Font = Enum.Font.Code
    label.TextColor3 = Color3.fromRGB(0, 200, 0)
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextYAlignment = Enum.TextYAlignment.Top
    label.Parent = Output
    
    -- Auto-scroll
    Output.CanvasPosition = Vector2.new(0, OutputLayout.AbsoluteContentSize.Y)
end

-- Simulate typing effect
local function typeWriter(text, speed)
    for i = 1, #text do
        addOutput(string.sub(text, 1, i))
        task.wait(speed)
    end
end

-- Animate progress
local loadDuration = 5
local progress = 0

local progressTween = TweenService:Create(
    ProgressBar,
    TweenInfo.new(loadDuration, Enum.EasingStyle.Linear),
    {Size = UDim2.new(1, 0, 1, 0)}
)
progressTween:Play()

-- Update progress text
local connection
connection = RunService.Heartbeat:Connect(function()
    local currentWidth = ProgressBar.AbsoluteSize.X
    local totalWidth = ProgressContainer.AbsoluteSize.X
    progress = math.floor((currentWidth / totalWidth) * 100)
    ProgressText.Text = progress.."% COMPLETE"
    
    if progress >= 100 then
        connection:Disconnect()
    end
end)

-- Display system messages
for i, msg in ipairs(messages) do
    task.spawn(typeWriter, msg, 0.03 + math.random() * 0.05)
    task.wait(loadDuration/#messages)
end

-- Terminal shutdown effect
task.wait(1)

local shutdownTween = TweenService:Create(
    Console,
    TweenInfo.new(0.5, Enum.EasingStyle.Quad),
    {BackgroundTransparency = 1}
)

shutdownTween:Play()

shutdownTween.Completed:Connect(function()
    LoadingGUI:Destroy()
    -- Activate your UI here
end)
