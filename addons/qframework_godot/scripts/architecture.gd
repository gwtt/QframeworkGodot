class_name Architecture extends RefCounted

signal on_register_patch(architecture)

var m_inited :bool = false
var m_systems :HashSet = HashSet.new()
var m_models :HashSet = HashSet.new()
static var m_architecture: Architecture

static func interface(type) -> Architecture:
	if !m_architecture:
		make_sure_architecture(type)
	return m_architecture
	
static func make_sure_architecture(type):
	if m_architecture == null:
		m_architecture = type.new()
		m_architecture.on_init()
	
		for architecture_model in m_architecture.m_models._data:
			architecture_model.on_init()
		m_architecture.m_models.clear()
		
		for architecture_system in m_architecture.m_systems._data:
			architecture_system.on_init()
		m_architecture.m_systems.clear()
		m_architecture.m_inited = true

func invoke_signal():
	on_register_patch.emit(m_architecture)

func on_init() -> void:
	pass

var m_container: IOCContainer = IOCContainer.new()

func register_system(system: GDScript):
	var instance_system = m_container.register(system)
	instance_system.set_architecture(self)
	if !m_inited:
		m_systems.append(instance_system)
	else:
		instance_system.on_init()

func register_model(model: GDScript):
	var instance_model = m_container.register(model)
	instance_model.set_architecture(self)
	if !m_inited:
		m_systems.append(instance_model)
	else:
		instance_model.on_init()

func register_utility(utility: GDScript):
	m_container.register(utility)

func get_system(gdscript: GDScript):
	return m_container.get_value(gdscript)

func get_model(gdscript: GDScript):
	return m_container.get_value(gdscript)

func get_utility(gdscript: GDScript):
	return m_container.get_value(gdscript)

func send_command(command):
	command.set_architecture(self)
	return command.on_execute_result()

func send_command_without_result(command):
	command.set_architecture(self)
	command.on_execute_result()

var m_type_event_system: TypeEventSystem

func send_type_event(type ,e=null):
	if !e:
		m_type_event_system.send_type(type)
	else:
		m_type_event_system.send_type_event(type, e)

func register_event(on_event: Callable) -> IUnRegister:
	return m_type_event_system.register(on_event)

func unregister_event(on_event: Callable) -> void:
	m_type_event_system.un_register(on_event)
