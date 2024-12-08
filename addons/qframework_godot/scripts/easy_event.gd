class_name EasyEvent extends RefCounted

signal on_event(t, k, s)
func register(on_event) -> IUnRegister:
	self.on_event.connect(on_event)
	return CustomUnregister.new(unregister(on_event))

func unregister(on_event):
	self.on_event.disconnect(on_event)

func trigger(t, k, s):
	on_event.emit(t, k, s)
