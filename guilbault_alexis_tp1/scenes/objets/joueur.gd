extends Node

var lane = 3
var laneSwitch = 0

var vspeed = 0
var vgoal = 0

func _input(event):
	if event is InputEventKey:
		if event.pressed and (event.keycode == KEY_UP or event.keycode == KEY_W):
			if lane != 1 and vspeed == 0:
				lane -= 1
				laneSwitch = -1
				$"./AudioStreamPlayer".play()
	
	if event is InputEventKey:
		if event.pressed and (event.keycode == KEY_DOWN or event.keycode == KEY_S):
			if lane != 5 and vspeed == 0:
				lane += 1
				laneSwitch = 1
				$"./AudioStreamPlayer".play()

func _process(delta: float) -> void:
	match laneSwitch:
		-1:
			$"../joueur".rotation = deg_to_rad(-15) 
			vspeed = -2
		
		1:
			$"../joueur".rotation = deg_to_rad(15) 
			vspeed = 2
		
		0:
			$"../joueur".rotation = 0
			vspeed = 0
	
	$"../joueur".position.y += vspeed
	
	match lane:
		1:
			vgoal = 272
		
		2:
			vgoal = 336
		
		3:
			vgoal = 400
		
		4:
			vgoal = 464
		
		5:
			vgoal = 528
	
	if $"../joueur".position.y == vgoal:
		laneSwitch = 0
	
	$"./AnimatedSprite2D".play()
