extends Node2D

var dlg1 = [
	["Welcome! You’re one of many participants in our company’s endeavour!", 0.01],
	["I know you’re eager to be part of our hall of fame, but we’re obligated to tell you about a few things.", 0.01],
	["On your way down, it is imperative you maintain the pressure and comms.", 0.01],
	["You can recalibrate the communications channel using your submersible’s dashboard;", 0.01],
	["And the pressure can be stabilized if you configure the valves on your left.", 0.01],
	["Nothing too crazy — so you should be fine.", 0.01],
	["Don’t forget to check your sonar to know when to take photos of the outside through the windows.", 0.01],
	["You’ll also need to log information via your submersible’s tablet.", 0.01],
	["And that’s pretty much everything you’d need to know for this journey!", 0.01],
	["Good luck, and remember;", 0.01],
	["This path is a lonely one.", 0.05]
]

func _ready() -> void:
	Sfx.stop_sounds()
	Sfx.deep_sea_amb.play()
	
	await get_tree().create_timer(3.0).timeout

	var db = GlobalVars.instantiate_dialogue_box()
	db.dialogue_portion_done.connect(_intro_dialogue)
	db.dialogue_portion_started.connect(_intro_dialogue_start)
	db.show_dialogue(dlg1)
	
func _intro_dialogue_start(dialogue_text : String) -> void:
		if dialogue_text == dlg1[2][0]:
			print("second_start")
			
func _intro_dialogue(dialogue_text : String) -> void:
		if dialogue_text == dlg1[2][0]:
			print("second_end")
