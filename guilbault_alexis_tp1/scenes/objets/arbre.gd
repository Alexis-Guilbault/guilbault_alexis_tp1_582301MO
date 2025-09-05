extends Node2D
var speed = -5

func _process(delta: float) -> void:
	position.x += speed
	
	if position.x < -1000:
		position.x = 1500
