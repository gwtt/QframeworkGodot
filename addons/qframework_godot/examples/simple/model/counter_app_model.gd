class_name CounterAppModel extends AbstractModel

var count:BindableProperty = BindableProperty.new()

func on_init():
	var storage = self.get_utility(Storage) as Storage
	var load_int = storage.load_int()
	if load_int:
		count.set_value_without_event(load_int)
	else:
		count.set_value_without_event(0)
	count.register(func (new_count): storage.save_int(new_count))
	count.register(event_send)
	
func event_send(new_count):
	send_event("event_count", new_count)
