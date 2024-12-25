## 表现层，负责接受输入和状态变化时的表现
## 可以获取system、model、监听event

class_name AbstractController extends Node

var m_architecture: Architecture

func on_init():
	pass

func get_architecture() -> Architecture:
	return m_architecture

func set_architecture(architecture: Architecture):
	m_architecture = architecture
	
func get_system(type):
	return m_architecture.get_system(type)

func get_model(type):
	return m_architecture.get_model(type) 
	
func register_event(destination: String,on_event: Callable):
	m_architecture.register_event(destination, on_event)

func unregister_event(destination: String,on_event: Callable) -> void:
	m_architecture.unregister_event(destination, on_event)
