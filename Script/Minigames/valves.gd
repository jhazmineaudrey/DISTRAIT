extends Node2D
@onready var valve_wheel: TextureRect = $ValveWheel
var last_angle := 0

func _ready() -> void:
	set_process(false)

func _process(_delta: float) -> void:
	print(Input.get_last_mouse_velocity())
	
	valve_wheel.rotation = (get_global_mouse_position() - valve_wheel.global_position).angle() + deg_to_rad(90)
	
	#if Input.get_last_mouse_velocity().x > 0 and Input.get_last_mouse_velocity().y > 0:
		#valve_wheel.rotation_degrees += 1
	#elif Input.get_last_mouse_velocity().x < 0 and Input.get_last_mouse_velocity().y < 0:
		#valve_wheel.rotation_degrees -= 1
		

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			
			if event.pressed and InputEventMouseMotion:
				set_process(true)
			else:
				set_process(false)
			
