## 此类是数据的定义，为了方便连接信号采用

class_name BindableProperty extends Resource

signal value_changed(new_value)

var comparer = func(a, b):
	return a == b
var value:
	get:
		return value
	set(new_value):
		value = new_value
		value_changed.emit(value)

func set_value_without_event(new_value) -> void:
	value = new_value

func register(on_value_changed: Callable):
	value_changed.connect(on_value_changed)

func register_with_init_value(default_value, on_value_changed: Callable):
	register(on_value_changed)
	value = default_value

func register_and_refresh(on_value_changed: Callable):
	value_changed.connect(on_value_changed)
	value_changed.emit(value)

func unregister(on_value_changed: Callable):
	value_changed.disconnect(on_value_changed)
