class_name Player extends CharacterBody2D

@export var speed = 120
@export var dash_speed = 250
@export var jump_speed = -180
@export var gravity = 500

@export var remaining_djumps = 9999
@export var remaining_dash = 100
@export var remaining_walljump = 100

var is_dead = false

var f_dash = false
var dashing = false
var temp_x_vel
var temp_y_vel
var temp_bd_y_vel

func _ready() -> void:
	pass

func _physics_process(delta):
	#if f_dash:
	#	f_dash = false
	#	velocity.y= 0
	
	if is_dead == false :
		if Input.is_action_just_pressed("dash") && !dashing && remaining_dash > 0 && Input.get_axis("left","right")!=0:
			$"Dash-Timer".start()
			dashing = true
			temp_x_vel = Input.get_axis("left", "right") *(speed + dash_speed)
			remaining_dash -= 1
			get_tree().get_first_node_in_group("World").Dash(Input.get_axis("left","right") == -1)
		if dashing:
			velocity.y = 0
			velocity.x = temp_x_vel
		elif !dashing:
			velocity.y += gravity * delta
			velocity.x = Input.get_axis("left", "right") * speed
			var y_dir = Input.get_axis("up", "down")
	

			if is_on_wall_only() and Input.is_action_just_pressed("jump") and (remaining_walljump > 0 or remaining_djumps > 0):
				if remaining_walljump > 0:
					remaining_walljump -= 1
					walljump()
					get_tree().get_first_node_in_group("World").Wjump()
				elif remaining_djumps > 0:
					remaining_djumps -=1
					walljump()
					
			elif Input.is_action_just_pressed("jump") and !is_on_floor() and remaining_djumps>0:
				velocity.y = jump_speed
				remaining_djumps -= 1
				get_tree().get_first_node_in_group("World").Djump()
			elif Input.is_action_just_pressed("jump") and is_on_floor():
				velocity.y = jump_speed
		
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
	
	
	
	
	
	# print(str(velocity.y))

		move_and_slide()

	
	
	


func _on_dash_timer_timeout() -> void:
	f_dash = true
	gravity = 0
	dashing = false
	print("finish dash")
	$"Dash-Timer".stop()
	gravity = 500
	print(str(PI))
	
func walljump() -> void:
	velocity.y = jump_speed +2

func _death() -> void:
	is_dead = true
	var Body = $AnimatedSprite2D
	Body.play("death")
	
	
