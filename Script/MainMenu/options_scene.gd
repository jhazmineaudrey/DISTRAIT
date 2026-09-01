extends Node2D

@onready var sfx: HSlider = $SFX

func _ready() -> void:
	sfx.value = GlobalVars.current_db

func _on_sfx_value_changed(value: float) -> void:
	var master_idx = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(master_idx, value)
	GlobalVars.current_db = AudioServer.get_bus_volume_db(master_idx)

func _on_back_pressed() -> void:
	queue_free()
