extends Sprite2D

const offText = preload("uid://bhwvnivr4don3")
const onText = preload("uid://do8r0xvwqjgag")

func light_func():
	texture = offText
	await get_tree().create_timer(0.3).timeout
	texture = onText
	await get_tree().create_timer(0.1).timeout
	texture = offText
	await get_tree().create_timer(0.1).timeout
	texture = onText
