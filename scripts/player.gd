class_name Player extends CharacterBody2D

@export var SPEED := 200.0
@export var DASH := 300.0

var dashing = false
var cooldown = true
var last_direction := "front"
var is_picking_up = false
var was_walking = false
var disable_input = false


func _physics_process(delta):
	if disable_input:
		return

	var input_direction = Input.get_vector("left", "right", "up", "down")
	#if Input.is_action_just_pressed("dash") and cooldown:
	#	dashing = true
	#	cooldown = false
	#if dashing:
	#	velocity = input_direction * (SPEED + DASH)
	#else:
	velocity = input_direction * SPEED
	move_and_slide()
