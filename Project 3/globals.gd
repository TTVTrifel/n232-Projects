extends Node
var Score = 0

var Ppos : Vector3
var level
func _ready():
	level = 1

func _process(delta):
	if Score == 10:
		if level == 1:
			get_tree().change_scene_to_file("res://speed2.tscn")
			level = level + 1
	if Score == 25:
		if level == 2:
			get_tree().change_scene_to_file("res://speed3.tscn")
			level = level + 1
	if Score == 50:
		if level == 3:
			get_tree().change_scene_to_file("res://End.tscn")


