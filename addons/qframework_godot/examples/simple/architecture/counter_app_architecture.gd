class_name CounterAppArchitecture extends Architecture

func on_init():
	self.register_system(PathUtil.achievement_system)
	self.register_model(PathUtil.counter_app_model)
	self.register_utility(PathUtil.storage)
	
