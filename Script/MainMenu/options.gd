extends Button

@onready var options: Sprite2D = $Options
@onready var options_h: Sprite2D = $OptionsH

func _on_pressed() -> void:
	pass # Replace with function body.

func _on_mouse_entered() -> void:
	options_h.visible = true
	options.visible = false

func _on_mouse_exited() -> void:
	options.visible = true
	options_h.visible = false
