-- SpeedKeybind.lua
local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer

local isHyperSpeed = false
local originalSpeed = 16  -- Will store your normal speed
local hyperSpeed = 900    -- Crazy fast speed!

-- Function to apply speed to current character
local function applySpeedToCharacter(character)
    if not character then return end
    
    local humanoid = character:WaitForChild("Humanoid", 5)  -- Wait up to 5 seconds
    if humanoid then
        if isHyperSpeed then
            -- Store original speed if not already stored
            if not originalSpeed then
                originalSpeed = humanoid.WalkSpeed
            end
            humanoid.WalkSpeed = hyperSpeed
            print("⚡ HYPER SPEED ACTIVATED: " .. hyperSpeed .. " walk speed!")
        else
            humanoid.WalkSpeed = originalSpeed or 16
            print("✅ Speed reset to normal: " .. humanoid.WalkSpeed)
        end
    end
end

-- Function to toggle speed
local function toggleSpeed()
    isHyperSpeed = not isHyperSpeed
    
    -- Apply to current character
    local character = player.Character
    if character then
        applySpeedToCharacter(character)
    end
    
    -- Also apply to future characters (after respawn)
    if isHyperSpeed then
        print("📢 Note: Speed will persist after respawn!")
    end
end

-- Apply speed when character loads (for respawns)
player.CharacterAdded:Connect(function(character)
    task.wait(0.5)  -- Small delay to ensure Humanoid exists
    if isHyperSpeed then
        applySpeedToCharacter(character)
    end
end)

-- Set up keybind (press "F" to toggle)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    -- Only trigger if not typing in chat, and pressing "F" key
    if not gameProcessed and input.KeyCode == Enum.KeyCode.F then
        toggleSpeed()
    end
end)

-- Apply to current character immediately if exists
task.wait(1)  -- Wait for everything to load
if player.Character then
    applySpeedToCharacter(player.Character)
end

print("✅ Speed Keybind Loaded!")
print("   Press 'F' to toggle between normal speed and 900 hyper speed!")
print("   Works after respawning too!")
