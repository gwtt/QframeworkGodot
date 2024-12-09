class_name CounterAppArchitecture extends Architecture

func on_init():
	print(AchievementSystem is GDScript)
	self.register_system(AchievementSystem)
	self.register_model(CounterAppModel)
	self.register_utility(Storage)
	
