class_name Player extends CharacterBody2D

@export var speed = 120
@export var dash_speed = 250
@export var jump_speed = -180
@export var gravity = 500

@export var remaining_djumps = 1
@export var remaining_dash = 1
@export var remaining_walljump = 2
@export var Wings: Node2D#

var is_dead = false

var f_dash = false
var dashing = false
var temp_x_vel
var temp_y_vel
var temp_bd_y_vel

func _ready() -> void:
	Wings = $Sprite2D
	Wings.visible = false

func _physics_process(delta):
	#if f_dash:
	#	f_dash = false
	#	velocity.y= 0
	
	if is_dead == false :
		if Input.is_action_just_pressed("dash") && !dashing && remaining_dash > 0 :
			$"Dash-Timer".start()
			dashing = true
			temp_bd_y_vel = velocity.y
			temp_x_vel = Input.get_axis("left", "right") *(speed + dash_speed)
			temp_y_vel = Input.get_axis("up","down") * (speed + dash_speed)
		if dashing:
			velocity.x = temp_x_vel
			velocity.y = temp_y_vel
		elif !dashing:
			velocity.y += gravity * delta
			velocity.x = Input.get_axis("left", "right") * speed
			var y_dir = Input.get_axis("up", "down")
	

			if is_on_wall_only() and Input.is_action_just_pressed("jump") and (remaining_walljump > 0 or remaining_djumps > 0):
				if remaining_walljump > 0:
					remaining_walljump -= 1
					walljump()
				elif remaining_djumps > 0:
					remaining_djumps -=1
					walljump()
					
			elif Input.is_action_just_pressed("jump") and !is_on_floor() and remaining_djumps>0:
				Wings.visible = true
				$Timer.start()
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
		elif direction < 0:
			Body.play("left")	
		elif direction == 0:
			Body.play("idle")
	
	
	
	
	
	# print(str(velocity.y))

		move_and_slide()
		
func reset_Wings() -> void:
	Wings.visible = false 
	$Timer.stop()
	
	
	


func _on_dash_timer_timeout() -> void:
	f_dash = true
	gravity = 0
	dashing = false
	print("finish dash")
	$"Dash-Timer".stop()
	velocity.y  = -100
	gravity = 500
	print(str(PI))
	
func walljump() -> void:
	velocity.y = jump_speed +2

func _death() -> void:
	is_dead = true
	var Body = $AnimatedSprite2D
	Body.play("death")
	
	
