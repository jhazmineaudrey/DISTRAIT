extends Node2D

signal dialogue_finished
signal end

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var dialogue_box: Sprite2D = $DialogueBox
@onready var dialogue: RichTextLabel = $Dialogue
@onready var skip_label: RichTextLabel = $SkipLabel
var in_dialogue : bool = false
var skipped : bool = false


func _ready() -> void:
	dialogue_box.rotation = 24.5
	dialogue_box.position = Vector2(1042.579, 300)
	dialogue_box.scale = Vector2(-0.001, -0.002)
	
	set_process_input(false)
	dialogue.visible_characters = 0
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Skip"):
		if in_dialogue:
			skipped = true
		else:
			set_process_input(false)
			end.emit()
	
func show_dialogue(dialogueInfo: Array):
	animation_player.play("BoxPopUp")
	await animation_player.animation_finished
	skip_label.visible = true
	for index in range(dialogueInfo.size()):
		var i = dialogueInfo[index]

		dialogue.text = i[0]
		var total_chars = i[0].length()
		dialogue.visible_characters = 0
		
		in_dialogue	= true
		set_process_input(true)

		for char in range(total_chars):
			if skipped:
				skipped = false
				dialogue.visible_characters = -1
				break
			else:
				dialogue.visible_characters += 1
				await get_tree().create_timer(i[1]).timeout

		in_dialogue = false
		set_process_input(true)

		await end

		if index == dialogueInfo.size() - 1:
			dialogue_finished.emit()
		else:
			set_process_input(false)
				

func _on_dialogue_finished() -> void:
	dialogue.visible_characters = 0
	skip_label.visible = false
	animation_player.play_backwards("BoxPopUp")
	await animation_player.animation_finished
	queue_free()
