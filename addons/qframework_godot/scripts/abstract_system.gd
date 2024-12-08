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
