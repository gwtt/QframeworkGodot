class_name EasyEvents extends RefCounted

var m_global_events = EasyEvents.new()
var m_type_events :Dictionary = {}

func register(type: EasyEvent):
	m_global_events.add_event(type)

func add_event(type: EasyEvent):
	m_type_events[type] = type.new()

func get_event(type: EasyEvent) -> Callable:
	return m_type_events.get(type)

func get_or_add_event(type: EasyEvent):
	if m_type_events.has(type):
		return m_type_events.get(type)
	var temp = type.new()
	m_type_events[type] = temp
	return temp
