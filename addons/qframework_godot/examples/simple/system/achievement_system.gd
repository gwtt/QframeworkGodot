class_name AchievementSystem extends AbstractSystem

func on_init():
	var temp = self.get_model(PathUtil.counter_app_model)
	var temp_count = temp.count as BindableProperty
	temp_count.register(judge_count)

func judge_count(newCount):
	if newCount == 10:
		print("触发 点击达人 成就");
	elif newCount == 20:
		print("触发 点击专家 成就");
	elif newCount == -10:
		print("触发 点击菜鸟 成就");
