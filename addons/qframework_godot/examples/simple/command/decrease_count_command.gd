class_name DecreaseCountCommand extends AbstractCommand

func on_execute_result() -> void:
	self.get_model(PathUtil.counter_app_model).count.value -= 1
