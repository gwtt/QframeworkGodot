class_name TypeEventSystem extends RefCounted

var m_events:EasyEvents
var global = TypeEventSystem.new()

func send_type(type) -> void:
	m_events.get_event(type).call()

func send_type_event(type, e) -> void:
	m_events.get_event(type).call(e)

func register(on_event):
	return m_events.get_or_add_event(on_event)

# TODO
func un_register(on_event):
	var e = m_events.get_event(on_event)
	if e != null:
		e.un
