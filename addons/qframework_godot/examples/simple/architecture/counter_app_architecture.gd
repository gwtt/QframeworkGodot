extends Architecture

func _init() -> void:
	self.register_system(AchievementSystem)
	self.register_model(CounterAppModel)
	self.register_utility(Storage)
	make_sure_architecture()
	
	
