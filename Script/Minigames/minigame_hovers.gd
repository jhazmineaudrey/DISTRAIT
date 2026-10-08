extends Node2D
@onready var valve_fade: AnimationPlayer = $ValveFade
@onready var comms_fade: AnimationPlayer = $CommsFade
@onready var valve_minigame: TextureRect = $ValveMinigame
@onready var comms_minigame: TextureRect = $CommsMinigame

var valve_hovering : bool = false
var comms_hovering : bool = false

func _ready() -> void:
	valve_minigame.modulate.a = 0
	comms_minigame.modulate.a = 0

func _on_valve_minigame_mouse_entered() -> void: 
	valve_fade.play("ValveFade")
	valve_hovering = true
	
func _on_comms_minigame_mouse_entered() -> void: 
	comms_fade.play("CommsFade")
	comms_hovering = true

func _on_valve_minigame_mouse_exited() -> void: 
	valve_fade.play_backwards("ValveFade")
	valve_hovering = false
	
func _on_comms_minigame_mouse_exited() -> void: 
	comms_fade.play_backwards("CommsFade")
	comms_hovering = false
