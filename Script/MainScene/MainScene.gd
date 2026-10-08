extends Node2D
signal epip_zone_start

@onready var zone_label_anim_player: AnimationPlayer = $Camera2D/CanvasLayer/ZoneLabel/ZoneLabelAnimPlayer
@onready var zone_label_text: RichTextLabel = $Camera2D/CanvasLayer/ZoneLabel/ZoneLabelText
@onready var zone_label_bg: TextureRect = $Camera2D/CanvasLayer/ZoneLabel/ZoneLabelBG
@onready var canvas_layer: CanvasLayer = $Camera2D/CanvasLayer
const TABLET = preload("uid://3sgfs6ha6ayk")

var dlg1 = [
	["Welcome! You’re one of many participants in our company’s endeavour!", 0.01],
	["I know you’re eager to be part of our hall of fame, but we’re obligated to tell you about a few things.", 0.01],
	["On your way down, it is imperative you maintain the pressure and comms.", 0.01],
	["You can recalibrate the communications channel using your submersible’s dashboard;", 0.01],
	["And the pressure can be stabilized if you configure the valves on your left.", 0.01],
	["Nothing too crazy — so you should be fine.", 0.01],
	["You’ll also need to log information via your submersible’s tablet; research is imperative.", 0.01],
	["And that’s pretty much everything you’d need to know for this journey!", 0.01],
	["Good luck, and remember;", 0.01],
	["This path is a lonely one.", 0.05]
]

var dlg2 = [
	["Quite a quick and easy trip isn’t it?", 0.01],
	["You’re already past the first zone!", 0.01],
	["Keep it up — you’ve got great things ahead of you.", 0.01],
	["You should be aware however, that our research equipment tends to start malfunctioning at this level.", 0.02],
	["You’ll need to fix them by accessing the panel behind the tablet.", 0.02],
	["It’s extra work, yes, but you should be fine right?", 0.01]
]

var dlg3 = [
	["Hey. Still kicking I see.", 0.02],
	["There’s no more light here,", 0.02],
	["just yourself.", 0.03],
	["You’ll need to adjust your submersible’s position every now and then; using the submersible’s Control Disc in front of you. An indicator will let you know which way to go.", 0.02],
	["Things tend to get rough now; but you mustn't show it.", 0.02],
	["Ignore the insurmountable pressure, and keep going.", 0.02],
	["You’re almost there.", 0.02]
]

var dlg4 = [
	["The waters are freezing cold.", 0.03],
	["Don’t let it in. Coat the cracks in the windows.", 0.03],
	["All eyes are on you now.", 0.03],
	["Use the last of your energy.", 0.03],
	["Don’t let us down.", 0.03]
]

func _ready() -> void:
	zone_label_text.modulate.a = 0
	zone_label_bg.modulate.a = 0
	
	Sfx.stop_sounds()
	Sfx.deep_sea_amb.play()
	
	await get_tree().create_timer(3.0).timeout

	var db = GlobalVars.instantiate_dialogue_box()
	db.dialogue_portion_done.connect(_intro_dialogue)
	db.dialogue_portion_started.connect(_intro_dialogue_start)
	db.show_dialogue(dlg1)
	
	await db.tree_exited
	
	new_zone_label("EPIPELAGIC ZONE | 0–200m", epip_zone_start)
	
# TUTORIAL PULSES
@onready var tut_pulse: Node2D = $TutPulse
@onready var tut_pulse_hidden: Node2D = $TutPulseHidden
@onready var valves: PointLight2D = $TutPulseHidden/Valves
@onready var comms: PointLight2D = $TutPulseHidden/Comms

# DIALOGUE SIGNAL FUNCTIONS 
func _intro_dialogue_start(dialogue_text : String) -> void:
		if dialogue_text == dlg1[2][0]:
			valves.reparent(tut_pulse)
			comms.reparent(tut_pulse)
		elif dialogue_text == dlg1[3][0]:
			valves.reparent(tut_pulse_hidden)
		elif dialogue_text == dlg1[4][0]:
			valves.reparent(tut_pulse)
			comms.reparent(tut_pulse_hidden)
		elif dialogue_text == dlg1[5][0]:
			valves.reparent(tut_pulse_hidden)
		elif dialogue_text == dlg1[6][0]:
			var tab = TABLET.instantiate()
			tab.global_position = Vector2(1042.0, 571)
			canvas_layer.add_child(tab)
			
func _intro_dialogue(_dialogue_text : String) -> void:
		pass # placeholder for the moment
			
func new_zone_label(zoneLabelText : String, event : Signal):
	zone_label_text.text = zoneLabelText
	zone_label_anim_player.play("ZoneLabelAnim")
	
	await get_tree().create_timer(4.0).timeout
	
	zone_label_anim_player.play_backwards("ZoneLabelAnim")
	event.emit()
	
