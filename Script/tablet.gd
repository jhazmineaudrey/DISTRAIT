extends TextureRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer
const TABLET_ZOOM = preload("uid://dhqwir2xhepyo")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Tablet"):
		var canv = get_tree().current_scene.canvas_layer
		var tab = TABLET_ZOOM.instantiate()
		
		canv.add_child(tab)
		animation_player.play_backwards("Entrance_Exit")
		
		set_process_input(false)
		
		await tab.tree_exited
		set_process_input(true)
		animation_player.play("Entrance_Exit")

func _ready() -> void:
	self.rotation_degrees = 12
	animation_player.play("Entrance_Exit")

func _on_mouse_entered() -> void:
	animation_player.play("Tilt")


func _on_mouse_exited() -> void:
	animation_player.play_backwards("Tilt")
