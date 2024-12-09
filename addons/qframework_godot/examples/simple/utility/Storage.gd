class_name Storage extends AbstractUtility

const SAVE_GAME_PATH = "user://save.save"

func save_int(value: int):
	var file = FileAccess.open(SAVE_GAME_PATH, FileAccess.WRITE)
	var data = {
		'count': value
	}
	file.store_line(JSON.stringify(data))

func load_int() -> int:
	var file = FileAccess.open(SAVE_GAME_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_GAME_PATH):
		while file.get_position() < file.get_length():	
			var data = JSON.parse_string(file.get_line())
			return data['count']
	return 0
