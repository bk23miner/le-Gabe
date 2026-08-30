extends Node2D
var Wings
var Wings2
var PL: Node = null
var count = 0
var dash = false
var cnt = 0
static var Level =1
var main

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Wings = $"D-Jump"
	Wings.visible = false
	PL = $Player
	Wings2 = $"D-Jump2"
	Wings2.visible = false
	$Dash.visible = false
	$Dash2.visible = false
	main = get_tree().get_first_node_in_group("Main")
	add_child(load("res://scenes/hud.tscn").instantiate())
	if Level == 1:
		$LV1/Camera2D.enabled = true
		PL.position = $LV1/Pspawn.position
	elif Level== 2:
		PL.position = $LV2/Pspawn.position
		$"LV2/Camera2D2".enabled = true
	elif Level == 3:#
		$lv3/Camera2D3.enabled = true
		PL.position = $lv3/Pspawn.position
	elif Level == 4:
		$lv4/Camera2D4.enabled = true
		PL.position = $lv4/Pspawn.position
	elif Level == 5:
		$lvl5/Camera2D5.enabled = true
		PL.position = $lvl5/Pspawn.position
	elif Level == 6:
		$lvl6/Camera2D6.enabled = true
		PL.position = $lvl6/Pspawn.position
	elif Level == 7:
		$LV7/Camera2D7.enabled = true
		PL.position = $LV7/Pspawn.position
	elif Level == 8:
		$LV8/Camera2D8.enabled = true
		PL.position = $LV8/Pspawn.position
	elif Level == 9:
		$LV9/Camera2D9.enabled = true
		PL.position = $LV9/Pspawn.position
	elif Level == 10:
		$finallvl/Camera2D10.enabled = true
		PL.position = $finallvl/Pspawn.position
	elif Level == 11:
		$NGpp/Camera2D11.enabled = true
		PL.position = $NGpp/Pspawn.position
	elif Level == 12:
		$Finish/Camera2D12.enabled = true
		PL.position = $Finish/Pspawn.position
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		Level = 1
		restart()
		main.MENU = true
	if dash:
		count += delta
		if count >= 0.03 && cnt == 0:
			$Dash.visible = true
			$Dash.play("default")
			$Dash.position = $Player.position
			print("D1")
			cnt =1
		
		if count >= 0.08 && cnt == 1:
			$Dash2.visible = true
			$Dash2.play("default")
			$Dash2.position = $Player.position
			print("D2")
			
			cnt =2
		if count >= 0.25 && cnt == 2:
			$Dash.visible = false
			cnt =3
		if count >= 0.28 && cnt == 3:
			$Dash2.visible = false
			dash = false
			cnt = 0
			count = 0
			
			
		
func reset_Wings() -> void:
	Wings.visible = false 
	$"D-Jump/Timer".stop()
	
	
func reset_WJ() -> void:
	Wings2.visible = false
	$"D-Jump2/Timer".stop()

func Djump() -> void :
	print("DJUMP")
	$"D-Jump".position = $Player.position
	Wings.visible = true
	Wings.play("default")
	$"D-Jump/Timer".start()

func Wjump() -> void:
	print("WJUMP")
	$"D-Jump2".position = $Player.position
	Wings2.visible = true
	Wings2.play("default")
	$"D-Jump2/Timer".start()
	

func Dash(LEFT) -> void: 
	
	print("Dash")
	dash = true
	if LEFT:
		$Dash.flip_h = true
		$Dash2.flip_h = true
	elif !LEFT:
		$Dash.flip_h = false
		$Dash2.flip_h = false
	

func nxtLvL():
	Level += 1
	restart()
	
	



func restart() -> void:
	get_tree().reload_current_scene()  
