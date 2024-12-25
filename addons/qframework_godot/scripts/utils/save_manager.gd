## TODO 加密处理和懒加载

class_name SaveManager extends Node
const SAVE_FOLDER = "user://saves/"
const SAVE_FILE_EXTENSION = ".save"

## 获取模型的存储路径
static func get_save_path(slot_id: int, model_name: String) -> String:
	return SAVE_FOLDER + str(slot_id) + "/" + model_name + SAVE_FILE_EXTENSION
	
## 保存单个模型
static func save_model(slot_id: int, model: AbstractModel) -> Error:
	var model_name = model.get_script().get_path().get_file().get_basename()
	var slot_dir = SAVE_FOLDER + str(slot_id)
	
	# 确保存档目录存在
	if not DirAccess.dir_exists_absolute(slot_dir):
		DirAccess.make_dir_recursive_absolute(slot_dir)
	
	var save_data = model.get_save_data()
	#print("保存数据: ", save_data)
	var json_string = JSON.stringify(save_data)
	#print("JSON字符串: ", json_string)
	
	var save_path = get_save_path(slot_id, model_name)
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	if file == null:
		return FileAccess.get_open_error()
	
	file.store_string(json_string)
	return OK
	
## 加载单个模型
static func load_model(slot_id: int, model: AbstractModel) -> Error:
	var model_name = model.get_script().get_path().get_file().get_basename()
	var save_path = get_save_path(slot_id, model_name)
	
	if not FileAccess.file_exists(save_path):
		return ERR_FILE_NOT_FOUND
	
	var file = FileAccess.open(save_path, FileAccess.READ)
	if file == null:
		return FileAccess.get_open_error()
	
	var json_string = file.get_as_text()
	
	var json = JSON.new()
	var parse_result = json.parse(json_string)
	if parse_result != OK:
		return parse_result
	
	var save_data = json.get_data()
	model.load_save_data(save_data)
	
	return OK
	
## 保存多个模型（向下兼容）
static func save_game(slot_id: int, models: Array) -> Error:
	var result = OK
	for model in models:
		if model is AbstractModel:
			var save_result = save_model(slot_id, model)
			if save_result != OK:
				result = save_result
	return result
	
## 加载多个模型（向下兼容）
static func load_game(slot_id: int, models: Array) -> Error:
	var result = OK
	for model in models:
		if model is AbstractModel:
			var load_result = load_model(slot_id, model)
			if load_result != OK:
				result = load_result
	return result
