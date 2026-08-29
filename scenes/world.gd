extends Node2D
var Wings
var PL: Node = null
var count = 0
var dash = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Wings = $"D-Jump"
	Wings.visible = false
	$Dash.visible = false
	$Dash2.visible = false
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dash:
		count += delta
		if count <= 0.03:
			$Dash.visible = true
			$Dash.play("default")
			$Dash.position = $Player.position
			print("D1")
		
		if count <= 0.06:
			$Dash2.visible = true
			$Dash2.play("default")
			$Dash2.position = $Player.position
			print("D2")
		if count >= 0.25:
			$Dash.visible = false
		if count >= 0.28:
			$Dash2.visible = false
			dash = false
		
func reset_Wings() -> void:
	Wings.visible = false 
	$"D-Jump/Timer".stop()


func Djump() -> void :
	$"D-Jump".position = $Player.position
	Wings.visible = true
	Wings.play("default")
	$"D-Jump/Timer".start()
	

func Dash(LEFT) -> void: 
	dash = true
	if LEFT:
		$Dash.flip_h = true
		$Dash2.flip_h = true
	elif !LEFT:
		$Dash.flip_h = false
		$Dash2.flip_h = false
	
	
