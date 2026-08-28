class_name Player extends CharacterBody2D

@export var speed = 120
@export var jump_speed = -180
@export var gravity = 400

@export var remaining_djumps = 1000
@export var remaining_dash = 3
@export var remaining_walljump = 0

func _physics_process(delta):
	# Add gravity every frame
	velocity.y += gravity * delta

	# Input affects x axis only
	velocity.x = Input.get_axis("left", "right") * speed
	
	move_and_slide()

	# Only allow jumping when on the ground or if djumps greater 0
	if Input.is_action_just_pressed("jump") and !is_on_floor() and remaining_djumps>0:
		velocity.y = jump_speed
		remaining_djumps -= 1
	elif Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed
	var Body = $AnimatedSprite2D
	
	var direction = sign(velocity.x)
		#rechts	
	if direction > 0:
		Body.play("right")
	#links
	if direction < 0:
		Body.play("left")	
	elif direction == 0:
		Body.play("idle")
	if Input.is_action_just_pressed("dash"):
		velocity = Input.get_vector("left", "right","up","down") * speed *3
		
