class_name IOCContainer extends RefCounted

var m_instances :Dictionary = {}

func register(gdscript: GDScript):
	var key = gdscript.get_global_name()
	var instance = gdscript.new()
	m_instances[key] = instance
	return instance

func get_value(gdscript: GDScript):
	var key = gdscript.get_global_name()
	if m_instances.has(key):
		return m_instances.get(key)
	else:
		return null
