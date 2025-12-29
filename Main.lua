-- SpeedKeybind.lua
local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer

local isSuperSpeed = false
local normalSpeed = 16
local superSpeed = 50

local character = player.Character
if character then
 local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = 900
    end
end

