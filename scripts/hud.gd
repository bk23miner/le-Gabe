extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_tree().get_first_node_in_group("Player").remaining_djumps >0:
		$MarginContainer/HBoxContainer/TextureRect.texture = load("res://assets/djump.png")
	else:
		$MarginContainer/HBoxContainer/TextureRect.texture = load("res://assets/djump_red.png")
		
	
	if get_tree().get_first_node_in_group("Player").remaining_walljump >0:
		$MarginContainer/HBoxContainer/wjump.texture = load("res://assets/wjump.png")
	else:
		$MarginContainer/HBoxContainer/wjump.texture = load("res://assets/wjump_red.png")
	
	if get_tree().get_first_node_in_group("Player").remaining_dash >0:
		$MarginContainer/HBoxContainer/dash.texture = load("res://assets/dash.png")
	else:
		$MarginContainer/HBoxContainer/dash.texture = load("res://assets/dash_red.png")
	


func get_Int() -> int:
	return 1
