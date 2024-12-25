class_name CounterAppModel extends AbstractModel

var count:BindableProperty = BindableProperty.new()

func on_init():
	count.register_with_init_value_no_emit_first(0, on_count_change)
	## 记录存档的属性
	register_saveable_properties([
		"count",
	])
	## 恢复存档
	super.on_init()
	
func on_count_change(new_count):
	save_model()
	send_event("event_count", new_count)

	
