class_name OrEvent extends RefCounted

signal m_on_event

var unregister_list: Array[IUnRegister]
func or_event(easyEvent: EasyEvent) -> OrEvent:
	unregister_list.append(easyEvent.register(Trigger))
	return self

func register(on_event):
	m_on_event.connect(on_event)

func unregister(on_event):
	m_on_event.disconnect(on_event)

func Trigger():
	m_on_event.emit()

func unregister_all():
	for unregister in unregister_list:
		unregister.unregister()
	unregister_list.clear()
