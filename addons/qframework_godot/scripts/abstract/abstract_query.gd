class_name AbstractQuery extends GDScript

var m_architecture: Architecture

## 只做查询使用，不会修改数据状态
func on_do_result():
	pass

func get_architecture() -> Architecture:
	return m_architecture

func set_architecture(architecture: Architecture):
	m_architecture = architecture
