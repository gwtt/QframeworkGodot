## 数据层，负责数据定义和数据的增删改查方法提供 
## 可以获取utility、发送event

class_name AbstractModel extends GDScript

var m_architecture: Architecture

var _saveable_properties: Dictionary = {}

## 注册一个可存档的属性
func register_saveable_property(property_name: String) -> void:
	_saveable_properties[property_name] = true
	
## 注册多个可存档的属性
func register_saveable_properties(property_names: Array[String]) -> void:
	for name in property_names:
		register_saveable_property(name)
		
## super.on_init()主要是读取存档使用，需要放在初始化最后
func on_init():
	load_model()
	
## 获取需要存档的数据
func get_save_data() -> Dictionary:
	var save_data = {}
	for property in _saveable_properties.keys():
		var value = self.get(property)
		# 处理 BindableProperty
		if value is BindableProperty:
			save_data[property] = value.value
		else:
			save_data[property] = value
	return save_data
	
## 从存档数据恢复
func load_save_data(data: Dictionary) -> void:
	for property in data.keys():
		if _saveable_properties.has(property):
			var current_value = self.get(property)
			# 处理 BindableProperty
			if data[property]:		
				if current_value is BindableProperty:
					current_value.value = data[property]
				else:
					self.set(property, data[property])

func get_architecture() -> Architecture:
	return m_architecture

func set_architecture(architecture: Architecture):
	m_architecture = architecture

func get_utility(type):
	return m_architecture.get_utility(type)

func send_event(destination: String, payload):
	m_architecture.send_event(destination, payload)

func save_model(index: int = 0):
	var result = SaveManager.save_model(index, self)
	if result != OK:
		print("保存失败：", result)
		
func load_model(index:int = 0):
	var result = SaveManager.load_model(index, self)
	if result != OK:
		print("加载失败：", result)
