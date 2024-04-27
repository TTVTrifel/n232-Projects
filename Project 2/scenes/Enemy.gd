extends RigidBody2D

@export var player: RigidBody2D

func _on_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://scenes/game2.tscn")

func _process(delta):
	linear_velocity = player.position - position 
		
