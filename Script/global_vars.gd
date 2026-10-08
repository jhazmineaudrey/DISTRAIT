extends Node

var current_db : float = -25
const dialogue_box = preload("uid://dt1cjbflsqkiq")

var depth : float = 0
var research : float = 0

func instantiate_dialogue_box():
	var db = dialogue_box.instantiate()
	add_child(db)
	return db
