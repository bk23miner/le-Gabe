extends Node2D

var PL: Node = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:


	var scene = load("res://scenes/world.tscn")
	var instance = scene.instantiate()
	add_child(instance)
	
	add_child(load("res://scenes/hud.tscn").instantiate())

	PL = instance


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
