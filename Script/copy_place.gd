extends TextEdit

signal text_submitted()

func _gui_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ENTER or event.keycode == KEY_KP_ENTER:
			
			if not event.shift_pressed:
				get_viewport().set_input_as_handled() 
				
				text_submitted.emit()
