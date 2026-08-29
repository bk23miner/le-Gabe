extends Node2D
@export var frame = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if frame == 2:
		$Area2D/AnimatedSprite2D.play("new_animation")
	if frame == 3:
		$Area2D/AnimatedSprite2D.play("new_animation1")
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		var Player = body
		Player._death()
