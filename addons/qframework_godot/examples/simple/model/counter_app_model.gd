class_name CounterAppModel extends AbstractModel

var count:BindableProperty = BindableProperty.new()

func on_init():
	var storage = self.get_utility(Storage) as Storage
	count.register(func (new_count): storage.save_int(new_count))
	var load_int = storage.load_int()
	if load_int:
		count.set_value_without_event(load_int)

