local module = {}

module.Movement = {
	SpeedConfig = {
		toggle = true,
		runOn = "hold",
		keybind =Enum.KeyCode.LeftControl,
		speed = 55
	},
	
	FlyConfig = {
		toggle = false,
		runOn = "hold",
		keybind =Enum.KeyCode.Q,
		speed = 100
	}
}


return module
