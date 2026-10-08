extends PointLight2D

func _ready() -> void:
	pulse()

func pulse() -> void:
	var tw = create_tween().tween_property(self, "energy", 2, 0.5).set_trans(Tween.TRANS_CUBIC)
	await tw.finished
	var tw2 = create_tween().tween_property(self, "energy", 6, 0.5).set_trans(Tween.TRANS_CUBIC)
	await tw2.finished
	pulse()
