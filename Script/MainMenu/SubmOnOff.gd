extends Sprite2D

const offText = preload("uid://ckcr0fhkj44g8")
const onText = preload("uid://dppmsltlk0trw")

func light_func():
	texture = offText
	await get_tree().create_timer(0.3).timeout
	texture = onText
	await get_tree().create_timer(0.1).timeout
	texture = offText
	await get_tree().create_timer(0.1).timeout
	texture = onText
