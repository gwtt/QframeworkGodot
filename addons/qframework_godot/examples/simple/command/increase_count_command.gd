class_name IncreaseCountCommand extends AbstractCommand

func on_execute_result() -> void:
	self.get_model(CounterAppModel).count.value += 1
