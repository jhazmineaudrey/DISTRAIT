extends TextEdit

signal text_submitted()
var hovering : bool

func _gui_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ENTER or event.keycode == KEY_KP_ENTER:
			
			if not event.shift_pressed:
				get_viewport().set_input_as_handled() 
				
				text_submitted.emit()

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Click"):
		if not hovering:
			self.release_focus()

func _on_mouse_entered() -> void: 
	hovering = true
func _on_mouse_exited() -> void: 
	hovering = false
