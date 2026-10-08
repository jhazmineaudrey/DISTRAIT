extends Node2D
@onready var valve_wheel: TextureRect = $ValveWheel

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			
			if not event.pressed:
				print(Input.get_last_mouse_velocity())
			
