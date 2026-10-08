extends Node2D

@onready var light_flicker: Timer = $LightFlicker

func _ready() -> void:
	Sfx.horror_amb_1.play()
	Sfx.ocean_amb.play()

func _on_light_flicker_timeout() -> void:
	Sfx.flickering_lights.play()
	get_tree().call_group("Light", "light_func")
	light_flicker.start(randi_range(4, 8))
