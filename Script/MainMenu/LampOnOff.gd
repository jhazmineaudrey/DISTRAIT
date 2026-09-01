extends Sprite2D

const offText = preload("uid://ccas3317icvfo")
const onText = preload("uid://dj562awy1vr3h")

func light_func():
	texture = offText
	await get_tree().create_timer(0.3).timeout
	texture = onText
	await get_tree().create_timer(0.1).timeout
	texture = offText
	await get_tree().create_timer(0.1).timeout
	texture = onText
