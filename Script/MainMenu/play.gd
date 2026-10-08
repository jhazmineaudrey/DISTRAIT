extends Button

@onready var play: Sprite2D = $Play
@onready var play_h: Sprite2D = $PlayH
@onready var buttons: Node2D = $".."

func _on_pressed() -> void:
	SceneLoader.load_scene("uid://dcdm17kuw6dyk", 2)
	var btns = buttons.get_children()
	
	for i in btns:
		i.mouse_filter = MOUSE_FILTER_IGNORE
		
	Sfx.fade_master_volume(-80, 1)
	
func _on_mouse_entered() -> void:
	play_h.visible = true
	play.visible = false

func _on_mouse_exited() -> void:
	play.visible = true
	play_h.visible = false
