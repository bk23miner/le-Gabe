class_name Player extends CharacterBody2D

@export var speed = 120
@export var jump_speed = -180
@export var gravity = 500
@export var remaining_djumps = 1
@export var remaining_dash = 1
@export var remaining_walljump = 0
@export var Wings: Node2D#
var dashing = false

func _ready() -> void:
	Wings = $Sprite2D
	Wings.visible = false

func _physics_process(delta):
	# Add gravity every frame

	# Input affects x axis only
	velocity.x = Input.get_axis("left", "right") * speed
	var y_dir = Input.get_axis("up", "down")
	


	# Only allow jumping when on the ground or if djumps greater 0
	if Input.is_action_just_pressed("jump") and !is_on_floor() and remaining_djumps>0:
		Wings.visible = true
		$Timer.start()
		velocity.y = jump_speed
		remaining_djumps -= 1
	elif Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed
	elif Input.is_action_just_pressed("dash") && !dashing && remaining_dash > 0 :
		$"Dash-Timer".start()
		dashing = true
	var Body = $AnimatedSprite2D
	
	var direction = sign(velocity.x)
		#rechts	
	if direction > 0:
		Body.play("right")
	#links
	elif direction < 0:
		Body.play("left")	
	elif direction == 0:
		Body.play("idle")
		
	if dashing:
		velocity.x =  Input.get_axis("left", "right") * (speed + 200)
		velocity.y = y_dir * (speed+100)
	else:	
		velocity.y += gravity * delta
	
	
	

	move_and_slide()
		
func reset_Wings() -> void:
	Wings.visible = false 
	
	


func _on_dash_timer_timeout() -> void:
	dashing = false
