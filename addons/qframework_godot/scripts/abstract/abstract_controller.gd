class_name AbstractController extends GDScript

var m_architecture: Architecture

func get_system(type):
	return m_architecture.get_system(type)

func get_model(type):
	return m_architecture.get_model(type) 
	
func send_command(type):
	return m_architecture.get_controller(type)

func register_event(destination: String,on_event: Callable):
	m_architecture.register_event(destination, on_event)

func unregister_event(destination: String,on_event: Callable) -> void:
	m_architecture.unregister_event(destination, on_event)
