class_name AchievementSystem extends AbstractSystem

func on_init():
	var temp = self.get_model(CounterAppModel)
	var temp_count = temp.count as BindableProperty
	temp_count.register(judge_count)
	register_event("event_count", event_count)
	
func judge_count(new_count):
	if new_count == 10:
		print("触发 点击达人 成就");
	elif new_count == 20:
		print("触发 点击专家 成就");
	elif new_count == -10:
		print("触发 点击菜鸟 成就");

func event_count(new_count):
	if new_count == 0:
		print("触发返璞归真")
