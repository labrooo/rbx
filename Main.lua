-- SpeedKeybind.lua
local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer

local isSuperSpeed = false
local normalSpeed = 16
local superSpeed = 50

local function toggleSpeed()
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            if isSuperSpeed then
                humanoid.WalkSpeed = normalSpeed
                print("🐢 Normal speed: " .. normalSpeed)
            else
                humanoid.WalkSpeed = superSpeed
                print("🚀 Super speed: " .. superSpeed)
            end
            isSuperSpeed = not isSuperSpeed
        end
    end
end

-- Press "P" to toggle speed (change to any key)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.P then
        toggleSpeed()
    end
end)

print("✅ Speed keybind loaded! Press 'P' to toggle between speeds.")
