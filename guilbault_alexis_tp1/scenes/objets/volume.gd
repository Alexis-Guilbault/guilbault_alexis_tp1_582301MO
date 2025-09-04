extends AnimatedSprite2D

var audio_joue = true
var temps

func _ready() -> void:
	$"../AudioStreamPlayer".play()

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_M:
			if audio_joue == true:
				temps = $"../AudioStreamPlayer".get_playback_position()
				$"../AudioStreamPlayer".stop()
				audio_joue = false
				frame = 1
			else:
				$"../AudioStreamPlayer".play()
				$"../AudioStreamPlayer".seek(temps)
				audio_joue = true
				frame = 0
