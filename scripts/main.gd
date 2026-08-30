extends Node2D

var PL: Node = null
static var MENU = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	menu()
	
	
	




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func start():
	if PL != null:
		PL.queue_free()
	var scene = load("res://scenes/world.tscn")
	var instance = scene.instantiate()
	add_child(instance)
	MENU = false
	PL = instance


func menu():
	if !MENU:
		start()
	else:
		if PL != null:
			PL.queue_free()
		var scene = load("res://scenes/Menu.tscn")
		var instance = scene.instantiate()
		add_child(instance)
		PL = instance
