extends Area2D


var num

func _ready():
	num = 0
func _on_body_entered(body):
	if(num == 0):
		get_tree().change_scene_to_file("res://scenes/game1.tscn")
		num = 1
	#if(num == 1):
		#get_tree().change_scene_to_file("res://scenes/End.tscn")
