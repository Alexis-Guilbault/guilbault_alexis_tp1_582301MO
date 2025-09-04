extends Node

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_UP:
			if $"../joueur".position.y != 240.0:
				$"../joueur".position.y -= 64
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_DOWN:
			if $"../joueur".position.y != 496.0:
				$"../joueur".position.y += 64
