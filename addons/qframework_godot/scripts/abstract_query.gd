class_name AbstractQuery extends GDScript

var m_architecture: Architecture

func on_do():
	pass

func get_architecture() -> Architecture:
	return m_architecture

func set_architecture(architecture: Architecture):
	m_architecture = architecture
