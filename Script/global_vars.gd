extends Node

var current_db : float = -25
const dialogue_box = preload("uid://dt1cjbflsqkiq")

func instantiate_dialogue_box():
	var db = dialogue_box.instantiate()
	add_child(db)
	return db
