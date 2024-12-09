extends Control

@onready var count_text: Label = $CountText
@onready var btn_add: Button = $BtnAdd
@onready var btn_sub: Button = $BtnSub
var controller: AbstractController = AbstractController.new()
var architecture: Architecture
func _ready() -> void:
	architecture = CounterAppArchitecture.interface(CounterAppArchitecture)
	controller.set_architecture(architecture)
	btn_add.pressed.connect(add)
	btn_sub.pressed.connect(sub)
	architecture.get_model(CounterAppModel).count.register_and_refresh(
		func(count):
			count_text.text = str(count);
	)
	
func add():
	architecture.send_command(IncreaseCountCommand.new())
	var temp = architecture.get_model(CounterAppModel)
	print(temp.count.value)

func sub():
	architecture.send_command(DecreaseCountCommand.new())
	print(architecture.get_model(CounterAppModel).count.value)
