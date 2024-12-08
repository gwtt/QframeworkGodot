class_name BindablePropertyUnRegister extends IUnRegister

var bindable_property: BindableProperty
var on_value_changed: Callable

func _init(bindable_property: BindableProperty, on_value_changed: Callable) -> void:
	self.bindable_property = bindable_property
	self.on_value_changed = on_value_changed

func unregister():
	self.bindable_property.unregister(on_value_changed)
	bindable_property = null
