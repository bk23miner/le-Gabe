extends Node2D
var Wings
var PL: Node = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Wings = $"D-Jump"
	Wings.visible = false
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

		
func reset_Wings() -> void:
	Wings.visible = false 
	$"D-Jump/Timer".stop()


func Djump() -> void :
	$"D-Jump".position = $Player.position
	Wings.visible = true
	Wings.play("default")
	$"D-Jump/Timer".start()
