extends Node2D
@onready var title: RichTextLabel = $Title
@onready var title_2: RichTextLabel = $Title2
@onready var title_3: RichTextLabel = $Title3

func _ready() -> void:
	create_tween().tween_property(title, "modulate:a", 1, 0.5).set_trans(Tween.TRANS_CUBIC)
	
	await get_tree().create_timer(2.0).timeout
	
	create_tween().tween_property(title_2, "modulate:a", 1, 0.5).set_trans(Tween.TRANS_CUBIC)
	
	await get_tree().create_timer(4.0).timeout
	
	create_tween().tween_property(title_3, "modulate:a", 1, 0.5).set_trans(Tween.TRANS_CUBIC)
	
	await get_tree().create_timer(4.0).timeout
	
	
	create_tween().tween_property(title, "modulate:a", 0, 0.5).set_trans(Tween.TRANS_CUBIC)
	create_tween().tween_property(title_2, "modulate:a", 0, 0.5).set_trans(Tween.TRANS_CUBIC)
	create_tween().tween_property(title_3, "modulate:a", 0, 0.5).set_trans(Tween.TRANS_CUBIC)
	
	await get_tree().create_timer(2.0).timeout
	
	SceneLoader.load_scene("uid://berhvdtyr4qjv", 2)
