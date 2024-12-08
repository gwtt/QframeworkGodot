class_name CustomUnregister extends IUnRegister
var m_on_unregister

func _init(on_unregister) -> void:
	m_on_unregister = on_unregister

func unregister() -> void:
	m_on_unregister.call()
	m_on_unregister = null
