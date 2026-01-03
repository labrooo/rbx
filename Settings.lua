local module = {}

module.Movement = {
	SpeedConfig = {
		toggle = true,
		runOn = "hold",
		keybind =Enum.KeyCode.LeftControl,
		speed = 100
	},
	
	FlyConfig = {
		toggle = true,
		runOn = "hold",
		keybind =Enum.KeyCode.Q,
		speed = 100
	}
}


return module
