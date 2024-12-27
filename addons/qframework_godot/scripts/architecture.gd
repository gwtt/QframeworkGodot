## 架构中心，负责调度所有类的关系。
## 包含两个概念：ioc_container容器和m_type_event_system事件总线
## 所有的层都需要向容器去注册。获取其他层的时候也要借助这个容器去获取。
## 所有的信号和事件可以借助事件总线去实现。形成多对多关系。

class_name Architecture extends Node

signal on_register_patch(architecture)

var m_inited: bool = false
var m_systems: HashSet = HashSet.new()
var m_models: HashSet = HashSet.new()

func make_sure_architecture():
	self.on_register_patch.emit()
	for architecture_model in self.m_models._data:
		architecture_model.on_init()
	self.m_models.clear()
		
	for architecture_system in self.m_systems._data:
		architecture_system.on_init()
	self.m_systems.clear()
	self.m_inited = true

func on_init() -> void:
	pass
	
#region container
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
		m_models.append(instance_model)
	else:
		instance_model.on_init()

func register_utility(utility: GDScript):
	var instance_model = m_container.register(utility)
	
func get_system(gdscript: GDScript):
	return m_container.get_value(gdscript)

func get_model(gdscript: GDScript):
	return m_container.get_value(gdscript)

func get_utility(gdscript: GDScript):
	return m_container.get_value(gdscript)
#endregion

#region EventBus
var m_type_event_system: TypeEventSystem = TypeEventSystem.global

func send_event(destination: String, payload):
	m_type_event_system.send_event(destination, payload)

func register_event(destination: String, on_event: Callable):
	m_type_event_system.register_event(destination, on_event)

func unregister_event(destination: String, on_event: Callable):
	m_type_event_system.unregister_event(destination, on_event)
#endregion
