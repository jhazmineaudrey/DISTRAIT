extends Node

@onready var horror_amb_1: AudioStreamPlayer = $HorrorAmb1
@onready var ocean_amb: AudioStreamPlayer = $OceanAmb
@onready var flickering_lights: AudioStreamPlayer = $FlickeringLights
@onready var deep_sea_amb: AudioStreamPlayer = $DeepSeaAmb

func fade_master_volume(to_db: float, duration: float) -> void:
	var master_idx = AudioServer.get_bus_index("Master")
	var start_db = AudioServer.get_bus_volume_db(master_idx)
	
	var tween = create_tween()
	tween.tween_method(
		set_master_volume, 
		start_db, 
		to_db, 
		duration
	)
	
func set_master_volume(volume_db: float) -> void:
	var master_idx = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(master_idx, volume_db)
	
func stop_sounds() -> void:
	var audio = self.get_children()
	for i in audio:
		i.stop()
