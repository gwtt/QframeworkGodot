## 命令层，主要用来更改system和model的状态，属于直接行为
## 可以发送event和command

class_name AbstractCommand extends RefCounted

var m_architecture: Architecture

func on_execute() -> void:
	pass

func on_execute_result():
	pass

func get_architecture() -> Architecture:
	return m_architecture

func set_architecture(architecture: Architecture):
	m_architecture = architecture

func get_system(type):
	return m_architecture.get_system(type)

func get_model(type):
	return m_architecture.get_model(type)

func send_event(destination: String, payload):
	m_architecture.send_event(destination, payload)
