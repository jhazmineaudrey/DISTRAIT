extends Camera2D

@export var max_offset: Vector2 = Vector2(100, 50)
@export var smooth_speed: float = 10.0
var center_position: Vector2

func _ready() -> void:
	center_position = global_position

func _process(delta: float) -> void:
	var viewport_size: Vector2 = get_viewport().get_visible_rect().size
	
	var mouse_pos: Vector2 = get_viewport().get_mouse_position()
	var normalized_mouse: Vector2 = (mouse_pos / viewport_size) - Vector2(0.5, 0.5)
	
	var target_position: Vector2 = center_position + (normalized_mouse * max_offset)

	global_position = global_position.lerp(target_position, smooth_speed * delta)
