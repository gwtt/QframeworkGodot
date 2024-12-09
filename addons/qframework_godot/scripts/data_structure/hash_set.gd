class_name HashSet
var _data : Dictionary = {}

# 初始化方法，接受一个数组作为初始值
func _init(values = []):
	merge(values)

# 添加元素
func append(value) -> void:
	_data[value] = null

# 添加数组中的所有元素
func append_array(values) -> void:
	for value in values:
		_data[value] = null

# 删除元素
func erase(value) -> bool:
	return _data.erase(value)

# 检查元素是否存在
func has(value) -> bool:
	return _data.has(value)

# 转换为数组
func to_array() -> Array:
	return _data.keys()

# 获取集合大小
func size() -> int:
	return _data.size()

# 检查集合是否为空
func is_empty() -> bool:
	return _data.is_empty()

# 清空集合
func clear() -> void:
	_data.clear()

# 集合合并
func merge(values) -> void:
	for i in values:
		_data[i] = null

# 集合的哈希值
func hash() -> int:
	return _data.keys().hash()
