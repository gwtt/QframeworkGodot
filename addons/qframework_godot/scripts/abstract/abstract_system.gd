## 系统层，帮助controller承担一部分逻辑
## 可以获取system、model、监听event和发送event

class_name AbstractSystem extends GDScript

var m_architecture: Architecture

func on_init() -> void:
	pass

func get_architecture() -> Architecture:
	return m_architecture

func set_architecture(architecture: Architecture):
	m_architecture = architecture

func get_system(gdscript: GDScript) -> AbstractSystem:
	return m_architecture.get_system(gdscript)

func get_model(gdscript: GDScript) -> AbstractModel:
	return m_architecture.get_model(gdscript)

func register_event(destination: String, callback: Callable):
	m_architecture.register_event(destination, callback)

func send_event(destination: String, payload):
	m_architecture.send_event(destination, payload)
