## 事件总线

class_name TypeEventSystem extends RefCounted

static var global = TypeEventSystem.new()

## 推送事件
func send_event(destination: String, payload = null) -> void:
	if payload == null:
		payload = []
	if not payload is Array:
		payload = [payload]
	payload.insert(0, _get_destination_signal(destination))	
	callv("emit_signal", payload)
	
## 订阅
func register_event(destination: String, callback: Callable) -> void:
	var dest_signal: String = _get_destination_signal(destination)
	if not is_connected(dest_signal, callback):
		connect(dest_signal, callback)
		
## 取消订阅
func unregister_event(destination: String, callback: Callable) -> void:
	var dest_signal: String = _get_destination_signal(destination)
	if is_connected(dest_signal, callback):
		disconnect(dest_signal, callback)
		
## 获取事件名		
func _get_destination_signal(destination: String) -> String:
	var dest_signal: String = "EventBus|%s" % destination
	if not has_user_signal(dest_signal):
		add_user_signal(dest_signal)
	return dest_signal
