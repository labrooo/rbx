

local players = game:GetService("Players")
local player = players.LocalPlayer
local mouse = player:getMouse()
local RunService = game:GetService("RunService")

local UserInputService = game:GetService("UserInputService")

local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")


local speedActive = false
local isFlying = true

--local FLY_SPEED = settings.Movement.FlyConfig.speed
local bodyVelocity
local bodyGyro
local flyConnection

local Movementhacks = {}
local function SpeedHack(keyState, settings)
	if settings.Movement.SpeedConfig.toggle then
		if settings.Movement.SpeedConfig.runOn == "hold" then
			
			if keyState then
				player.Character.Humanoid.WalkSpeed = settings.Movement.SpeedConfig.speed
			end

			if not keyState then
				player.Character.Humanoid.WalkSpeed =16
			end
		end

		if settings.Movement.SpeedConfig.runOn == "toggle" then
			
			if speedActive == true and keyState then
				speedActive = false
				player.Character.Humanoid.WalkSpeed = 16
			end
			
			if speedActive == false and keyState then
				player.Character.Humanoid.WalkSpeed = settings.Movement.SpeedConfig.speed
			end
		end
	end
end



Movementhacks.SpeedHack = SpeedHack
return Movementhacks
