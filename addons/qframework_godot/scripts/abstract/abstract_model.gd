## 数据层，负责数据定义和数据的增删改查方法提供 
## 可以获取utility、发送event

class_name AbstractModel extends GDScript

var m_architecture: Architecture

func on_init():
	pass

func get_architecture() -> Architecture:
	return m_architecture

func set_architecture(architecture: Architecture):
	m_architecture = architecture

func get_utility(type):
	return m_architecture.get_utility(type)

func send_event(destination: String, payload):
	m_architecture.send_event(destination, payload)
