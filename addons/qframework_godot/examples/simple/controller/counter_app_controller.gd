extends AbstractController

@onready var count_text: Label = $CountText
@onready var btn_add: Button = $BtnAdd
@onready var btn_sub: Button = $BtnSub
var controller: AbstractController = AbstractController.new()
func _ready() -> void:
	controller.set_architecture(CounterAppArchitecture.interface(CounterAppArchitecture))
	btn_add.pressed.connect(add)
	btn_sub.pressed.connect(sub)
	controller.get_model(CounterAppModel).count.register_and_refresh(
		func(count):
			count_text.text = str(count);
	)

	
func add():
	controller.send_command(IncreaseCountCommand.new())
	var temp = controller.get_model(CounterAppModel)
	print(temp.count.value)

func sub():
	controller.send_command(DecreaseCountCommand.new())
	print(controller.get_model(CounterAppModel).count.value)
