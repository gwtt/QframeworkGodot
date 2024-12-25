extends Architecture

func _init() -> void:
	self.register_system(AchievementSystem)
	self.register_model(CounterAppModel)
	make_sure_architecture()
	
	
