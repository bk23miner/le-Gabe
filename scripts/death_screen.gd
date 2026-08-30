extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func custom():
	$VBoxContainer/Label.label_settings.set_font_color("White")
	$VBoxContainer/Label.label_settings.font_size = 150
	$VBoxContainer/Label.text = "The End\n or is it"
	var ls = LabelSettings.new()
func win():
	$VBoxContainer/Label.label_settings.set_font_color("Green")
	$VBoxContainer/Label.label_settings.font_size = 150
	$VBoxContainer/Label.text = "The End\n You did it!"
	var ls = LabelSettings.new()
