extends Button

const OPTIONS_UI = preload("uid://bocf7yxqfuy03")
@onready var options: Sprite2D = $Options
@onready var options_h: Sprite2D = $OptionsH
@onready var canvas_layer: CanvasLayer = $"../../../../Camera2D/CanvasLayer"
@onready var buttons: Node2D = $".."

func _on_pressed() -> void:
	var optui = OPTIONS_UI.instantiate()
	canvas_layer.add_child(optui)
	var btns = buttons.get_children()
	
	for i in btns:
		i.mouse_filter = MOUSE_FILTER_IGNORE
	
	await optui.tree_exited
	
	for i in btns:
		i.mouse_filter = MOUSE_FILTER_PASS

func _on_mouse_entered() -> void:
	options_h.visible = true
	options.visible = false

func _on_mouse_exited() -> void:
	options.visible = true
	options_h.visible = false
